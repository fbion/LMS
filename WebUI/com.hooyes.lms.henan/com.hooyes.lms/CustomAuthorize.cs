using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.Text;

namespace com.hooyes.lms
{
    public class CustomAuthorizeAttribute : FilterAttribute, IAuthorizationFilter
    {
        private bool requireAdmin = false;
        public void OnAuthorization(AuthorizationContext filterContext)
        {
            if (!Client.IsLogin)
            {
                if (filterContext.HttpContext.Request.IsAjaxRequest())
                {
                    ContentResult cr = new ContentResult();
                    cr.Content = "{msg:'forbidden',isLogin:'false'}";
                    filterContext.Result = cr;
                }
                else
                {
                    filterContext.HttpContext.Response.Redirect(C.APP);
                }
            }

            if (requireAdmin && Client.IsLogin)
            {
                if (!Client.IsAdministrator)
                {
                    ContentResult cr = new ContentResult();
                    cr.Content = "{msg:'forbidden to access',isLogin:'true',isAdmin:'false'}";
                    filterContext.Result = cr;
                }
            }

        }

        public CustomAuthorizeAttribute()
        {
        }
        public CustomAuthorizeAttribute(bool RequireAdmin)
        {
            requireAdmin = RequireAdmin;
        }

    }
    /// <summary>
    /// 要求完成必修课程才能进入考试,若已考试通过，也无需参考加考
    /// 2014-3-5 学完1080才可以考试
    /// </summary>
    public class RequiredFinishCoursesAttribute : FilterAttribute, IAuthorizationFilter
    {

        public void OnAuthorization(AuthorizationContext filterContext)
        {
            var report = DAL.Get.Report(Client.MID);
            if (report.Minutes < 1080)
            {
                string Url = C.APP + "/Account/Error?code=1";
                filterContext.HttpContext.Response.Redirect(Url);
            }

            if (report.Minutes >= 1080 && report.Score >= 60)
            {
                string Url = C.APP + "/Account/Error?code=202";
                filterContext.HttpContext.Response.Redirect(Url);
            }
        }
    }
    /// <summary>
    ///  必学的8课时学完，并考试通过后才能进行选学课程的学习。
    ///  2014-3-5 调整 学完必修 即可以 学选修。
    /// </summary>
    public class RequiredFinishExamAttribute : FilterAttribute, IAuthorizationFilter
    {

        public void OnAuthorization(AuthorizationContext filterContext)
        {
            int cid = Convert.ToInt32(filterContext.HttpContext.Request["cid"]);

            var c = DAL.Get.Courses(cid, Client.MID, Client.Year, Client.Type);
            if (c.Cate == 0)
            {

                var report = DAL.Get.Report(Client.MID);
                if (report.Compulsory >= 8)
                {
                    // 通过
                }
                else
                {
                    string Url = C.APP + "/Account/Error?code=201";
                    filterContext.HttpContext.Response.Redirect(Url);
                }
            }
        }
    }
    /// <summary>
    /// 要求验证手机
    /// </summary>
    public class RequiredPhoneValidateAttribute : FilterAttribute, IAuthorizationFilter
    {

        public void OnAuthorization(AuthorizationContext filterContext)
        {
            if (Client.Year > 2011)
            {
                int cid = Convert.ToInt32(filterContext.HttpContext.Request["cid"]);
                if (!isValidate(cid))
                {
                    string Url = C.APP + "/Account/ValidatePhone?cid={0}";
                    Url = string.Format(Url, cid);
                    filterContext.HttpContext.Response.Redirect(Url);
                }
            }
        }
        private bool isValidate(int CID)
        {
            var Courses = DAL.Get.Courses(Client.MID, CID);
            return (Courses.Validate == 1);
        }

    }

    /// <summary>
    /// 要求验管理员
    /// </summary>
    public class RequiredMasterAttribute : FilterAttribute, IAuthorizationFilter
    {

        public void OnAuthorization(AuthorizationContext filterContext)
        {
            if (!Client.IsAdministrator)
            {
                string Url = C.APP + "/login/masterlogin";
                filterContext.HttpContext.Response.Redirect(Url);
            }
        }
    }
    /// <summary>
    /// 要求验管权限
    /// </summary>
    public class RequiredTagAttribute : FilterAttribute, IAuthorizationFilter
    {
        //private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        public int Tag = 0;
        public void OnAuthorization(AuthorizationContext filterContext)
        {
            //log.Info("RequiredTag{0},{1},| {2}", Tag, b, Client.Tag);
            if (!Client.CheckTag(Tag))
            {
                var r = new ContentResult();
                r.Content = "Forbbiden";
                filterContext.Result = r; 
            }
        }
    }

    /// <summary>
    /// IP限制
    /// </summary>
    public class IPRestrictAttribute : FilterAttribute, IAuthorizationFilter
    {
        //private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        public void OnAuthorization(AuthorizationContext filterContext)
        {
            bool b = false;
            string CurrentIP = filterContext.RequestContext.HttpContext.Request.UserHostAddress;
            string AcceptIP = C.M_AcceptIP;
            //log.Info("IP,{0},{1}", CurrentIP,AcceptIP);

            string[] Array_IP = AcceptIP.Split(',');
            foreach (string ip in Array_IP)
            {
                if (CurrentIP.StartsWith(ip))
                {
                    b = true;
                }
            }
            if (!b)
            {
                var r = new ContentResult();
                r.Content = "Forbbiden";
                filterContext.Result = r; 
            }
        }
    }
}
