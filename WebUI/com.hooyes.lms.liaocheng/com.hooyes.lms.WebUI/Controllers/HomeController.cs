using System;
using System.Web.Mvc;

namespace com.hooyes.lms.Controllers
{

    [HandleError]
    public class HomeController : Controller
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        public ActionResult Index()
        {

            string Host = Request.Url.Host;
            string Alias = Host.Substring(0, Host.IndexOf("."));
            if (!string.IsNullOrEmpty(Alias))
            {
                return View("Index_" + Alias);
            }
            else
            {
                return View();
            }
        }
        public ActionResult DynamicIndex()
        {
            return View();
        }

        public ActionResult ShowIP()
        {
            string IP = Request.UserHostAddress;
            return Content(IP);
        }
        public ActionResult DatePicker()
        {
            return View();
        }

    }
}
