using com.hooyes.lms.Svc.Model;
using System;
using System.Data;

namespace com.hooyes.lms.Svc
{
    public class Service1 : IService1
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        public R SystemTestLearning(string IDSN, string IDCard, string Name, int Year, string Token)
        {
            var r = ValidateKey(Token);
            if (r.Code == 0)
            {
                var mc = new M1();
                mc.IDSN = IDSN;
                mc.IDCard = IDCard;
                mc.Name = Name;
                mc.Year = Year;
                mc.Type = 1;
                mc.tag = 200;
                mc.sType = "S2";
                mc.Phone = "";
                mc.SN = CreateSN();
                r = DAL.Login.Check(mc.IDSN, mc.IDCard);
                if (r.Code == 0)
                {
                    r = DAL.Update.MemberCredit(mc);
                }
            }
            return r;
        }

        public R V(string k)
        {
            var r = ValidateKey(k);
            return r;
        }

        public DataSet Summary(string k)
        {
            var ds = new DataSet();
            var r = ValidateKey(k);
            if (r.Code == 0)
            {
                ds = DAL.Get.Summary();
            }
            return ds;
        }
        private R ValidateKey(string k)
        {
            var r = new R();
            if (k == C.VKEY)
            {
                r.Code = 0;
            }
            else
            {
                r.Code = 101;
                r.Message = "key error";
            }
            return r;
        }

        private decimal CreateSN()
        {
            string SN = DateTime.Now.ToString("yyyyMMddhhmmss");
            return Convert.ToDecimal(SN);
        }
    }
}
