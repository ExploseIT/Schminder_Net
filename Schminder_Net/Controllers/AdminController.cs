
using Schminder_Net.ef;
using Schminder_Net.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authentication;
using System.Security.Claims;
using System.Web;
using System.Reflection.Metadata;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Text;

namespace Schminder_Net.Controllers
{
    [Authorize]
    public class AdminController : Controller
    {
        private readonly ILogger<AdminController> _logger;
        private dbContext _dbCon;
        private IConfiguration _conf;
        private IWebHostEnvironment _env;

        public AdminController(ILogger<AdminController> logger, IConfiguration conf, IWebHostEnvironment env, dbContext dbCon)
        {

            _logger = logger;
            _dbCon = dbCon;
            _conf = conf;
            _env = env;
        }

        [AllowAnonymous]
        [HttpGet]
        public IActionResult Index()
        {
            HttpContext _hc = this.HttpContext;

            mApp _m_App = new mApp(_hc, this.Request, this.RouteData, _dbCon, _conf, _env);

            return View(_m_App);
        }

        public IActionResult Dashboard()
        {
            HttpContext _hc = this.HttpContext;

            mApp _m_App = new mApp(_hc, this.Request, this.RouteData, _dbCon, _conf, _env);

            return View(_m_App);
        }

        [HttpPost]
        public IActionResult BlogPost(cBlog _blog)
        {

            HttpContext _hc = this.HttpContext;

            mApp _m_App = new mApp(_hc, this.Request, this.RouteData, _dbCon, _conf, _env);
            _blog.blogTitleToUrl();
            _blog.blogLocaliseUrls(_m_App.mUrl!,_m_App.mVDir!);
            _blog = new ent_blog(_dbCon).doBlogUpdate(_blog);
            _m_App._cBlog = _blog;
            return RedirectToAction("BlogEdit", new { id = _blog.blog_id });
        }

        public IActionResult BlogList()
        {
            HttpContext _hc = this.HttpContext;

            mApp _m_App = new mApp(_hc, this.Request, this.RouteData, _dbCon, _conf, _env);

            return View(_m_App);
        }

        [Route("admin/blog-edit/{id?}")]
        public IActionResult BlogEdit(string id)
        {
            HttpContext _hc = this.HttpContext;

            mApp _m_App = new mApp(_hc, this.Request, this.RouteData, _dbCon, _conf, _env);
            Guid gid = Guid.Empty;
            if (Guid.TryParse(id, out gid))
            { 
                cBlog _blog = new ent_blog(_dbCon).doBlogReadById(gid);
                _m_App._cBlog = _blog;
            }

            return View(_m_App);
        }

        public IActionResult ProductDataItem(Guid id)
        {
            HttpContext _hc = this.HttpContext;

            mApp _m_App = new mApp(_hc, this.Request, this.RouteData, _dbCon, _conf, _env);

            cProductData _prd = new cProductData();
            if (id != Guid.Empty)
            {
                _prd = new ent_productdata(_dbCon).prdProductDataReadById(id)!;
            }
            
            _m_App._prdsProductSources = new ent_productdata(_dbCon).prdsProductSourceList();
            _m_App._prdcProductCats = new ent_productdata(_dbCon).prdcProductCatList();
                
            return View(_m_App);
        }

        [HttpPost]
        public IActionResult ProductDataItemPost(cProductData p)
        {
            HttpContext _hc = this.HttpContext;

            mApp _m_App = new mApp(_hc, this.Request, this.RouteData, _dbCon, _conf, _env);
            
            var _e_prd = new ent_productdata(_dbCon);
            p.prdTitleAndSourceToUrl();
            var _prd = _e_prd.prdProductDataUpdate(p);
            //_m_App._prdProductData = _prd;
            _m_App._prdsProductSources = _e_prd.prdsProductSourceList();
            _m_App._prdcProductCats = _e_prd.prdcProductCatList();
            return RedirectToAction("ProductDataItem", new { id = _prd!.prdId });
        }

        public IActionResult ProductDataList()
        {
            HttpContext _hc = this.HttpContext;

            mApp _m_App = new mApp(_hc, this.Request, this.RouteData, _dbCon, _conf, _env);

            return View(_m_App);
        }


        [HttpPost]
        public IActionResult AppContentPost(cPageContent _cpd)
        {
            // Use the model data
            var name = _cpd.pc_name;
            var value = _cpd.pc_value;

            HttpContext _hc = this.HttpContext;

            mApp _m_App = new mApp(_hc, this.Request, this.RouteData, _dbCon, _conf, _env);

            _m_App._cPageContent = new ent_pagedata(_dbCon).pdPageContentUpdate(_cpd);
            return RedirectToAction("AppContent",  new { id = _cpd.pc_id });
        }

        public IActionResult AppContent(int id)
        {
            HttpContext _hc = this.HttpContext;

            mApp _m_App = new mApp(_hc, this.Request, this.RouteData, _dbCon, _conf, _env);

            return View(_m_App);
        }

