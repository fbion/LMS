using System;
using System.Configuration;
using System.Web.Mvc;

namespace com.hooyes.lms.Controllers
{
    public class LoginController : Controller
    {
     
        public void Logout()
        {
           
            MemCache.clear();
            System.Web.HttpCookie hc = new System.Web.HttpCookie("Resx", string.Empty);
            hc.Expires = DateTime.Now.AddDays(-20);
            System.Web.HttpContext.Current.Response.SetCookie(hc);

            string AuthUrl = ConfigurationManager.AppSettings.Get("auth_url");
            AuthUrl = AuthUrl.Replace("go?cbUrl=", "masterlogin?cbUrl=");
            string cbUrl = "http://" + Request.Url.Host + "/CP/login/callback";
            string sUrl = AuthUrl + cbUrl;
            Response.Redirect(sUrl);
        }
        [HttpGet]
        public ActionResult Code(string sid)
        {
            return new CodeResult(sid);
        }

        [IPRestrict]
        public ActionResult MasterLogin()
        {
            return View();
        }
        [IPRestrict]
        [HttpPost]
        public ActionResult MasterLogin(string uid, string pwd)
        {
            string Url = C.APP + "/Master/Search";
            var r = DAL.Login.CheckAdmin(uid, pwd);
            if (r.Code == 0)
            {
                MemCache.Save("admin", "admin");
                MemCache.Save("AID", r.Value);
                MemCache.Save("AdminLogin", uid);
                MemCache.Save("Tag", r.Message);
                //资源访问
                System.Web.HttpCookie hc = new System.Web.HttpCookie("Resx", r.Value.ToString());
                System.Web.HttpContext.Current.Response.SetCookie(hc);
            }
            else
            {
                Url = C.APP + "/login/masterlogin?Code="+r.Code.ToString();
            }
            Response.Redirect(Url);
            return Content("");
        }
        public void MasterLogout()
        {

            MemCache.clear();
            System.Web.HttpCookie hc = new System.Web.HttpCookie("Resx", string.Empty);
            hc.Expires = DateTime.Now.AddDays(-20);
            System.Web.HttpContext.Current.Response.SetCookie(hc);
            string Url = C.APP + "/login/masterlogin";
            Response.Redirect(Url);
            
        }

        public ActionResult Callback(int AID, int status, string sign)
        {
            string Url = C.APP + "/Master/Search";
            string Key = ConfigurationManager.AppSettings.Get("auth_key");
            string sKey = string.Format("{0}-{1}-{2}", Key, AID, DateTime.Now.ToString("yyyyMMddHH"));
            string Localsign = U.GetMD5(sKey);

            if (status == 1 && Localsign == sign)
            {

                var admin = DAL.M.Get.Admin(AID);

                if (admin.AID > 0 && admin.Level >= 0)
                {
                    MemCache.Save("admin", "admin");
                    MemCache.Save("AID", admin.AID);
                    MemCache.Save("AdminLogin", admin.Login);
                    MemCache.Save("Tag", admin.Tag);
                    MemCache.Save("Level", admin.Level);
                    //资源访问
                    System.Web.HttpCookie hc = new System.Web.HttpCookie("Resx", admin.AID.ToString());
                    System.Web.HttpContext.Current.Response.SetCookie(hc);
                    Response.Redirect(Url);
                }
            }
            return Content("Nothing");
        }


    }
}
