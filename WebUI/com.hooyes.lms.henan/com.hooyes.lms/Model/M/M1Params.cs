using System;
using System.Text;

namespace com.hooyes.lms.Model.M
{
    /// <summary>
    /// 学员列表的查询参数
    /// </summary>
    public class M1Params
    {
        /// <summary>
        /// 学员类型
        /// </summary>
        public int Type { get; set; }
        /// <summary>
        /// 可以多选 2013,2012...
        /// </summary>
        public string Years { get; set; }
        public int MaxMinutes { get; set; }
        public int MinMinutes { get; set; }
        public int MinScore { get; set; }
        public int MaxScore { get; set; }
        /// <summary>
        /// 结业状态
        /// </summary>
        public int Status { get; set; }
        /// <summary>
        /// 发票
        /// </summary>
        public int IID { get; set; }

        /// <summary>
        /// 注册时间
        /// </summary>
        public DateTime RegMinDate { get; set; }
        public DateTime RegMaxDate { get; set; }

        /// <summary>
        /// 结业时间
        /// </summary>
        public DateTime GrMinDate { get; set; }
        public DateTime GrMaxDate { get; set; }

        /// <summary>
        /// 查询标识 1 在查 0 未查询
        /// </summary>
        public int QueryFlag { get; set; }
    }
}
