

using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using Schminder_Net.ef;
using Schminder_Net.Models;

namespace Schminder_Net.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private dbContext _dbCon;
        private IConfiguration _conf;
        private IWebHostEnvironment _env;

        private bool b_mpp_process = false;
        public HomeController(ILogger<HomeController> logger, IConfiguration conf, IWebHostEnvironment env, dbContext dbCon)
        {
            _logger = logger;
            _dbCon = dbCon;
            _conf = conf;
            _env = env;
        }

        public IActionResult Index()
        {
            HttpContext _hc = this.HttpContext;

            mApp _m_App = new mApp(_hc, this.Request, this.RouteData, _dbCon, _conf, _env);
            var e_Post = new ent_post(_dbCon);
            _m_App.mPage = new ent_page(_dbCon).doPageReadHome();
            _m_App.mPosts = new ent_post(_dbCon).doPostReadListByPageId(_m_App.mPage?.page_Id, "");

            if (b_mpp_process)
            {
                ImportAmpp(_dbCon, @"C:\dmdDataLoader\xml\f_ampp2_3100425.xml");
                ImportVmpp(_dbCon, @"C:\dmdDataLoader\xml\f_vmpp2_3100425.xml");
            }

            return View(_m_App);
        }

        public void ImportAmpp(dbContext _db_con, string filePath)
        {
            var _e_mpp = new ent_mpp(_db_con, _logger);

            //var l_elems = _e_ampp.PrintAmppElementNames(filePath);
            var l_ampp = _e_mpp.ParseAmppXml(filePath);
            //var l_ampp = _e_ampp.ParseAmppXmlWhere(filePath,"nepa");

            var _r_elems = _e_mpp.doAmpUpdateList(l_ampp);

        }

        public void ImportVmpp(dbContext _db_con, string filePath)
        {
            var _e_mpp = new ent_mpp(_db_con, _logger);

            //var l_elems = _e_ampp.PrintVmppElementNames(filePath);
            //var l_ampp = _e_ampp.ParseAmppXml(filePath);
            var l_ampp = _e_mpp.ParseVmppXml(filePath);

            var _r_elems = _e_mpp.doVmpUpdateList(l_ampp);

        }

        public async Task ImportAmppAsync(dbContext _db_con, string filePath)
        {
            var _e_mpp = new ent_mpp(_db_con, _logger);

            //var l_elems = _e_ampp.PrintAmppElementNames(filePath);
            var l_ampp = _e_mpp.ParseAmppXml(filePath);
            //var l_ampp = _e_ampp.ParseAmppXmlWhere(filePath,"nepa");

            var _r_elems = _e_mpp.doAmpUpdateList(l_ampp);

        }

        public async Task ImportVmppAsync(dbContext _db_con, string filePath)
        {
            var _e_mpp = new ent_mpp(_db_con, _logger);

            //var l_elems = _e_ampp.PrintVmppElementNames(filePath);
            //var l_ampp = _e_ampp.ParseAmppXml(filePath);
            var l_mpp = _e_mpp.ParseVmppXml(filePath);

            var _r_elems = _e_mpp.doVmpUpdateList(l_mpp);

        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
