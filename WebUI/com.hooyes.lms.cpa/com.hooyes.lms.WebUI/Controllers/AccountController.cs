using com.hooyes.lms.Model;
using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.Mvc;

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

            //评估是否可以标为结业
            if (Report.Status == 0 && Report.Minutes >= 1125)
            {
                DAL.Task.EvaluteReport(Client.MID, id, Client.RegionCode);
                Report = DAL.Get.Report(Client.MID, id);
            }


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
            invoice.MID = Client.MID;
            invoice.IDSN = Client.IDSN;
            var r = DAL.Update.Invoice(invoice);
            return Json(r);
        }
       
        public ActionResult Paper(int id)
        {
            if (!U.IsActive(id))
            {
                GoMessage(string.Format("您尚未开通本年度的课程", id));
            }
            var Report = DAL.Get.Report(Client.MID, id);
            if (Report.Minutes < 1080)
            {
                GoMessage(string.Format("请您学够本年度课时再来参加考试", id));
            }
            var Product = DAL.Get.Products(Client.MID, id);
            var lt = DAL.Get.MyPaper(Client.MID, id, 0);
            ViewData["DisplayYear"] = id;
            ViewData["lt"] = lt;
            ViewData["Product"] = Product;
            return View();
        }
        [HttpPost]
        public ActionResult Paper(int id, FormCollection form)
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
            DAL.Task.EvalutePaper(Client.MID, id);
            Response.Redirect(string.Format(C.APP + "/Account/PaperReport/{0}", id));
            return Content(string.Empty);
        }
        public ActionResult PaperReport(int id)
        {
            if (!U.IsActive(id))
            {
                GoMessage(string.Format("您尚未开通{0}年度的课程", id));
            }
            var Product = DAL.Get.Products(Client.MID, id);
            var Report = DAL.Get.Report(Client.MID, id);
            ViewData["Report"] = Report;
            ViewData["DisplayYear"] = id;
            ViewData["Product"] = Product;
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
            var reportFinish = report.FindAll(N => N.Minutes >= 1125);
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

        public ActionResult Certificatev2(int id)
        {
            decimal Total_length = 0;
            var report = DAL.Get.Report(Client.MID,id);
            var cert = DAL.Get.Certificate(Client.MID);
            var CLData = DAL.Get.MyCourses(Client.MID, id, Client.Type);
            var certConfig = DAL.Get.CertConfig(id);
            if (cert.ID == 0)
            {
                DAL.Update.Certificate(Client.MID);
                cert = DAL.Get.Certificate(Client.MID);
            }
            if (report.Status != 1)
            {
                GoMessage("您尚未获得合格证书，请继续学习。");
            }
            //已学
            var MyCourses_1 = CLData.FindAll(n => n.Status == 1);

            var ShowList = new List<MyCourses>();
            for (int i = 0; i <MyCourses_1.Count; i++)
            {
                Total_length = Total_length + MyCourses_1[i].Length;
                if (i < 13)
                {
                    ShowList.Add(MyCourses_1[i]);
                }
            }
            if (MyCourses_1.Count > 14)
            {
                var m = new MyCourses();
                m.Name = "……";
                ShowList.Add(m);
            }


            ViewData["MyCourses_1"] = ShowList;
            ViewData["report"] = report;
            ViewData["cert"] = cert;
            ViewData["certConfig"] = certConfig;
            ViewData["PID"] = id;
            ViewData["Total_length"] = Total_length;
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
