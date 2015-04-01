using com.hooyes.lms.DAL;
using com.hooyes.lms.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Web.Mvc;


namespace com.hooyes.lms.Controllers
{
    [IPRestrict]
    [RequiredMaster]
    public class MasterController : Controller
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        public ActionResult ListMember(Model.M.M1Params m1params)
        {
            m1params.Years = Request.QueryString.Get("Years"); //Years 多条
            m1params.RegionCodes = Request.QueryString.Get("RegionCodes"); 
            ViewData["Filter"] = U.BuildFilter(m1params);
            ViewData["JsonStr"] = U.BuildJSON(m1params);
            return View();
        }
        public ActionResult ListInvoice(Model.M.M2Params m2params)
        {
            //m2params.Years = Request.QueryString.Get("Years"); //Years 多条
            ViewData["Filter"] = U.BuildFilter(m2params);
            ViewData["JsonStr"] = U.BuildJSON(m2params);
            return View();
        }
        public ActionResult ListIncomes(Model.M.IncomesParams Params)
        {
            //m2params.Years = Request.QueryString.Get("Years"); //Years 多条
            ViewData["Filter"] = U.BuildFilter(Params);
            ViewData["JsonStr"] = U.BuildJSON(Params);
            return View();
        }
        public ActionResult FixCourses()
        {
            return View();
        }
        public ActionResult Search()
        {
            return View();
        }
        public ActionResult ViewCourses(int MID,int Year)
        {
            var r = DAL.Task.EvaluteCourses(MID, Year); 
            return View();
        }
        public ActionResult ViewInvoice()
        {
            return View();
        }
        public ActionResult CreditCourses(int MID, int CID)
        {
            string rx = string.Empty;
            try
            {
                var r = DAL.M.BaseUpdate.Courses(MID, CID);
                var r2 = DAL.Task.EvaluteCourses(MID);
                string referrer = Request.UrlReferrer.ToString();
                Response.Redirect(referrer);
            }
            catch (Exception ex)
            {
                rx = ex.Message;
            }
            return Content(rx);
        }
        [HttpPost]
        public ActionResult CreditCourses(int MID)
        {
            string referrer = Request.UrlReferrer.ToString();
            string CIDs = Request.Form["CID"];
            if (!string.IsNullOrEmpty(CIDs))
            {
                string[] CIDa = CIDs.Split(',');

                foreach (var CIDi in CIDa)
                {
                    int CID = Convert.ToInt32(CIDi);
                    var r = DAL.M.BaseUpdate.Courses(MID, CID);
                }
            }
            var r2 = DAL.Task.EvaluteCourses(MID);
            Response.Redirect(referrer);
            return Content(CIDs);
        }
        [HttpPost]
        public ActionResult ValidateCourses(int MID)
        {
            string referrer = Request.UrlReferrer.ToString();
            string CIDs = Request.Form["CID"];
            if (!string.IsNullOrEmpty(CIDs))
            {
                string[] CIDa = CIDs.Split(',');

                foreach (var CIDi in CIDa)
                {
                    int CID = Convert.ToInt32(CIDi);
                    var r = DAL.Update.Validate(MID, CID, 1);
                }
            }

            return Json(new { Code = 0,Message ="success" });
        }
        [HttpPost]
        public ActionResult CreditScore(int MID, int Year, int Score)
        {
            string referrer = Request.UrlReferrer.ToString();
            Score = Score > 0 ? Score : 0;
            Report re = new Report();
            re.Score = Score;
            re.MID = MID;
            re.Year = Year;
            if (Score >= 60)
            {
                re.Status = 1;
            }
            var r = DAL.Update.Report(re);
            Response.Redirect(referrer);
            return Content(r.Message);
        }

