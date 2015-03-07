using com.hooyes.lms.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace com.hooyes.lms.WebUI.Controllers
{
    public class SurveyController : Controller
    {
        
        [HttpPost]
        public ActionResult Add(Survey p)
        {
            p.IP = Request.UserHostAddress;
            if (Client.IsLogin)
            {
                p.IDCard = Client.IDCard;
                p.IDSN = Client.IDSN;
                p.Name = Client.Name;
                p.Phone = Client.Phone;
            }
            var r = DAL.Update.Survey(p);
            return Json(r);
        }

    }
}