        public IActionResult AppContents()
        {
            HttpContext _hc = this.HttpContext;

            mApp _m_App = new mApp(_hc, this.Request, this.RouteData, _dbCon, _conf, _env);
            var _cPD = new cPageData();
            _cPD.pd_contents = new ent_pagedata(_dbCon).pdPageContentListAll();
            _m_App._cPageData = _cPD;
            return View(_m_App);
        }



        [AllowAnonymous]
        [HttpGet]
        public IActionResult Login()
        {
            HttpContext _hc = this.HttpContext;
            string _method = _hc.Request.Method;
            mApp _m_App = new mApp(_hc, this.Request, this.RouteData, _dbCon, _conf, _env);

            return View(_m_App);
        }

        [AllowAnonymous]
        [HttpPost]
        public async Task<IActionResult> LoginAsync(ent_user? _mUser)
        {
            HttpContext _hc = this.HttpContext;
            string? returnUrl = null;

            bool b_authtype_jwt = true;

            Exception? exc = null;
            mApp? _m_App = null;
            try
            {
                var pqs = HttpUtility.ParseQueryString(this.Request.QueryString.Value ?? "");
                if (pqs.HasKeys())
                {
                    returnUrl = (pqs["ReturnUrl"]! + "").ToLower()!;
                    if (returnUrl.IndexOf("/admin") > 0)
                    {
                        
                    }
                }

                _m_App = new mApp(_hc, this.Request, this.RouteData, _dbCon, _conf, _env);

                ent_user e_user = new ent_user(_m_App.getDBContext()!);
                
                if (b_authtype_jwt)
                {
                    var accessToken = Request.Headers["Authorization"].ToString();

                    if (string.IsNullOrEmpty(accessToken))
                    {
                        return Unauthorized(new { Message = "No Authorization token provided" });
                    }

                    // ✅ Remove "Bearer " prefix from token
                    var token = accessToken.Replace("Bearer ", "");

                    // ✅ Decode JWT token
                    var handler = new JwtSecurityTokenHandler();
                    var jwtToken = handler.ReadJwtToken(token);

                    var username = jwtToken.Claims.FirstOrDefault(c => c.Type == ClaimTypes.Name)?.Value;
                    var userId = jwtToken.Claims.FirstOrDefault(c => c.Type == ClaimTypes.NameIdentifier)?.Value;

                    var mUser = e_user.doUserReadByUsernamePwd(_mUser!);

                    //Sign in with JWT
                    if (username != null) 
                    {

                    }
                    if (!String.IsNullOrEmpty(returnUrl))
                    {
                        Response.Redirect(returnUrl);
                    }
                }
                else
                {
                    var mUser = e_user.doUserReadByUsernamePwd(_mUser!);
                    //Sign in with Cookie
                    if (mUser != null)
                    {
                        var claims = new[] {
                new Claim(ClaimTypes.NameIdentifier, mUser.user_id.ToString()),
                new Claim(ClaimTypes.Name, mUser.user_username!),
            };

                        var identity = new ClaimsIdentity(claims, "CookieAuth");
                        var principal = new ClaimsPrincipal(identity);
                        await this.HttpContext.SignInAsync(principal);

                        this.HttpContext.Response.Redirect(this.HttpContext.Request.PathBase + "/Admin/");
                    }
                    if (!String.IsNullOrEmpty(returnUrl))
                    {
                        Response.Redirect(returnUrl);
                    }
                }
            }
            catch (Exception ex)
            {
                exc = ex;
            }

            return View(_m_App);
        }

        public async Task<IActionResult> LogoutAsync(ent_user? _mUser)
        {
            HttpContext _hc = this.HttpContext;

            mApp _m_App = new mApp(_hc, this.Request, this.RouteData, _dbCon, _conf, _env);

            await this.HttpContext.SignOutAsync();

            this.HttpContext.Response.Redirect(this.HttpContext.Request.PathBase + "/Admin/");

            return View("Login", _m_App);
        }


        public IActionResult Logout()
        {
            HttpContext _hc = this.HttpContext;

            mApp _m_App = new mApp(_hc, this.Request, this.RouteData, _dbCon, _conf, _env);
            return View(_m_App);
        }

        private string GenerateJwtToken(string username)
        {
            var jwtSettings = _conf.GetSection("JwtSettings");
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtSettings["SecretKey"]!));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var claims = new[]
            {
            new Claim(JwtRegisteredClaimNames.Sub, username),
            new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
        };

            var token = new JwtSecurityToken(
                issuer: jwtSettings["Issuer"],
                audience: jwtSettings["Audience"],
                claims: claims,
                expires: DateTime.UtcNow.AddMinutes(Convert.ToDouble(jwtSettings["ExpiryMinutes"])),
                signingCredentials: creds
            );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}

