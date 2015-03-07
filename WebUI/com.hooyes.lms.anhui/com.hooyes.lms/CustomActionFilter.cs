using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;

namespace com.hooyes.lms
{
    public class CustomActionFilterAttribute : ActionFilterAttribute 
    {
        public int Year = 2012;
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (Client.Type < 0)
            {
                GoSetting();
            }

            if (Year > Client.Year && Year != 2010)
            {
                if (Client.Year == 2011)
                {
                    Go2011();
                }
                if (Client.Year <= 2010)
                {
                    GoRestudy();
                }
            }
            base.OnActionExecuting(filterContext);
        }

        public override void OnActionExecuted(ActionExecutedContext filterContext)
        {
            base.OnActionExecuted(filterContext);
        }

        public override void OnResultExecuted(ResultExecutedContext filterContext)
        {
            
            base.OnResultExecuted(filterContext);
        }

        public override void OnResultExecuting(ResultExecutingContext filterContext)
        {
            base.OnResultExecuting(filterContext);
        }
        private void GoSetting()
        {
            HttpContext.Current.Response.Redirect(C.APP + "/Account/Setting");
            HttpContext.Current.Response.End();
        }
        private void Go2011()
        {
            HttpContext.Current.Response.Redirect(C.APP + "/Account/Learning2011");
            HttpContext.Current.Response.End();
        }
        private void GoRestudy()
        {
            HttpContext.Current.Response.Redirect(C.APP + "/Account/LearningRestudy");
            HttpContext.Current.Response.End();
        }
    }
}