using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Xml;
using System.Xml.Linq;
using System.IO;
using System.Text;
using System.Web.Script.Serialization;
using com.hooyes.lms.Model;
using com.hooyes.lms.API;
using com.hooyes.lms.DAL;
using System.Configuration;

namespace com.hooyes.lms.Controllers
{

    [HandleError]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return Content(string.Empty);

        }
    }
}
