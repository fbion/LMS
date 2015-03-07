using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml;
using System.Xml.Linq;
using System.IO;
using System.Text;
using System.Web.Script.Serialization;
using com.hooyes.lms.Model;
using com.hooyes.lms.API;
using com.hooyes.lms.DAL;

namespace com.hooyes.lms.Controllers
{
    
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult DynamicIndex()
        {
            return View();
        }

        public ActionResult Faq()
        {
            return View();
        }

        public ActionResult ShowIP()
        {
            string IP = Request.UserHostAddress;
            return Content(IP);
        }

    }
}
