using System.Web.Mvc;


namespace com.hooyes.lms.Controllers
{
   

    [RequiredMaster]
    public class SurveyController : Controller
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();

        [RequiredTag(Tag = 19)]
        public ActionResult Summary()
        {
            return View();
        }
        [RequiredTag(Tag = 19)]
        public ActionResult Feedback()
        {
            return View();
        }
    }
}
