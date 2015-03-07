using System.Web.Mvc;

namespace com.hooyes.lms.Controllers
{
    
    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return Content("");
        }
        /*
        public ActionResult DynamicIndex()
        {
          
            return View();
        }
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
            string FolderPath = AppDomain.CurrentDomain.BaseDirectory + "Content";
            DirectoryInfo di = new DirectoryInfo(FolderPath);
            DirectoryInfo[] dii = di.GetDirectories(sCID);
            StreamWriter sw = new StreamWriter(Path.Combine(FolderPath, "read.txt"), false);
            foreach (var d in dii)
            {
                CID = Convert.ToInt32(d.Name);
                string rule = "Content\\" + d.Name + "\\imsmanifest.xml";
                string filename = AppDomain.CurrentDomain.BaseDirectory + rule;
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

        public ActionResult Index000()
        {
            return View();
        }
        */
        public ActionResult ShowIP()
        {
            string IP = Request.UserHostAddress;
            return Content(IP);
        }

    }
}
