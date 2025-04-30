

using FirebaseAdmin.Auth;
using Microsoft.AspNetCore.Mvc;
using Schminder_Net.ef;
using Schminder_Net.Models;
using System;

namespace Schminder_Net.Controllers
{
    [Route("api")]
    [ApiController]
    public class ApiController : ControllerBase
    {
        private readonly ILogger<ApiController> _logger;
        private dbContext _dbCon;
        private IConfiguration _conf;
        private IWebHostEnvironment _env;

        public ApiController(ILogger<ApiController> logger, IConfiguration conf, IWebHostEnvironment env, dbContext dbCon)
        {
            _logger = logger;
            _dbCon = dbCon;
            _conf = conf;
            _env = env;
        }

        [HttpPost("api_FirebaseToken")]
        public async Task<c_FirebaseTokenInfo> api_AppSignInTokenAsync(s_FirebaseToken p)
        {
            HttpContext _hc = this.HttpContext;

            var ret = new c_FirebaseTokenInfo();

            try
            {
                var decoded = await FirebaseAuth.DefaultInstance.VerifyIdTokenAsync(p.s_fbtoken);
                var firebaseUid = decoded.Uid;
                var expiry = DateTimeOffset.FromUnixTimeSeconds(decoded.ExpirationTimeSeconds);

                // Log the success locally (e.g. file, console, or ELK)
                _logger.LogInformation("Firebase token verified: UID = {Uid}, Expires = {Expiry}", firebaseUid, expiry);

                // Return useful info to the client
                ret.fbt_token = p.s_fbtoken;
                ret.fbt_uid = firebaseUid;
                ret.fbt_expiresat = expiry;
                ret.fbt_status = "success";
                ret.fbt_error = "";

            }
            catch (Exception ex)
            {
                _logger.LogError(ex, "Firebase token verification failed.");
                ret.fbt_status = "error";
                ret.fbt_error = "Token verification failed. Please re-authenticate.";
            }
            var _n_ret = new ent_firebase(_dbCon).doFirebaseTokeInfoUpdate(ret);
            return ret;
        }


        [HttpGet("api_ServerVersion2_0")]
        public r_ServerVersion2_0 api_ServerVersion2_0()
        {
            HttpContext _hc = this.HttpContext;

            r_ServerVersion2_0 ret = new r_ServerVersion2_0();
            ret.svVersion = typeof(mApp).Assembly.GetName().Version!.ToString();

            return ret;
        }

        [HttpGet("api_ServerVersion")]
        public  r_ServerVersion api_ServerVersion()
        {
            HttpContext _hc = this.HttpContext;

            r_ServerVersion ret = new r_ServerVersion();
            ret.sv_version = typeof(mApp).Assembly.GetName().Version!.ToString();

            return ret;
        }

        [HttpGet("api_MedSearch")]
        public List<c_med> api_MedSearch(string med_name)
        {
            HttpContext _hc = this.HttpContext;
            var ret = new ent_mpp(_dbCon).doMedSearchbyName(med_name);

            return ret;
        }

        [AuthorizeFirebase]
        [HttpGet("api_MedIndivListAll2_0")]
        public c_medIndivInfo api_MedIndivListAll2_0()
        {
            HttpContext _hc = this.HttpContext;
            c_medIndivInfo ret = new c_medIndivInfo();
            ret.medIndivList = new ent_mpp(_dbCon).doMedIndivListAll2_0();
            return ret;
        }


        [AuthorizeFirebase]
        [HttpGet("api_MedIndivListAll")]
        public c_med_indiv_info api_MedIndivListAll()
        {
            HttpContext _hc = this.HttpContext;
            c_med_indiv_info ret = new c_med_indiv_info();
            ret.med_indiv_list = new ent_mpp(_dbCon).doMedIndivListAll();
            return ret;
        }

        [HttpGet("api_MedListAll")]
        public c_med_indiv_info_old api_MedListAll()
        {
            HttpContext _hc = this.HttpContext;
            c_med_indiv_info_old ret = new c_med_indiv_info_old();
            ret.med_indiv_list = new ent_mpp(_dbCon).doMedListAll();

            return ret;
        }

        public class s_FirebaseToken
        {
            public string s_fbtoken { get; set; } = "";  
        }


        public class r_ServerVersion2_0
        {
            public string? svVersion { get; set; } = "";

        }

        public class r_ServerVersion
        {
            public string? sv_version { get; set; } = "";

        }
    }
}
