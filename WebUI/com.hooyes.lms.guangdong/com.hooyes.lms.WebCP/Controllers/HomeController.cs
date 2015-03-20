using System.Web.Mvc;

namespace com.hooyes.lms.Controllers
{

    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return Content("");
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
