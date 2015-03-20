using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.IO;
using com.hooyes.lms;

namespace com.hooyes.lms.Controllers
{
    [CustomAuthorize]
    public class FileController : Controller
    {

        [HttpPost]
        public ActionResult CommonFileSave(string tag, string nextAction)
        {
            string FilePath = CreateFilePath();
            string result = "";

            int l = Request.Files.Count;

            var c = Request.Files[0];

            if (c != null)
            {
                
                //文件编号
                //string SN = DateTime.Now.ToString("yyyyMMddhhmmss");
                string SN = string.Format("{0}", Client.MID);
                string newFileName = string.Format("{0}_{1}.jpg", tag, SN);
                string fileName = Path.Combine(FilePath, newFileName);

                c.SaveAs(fileName);

                try
                {
                    string newFileName2 = string.Format("T_{0}_{1}.jpg", tag, SN);
                    string fileName2 = Path.Combine(FilePath, newFileName2);
                    string outthumbnailPath ="";
                    ThumbnailImage.MakeThumbnail(fileName, fileName2, 161, 192, out outthumbnailPath);
                }
                catch (Exception ex)
                {

                }

                if (!string.IsNullOrEmpty(nextAction))
                {
                    string Url = "../Upload/{3}?f={0}&SN={1}&tag={2}";
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


        [NonAction]
        private string CreateFilePath()
        {
            string FilePath = AppDomain.CurrentDomain.BaseDirectory;
            FilePath = Path.Combine(FilePath, "Photos");

            DirectoryInfo di = new DirectoryInfo(FilePath);
            if (!di.Exists)
            {
                di.Create();
            }
            return FilePath;
        }
    }
}
