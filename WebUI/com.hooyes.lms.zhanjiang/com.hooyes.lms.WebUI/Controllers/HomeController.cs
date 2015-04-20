using com.hooyes.lms.Model;
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


        public ActionResult hooyes_compProve(Member member)
        {
            var param = new API.GuangdongParams1();
            param.cardNumber = member.IDCard;
            param.compId = member.IDCert;
            param.compName = member.Name;
            param.areaName = member.City;

            var r = API.Guangdong.compProve(param);
            return Json(r, JsonRequestBehavior.AllowGet);
        }

    }
}
