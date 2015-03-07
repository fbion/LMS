using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Net.Cache;
using System.Text;
using System.Web.Caching;
using System.Web.Mvc;

namespace com.hooyes.lms.Controllers
{
    public class SystemController : Controller
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        private string SystemKey = ConfigurationManager.AppSettings.Get("system_key");
        public ActionResult GetCmd(string key)
        {
            string result = string.Empty;
            if (SystemKey == key)
            {
                string cachestring = (string)HttpContext.Cache.Get("sys_cache");
                if (!string.IsNullOrEmpty(cachestring))
                {
                    result = cachestring;
                    log.Fatal("SQL Restart Command ");
                    //log.Fatal(cachestring);
                }

            }
            return Content(result);
        }
        public ActionResult SetCmd(string key)
        {
            if (SystemKey == key)
            {
                string FilePath = AppDomain.CurrentDomain.BaseDirectory;
                FilePath = Path.Combine(FilePath, "App_Data/System.txt");
                StreamReader sr = new StreamReader(FilePath);
                string CmdText = sr.ReadToEnd();
                HttpContext.Cache.Insert("sys_cache", CmdText);
                sr.Close();
                log.Fatal("Setting SQL Restart Command ");
                //log.Fatal(CmdText);
                return Content(CmdText);
            }
            else
            {
                return Content("Not Found");
            }
        }
        public ActionResult Clear(string key)
        {
            if (SystemKey == key)
            {
                HttpContext.Cache.Remove("sys_cache");
                log.Fatal("SQL Restart Finished ");
                return Content("ok");
            }
            else
            {
                return Content("Not Found");
            }
        }
    }
}
