using System;
using System.Web.Mvc;
using System.Configuration;

namespace com.hooyes.lms.Controllers
{
    public class HomeController : Controller
    {

        public ActionResult Index()
        {
            return Content("");
        }
    }
}