        [HttpPost]
        public ActionResult CreditSingleScore(int MID)
        {
            string referrer = Request.UrlReferrer.ToString();
            string CIDs = Request.Form["CID_Score"];
            if (!string.IsNullOrEmpty(CIDs))
            {
                string[] CIDa = CIDs.Split(',');

                foreach (var CIDi in CIDa)
                {
                    try
                    {
                        int CID = Convert.ToInt32(CIDi);
                        int Score = Convert.ToInt32(Request.Form[string.Format("CID_Score_{0}", CID)]);
                        if (Score > 0 && Score<=100)
                        {
                            DAL.M.Update.MyCourses(MID, CID, Score);
                        }
                    }
                    catch (Exception ex)
                    {
                        log.Warn("{0},{1}", ex.Message,ex.StackTrace);
                    }
                }
            }
           
            Response.Redirect(referrer);
            return Content(CIDs);
        }

        [RequiredTag(Tag = 4)]
        public ActionResult ImportMember()
        {
            string FilePath = AppDomain.CurrentDomain.BaseDirectory + "App_Data/20120423_Member_Import.xls";
            DAL.Import.Member(FilePath);
            return Content("");
        }

        #region MemberCredit Controller

        [RequiredTag(Tag = 4)]
        public ActionResult ImportMemberCredit(string fileName,decimal SN)
        {
            string FilePath = AppDomain.CurrentDomain.BaseDirectory + "App_Data/" + fileName;
            var r = DAL.Import.MemberCredit(FilePath, SN);
            var r2 = DAL.Import.MemberCreditTask();
            var Url = "UploadComplete?SN={0}";
            Url = string.Format(Url, SN);
            Response.Redirect(Url);
            return Content(r.Message);
        }

        [RequiredTag(Tag = 4)]
        public ActionResult Upload()
        {
            return View();
        }

        [RequiredTag(Tag = 4)]
        public ActionResult UploadComplete()
        {
            return View();
        }

        #endregion

        #region Invoice Controller

        public ActionResult UploadInvoice()
        {
            return View();
        }

        public ActionResult ImportInvoice(string fileName, decimal SN)
        {
            string FilePath = AppDomain.CurrentDomain.BaseDirectory + "App_Data/" + fileName;
            var r = DAL.Import.Invoice(FilePath, SN);
            var r2 = DAL.Import.InvoiceTask(SN);
            var Url = "UploadInvoiceComplete?SN={0}";
            Url = string.Format(Url, SN);
            Response.Redirect(Url);
            return Content(r.Message);
        }

        public ActionResult UploadInvoiceComplete()
        {
            return View();
        }

        [RequiredTag(Tag = 8)]
        [HttpPost]
        public ActionResult Invoice(Invoice invoice)
        {
            var r = DAL.M.BaseUpdate.Invoice(invoice);
            return Json(r);
        }

        #endregion 

        [RequiredTag(Tag = 7)]
        public ActionResult UpdatePassword()
        {
            return View();
        }

        [RequiredTag(Tag = 7)]
        public ActionResult VerifyPassword(string CurrentPassword)
        {
            var r = DAL.Login.CheckAdmin(Client.AdminLogin, CurrentPassword);
            if (r.Code == 0)
            {
                MemCache.Save("CanChangePassword", true);
            }
            return Json(r);
        }
        [RequiredTag(Tag = 7)]
        [HttpPost]
        public ActionResult UpdatePassword(string NewPassword)
        {
            var r = new R();
            if (Client.CanChangePassword)
            {
                r = DAL.M.BaseUpdate.Password(Client.AID, NewPassword);
                if (r.Code == 0)
                {
                    MemCache.Save("CanChangePassword", false);
                }
            }
            else
            {
                r.Code = -1;
                r.Message = "Please Check Old Password";
            }
            return Json(r);
        }

        public ActionResult AddMember()
        {
            return View();
        }

