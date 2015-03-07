using System;
using System.Collections.Generic;
using System.Text;

namespace com.hooyes.lms.Model
{
    public class GatewayLog
    {
        public int ID { get; set; }
        public string MerId { get; set; }
        public string BusiId { get; set; }
        public string OrdId { get; set; }
        public string OrdAmt { get; set; }
        public string Version { get; set; }
        public string BgRetUrl { get; set; }
        public string PageRetUrl { get; set; }
        public string GateId { get; set; }
        public string Param1 { get; set; }
        public string Param2 { get; set; }
        public string Param3 { get; set; }
        public string Param4 { get; set; }
        public string Param5 { get; set; }
        public string Param6 { get; set; }
        public string Param7 { get; set; }
        public string Param8 { get; set; }
        public string Param9 { get; set; }
        public string Param10 { get; set; }
        public string OrdDesc { get; set; }
        public string ShareType { get; set; }
        public string ShareData { get; set; }
        public string Priv1 { get; set; }
        public string CustomIp { get; set; }
        public string ChkValue { get; set; }
        public string Plain { get; set; }
        public string PayStat { get; set; }
        public string PayTime { get; set; }
        /// <summary>
        /// 验签结果 0 合法 其它非法
        /// </summary>
        public string Flag { get; set; }
        public DateTime CreateDate { get; set; }
    }
}
