using com.hooyes.lms.Svc.Model;
using System;
using System.Data;

namespace com.hooyes.lms.Svc
{
    public class Service1 : IService1
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        public R I(M1 mc,string k)
        {
            var r = ValidateKey(k);
            if (r.Code == 0)
            {
                r = DAL.Login.Check(mc.IDSN, mc.IDCard);
                if (r.Code == 0)
                {
                    mc.Token = k;
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
                ds = DAL.Get.Summary(k);
            }
            return ds;
        }
        private R ValidateKey(string k)
        {
            var r = new R();
            string[] ArrayKeys = C.VKEY.Split(',');
            bool b = false;
            foreach (var key in ArrayKeys)
            {
                if (k == key)
                {
                    b = true;
                }
            }
            if (b)
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
    }
}
