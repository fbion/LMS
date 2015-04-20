using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Mvc;
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

        public ActionResult IndexOld()
        {
            return View();
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

        public ActionResult Help()
        {
            return View();
        }

        public ActionResult Notice()
        {
            return View();
        }
    }
}
