using System;
using System.Collections.Generic;
using System.Configuration;
using System.Text;
using System.Web.Script.Serialization;
using com.hooyes.lms;

namespace com.hooyes.lms.API
{
    public static class Guangdong
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        private static string api_gd_uid = ConfigurationManager.AppSettings.Get("api_gd_uid");
        private static string api_gd_pwd = ConfigurationManager.AppSettings.Get("api_gd_pwd");
        private static string api_gd_url = ConfigurationManager.AppSettings.Get("api_gd_url");
        private static string api_gd_key = ConfigurationManager.AppSettings.Get("api_gd_key");
        public static GuangdongResult compProve(GuangdongParams1 param)
        {
            var r = new GuangdongResult();
            try
            {
                param.userID = api_gd_uid;
                param.userPwd = api_gd_pwd;
                string url = api_gd_url;
                string data = "method=compProve&userID={0}&userPwd={1}&cardNumber={2}&compId={3}&compName={4}&areaName={5}";
                data = string.Format(data, param.userID.Encrypt(), param.userPwd.Encrypt(), param.cardNumber.Encrypt(), param.compId.Encrypt(), param.compName.Encrypt(), param.areaName.Encrypt());
                string s = http.Send(data, url);
                r.ResponseCode = s;
            }
            catch (Exception ex)
            {
                log.Warn(ex.Message);
            }
            return r;
        }
        public static GuangdongResult saveTelOrgStuScore(GuangdongParams2 param)
        {
            var r = new GuangdongResult();
            try
            {
                param.userID = api_gd_uid;
                param.userPwd = api_gd_pwd;

                log.Debug("userID：{0}", param.userID);
                log.Debug("userPwd：{0}", param.userPwd);
                log.Debug("cardNumberType：{0}", param.cardNumberType);
                log.Debug("cardNumber：{0}", param.cardNumber);
                log.Debug("areaName：{0}", param.areaName);
                log.Debug("year：{0}", param.year);
                log.Debug("classCode：{0}", param.classCode);
                log.Debug("classLearnTimeCount：{0}", param.classLearnTimeCount);
                log.Debug("score：{0}", param.score);
                log.Debug("password：{0}", param.password);

                string url = api_gd_url;
                string data = "method=saveTelOrgStuScore&userID={0}&userPwd={1}&cardNumberType={2}&cardNumber={3}&areaName={4}&year={5}&classCode={6}&classLearnTimeCount={7}&score={8}&password={9}";
                data = string.Format(data, param.userID.Encrypt(), param.userPwd.Encrypt(),
                    param.cardNumberType.Encrypt(),
                    param.cardNumber.Encrypt(),
                    param.areaName.Encrypt(),
                    param.year.Encrypt(),
                    param.classCode.Encrypt(),
                    param.classLearnTimeCount.Encrypt(),
                    param.score.Encrypt(),
                    param.password.Encrypt());
                string s = http.Send(data, url);
                r.ResponseCode = s;
            }
            catch (Exception ex)
            {
                log.Warn(ex.Message);
            }
            return r;
        }
        private static string Encrypt(this string str)
        {
            string data = DESSecurity.Encrypt(str, api_gd_key);
            return data;
        }
    }
}
