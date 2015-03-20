using System;
using System.Collections.Generic;
using System.Text;
using com.hooyes.lms.Model;

namespace com.hooyes.lms
{
    public class Client
    {
        public static bool IsAdministrator
        {
            get
            {
                return MemCache.Get<string>("admin") == "admin";
            }
        }
        public static bool IsLogin
        {
            get
            {
                return !string.IsNullOrEmpty( MemCache.Get<string>("login"));
            }
        }
        public static string Login
        {
            get
            {
                return MemCache.Get<string>("Login");
            }
        }
        public static int MID
        {
            get
            {
                return MemCache.Get<int>("MID");
            }
        }
        /// <summary>
        /// Admin ID
        /// </summary>
        public static int AID
        {
            get
            {
                return MemCache.Get<int>("AID");
            }
        }
       
        public static string IDCard
        {
            get
            {
                return MemCache.Get<string>("IDCard");
            }
        }
        public static string IDSN
        {
            get
            {
                return MemCache.Get<string>("IDSN");
            }
        }
        public static int Year
        {
            get
            {
                return MemCache.Get<int>("Year");
            }
        }
        public static string Name
        {
            get
            {
                return MemCache.Get<string>("Name");
            }
        }
        public static int Type
        {
            get
            {
                return MemCache.Get<int>("Type");
            }
        }
        public static int Level
        {
            get
            {
                return MemCache.Get<int>("Level");
            }
        }
        public static string Phone
        {
            get
            {
                return MemCache.Get<string>("phone");
            }
        }
        public static string Tag
        {
            get
            {
                return MemCache.Get<string>("Tag");
            }
        }
        /// <summary>
        /// 是否已完成学业
        /// </summary>
        public static int Report_Status
        {
            get
            {
                return MemCache.Get<int>("Report_Status");
            }
        }
        /// <summary>
        /// 已学必修课时
        /// </summary>
        public static decimal Report_Compulsory
        {
            get
            {
                return MemCache.Get<decimal>("Report_Compulsory");
            }
        }
        /// <summary>
        /// 已学选修课时
        /// </summary>
        public static decimal Report_Elective
        {
            get
            {
                return MemCache.Get<decimal>("Report_Elective");
            }
        }
        /// <summary>
        /// 已获成绩
        /// </summary>
        public static int Report_Score
        {
            get
            {
                return MemCache.Get<int>("Report_Score");
            }
        }
        /// <summary>
        /// 0 --未学完 1 -- 已学完 (只表示本平台的学习状态)
        /// </summary>
        public static int Learning_Finish
        {
            get
            {
                return MemCache.Get<int>("Learning_Finish");
            }
        }
        public static string AdminLogin
        {
            get
            {
                return MemCache.Get<string>("AdminLogin");
            }
        }
        public static bool CheckTag(int Tag)
        {
            bool b = false;
            string[] ArrayTag = Client.Tag.Split(',');
            foreach (var s in ArrayTag)
            {
                if (s == Tag.ToString())
                {
                    b = true;
                }
            }
            return b;
        }

        /// <summary>
        /// 
        /// </summary>
        public static bool CanChangePassword
        {
            get
            {
                return MemCache.Get<bool>("CanChangePassword");
            }
        }
    }

    public class AdminClient
    {
        public static bool IsAdministrator
        {
            get
            {
                return MemCache.Get<string>("admin") == "admin";
            }
        }
        public static bool IsLogin
        {
            get
            {
                return MemCache.Get<string>("login") == "login";
            }
        }
        /// <summary>
        /// Admin ID
        /// </summary>
        public static int AID
        {
            get
            {
                return MemCache.Get<int>("AID");
            }
        }
        public static string AdminLogin
        {
            get
            {
                return MemCache.Get<string>("AdminLogin");
            }
        }
        public static bool CheckTag(int Tag)
        {
            bool b = false;
            string[] ArrayTag = Client.Tag.Split(',');
            foreach (var s in ArrayTag)
            {
                if (s == Tag.ToString())
                {
                    b = true;
                }
            }
            return b;
        }
        /// <summary>
        /// 
        /// </summary>
        public static bool CanChangePassword
        {
            get
            {
                return MemCache.Get<bool>("CanChangePassword");
            }
        }

        public static string Tag
        {
            get
            {
                return MemCache.Get<string>("Tag");
            }
        }
    }
}
