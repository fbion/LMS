using System;
using System.Collections.Generic;
using System.IO;
using System.Reflection;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Script.Serialization;

namespace com.hooyes.lms
{
    public class Utility
    {
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
        public static string BuildJSON<T>(T Params)
        {
            string JsonStr = string.Empty;
            JavaScriptSerializer jss = new JavaScriptSerializer();
            JsonStr = jss.Serialize(Params);
            return JsonStr;
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
    }
}
