using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using com.hooyes.lms.Model;
using com.hooyes.lms.SMS;

namespace com.hooyes.lms.Controllers
{
    [CustomAuthorize]
    public class AccountController : Controller
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();

        [CustomActionFilter(Year = 2012)]
        public ActionResult Learning()
        {
            var CLData = DAL.Get.MyCourses(Client.MID, Client.Year, Client.Type);
            var Report = DAL.Get.Report(Client.MID);
            var CateCount1 = CLData.Count(n => n.Cate == 1);
            var CateCount0 = CLData.Count(n => n.Cate == 0);
            ViewData["MyCourses"] = CLData;
            ViewData["CateCount1"] = CateCount1;
            ViewData["CateCount0"] = CateCount0;
            ViewData["Report"] = Report;
            return View();
        }
        [CustomActionFilter(Year = 2011)]
        public ActionResult Learning2011()
        {
            var CLData = DAL.Get.MyCourses(Client.MID, Client.Year, Client.Type);
            var CateCount1 = CLData.Count(n => n.Cate == 1);
            var CateCount0 = CLData.Count(n => n.Cate == 0);
            ViewData["MyCourses"] = CLData;
            ViewData["CateCount1"] = CateCount1;
            ViewData["CateCount0"] = CateCount0;
            var Report = DAL.Get.Report(Client.MID);
            ViewData["Report"] = Report;
            return View();
        }
        [CustomActionFilter(Year = 2010)]
        public ActionResult LearningRestudy()
        {
            var CLData = DAL.Get.MyCourses(Client.MID, Client.Year, Client.Type);
            ViewData["MyCourses"] = CLData;
            var Report = DAL.Get.Report(Client.MID);
            ViewData["Report"] = Report;
            return View();
        }
        //[RequiredFinishExam(Order = 0)]
        [RequiredPhoneValidate(Order = 1)]
        public ActionResult Contents(int cid)
        {
            var MyContents = DAL.Get.Contents(Client.MID, cid);
            var MyCourses = DAL.Get.Courses(Client.MID, cid);
            ViewData["CID"] = cid;
            ViewData["MyCourses"] = MyCourses;
            ViewData["MyContents"] = MyContents;
            return View();
        }
        //[RequiredFinishExam(Order = 0)]
        [RequiredPhoneValidate(Order = 1)]
        public ActionResult Player(int cid, int ccid)
        {
            var LtContents = DAL.Get.Contents(cid);
            string startUrl = string.Empty;
            ViewData["CID"] = cid;
            ViewData["CCID"] = ccid;
            ViewData["Courses"] = DAL.Get.Courses(cid);
            //ViewData["LtContents"] = LtContents;
            ViewData["Contents"] = LtContents.Find(delegate(Model.Contents c) { return c.CCID == ccid; });
            return View();
        }

