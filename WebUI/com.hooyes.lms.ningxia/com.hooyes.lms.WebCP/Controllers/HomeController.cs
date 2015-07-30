using System.Web.Mvc;

namespace com.hooyes.lms.Controllers
{

    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return Content(string.Empty);

        }
    }
}
