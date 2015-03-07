using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml;
using System.Xml.Linq;
using System.IO;
using System.Text;
//using System.Web.Script.Serialization;
//using com.hooyes.lms.Model;
//using com.hooyes.lms.API;
//using com.hooyes.lms.DAL;
//using System.Configuration;

namespace com.hooyes.lms.Controllers
{
    
    [HandleError]
    public class HomeController : Controller
    {
        
        /*
        [RequiredMaster]
        public ActionResult LoadAll()
        {
            int CID;
            string FolderPath =  AppDomain.CurrentDomain.BaseDirectory + "Content";
            DirectoryInfo di = new DirectoryInfo(FolderPath);
            DirectoryInfo[] dii = di.GetDirectories();
            StreamWriter sw = new StreamWriter(Path.Combine(FolderPath, "read.txt"), false);
            foreach (var d in dii)
            {
                CID = Convert.ToInt32(d.Name);
                string rule = "Content\\" + d.Name + "\\imsmanifest.xml";
                string filename = AppDomain.CurrentDomain.BaseDirectory + rule;
                var course = new Courses();
                course.CID = CID;
                course.Type = 0;
                course.Year = 2012;
                Import.Courses(filename, course);
            }
            sw.Close();

            return Content("ok");
        }
        [RequiredMaster]
        [HttpPost]
        public ActionResult ImportC(string sCID, Courses c)
        {
            int CID;
            string ContentRoot = ConfigurationManager.AppSettings.Get("ContentRoot");
            string FolderPath = ContentRoot + "\\Content";
            DirectoryInfo di = new DirectoryInfo(FolderPath);
            DirectoryInfo[] dii = di.GetDirectories(sCID);
            StreamWriter sw = new StreamWriter(Path.Combine(FolderPath, "read.txt"), false);
            foreach (var d in dii)
            {
                CID = Convert.ToInt32(d.Name);
                string rule = "\\" + d.Name + "\\imsmanifest.xml";
                string filename = FolderPath + rule;
                var course = c;
                course.CID = CID;
                course.Type = c.Type;
                course.Year = c.Year;
                Import.Courses(filename, course);
            }
            sw.Close();

            return Content("ok");
        }
        [RequiredMaster]
        public ActionResult ImportC()
        {
            return View();
        }
        [RequiredMaster]
        [HttpPost]
        public ActionResult UpdateC(Courses c)
        {
            var r = DAL.Update.UpdateC(c);
            return Json(r);
        }
        [RequiredMaster]
        public ActionResult UpdateC()
        {
            return View();
        }
        [RequiredMaster]
        public ActionResult GetC(int CID)
        {
            var r = DAL.Get.Courses(CID);
            return Json(r);
        }
        */
        public ActionResult ShowIP()
        {
            string IP = Request.UserHostAddress;
            return Content(IP);
        }

    }
}
