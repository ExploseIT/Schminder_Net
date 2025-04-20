

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

        [HttpGet("api_ServerVersion")]
        public  c_ServerVersion api_ServerVersion()
        {
            HttpContext _hc = this.HttpContext;

            c_ServerVersion ret = new c_ServerVersion();
            ret.sv_version = typeof(mApp).Assembly.GetName().Version!.ToString();

            return ret;
        }



        public class c_ServerVersion
        {
            public string? sv_version { get; set; } = "";

        }
    }
}
