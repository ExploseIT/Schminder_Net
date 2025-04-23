
using FirebaseAdmin.Auth;
using Google.Apis.Auth.OAuth2;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.Data;

namespace Schminder_Net.ef
{
    public class ent_firebase :cIsDbNull
    {
        private dbContext? dbCon { get; } = null;
        private Exception? exc = null;
        public ent_firebase()
        {
        }
        public ent_firebase(dbContext dbCon)
        {
            this.dbCon = dbCon;
        }

        public c_FirebaseTokenInfo doFirebaseTokeInfoUpdate(c_FirebaseTokenInfo p)
        {
            c_FirebaseTokenInfo ret = new c_FirebaseTokenInfo();

            try
            {
                SqlParameter[] lParams = {
                new SqlParameter("@fbt_id", SqlDbType.UniqueIdentifier, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.fbt_id)
                , new SqlParameter("@fbt_uid", SqlDbType.NVarChar, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.fbt_uid)
                , new SqlParameter("@fbt_token", SqlDbType.NVarChar, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.fbt_token)
                , new SqlParameter("@fbt_createdat", SqlDbType.DateTimeOffset, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.fbt_createdat)
                , new SqlParameter("@fbt_issuedat", SqlDbType.DateTimeOffset, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.fbt_issuedat)
                , new SqlParameter("@fbt_lastusedat", SqlDbType.DateTimeOffset, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, IsDbNull(p.fbt_lastusedat))
                , new SqlParameter("@fbt_expiresat", SqlDbType.DateTimeOffset, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, IsDbNull(p.fbt_expiresat))
                , new SqlParameter("@fbt_isanonymous", SqlDbType.Bit, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.fbt_isanonymous)
                , new SqlParameter("@fbt_status", SqlDbType.NVarChar, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.fbt_status)
                , new SqlParameter("@fbt_error", SqlDbType.NVarChar, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.fbt_error)
            };

                var sp = "spFirebaseTokenInfoUpdate @fbt_id, @fbt_uid, @fbt_token, @fbt_createdat, @fbt_issuedat, @fbt_lastusedat, @fbt_expiresat, @fbt_isanonymous, @fbt_status," +
                    "@fbt_error";

                var retSP = this.dbCon?.lFBTs.FromSqlRaw(sp, lParams).AsEnumerable();

                if (retSP != null && retSP.Count() > 0)
                {
                    ret = retSP?.FirstOrDefault()!;
                }
            }
            catch (Exception ex)
            {
                this.exc = ex;
            }
            return ret;
        }
    }

    public class FirebaseAuthMiddleware
    {
        private readonly RequestDelegate _next;

        public FirebaseAuthMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task Invoke(HttpContext context)
        {
            // Skip Firebase auth for specific public endpoints
            var path = context.Request.Path.ToString().ToLower();

            if (string.IsNullOrWhiteSpace(path) || path == "/" || path.StartsWith("/schminder_net"))
            {
                await _next(context);
                return;
            }

            var allowedAnonymous = new[]
            {
            "/", "/index.html", "/swagger", "/swagger/index.html",
            "/api/api_firebaseToken", "/api/api_serverversion"
        };

            if (allowedAnonymous.Any(path.StartsWith))
            {
                await _next(context);
                return;
            }

            var authHeader = context.Request.Headers["Authorization"].FirstOrDefault();

            if (authHeader != null && authHeader.StartsWith("Bearer "))
            {
                var idToken = authHeader.Substring("Bearer ".Length);

                try
                {
                    var decodedToken = await FirebaseAuth.DefaultInstance.VerifyIdTokenAsync(idToken);
                    var uid = decodedToken.Uid;

                    // Attach UID to the context for downstream access
                    context.Items["FirebaseUid"] = uid;

                    // Optional: you can also store other claims like email, isAnonymous, etc.
                }
                catch (Exception ex)
                {
                    context.Response.StatusCode = 401;
                    await context.Response.WriteAsync("Unauthorized: Invalid Firebase token");
                    return;
                }
            }
            else
            {
                context.Response.StatusCode = 401;
                await context.Response.WriteAsync("Unauthorized: Missing Authorization header");
                return;
            }

            await _next(context);
        }
    }


    public class c_FirebaseTokenInfo
    {
        [Key]
        public Guid fbt_id { get; set; } = Guid.NewGuid();
        public string? fbt_uid { get; set; }
        public string fbt_token { get; set; } = "";
        public DateTimeOffset? fbt_expiresat { get; set; }
        public DateTimeOffset fbt_issuedat { get; set; } = DateTimeOffset.UtcNow;
        public DateTimeOffset fbt_createdat { get; set; } = DateTimeOffset.UtcNow;
        public DateTimeOffset fbt_lastusedat { get; set; }
        public bool fbt_isanonymous { get; set; } = false;
        public string? fbt_status { get; set; } = "";
        public string? fbt_error { get; set; } = "";
    }


}