        [HttpPost]
        public ActionResult AddMember(string Name, string IDCard, int RegionCode)
        {
            var member = new Member();
            member.MID = 0;
            member.Name = Name;
            member.Login = IDCard;
            member.Password = Name;
            member.IDCard = IDCard;
            member.RegionCode = RegionCode;
            member.IDSN = "0";
            member.Phone = "0";
            var r = DAL.Update.Member(member);
            string Url = string.Format("{0}/Master/ViewMember?MID={1}", C.APP, r.Value);
            Response.Redirect(Url);
            return Content(string.Empty);
        }
        [HttpPost]
        public ActionResult UpdateMember(Member member)
        {
            var r = DAL.Update.Member(member);
            return Json(r);
        }
        [RequiredTag(Tag = 17)]
        public ActionResult ViewMember(int MID)
        {
            var member = DAL.Get.Member(MID);
            var invoices = DAL.Get.Invoice(MID);
            var Orders = DAL.Get.Order(MID);
            var Cert = DAL.Get.Certificate(MID);

            var Reports = DAL.Get.MyReport(MID);

            Orders = Orders.FindAll(N => N.Status == 10);
            //结业的产生证书号
            var reportFinish = Reports.FindAll(N => N.Score >= 60 && N.Minutes >= 1080);
            if (reportFinish.Count > 0 && Cert.ID == 0)
            {
                DAL.Update.Certificate(MID);
                Cert = DAL.Get.Certificate(MID);
            }
            
            ViewData["member"] = member;
            ViewData["Invoices"] = invoices;
            ViewData["Orders"] = Orders;
            ViewData["Cert"] = Cert;
            ViewData["Reports"] = Reports;
            return View();
        }

        [HttpPost]
        public ActionResult ImportCs(string sCName)
        {
            var rl = new List<R>();
            try
            {
                string FolderPath = ConfigurationManager.AppSettings.Get("ContentRoot");
                var di = new DirectoryInfo(FolderPath);
                var dii = di.GetDirectories(sCName);
                foreach (var d in dii)
                {
                    var r = new R();
                    string filename = Path.Combine(FolderPath, d.Name + "\\imsmanifest.xml");
                    if (System.IO.File.Exists(filename))
                    {
                        var course = new Courses();
                        course.CName = d.Name;
                        r = Import.Courses(filename, course);
                    }
                    else
                    {
                        r.Code = 101;
                        r.Message = string.Format("File Not Found:{0}", filename);
                    }
                    rl.Add(r);
                }
            }
            catch (Exception ex)
            {
                log.Warn("{0},{1}", ex.Message, ex.StackTrace);
                var r = new R();
                r.Code = 300;
                r.Message = ex.Message;
                rl.Add(r);
            }
            return Json(rl);
        }
        
        public ActionResult ImportCs()
        {
            return View();
        }


        [RequiredTag(Tag = 18)]
        public ActionResult UploadQuestion()
        {
            return View();
        }
        [RequiredTag(Tag = 18)]
        public ActionResult UploadQuestionPreview(string fileName, string SN, string Tag)
        {
            string FilePath = AppDomain.CurrentDomain.BaseDirectory + "App_Data/" + fileName;
            var ds = DAL.Import.PreviewQuestion(FilePath);
            ViewData["data"] = ds;
            ViewData["fileName"] = fileName;
            ViewData["SN"] = SN;
            ViewData["Tag"] = Tag;
            return View();
        }
        [RequiredTag(Tag = 18)]
        [HttpPost]
        public ActionResult UploadQuestionCommit(string fileName, string SN, string Tag)
        {
            string FilePath = AppDomain.CurrentDomain.BaseDirectory + "App_Data/" + fileName;
            var r = DAL.Import.Question(FilePath);
            string message = "";
            if (r.Code == 0)
            {
                message = "导入成功";
            }
            else
            {
                message = r.Message;
            }
            ViewData["Message"] = message;
            string sUrl = string.Format("UploadQuestionCommit?message={0}", message);
            Response.Redirect(sUrl);
            return View();
        }
        [HttpGet]
        public ActionResult UploadQuestionCommit(string Message)
        {

            ViewData["Message"] = Message;

            return View();
        }

    }
}
