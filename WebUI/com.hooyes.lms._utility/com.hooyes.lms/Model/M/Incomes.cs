using System;
using System.Collections.Generic;
using System.Text;

namespace com.hooyes.lms.Model.M
{
    /// <summary>
    /// 收入
    /// </summary>
    public class Incomes
    {
        public int Date { get; set; }
        public decimal Amount { get; set; }
        public int Count { get; set; }
        public decimal Avg { get; set; }
    }
    /// <summary>
    /// 查询参数
    /// </summary>
    public class IncomesParams
    {
        /// <summary>
        /// 金额
        /// </summary>
        public decimal MinAmount { get; set; }
        public decimal MaxAmount { get; set; }
        /// <summary>
        /// 时间
        /// </summary>
        public DateTime MinDate { get; set; }
        public DateTime MaxDate { get; set; }

        public int RegionCode { get; set; }

        /// <summary>
        /// 查询标识 1 在查 0 未查询
        /// </summary>
        public int QueryFlag { get; set; }
    }
}