        [RequiredPhoneValidate(Order = 1)]
        public ActionResult PlayerHD(int cid, int ccid)
        {
            var LtContents = DAL.Get.Contents(cid);
            string startUrl = string.Empty;
            ViewData["CID"] = cid;
            ViewData["CCID"] = ccid;
            ViewData["Courses"] = DAL.Get.Courses(cid);
            //ViewData["LtContents"] = LtContents;
            ViewData["Contents"] = LtContents.Find(delegate(Model.Contents c) { return c.CCID == ccid; });
            return View();
        }
        public ActionResult Invoice(string act)
        {
            var invoice = DAL.Get.Invoice(Client.MID);
            ViewData["invoice"] = invoice;
            ViewData["act"] = act;
            return View();
        }
        [HttpPost]
        public ActionResult Invoice(Invoice invoice)
        {
            invoice.MID = Client.MID;
            invoice.IDSN = Client.IDSN;
            var r = DAL.Update.Invoice(invoice);
            return Json(r);
        }
        [RequiredFinishCourses]
        public ActionResult Paper()
        {
            var lt = DAL.Get.MyPaper(Client.MID, Client.Year, Client.Type);
            ViewData["lt"] = lt;
            return View();
        }
        [HttpPost]
        [RequiredFinishCourses]
        public ActionResult Paper(FormCollection form)
        {
            DAL.Task.ResetPaper(Client.MID, 0);
            foreach (var f in form.AllKeys)
            {
                var myQuestion = new MyQuestion();
                myQuestion.MID = Client.MID;
                myQuestion.QID = Convert.ToInt32(f);
                myQuestion.Answer = Request.Form[f];
                myQuestion.Flag = 0;

                DAL.Update.MyQuestion(myQuestion);
            }
            DAL.Task.EvalutePaper(Client.MID);
            Response.Redirect(C.APP + "/Account/PaperReport");
            return Content(string.Empty);
        }
        public ActionResult PaperReport()
        {
            var Report = DAL.Get.Report(Client.MID);
            ViewData["Report"] = Report;
            return View();
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
        public ActionResult Setting()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Setting(int Type, string Phone, string phonecode)
        {
            var r = API.SMSx.ValidateCode(phonecode);
            if (r.Code == 0)
            {
                r = DAL.Get.CheckPhone(Client.MID, Client.Year, Phone);
                if (r.Code == 0)
                {
                    var m = new Member();
                    m.MID = Client.MID;
                    m.Phone = Phone;
                    m.Type = Type;
                    r = DAL.Update.Setting(m);
                    if (r.Code == 0)
                    {
                        U.SetLoginSession(Client.MID);
                    }
                    API.SMSx.ClearPhoneCode();
                }
            }
            return Json(r);
        }
        [HttpPost]
        public ActionResult Setting2(int Type, string Phone, string phonecode)
        {

            var r = DAL.Get.CheckPhone(Client.MID, Client.Year, Phone);
            if (r.Code == 0)
            {
                var m = new Member();
                m.MID = Client.MID;
                m.Phone = Phone;
                m.Type = Type;
                r = DAL.Update.Setting(m);
                if (r.Code == 0)
                {
                    U.SetLoginSession(Client.MID);
                }
            }

            return Json(r);
        }
        public ActionResult UpdatePhone()
        {
            return View();
        }
        [HttpPost]
        public ActionResult UpdatePhone(string Phone, string phonecode)
        {
            var r = API.SMSx.ValidateCode(phonecode);
            if (r.Code == 0)
            {
                r = DAL.Get.CheckPhone(Client.MID, Client.Year, Phone);
                if (r.Code == 0)
                {
                    var m = new Member();
                    m.MID = Client.MID;
                    m.Phone = Phone;
                    m.Type = Client.Type;
                    r = DAL.Update.Setting(m);
                    if (r.Code == 0)
                    {
                        U.SetLoginSession(Client.MID);
                    }
                    API.SMSx.ClearPhoneCode();
                }
            }
            return Json(r);
        }
        [HttpPost]
        public ActionResult UpdatePhone2(string Phone, string phonecode)
        {

            var r = DAL.Get.CheckPhone(Client.MID, Client.Year, Phone);
            if (r.Code == 0)
            {
                var m = new Member();
                m.MID = Client.MID;
                m.Phone = Phone;
                m.Type = Client.Type;
                r = DAL.Update.Setting(m);
                if (r.Code == 0)
                {
                    U.SetLoginSession(Client.MID);
                }

            }

            return Json(r);
        }
        public ActionResult ValidatePhone(int cid)
        {
            ViewData["CID"] = cid;
            var r = DAL.Get.CheckHours(Client.MID);
            // Code 为1说明直接让学员验证通过。
            if (r.Code == 1)
            {
                log.Info("auto validate,MID:{0} CID:{1}", Client.MID, cid);
                r = DAL.Update.Validate(Client.MID, cid, 1);
                if (r.Code == 0)
                {
                    string Url = C.APP + "/Account/Contents?cid=" + cid.ToString();
                    Response.Redirect(Url);
                    Response.End();
                }
            }
            return View();
        }
        [HttpPost]
        public ActionResult ValidatePhone(string phone, string phonecode, int cid)
        {
            var r = API.SMSx.ValidateCode(phonecode);
            if (r.Code == 0)
            {
                r = DAL.Update.Validate(Client.MID, cid, 1);
                API.SMSx.ClearPhoneCode();
            }
            return Json(r);
        }
        [HttpPost]
        public ActionResult ReSendPhoneCode()
        {
            var r = API.SMSx.ReSendCode(Client.Phone);
            return Json(r);
        }

        [HttpPost]
        public ActionResult SendPhoneCode(string Phone)
        {
            var r = API.SMSx.ReSendCode(Phone);
            return Json(r);
        }

        [HttpPost]
        public ActionResult CheckPhone(string phone)
        {
            var r = DAL.Get.CheckPhone(Client.MID, Client.Year, phone);
            return Json(r);
        }

        public ActionResult Error(int Code)
        {
            string Message = string.Empty;
            switch (Code)
            {
                case 1:
                    Message = "您尚未完成要求的课时，需要学完1080分钟的课程后才可以参加考试。";
                    break;
                case 201:
                    Message = "学习完必修的8个课时后才能进行选学课程的学习";
                    break;
                case 202:
                    Message = "您已通过考试无需再次考试，请继续学习选修课程";
                    break;
                default:
                    Message = "Sorry, an error occurred while processing your request.";
                    break;
            }
            ViewData["Message"] = Message;
            return View();
        }
    }
}
