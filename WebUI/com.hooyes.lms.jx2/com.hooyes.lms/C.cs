using System;
using System.Collections.Generic;
using System.Text;
using System.Configuration;

namespace com.hooyes.lms
{
    public class C
    {
        public static readonly string conn = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        public static readonly string ASPState = ConfigurationManager.ConnectionStrings["ConnectionASPState"].ConnectionString;
        public static readonly string CDN = ConfigurationManager.AppSettings.Get("CDN");
        public static readonly string APP = ConfigurationManager.AppSettings.Get("APP");
        public static readonly string SMSTOKEN = ConfigurationManager.AppSettings.Get("SMSTOKEN");
        public static readonly string SCHOOLID = ConfigurationManager.AppSettings.Get("schoolId");
        public static readonly string SCHOOLPAS = ConfigurationManager.AppSettings.Get("schoolPas");
        public static readonly string SCHOOLURL = ConfigurationManager.AppSettings.Get("schoolUrl");
        public static readonly string CachePrefix = "hooyes";
        public static readonly string M_AcceptIP = ConfigurationManager.AppSettings.Get("M_ACCEPTIP");
    }
}
