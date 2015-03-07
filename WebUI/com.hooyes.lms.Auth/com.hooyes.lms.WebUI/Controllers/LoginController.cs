using System;
using System.Web.Mvc;
using System.Configuration;

namespace com.hooyes.lms.Controllers
{
    public class LoginController : Controller
    {

        public ActionResult Index(string cbUrl)
        {
            string default_url = ConfigurationManager.AppSettings.Get("auth_default_login");
            if (string.IsNullOrEmpty(cbUrl))
            {
                cbUrl = default_url;
            }
            ViewData["cbUrl"] = cbUrl;
            return View();
        }
        public void Logout()
        {

            MemCache.clear();
            System.Web.HttpCookie hc = new System.Web.HttpCookie("Resx", string.Empty);
            hc.Expires = DateTime.Now.AddDays(-20);
            System.Web.HttpContext.Current.Response.SetCookie(hc);
            Response.Redirect(C.APP);
            //return Content(C.APP);
        }
        [HttpGet]
        public ActionResult Code(string sid)
        {
            return new CodeResult(sid);
        }


        public ActionResult MasterLogin(string cbUrl)
        {
            ViewData["cbUrl"] = cbUrl;
            return View();
        }

        [HttpPost]
        public ActionResult MasterLogin(string uid, string pwd, string cbUrl)
        {
            string Key = ConfigurationManager.AppSettings.Get("auth_key");
            string Url = C.APP + "/Master/Search";
            string Query = "aid={0}&status={1}&sign={2}";
            if (!string.IsNullOrEmpty(cbUrl))
            {
                Url = cbUrl;
            }
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

                string sKey = string.Format("{0}-{1}-{2}", Key, r.Value, DateTime.Now.ToString("yyyyMMddHH"));
                string sign = U.GetMD5(sKey);
                Url = Url + "?" + string.Format(Query, r.Value, 1, sign);
            }
            else
            {
                Url = C.APP + string.Format("/login/masterlogin?Code={0}&cbUrl={1}", r.Code, cbUrl);
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


        public ActionResult Go(string cbUrl)
        {
            string loginurl = C.APP + "/login/masterlogin?cbUrl=" + cbUrl;
            string Url = cbUrl;
            string Key = ConfigurationManager.AppSettings.Get("auth_key");
            string Query = "aid={0}&status={1}&sign={2}";

            if (Client.IsAdministrator)
            {
                string sKey = string.Format("{0}-{1}-{2}", Key, Client.AID, DateTime.Now.ToString("yyyyMMddHH"));
                string sign = U.GetMD5(sKey);
                Url = Url + "?" + string.Format(Query, Client.AID, 1, sign);
                Response.Redirect(Url);
            }
            else
            {
                Response.Redirect(loginurl);
            }

            return Content("");
        }


    }
}
