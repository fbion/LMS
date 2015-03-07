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

        public ActionResult E(string seq_num, string user_name, string card_id, string department_code)
        {
            string url = "ReceiveAcctInfo?seq_num={0}&user_name={1}&card_id={2}&department_code={3}";
            url = string.Format(url, Cipher.Encrypt(seq_num), Cipher.Encrypt(user_name), Cipher.Encrypt(card_id), Cipher.Encrypt(department_code));
            return Content(url);
        }

        public ActionResult D(string seq_num, string user_name, string card_id, string department_code)
        {
            string url = "E?seq_num={0}&user_name={1}&card_id={2}&department_code={3}";
            url = string.Format(url, Cipher.Decrypt(seq_num), Cipher.Decrypt(user_name), Cipher.Decrypt(card_id), Cipher.Decrypt(department_code));
            return Content(url);
        }
    }
}
