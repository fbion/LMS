using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.Text;
using System.Net;
using System.IO;
using com.hooyes.lms.Model;

namespace com.hooyes.lms.Controllers
{
    public class LoginController : Controller
    {
        [HttpPost]
        public ActionResult CheckWithCaptcha(string ID, string PWD, string Captcha, string sid)
        {
            var r = new R();
            r.Code = 101;
            r.Message = string.Empty;
            if (!string.IsNullOrEmpty(Captcha) && !string.IsNullOrEmpty(sid))
            {
                if (CodeResult.VaildateCaptcha(sid, Captcha))
                {
                    r = DAL.Login.Check(ID, PWD);
                    if (r.Code == 0)
                    {
                        U.SetLoginSession(r.Value);
                    }
                    else
                    {
                        MemCache.clear();
                    }
                }
                else
                {
                    r.Code = 197;
                    r.Message = "验证码错误";
                }
            }
            return Json(r);
        }
        [HttpPost]
        public ActionResult CheckWithNoCaptcha(string ID, string PWD, string Captcha, string sid)
        {
            var r = new R();
            r.Code = 101;
            r.Message = string.Empty;
            r = DAL.Login.Check(ID, PWD);
            if (r.Code == 0)
            {
                U.SetLoginSession(r.Value);
            }
            else
            {
                MemCache.clear();
            }
            return Json(r);
        }
        [HttpPost]
        public ActionResult CheckByApps(string ID, string PWD)
        {
            var r = new R();
            r.Code = 101;
            r.Message = string.Empty;
            r = DAL.Login.CheckByApps(ID, PWD);
            if (r.Code == 0)
            {
                r.SessionId = Session.SessionID;
                U.SetLoginSession(r.Value);
            }
            else
            {
                MemCache.clear();
            }
            return Json(r);
        }
        public void Logout()
        {
           
            MemCache.clear();
            System.Web.HttpCookie hc = new System.Web.HttpCookie("Resx", string.Empty);
            hc.Expires = DateTime.Now.AddDays(-20);
            System.Web.HttpContext.Current.Response.SetCookie(hc);
            Response.Redirect(C.APP+"/");
            //return Content(C.APP);
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
            string Url = C.APP + "/Master/Workbench";
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


    }
}
