using com.hooyes.lms.Model;
using System;
using System.Text.RegularExpressions;
using System.Web.Mvc;

namespace com.hooyes.lms.WebUI.Controllers
{
    public class SurveyController : Controller
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        [HttpPost]
        public ActionResult Add(Survey p)
        {
            p.IP = Request.UserHostAddress;
            if (Client.IsLogin)
            {
                p.IDCard = Client.IDCard;
                p.IDSN = Client.IDSN;
                p.Name = Client.Name;
                p.Phone = Client.Phone;
            }
            var r = DAL.Update.Survey(p);
            return Json(r);
        }

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Finish()
        {
            return View();
        }

        public ActionResult DynamicIndex()
        {
            ViewData["data"] = DAL.Get.SurveyItem(1, 0);
            return View();
        }

        [HttpPost]
        public ActionResult Collect(FormCollection form)
        {
            string Url = C.APP + "/Survey/Finish?Thankyou";
            try
            {
                foreach (var f in form.AllKeys)
                {
                    string value = Request.Form[f];
                    if (!string.IsNullOrEmpty(value))
                    {
                        if (Regex.IsMatch(value, @"^\d+$") && value.Length < 10)
                        {
                            var p = new SurveyRecordsInt();
                            p.ItemID = Convert.ToInt32(f);
                            p.ItemValue = Convert.ToInt32(value);
                            DAL.Update.Survey(p);
                        }
                        else
                        {
                            var p = new SurveyRecordsText();
                            p.ItemID = Convert.ToInt32(f);
                            p.ItemValue = value;
                            DAL.Update.Survey(p);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                log.Warn("{0},{1}", ex.Message, ex.StackTrace);
                Url = C.APP + "/Survey/Finish?Thankyou_";
            }
            Response.Redirect(Url);
            return Content(string.Empty);
        }

    }
}
