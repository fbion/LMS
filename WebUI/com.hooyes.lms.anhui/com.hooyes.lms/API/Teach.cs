using System;
using System.Collections.Generic;
using System.Text;
using System.Web.Script.Serialization;
using System.Configuration;
using com.hooyes.lms.Model;

namespace com.hooyes.lms.API
{
    public class Teach
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        public static ProveAction TeachProveAction(ProveParams param)
        {
            ProveAction r = new ProveAction();
            try
            {
                if (string.IsNullOrEmpty(param.schoolId))
                {
                    param.schoolId = C.SCHOOLID;
                    param.schoolPas = C.SCHOOLPAS;
                }
                string url = C.SCHOOLURL + "/servlet/TeachEscapeProveAction";
                string data = "schoolId={0}&schoolPas={1}&certId={2}&orderId={3}";
                data = string.Format(data, param.schoolId, param.schoolPas, param.certId, param.orderId);
                string s = http.Send(data, url);
                JavaScriptSerializer jss = new JavaScriptSerializer();
                r = jss.Deserialize<ProveAction>(s);
            }
            catch (Exception ex)
            {
                log.Warn(ex.Message);
            }
            return r;
        }
        public static AnnalAction TeachAnnalAction(AnnalParams param)
        {
            AnnalAction r = new AnnalAction();
            try
            {
                if (string.IsNullOrEmpty(param.schoolId))
                {
                    param.schoolId = C.SCHOOLID;
                    param.schoolPas = C.SCHOOLPAS;
                }
                string url = C.SCHOOLURL + "/servlet/TeachEscapeAnnalAction";
                string data = "schoolId={0}&schoolPas={1}&certId={2}&orderId={3}";
                data = data + "&credits={4}&classHour={5}&startTeachDate={6}&endTeachDate={7}&isPass={8}";
                data = string.Format(data, param.schoolId, param.schoolPas, param.certId, param.orderId
                    ,param.credits
                    ,param.classHour
                    ,param.startTeachDate
                    ,param.endTeachDate
                    ,param.isPass);
                string s = http.Send(data, url);
                JavaScriptSerializer jss = new JavaScriptSerializer();
                r = jss.Deserialize<AnnalAction>(s);
            }
            catch (Exception ex)
            {
                log.Warn(ex.Message);
            }
            return r;
        }
        public static AdminServelt TeachAdminAnnalServelt(ProveParams param)
        {
            AdminServelt r = new AdminServelt();
            try
            {
                if (string.IsNullOrEmpty(param.schoolId))
                {
                    param.schoolId = C.SCHOOLID;
                    param.schoolPas = C.SCHOOLPAS;
                }
                string url = C.SCHOOLURL + "/servlet/CompTeachAdminAnnalServelt";
                string data = "schoolId={0}&schoolPas={1}&certId={2}&orderId={3}";
                data = string.Format(data, param.schoolId, param.schoolPas, param.certId, param.orderId);
                string s = http.Send(data, url);
                JavaScriptSerializer jss = new JavaScriptSerializer();
                r = jss.Deserialize<AdminServelt>(s);
            }
            catch (Exception ex)
            {
                log.Warn(ex.Message);
            }
            return r;
        }

        /// <summary>
        /// UploadEduAmount
        /// </summary>
        /// <param name="seq_num"></param>
        /// <param name="pay_data">YYYY-MM-DD</param>
        /// <param name="pay_amount"></param>
        /// <returns></returns>
        public static R UploadEduAmount(string seq_num, string pay_date, string pay_amount)
        {
            var r = new R();
            r.Code = -1;
            try
            {
                string api_url = ConfigurationManager.AppSettings.Get("Ah_Url_uploadEduAmount");
                string data = "seq_num={0}&pay_date={1}&pay_amount={2}";
                data = string.Format(data, seq_num, pay_date, pay_amount);
                r.Message = http.Send(data, api_url);
                if (r.Message.Substring(0, 1) == "1")
                {
                    r.Code = 0; //success;
                }
                else
                {
                    r.Code = 300;
                }
            }
            catch (Exception ex)
            {
                r.Code = 301;
                log.Warn("{0},{1}", ex.Message, ex.StackTrace);
            }
            return r;
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="seq_num"></param>
        /// <param name="training_hours"> >=24学时</param>
        /// <param name="edu_content">存考试合格的所有课程名如：会计准则/小企业制度/职业道德 以“/”分割</param>
        /// <param name="training_end_date">YYYY-MM-DD</param>
        /// <returns></returns>
        public static R UploadEduInfo(string seq_num, decimal training_hours, string edu_content, string training_end_date)
        {
            var r = new R();
            try
            {
                
                edu_content = API.Cipher.Encrypt(edu_content);
                string api_url = ConfigurationManager.AppSettings.Get("Ah_Url_uploadEduInfo");
                string data = "seq_num={0}&training_hours={1}&edu_content={2}&training_end_date={3}";
                data = string.Format(data, seq_num, training_hours, edu_content, training_end_date);
                r.Message = http.Send(data, api_url);
                if (r.Message.Substring(0, 1) == "1" || r.Message.IndexOf("无需再次接收") != -1)
                {
                    r.Code = 0; //success;
                }
                else
                {
                    r.Code = 300;
                }
            }
            catch (Exception ex)
            {
                r.Code = 301;
                log.Warn("{0},{1}", ex.Message, ex.StackTrace);
            }
            return r;
        }
    }
}
