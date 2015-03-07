using System.Web.Mvc;

namespace com.hooyes.lms.Simulate.Controllers
{
    public class servletController : Controller
    {

        public ActionResult TeachEscapeProveAction()
        {
            string str = "{\"personName\":\"上官晓月\",\"yearValue\":\"2012\",\"proveValue\":\"prove000\"}";
            return Content(str);
        }

        public ActionResult TeachEscapeAnnalAction()
        {
            string str = "{\"personName\":\"上官晓月\",\"yearValue\":\"2012\",\"annalValue\":\"annal000\"}";
            return Content(str);
        }

    }
}
