using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Mvc;

namespace com.hooyes.lms.WebUI.Controllers
{
    [CustomAuthorize]
    public class UploadController : Controller
    {

        public ActionResult Photo()
        {
            return View();
        }

        public ActionResult PhotoSave(string f, string SN, string tag)
        {
            string Url = "../Upload/Photo";
            var m = new Model.Member();
            m.Photo = f;
            m.MID = Client.MID;
            //DAL.Update.MemberPhoto(m);
            Response.Redirect(Url);
            return Content("");
        }

    }
}
