using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.IO;
using com.hooyes.lms;

namespace com.hooyes.lms.Controllers
{
    [RequiredMaster]
    public class FileController:Controller
    {
        [RequiredTag(Tag = 4)]
        public ActionResult CommonFileSave(string tag, string nextAction)
        {
            string FilePath = CreateFilePath();
            string result = "";

            int l = Request.Files.Count;

            var c = Request.Files[0];

            if (c != null)
            {
                //文件编号
                string SN = DateTime.Now.ToString("yyyyMMddhhmmss");
                string newFileName = string.Format("{0}_{1}.xls", tag, SN);
                string fileName = Path.Combine(FilePath, newFileName);
                c.SaveAs(fileName);

                if (!string.IsNullOrEmpty(nextAction))
                {

                    string Url = "../Master/{3}?fileName={0}&SN={1}&tag={2}";
                    Url = string.Format(Url, newFileName, SN, tag, nextAction);
                    Response.Redirect(Url);

                }

                result = newFileName;
            }
            else
            {
                result = string.Empty;

            }
            return Content(result);
        }

        [RequiredTag(Tag = 4)]
        public ActionResult Save()
        {
            string FilePath = CreateFilePath();
            string result = "";

            int l = Request.Files.Count;

            var c = Request.Files[0];

            if (c != null)
            {
                //文件编号
                string SN = DateTime.Now.ToString("yyyyMMddhhmmss");
                string newFileName = "C_" + SN + ".xls";
                string fileName = Path.Combine(FilePath, newFileName);
                c.SaveAs(fileName);
                string Url = "../Master/ImportMemberCredit?fileName={0}&SN={1}";
                Url = string.Format(Url, newFileName, SN);
                Response.Redirect(Url);
                result = fileName;
            }
            else
            {
                result = string.Empty;

            }
            return Content(result);
        }

        public ActionResult SaveInvoice()
        {
            string FilePath = CreateFilePath();
            string result = "";

            int l = Request.Files.Count;

            var c = Request.Files[0];

            if (c != null)
            {
                //文件编号
                string SN = DateTime.Now.ToString("yyyyMMddhhmmss");
                string newFileName = "Invoice_" + SN + ".xls";
                string fileName = Path.Combine(FilePath, newFileName);
                c.SaveAs(fileName);
                string Url = "../Master/ImportInvoice?fileName={0}&SN={1}";
                Url = string.Format(Url, newFileName, SN);
                Response.Redirect(Url);
                result = fileName;
            }
            else
            {
                result = string.Empty;

            }
            return Content(result);
        }
        [NonAction]
        private string CreateFilePath()
        {
            string FilePath = AppDomain.CurrentDomain.BaseDirectory;
            FilePath = Path.Combine(FilePath, "App_Data");

            DirectoryInfo di = new DirectoryInfo(FilePath);
            if (!di.Exists)
            {
                di.Create();
            }
            return FilePath;
        }
    }
}
