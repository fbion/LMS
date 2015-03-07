using System;
using System.Collections.Generic;
using System.Text;
using com.hooyes.lms.Model;
using com.hooyes.lms.SMS;

namespace com.hooyes.lms.API
{
    public class SMSx
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        public static void SendCode(string phone)
        {
            string sysPhoneCode = MemCache.Get<string>("sms_phonecode");
            if (string.IsNullOrEmpty(sysPhoneCode))
            {
                sysPhoneCode = GenerateCheckCode();
                log.Info("sysPhoneCode:{0},MID:{1}", sysPhoneCode,Client.MID);
                string text = "您的验证码是 {0} ，请您在10分钟内完成验证。[宁夏会计人员继续教育网]";
                text = string.Format(text,sysPhoneCode);
                PushToPhone(phone, text);
                MemCache.Save("sms_phonecode", sysPhoneCode);
                log.Info("phone:{0},code:{1}",phone, sysPhoneCode);
            }

        }
        public static R ReSendCode(string phone)
        {
            var r = new R();
            ClearPhoneCode();
            SendCode(phone);
            r.Code = 0;
            r.Message = "success";
            return r;
        }
        public static R ValidateCode(string phonecode)
        {
            var r = new R();
            r.Code = -1;
            try
            {
                if (!string.IsNullOrEmpty(phonecode))
                {
                    string sysPhoneCode = MemCache.Get<string>("sms_phonecode");

                    log.Info("sysPhoneCode:{0},userPhonecode:{1}", sysPhoneCode, phonecode);

                    if (sysPhoneCode.ToLower() == phonecode.ToLower())
                    {
                        r.Code = 0;
                        r.Message = "success";
                    }
                    else
                    {
                        r.Code = 109;
                        r.Message = "phone code incorrect";
                    }
                }
                else
                {
                    r.Code = 109;
                    r.Message = "phone code incorrect";
                }
            }
            catch (Exception ex)
            {
                r.Code = 300;
                log.Warn("{0},{1}", ex.Message, ex.StackTrace);
            }
            return r;
        }
        public static void ClearPhoneCode()
        {
            MemCache.Save("sms_phonecode","");
        }
        public static void PushToPhone(string phone, string text)
        {
            try
            {
                SMS.SendMessageSoapClient client = new SendMessageSoapClient();
                MySoapHeader header = new MySoapHeader();
                header.PassWord = C.SMSTOKEN;
                string s = client.sendmsg(header, phone, "1", "7", text, "远程学员");
                log.Info(s);
            }
            catch (Exception ex)
            {
                log.Warn("{0},{1}", ex.Message, ex.Source);
            }
        }
        private static string GenerateCheckCode()
        {
            int number;
            char code;
            string checkCode = String.Empty;

            System.Random random = new Random();

            for (int i = 0; i < 4; i++)
            {
                number = random.Next();

                //if (number % 2 == 0)
                //    code = (char)('1' + (char)(number % 9));
                //else
                code = (char)('A' + (char)(number % 26));
                checkCode += code.ToString();
            }

            return checkCode;
        }
    }
}
