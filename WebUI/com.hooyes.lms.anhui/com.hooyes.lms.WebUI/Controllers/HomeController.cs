using System.Web.Mvc;

namespace com.hooyes.lms.Controllers
{
    
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        [NonAction]
        public ActionResult DynamicIndex()
        {
            return View();
        }

        public ActionResult ShowIP()
        {
            string IP = Request.UserHostAddress;
            return Content(IP);
        }

        [NonAction]
        public ActionResult Help()
        {
            return View();
        }
        public ActionResult DatePicker()
        {
            return View();
        }
    }
}
