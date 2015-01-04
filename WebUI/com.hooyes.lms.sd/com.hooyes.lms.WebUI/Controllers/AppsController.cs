using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Mvc;

namespace com.hooyes.lms.WebUI.Controllers
{
    [CustomAuthorize]
    public class AppsController : Controller
    {
        //
        // GET: /Apps/

        public ActionResult Test()
        {

            var json = new { flag = 0, info = string.Format("MID:{0},Name:{1}", Client.MID, Client.Name), level = 1, sessionid = Session.SessionID };

            return Json(json, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetMyCourse(int id)
        {
            var CLData = DAL.Get.MyCourses(Client.MID, id, Client.Type);

            return Json(CLData, JsonRequestBehavior.AllowGet);
           

        }
        public ActionResult GetContents(int id)
        {
            var MyCourses = DAL.Get.Courses(Client.MID, id);
            if (!U.IsActive(MyCourses.Year))
            {
                return Content("[]");
            }
            var MyContents = DAL.Get.Contents(Client.MID, id);

            return Json(MyContents, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetReport(int id)
        {
            var Report = DAL.Get.Report(Client.MID, id);
            
            return Json(Report, JsonRequestBehavior.AllowGet);
        }

        public ActionResult GetProfiles()
        {
            var member = DAL.Get.Member(Client.MID);
            return Json(member, JsonRequestBehavior.AllowGet);
        }

    }
}
