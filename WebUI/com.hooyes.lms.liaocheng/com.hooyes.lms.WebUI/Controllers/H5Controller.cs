using com.hooyes.lms.Model;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Mvc;

namespace com.hooyes.lms.WebUI.Controllers
{
    public class H5Controller : Controller
    {
        //
        // GET: /H5/

        public ActionResult Notice(int id = 0)
        {
            string viewname = "";
            if (id != 0)
            {
                viewname = "Notice_" + id;
            }
            return View(viewname);
        }
        public ActionResult Paper(int id, int MID)
        {
            var lt = DAL.Get.MyPaper(MID, id, 0);
            ViewData["DisplayYear"] = id;
            ViewData["MID"] = MID;
            ViewData["lt"] = lt;
            return View();
        }

        [HttpPost]
        public ActionResult Paper(int id, int MID, FormCollection form)
        {

            DAL.Task.ResetPaper(MID, 0);
            foreach (var f in form.AllKeys)
            {
                var myQuestion = new MyQuestion();
                myQuestion.MID = MID;
                myQuestion.QID = Convert.ToInt32(f);
                myQuestion.Answer = Request.Form[f];
                myQuestion.Flag = 0;

                DAL.Update.MyQuestion(myQuestion);
            }
            DAL.Task.EvalutePaper(MID, id);
            Response.Redirect(string.Format(C.APP + "/H5/PaperReport?id={0}&MID={1}", id, MID));
            return Content(string.Empty);
        }

        public ActionResult PaperReport(int id, int MID)
        {

            var Product = DAL.Get.Products(MID, id);
            var Report = DAL.Get.Report(MID, id);
            ViewData["Report"] = Report;
            ViewData["DisplayYear"] = id;
            ViewData["Product"] = Product;
            var lt = DAL.Get.MyPaperResult(MID);
            ViewData["lt"] = lt;
            return View();
        }

        public ActionResult Records(int id, int MID)
        {
            var Report = DAL.Get.Report(MID, id);
            ViewData["Report"] = Report;
            return View();
        }

    }
}
