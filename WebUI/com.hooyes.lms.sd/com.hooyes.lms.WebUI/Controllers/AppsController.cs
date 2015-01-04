using com.hooyes.lms.Model;
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
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
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
            /*
            var MyCourses = DAL.Get.Courses(Client.MID, id);
            if (!U.IsActive(MyCourses.Year))
            {
                return Content("[]");
            }
            */
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

        [HttpPost]
        public ActionResult UpdateCC(MyConents myContents)
        {
            log.Debug("myContents.MID:{0}", myContents.MID);
            log.Debug("CID:{0}", myContents.CID);
            log.Debug("CCID:{0}", myContents.CCID);
            log.Debug("Second:{0}", myContents.Second);
            log.Debug("Status:{0}", myContents.Status);
            log.Debug("Client.MID:{0}", Client.MID);
            myContents.MID = Client.MID;
            var r = DAL.Update.MyContents(myContents);
            return Json(r);
        }

    }
}
