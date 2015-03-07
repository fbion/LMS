using System;
using System.Text;

namespace com.hooyes.lms.Model.M
{
    /// <summary>
    /// 发票列表的查询参数
    /// </summary>
    public class M2Params
    {

        /// <summary>
        /// ID Rang
        /// </summary>
        public int MinID { get; set; }
        public int MaxID { get; set; }
        /// <summary>
        /// 可以多选 2013,2012...
        /// </summary>
        public string Years { get; set; }
        /// <summary>
        /// 发票金额
        /// </summary>
        public decimal MinAmount { get; set; }
        public decimal MaxAmount { get; set; }
       

        /// <summary>
        /// 发票登记时间
        /// </summary>
        public DateTime CrMinDate { get; set; }
        public DateTime CrMaxDate { get; set; }

        


        /// <summary>
        /// 查询标识 1 在查 0 未查询
        /// </summary>
        public int QueryFlag { get; set; }
    }
}
