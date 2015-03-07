using com.hooyes.lms.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;

namespace com.hooyes.lms
{
    public class U
    {
        public static bool ExtValid(string ext)
        {
            if (!string.IsNullOrEmpty(ext))
            {
                ext = ext.ToLower();
                string[] s = new string[3] { ".jpg", ".gif", ".png" };
                return s.Contains(ext);
            }
            else
            {
                return false;
            }
        }
        public static void SetLoginSession(int MID)
        {
            var member = DAL.Get.Member(MID);
            if (member.Code == 0)
            {
                MemCache.Save("login", "login");
                MemCache.Save("MID", member.MID);
                MemCache.Save("IDCard", member.IDCard);
                MemCache.Save("IDSN", member.IDSN);
                MemCache.Save("Year", member.Year);
                MemCache.Save("Name", member.Name);
                MemCache.Save("Type", member.Type);
                MemCache.Save("Level", member.Level);
                MemCache.Save("Phone", member.Phone);

                //资源访问
                System.Web.HttpCookie hc = new System.Web.HttpCookie("Resx", MID.ToString());
                System.Web.HttpContext.Current.Response.SetCookie(hc);

                //CommitReport(member); //jx no commit
            }
            U.SaveMSessions();
        }
        public static void ResetLoginSession(int MID)
        {
            MemCache.clear();
            System.Web.HttpCookie hc = new System.Web.HttpCookie("Resx", string.Empty);
            hc.Expires = DateTime.Now.AddDays(-20);
            System.Web.HttpContext.Current.Response.SetCookie(hc);
        }
        public static void SaveMSessions()
        {
            var ms = new Model.MSessions();
            ms.MID = Client.MID;
            ms.IP = HttpContext.Current.Request.UserHostAddress;
            ms.SessionId = HttpContext.Current.Session.SessionID;
            DAL.Update.MSessions(ms);
        }
        /// <summary>
        /// 满足条件的提交。
        /// </summary>
        /// <param name="m"></param>
        public static void CommitReport(Member m)
        {
            var report = DAL.Get.Report(m.MID);
            MemCache.Save("Report_Status", report.Status);
            MemCache.Save("Report_Compulsory", report.Compulsory);
            MemCache.Save("Report_Elective", report.Elective);
            MemCache.Save("Report_Score", report.Score);
            MemCache.Save("Learning_Finish", 0);
            var r = DAL.Task.CommitReport(m, report);
            if (r.Code == 0 && r.Value == 1)
            {
                MemCache.Save("Report_Status", 1);
            }


            if (m.Year >= 2012)
            {
                if (report.Score >= 60 && (report.Compulsory + report.Elective) * 45 >= 1080)
                {
                    MemCache.Save("Learning_Finish", 1);
                }
            }
            else
            {
                if ((report.Compulsory + report.Elective) * 45 >= 1080)
                {
                    MemCache.Save("Learning_Finish", 1);
                }
            }
        }
        public static string LikeKeyword(string keyword)
        {
            string word = keyword;
            if (!string.IsNullOrEmpty(word))
            {

                if (!word.EndsWith("%"))
                {
                    word = string.Format("{0}%", word);
                }
            }
            return word;
        }
        public static string ConvertToCSV<T>(List<T> L)
        {
            var sb = new StringBuilder();
            foreach (var m in L)
            {
                Type type = m.GetType();
                foreach (PropertyInfo p in type.GetProperties())
                {
                    string val = Convert.ToString(p.GetValue(m, null));
                    sb.AppendFormat("\"{0}\",", val);
                }
                sb.AppendLine();
            }
            return sb.ToString();
        }
        public static void ExportCSV(string CSV)
        {
            var Response = HttpContext.Current.Response;
            var root = AppDomain.CurrentDomain.BaseDirectory;
            string fileName = "Export_" + DateTime.Now.ToString("yyyyMMddHHmm") + ".csv";
            string filePath = Path.Combine(root, "App_Data/" + fileName);

            StreamWriter sw = new StreamWriter(filePath, false, Encoding.UTF8);
            sw.Write(CSV);
            sw.Close();

            FileInfo file = new System.IO.FileInfo(filePath);
            Response.Clear();
            Response.AddHeader("Content-Disposition", "filename=" + file.Name);
            Response.AddHeader("Content-Length", file.Length.ToString());
            Response.ContentType = "application/msexcel";
            Response.WriteFile(file.FullName);
            Response.End();
        }
        public static string BuildFilter(Model.M.M1Params m1params)
        {
            string Filter = string.Empty;
            if (m1params.QueryFlag == 1)
            {
                var sb = new StringBuilder();
                sb.Append(" 1 = 1 ");
                //分钟
                if (m1params.Type != -1)
                {

                    sb.AppendFormat(" and type ={0}", m1params.Type);

                }
                //year = Request["year"];
                //年份
                if (!string.IsNullOrEmpty(m1params.Years))
                {
                    string[] ArrayYear = m1params.Years.Split(',');
                    if (!ArrayYear.Contains<string>("-1"))
                    {
                        sb.AppendFormat(" and Year in({0})", m1params.Years);
                    }
                }
                //分钟
                if (m1params.MinMinutes != 0)
                {

                    sb.AppendFormat(" and minutes >={0}", m1params.MinMinutes);

                }
                //分钟
                if (m1params.MaxMinutes != 0)
                {

                    sb.AppendFormat(" and minutes <={0}", m1params.MaxMinutes);

                }
                //分数
                if (m1params.MinScore != 0)
                {

                    sb.AppendFormat(" and score >={0}", m1params.MinScore);
                }
                //分数
                if (m1params.MaxScore != 0)
                {

                    sb.AppendFormat(" and score <={0}", m1params.MaxScore);
                }
                //结业
                if (m1params.Status != -1)
                {
                    sb.AppendFormat(" and status ={0}", m1params.Status);
                }
                //发票
                if (m1params.IID != -1)
                {
                    if (m1params.IID == 1)
                    {
                        sb.AppendFormat(" and IID >{0}", 0);
                    }
                    if (m1params.IID == 0)
                    {
                        sb.AppendFormat(" and IID ={0}", 0);
                    }
                }
                //注册时间
                if (m1params.RegMinDate > DateTime.MinValue)
                {
                    sb.AppendFormat(" and RegDate >='{0}'", m1params.RegMinDate);
                }
                //注册时间
                if (m1params.RegMaxDate > DateTime.MinValue)
                {
                    sb.AppendFormat(" and RegDate <='{0}'", m1params.RegMaxDate);
                }

                //缴费时间
                if (m1params.PayMinDate > DateTime.MinValue)
                {
                    sb.AppendFormat(" and PayDate >='{0}'", m1params.PayMinDate);
                }
                //缴费时间
                if (m1params.PayMaxDate > DateTime.MinValue)
                {
                    sb.AppendFormat(" and PayDate <='{0}'", m1params.PayMaxDate);
                }

                //结业时间
                if (m1params.GrMinDate > DateTime.MinValue)
                {
                    sb.AppendFormat(" and CommitDate >='{0}'", m1params.GrMinDate);
                }
                //结业时间
                if (m1params.GrMaxDate > DateTime.MinValue)
                {
                    sb.AppendFormat(" and CommitDate <='{0}'", m1params.GrMaxDate);
                }

                //区域代码
                //if (m1params.RegionCodes != 0)
                //{
                //    sb.AppendFormat(" and left(RegionCode,4) ='{0}'", m1params.RegionCodes);
                //}

                if (!string.IsNullOrEmpty(m1params.RegionCodes))
                {
                    string[] ArrayStr = m1params.RegionCodes.Split(',');
                    if (!ArrayStr.Contains<string>("-1"))
                    {
                        sb.AppendFormat(" and left(RegionCode,4) in({0})", m1params.RegionCodes);
                    }
                }

                Filter = sb.ToString();
            }
            return Filter;
        }
        public static string BuildFilter(Model.M.M2Params m2params)
        {
            string Filter = string.Empty;
            if (m2params.QueryFlag == 1)
            {
                var sb = new StringBuilder();
                sb.Append(" 1 = 1 ");

                //year = Request["year"];
                //年份
                //if (!string.IsNullOrEmpty(m2params.Years))
                //{
                //    string[] ArrayYear = m2params.Years.Split(',');
                //    if (!ArrayYear.Contains<string>("-1"))
                //    {
                //        sb.AppendFormat(" and Year in({0})", m2params.Years);
                //    }
                //}

                //ID下限
                if (m2params.MinID != 0)
                {
                    sb.AppendFormat(" and ID >='{0}'", m2params.MinID);
                }
                //ID上限
                if (m2params.MaxID != 0)
                {
                    sb.AppendFormat(" and ID <='{0}'", m2params.MaxID);
                }

                //发票金额下限
                if (m2params.MinAmount != 0)
                {
                    sb.AppendFormat(" and Amount >='{0}'", m2params.MinAmount);
                }
                //发票金额上限
                if (m2params.MaxAmount != 0)
                {
                    sb.AppendFormat(" and Amount <='{0}'", m2params.MaxAmount);
                }

                //发票登记时间
                if (m2params.CrMinDate > DateTime.MinValue)
                {
                    sb.AppendFormat(" and CreateDate >='{0}'", m2params.CrMinDate);
                }
                //发票登记时间
                if (m2params.CrMaxDate > DateTime.MinValue)
                {
                    sb.AppendFormat(" and CreateDate <='{0}'", m2params.CrMaxDate);
                }


                Filter = sb.ToString();
            }
            return Filter;
        }
        public static string BuildFilter(Model.M.IncomesParams Params)
        {
            string Filter = string.Empty;
            if (Params.QueryFlag == 1)
            {
                var sb = new StringBuilder();
                sb.Append(" 1 = 1 ");

                //金额下限
                if (Params.MinAmount != 0)
                {
                    sb.AppendFormat(" and Amount >='{0}'", Params.MinAmount);
                }
                //金额上限
                if (Params.MaxAmount != 0)
                {
                    sb.AppendFormat(" and Amount <='{0}'", Params.MaxAmount);
                }

                //时间
                if (Params.MinDate > DateTime.MinValue)
                {
                    sb.AppendFormat(" and Date >='{0}'", Params.MinDate.ToString("yyyyMMdd"));
                }
                //时间
                if (Params.MaxDate > DateTime.MinValue)
                {
                    sb.AppendFormat(" and Date <='{0}'", Params.MaxDate.ToString("yyyyMMdd"));
                }
                Filter = sb.ToString();
            }
            return Filter;
        }
        public static string BuildJSON<T>(T Params)
        {
            string JsonStr = string.Empty;
            JavaScriptSerializer jss = new JavaScriptSerializer();
            JsonStr = jss.Serialize(Params);
            return JsonStr;
        }
        /// <summary>
        /// 检查学员是否已开通了某年度的课程
        /// </summary>
        /// <param name="PID">如：2013,2012</param>
        /// <returns></returns>
        public static bool IsActive(int PID)
        {
            var r = false;
            var MyProducts = DAL.Get.MyProducts(Client.MID);
            var CheckProducts = MyProducts.FindAll(N => N.PID == PID);
            if (CheckProducts.Count > 0)
            {
                r = true;
            }
            return r;
        }

        public static string GetMD5(string str)
        {
            MD5CryptoServiceProvider md5Hasher = new MD5CryptoServiceProvider();
            byte[] hashedDataBytes;
            hashedDataBytes = md5Hasher.ComputeHash(Encoding.Unicode.GetBytes(str));
            StringBuilder tmp = new StringBuilder();
            foreach (byte i in hashedDataBytes)
            {
                tmp.Append(i.ToString("x2"));
            }

            return tmp.ToString();

        }
       
    }
}
