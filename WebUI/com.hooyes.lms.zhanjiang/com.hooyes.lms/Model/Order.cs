using System;
using System.Collections.Generic;
using System.Text;

namespace com.hooyes.lms.Model
{
    public class Order
    {
        /// <summary>
        /// 内部订单号
        /// </summary>
        public int ID { get; set; }
        public int MID { get; set; }
        /// <summary>
        /// 对外接口的订单号 
        /// </summary>
        public string OrderID { get; set; }
        /// <summary>
        /// 应付总额
        /// </summary>
        public decimal Amount { get; set; }
        /// <summary>
        /// 网银现金
        /// </summary>
        public decimal Cash { get; set; }
        /// <summary>
        /// 余额抵扣
        /// </summary>
        public decimal Credit { get; set; }
        /// <summary>
        /// Status = 10 已完成
        /// </summary>
        public int Status { get; set; }
        public string Tags { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime UpdateDate { get; set; }
        public string Memo { get; set; }
    }
}
