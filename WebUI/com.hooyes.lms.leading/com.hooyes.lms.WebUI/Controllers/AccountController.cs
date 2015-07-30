using System;
using System.Web;
using System.Web.Mvc;
using com.hooyes.lms.Model;

namespace com.hooyes.lms.Controllers
{
    [CustomAuthorize]
    public class AccountController : Controller
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();

        public ActionResult LearningX(int id)
        {
            if (!U.IsActive(id))
            {
                GoMessage(string.Format("您尚未开通{0}年度的课程", id));
            }
            var CLData = DAL.Get.MyCourses(Client.MID, id, Client.Type);
            var Report = DAL.Get.Report(Client.MID, id);
            var Product = DAL.Get.Products(Client.MID, id);
            //必修
            ViewData["MyCourses_1"] = CLData.FindAll(n => n.Cate == 1);
            //选修 
            ViewData["MyCourses_0"] = CLData.FindAll(n => n.Cate == 0);
            ViewData["DisplayYear"] = id;
            ViewData["Report"] = Report;
            ViewData["Product"] = Product;
            
            return View();
        }


        public ActionResult Contents(int id)
        {
            var MyCourses = DAL.Get.Courses(Client.MID, id);
            if (!U.IsActive(MyCourses.Year))
            {
                GoMessage(string.Format("您尚未开通本课程"));
            }
            var MyContents = DAL.Get.Contents(Client.MID, id);
            ViewData["CID"] = id;
            ViewData["MyCourses"] = MyCourses;
            ViewData["MyContents"] = MyContents;
            return View();
        }


        public ActionResult Player(int cid, int ccid)
        {
            var Courses = DAL.Get.Courses(cid);
            if (!U.IsActive(Courses.Year))
            {
                GoMessage(string.Format("您尚未开通本课程"));
            }
            var LtContents = DAL.Get.Contents(cid);
            string startUrl = string.Empty;
            ViewData["CID"] = cid;
            ViewData["CCID"] = ccid;
            ViewData["Courses"] = Courses;
            //ViewData["LtContents"] = LtContents;
            ViewData["Contents"] = LtContents.Find(delegate(Model.Contents c) { return c.CCID == ccid; });
            return View();
        }
        public ActionResult PlayerHD(int cid, int ccid)
        {
            var Courses = DAL.Get.Courses(cid);
            if (!U.IsActive(Courses.Year))
            {
                GoMessage(string.Format("您尚未开通本课程"));
            }
            var LtContents = DAL.Get.Contents(cid);
            string startUrl = string.Empty;
            ViewData["CID"] = cid;
            ViewData["CCID"] = ccid;
            ViewData["Courses"] = Courses;
            //ViewData["LtContents"] = LtContents;
            ViewData["Contents"] = LtContents.Find(delegate(Model.Contents c) { return c.CCID == ccid; });
            return View();
        }
        public ActionResult Invoice(string act)
        {
            var invoice = DAL.Get.Invoice(Client.MID);
            var CashAmount = DAL.Get.AvailableInvoiceCash(Client.MID);
            ViewData["invoice"] = invoice;
            ViewData["act"] = act;
            ViewData["CashAmount"] = CashAmount;
            return View();
        }
        [HttpPost]
        public ActionResult Invoice(Invoice invoice)
        {
            var r = new R();
            var CashAmount = DAL.Get.AvailableInvoiceCash(Client.MID);
            if (CashAmount.DecimalValue >= invoice.Amount)
            {
                invoice.MID = Client.MID;
                invoice.IDSN = Client.IDSN;
                r = DAL.Update.Invoice(invoice);
            }
            else
            {
                r.Code = 101;
                r.Message = "申请金额超出可申请配额";
            }
            return Json(r);
        }

        public ActionResult Paper(int id, int cid)
        {
            if (!U.IsActive(id))
            {
                GoMessage(string.Format("您尚未开通{0}年度的课程", id));
            }
            var MyCourses = DAL.Get.Courses(Client.MID, cid);
            if (MyCourses.Status != 1)
            {
                GoMessage(string.Format("请您学完本课《{0}》后再来参加考试", MyCourses.Name));
            }
            var lt = DAL.Get.MyPaper(Client.MID, id, cid);
            if (lt.Count == 0)
            {
                GoMessage(string.Format("暂无试卷"));
            }
            ViewData["MyCourses"] = MyCourses;
            //ViewData["DisplayYear"] = id;
            ViewData["lt"] = lt;
            return View();
        }
        [HttpPost]
        public ActionResult Paper(int id, int cid, FormCollection form)
        {
            if (!U.IsActive(id))
            {
                GoMessage(string.Format("您尚未开通{0}年度的课程", id));
            }
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
            DAL.Task.EvalutePaper(Client.MID, id, cid);
            Response.Redirect(string.Format(C.APP + "/Account/PaperReport/p/{0}/{1}", id, cid));
            return Content(string.Empty);
        }
        public ActionResult PaperReport(int id, int cid)
        {
            if (!U.IsActive(id))
            {
                GoMessage(string.Format("您尚未开通{0}年度的课程", id));
            }
            var MyCourses = DAL.Get.Courses(Client.MID, cid);
            //var Report = DAL.Get.Report(Client.MID, id);
            //ViewData["Report"] = Report;
            ViewData["MyCourses"] = MyCourses;
            ViewData["DisplayYear"] = id;
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

        public ActionResult Certificate()
        {
            var report = DAL.Get.MyReport(Client.MID);
            var reportFinish = report.FindAll(N => N.Score >= 60 && N.Minutes >= 1080);
            var cert = DAL.Get.Certificate(Client.MID);
            if (reportFinish.Count > 0 && cert.ID == 0)
            {
                DAL.Update.Certificate(Client.MID);
                cert = DAL.Get.Certificate(Client.MID);
            }
            if (reportFinish.Count == 0)
            {
                GoMessage("您尚未获得合格证书，请继续学习。");
            }
            ViewData["report"] = reportFinish;
            ViewData["cert"] = cert;

            return View();
        }

        public ActionResult Error(int Code)
        {
            string Message = string.Empty;
            switch (Code)
            {
                case 1:
                    Message = "您尚未完成要求的课时";
                    break;
                case 201:
                    Message = "必学的8课时学完，并考试通过后才能进行选学课程的学习";
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

        public ActionResult Message(string m)
        {
            ViewData["Message"] = HttpUtility.UrlDecode(m);
            return View();
        }

        [NonAction]
        private void GoMessage(string Message)
        {
            string Url = C.APP + "/Account/Message?m=" + HttpUtility.UrlEncode(Message);
            Response.Redirect(Url);
        }
    }
}
