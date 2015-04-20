using System;
using System.Web.Mvc;
using System.Text.RegularExpressions;
using com.hooyes.lms.Model;

namespace com.hooyes.lms.WebUI.Controllers
{
    public class SignupController : Controller
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Add(Member member)
        {
            var r = new R();
            try
            {
                if (!Regex.IsMatch(member.IDCard, @"^\d{6}(19|20)\d{2}([0][1-9]|10|11|12)([0,1,2][0-9]|[3][0,1])\d{3}([0-9]|X|x)$"))
                {
                    r.Code = 101;
                    r.Message = "IDCard Error";
                    return Json(r);
                }

                if (!Regex.IsMatch(member.Phone, @"^1[3|4|5|7|8][0-9]\d{8}$"))
                {
                    r.Code = 102;
                    r.Message = "Phone Error";
                    return Json(r);
                }

                if (!IsCanSignup(member.IDCard))
                {
                    r.Code = 103;
                    r.Message = " IDCard Exist";
                    return Json(r);
                }

                if (r.Code == 0)
                {
                    member.Login = member.IDCard;
                    //member.Password = member.Name;
                    r = DAL.Update.Member(member);
                    ////member ext 
                    //var ext = new MemberExt();
                    //ext.MID = r.Value;
                    //ext.PID = 2014;
                    //ext.IDSN = "";
                    //ext.Flag = 10;
                    //DAL.Update.Member(ext);
                }
            }
            catch (Exception ex)
            {
                r.Code = 401;
                r.Message = "System Error";
                log.Error("{0},{1}", ex.Message, ex.StackTrace);
            }
            return Json(r);
        }

        [HttpPost]
        private bool IsCanSignup(string LoginID)
        {
            var r = DAL.Login.Check(LoginID);
            if (r.Code == 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
