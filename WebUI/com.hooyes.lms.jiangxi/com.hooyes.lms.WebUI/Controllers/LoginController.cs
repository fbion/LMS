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

    }
}
