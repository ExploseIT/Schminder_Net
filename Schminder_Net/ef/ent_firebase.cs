
using FirebaseAdmin.Auth;
using Google.Apis.Auth.OAuth2;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;
using System.ComponentModel.DataAnnotations;
using System.Data;

namespace Schminder_Net.ef
{
    public class ent_firebase :cIsDbNull
    {
        private dbContext? dbCon { get; } = null;
        private ILogger? logger { get; } = null!;

        private Exception? exc = null;
        public ent_firebase()
        {
        }
        public ent_firebase(dbContext dbCon, ILogger logger)
        {
            this.dbCon = dbCon;
            this.logger = logger;
        }

        public FirebaseTokenInfoRx doFirebaseTokeInfoUpdate2_0(FirebaseTokenInfoRx p)
        {
            FirebaseTokenInfoRx ret = new FirebaseTokenInfoRx();

            try
            {
                SqlParameter[] lParams = {
                    new SqlParameter("@fbtIntId", SqlDbType.Int, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.fbtIntId)
                , new SqlParameter("@fbtVersion", SqlDbType.NVarChar, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.fbtVersion)
                , new SqlParameter("@fbtDevice", SqlDbType.NVarChar, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.fbtDevice)
                //, new SqlParameter("@fbtUserUid", SqlDbType.NVarChar, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.fbtUserUid)
                , new SqlParameter("@fbtId", SqlDbType.UniqueIdentifier, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.fbtId)
                , new SqlParameter("@fbtUid", SqlDbType.NVarChar, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.fbtUid)
                , new SqlParameter("@fbtToken", SqlDbType.NVarChar, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.fbtToken)
                , new SqlParameter("@fbtCreatedAt", SqlDbType.DateTimeOffset, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.fbtCreatedAt)
                , new SqlParameter("@fbtIssuedAt", SqlDbType.DateTimeOffset, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.fbtIssuedAt)
                , new SqlParameter("@fbtLastUsedAt", SqlDbType.DateTimeOffset, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, IsDbNull(p.fbtLastUsedAt))
                , new SqlParameter("@fbtExpiresAt", SqlDbType.DateTimeOffset, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, IsDbNull(p.fbtExpiresAt))
                , new SqlParameter("@fbtIsAnonymous", SqlDbType.Bit, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.fbtIsAnonymous)
                , new SqlParameter("@fbtStatus", SqlDbType.NVarChar, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.fbtStatus)
                , new SqlParameter("@fbtError", SqlDbType.NVarChar, 0, ParameterDirection.Input, true, 0, 0, "", DataRowVersion.Current, p.fbtError)
            };

                var sp = "spFirebaseTokenInfoUpdate2 @fbtIntId, @fbtVersion, @fbtDevice, @fbtId, @fbtUid, @fbtToken, @fbtCreatedAt, @fbtIssuedAt, @fbtLastUsedAt, @fbtExpiresAt, @fbtIsAnonymous, @fbtStatus, @fbtError";

                var retSP = this.dbCon?.lFBTs2_0.FromSqlRaw(sp, lParams).AsEnumerable();

                if (retSP != null && retSP.Count() > 0)
                {
                    ret = retSP?.FirstOrDefault()!;
                }
            }
            catch (Exception ex)
            {
                this.exc = ex;
                this.logger?.LogError(ex, "Error in doFirebaseTokeInfoUpdate2_0");
            }
            return ret;
        }

        public c_FirebaseTokenInfo doFirebaseTokeInfoUpdate(FirebaseTokenInfoRx p)
        {
            c_FirebaseTokenInfo pNew = new c_FirebaseTokenInfo(p);

            c_FirebaseTokenInfo ret = doFirebaseTokeInfoUpdate(pNew);
            return ret;
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
                this.logger?.LogError(ex, "Error in doFirebaseTokeInfoUpdate");
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
                    //this.logger?.LogError(ex, "Unauthorized: Invalid Firebase token");
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


[AttributeUsage(AttributeTargets.Class | AttributeTargets.Method)]
    public class AuthorizeFirebaseAttribute : Attribute, IAsyncAuthorizationFilter
    {
        public async Task OnAuthorizationAsync(AuthorizationFilterContext context)
        {
            var authHeader = context.HttpContext.Request.Headers["Authorization"].FirstOrDefault();

            if (string.IsNullOrEmpty(authHeader) || !authHeader.StartsWith("Bearer "))
            {
                context.Result = new UnauthorizedResult();
                return;
            }

            var token = authHeader.Substring("Bearer ".Length).Trim();

            try
            {
                var decodedToken = await FirebaseAuth.DefaultInstance.VerifyIdTokenAsync(token);

                // Optionally, store UID for use later
                context.HttpContext.Items["FirebaseUid"] = decodedToken.Uid;
            }
            catch (Exception)
            {
                context.Result = new UnauthorizedResult();
            }
        }
    }

    public class c_FirebaseTokenInfo
    {
        public c_FirebaseTokenInfo()
        { }

        public c_FirebaseTokenInfo(FirebaseTokenInfoRx fti)
        {
            fbt_id = fti.fbtId;
            fbt_uid = fti.fbtUid;
            fbt_token = fti.fbtToken;
            fbt_expiresat = fti.fbtExpiresAt;
            fbt_issuedat = fti.fbtIssuedAt;
            fbt_createdat = fti.fbtCreatedAt;
            fbt_lastusedat = fti.fbtLastUsedAt;
            fbt_isanonymous = fti.fbtIsAnonymous;
            fbt_status = fti.fbtStatus;
            fbt_error = fti.fbtError;
        }

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
    public class s_FirebaseToken
    {
        public string s_fbtoken { get; set; } = "";
    }

    public class FirebaseTokenTx
    {
        public string fbtDevice { get; set; } = "";
        public string fbtVersion { get; set; } = "";
        public string fbtToken { get; set; } = "";
        //public string fbtUserUid { get; set; } = "";
    }

    public class FirebaseTokenInfoRx
    {
        public FirebaseTokenInfoRx()
        {  }

        [Key]
        public int fbtIntId { get; set; } = 0;
        public string? fbtVersion { get; set; } = null;
        public string? fbtDevice { get; set; } = null;
        //public string? fbtUserUid { get; set; } = null;
        public Guid fbtId { get; set; } = Guid.NewGuid();
        public string? fbtUid { get; set; }
        public string fbtToken { get; set; } = "";
        public DateTimeOffset? fbtExpiresAt { get; set; }
        public DateTimeOffset fbtIssuedAt { get; set; } = DateTimeOffset.UtcNow;
        public DateTimeOffset fbtCreatedAt { get; set; } = DateTimeOffset.UtcNow;
        public DateTimeOffset fbtLastUsedAt { get; set; }
        public bool fbtIsAnonymous { get; set; } = false;
        public string? fbtStatus { get; set; } = "";
        public string? fbtError { get; set; } = "";
    }

}
