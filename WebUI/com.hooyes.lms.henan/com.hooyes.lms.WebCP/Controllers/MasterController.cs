using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.Configuration;
using com.hooyes.lms.Model;
using System.IO;
using com.hooyes.lms.DAL;


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
            ViewData["Filter"] = U.BuildFilter(m1params);
            ViewData["JsonStr"] = U.BuildJSON(m1params);
            return View();
        }
        public ActionResult ListInvoice(Model.M.M2Params m2params)
        {
            m2params.Years = Request.QueryString.Get("Years"); //Years 多条
            ViewData["Filter"] = U.BuildFilter(m2params);
            ViewData["JsonStr"] = U.BuildJSON(m2params);
            return View();
        }
        public ActionResult ListSurvey(Model.M.SurveyParams p)
        {
            ViewData["Filter"] = U.BuildFilter(p);
            ViewData["JsonStr"] = U.BuildJSON(p);
            return View();
        }
        public ActionResult FixCourses()
        {
            return View();
        }
        public ActionResult Workbench()
        {
            return View();
        }
        public ActionResult Search()
        {
            return View();
        }
        public ActionResult ViewCourses()
        {
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
                var r = DAL.M.Update.Courses(MID, CID);
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
                    var r = DAL.M.Update.Courses(MID, CID);
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
        public ActionResult CreditScore(int MID, int Score)
        {
            string referrer = Request.UrlReferrer.ToString();
            Score = Score > 0 ? Score : 0;
            Report re = new Report();
            re.Score = Score;
            re.MID = MID;
            var r = DAL.Update.Report(re);
            Response.Redirect(referrer);
            return Content(r.Message);
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
        public ActionResult ImportMQ(string fileName, int MsgID)
        {
            string FilePath = AppDomain.CurrentDomain.BaseDirectory + "App_Data/" + fileName;
            var r = DAL.Import.MessageQueue(FilePath, MsgID);
            return Content(r.Message);
        }
        [RequiredTag(Tag = 4)]
        public ActionResult UploadMQ()
        {
            return View();
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
            var r = DAL.M.Update.Invoice(invoice);
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
                r = DAL.M.Update.Password(Client.AID, NewPassword);
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

        [HttpPost]
        public ActionResult ImportCs2(string sCName)
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
                    string filename = Path.Combine(FolderPath, d.Name + "\\imsmanifest.xlsx");
                    if (System.IO.File.Exists(filename))
                    {
                        var course = new Courses();
                        course.CName = d.Name;
                        r = Import.Courses(filename, course, true);
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

        public ActionResult ImportCs2()
        {
            return View();
        }



    }
}
