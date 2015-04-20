using System;
using System.Collections.Generic;
using System.Text;

namespace com.hooyes.lms.Model.M
{
    /// <summary>
    /// WorkBench 查询结果
    /// </summary>
    public class M1
    {
        public int ID { get; set; }
        public int MID { get; set; }
        /// <summary>
        /// 姓名
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// 身份证号
        /// </summary>
        public string IDCard { get; set; }
        /// <summary>
        /// 报名序号
        /// </summary>
        public string IDSN { get; set; }
        /// <summary>
        /// 学年
        /// </summary>
        public int Year { get; set; }
        /// <summary>
        /// 用户类型 0 行政事业类 1 企业类
        /// </summary>
        public int Type { get; set; }
        /// <summary>
        /// 用户级别
        /// </summary>
        public int Level { get; set; }
        /// <summary>
        /// 手机
        /// </summary>
        public string Phone { get; set; }
        /// <summary>
        /// 注册时间
        /// </summary>
        public DateTime RegDate { get; set; }
        /// <summary>
        /// 结业
        /// </summary>
        public DateTime CommitDate { get; set; }
        /// <summary>
        /// Invoice ID
        /// </summary>
        public int IID { get; set; }
        /// <summary>
        /// 是否结业
        /// </summary>
        public int Status { get; set; }
        /// <summary>
        /// 总学时长
        /// </summary>
        public decimal Minutes { get; set; }
        /// <summary>
        /// 考试分数
        /// </summary>
        public int Score { get; set; }

        public int RegionCode { get; set; }

        public string RegionName { get; set; }

        public int PID { get; set; }

        public int Flag { get; set; }
    }

    /// <summary>
    /// 用于导出CSV
    /// </summary>
    public class Member
    {
        public string ID { get; set; }
        //public string MID { get; set; }
        /// <summary>
        /// 姓名
        /// </summary>
        public string Name { get; set; }
        //public string Phone { get; set; }
        /// <summary>
        /// 报名序号
        /// </summary>
        //public string IDSN { get; set; }
        /// <summary>
        /// 身份证号
        /// </summary>
        public string IDCard { get; set; }
        /// <summary>
        /// 用户类型 0 行政事业类 1 企业类
        /// </summary>
        //public string Type { get; set; }
        /// <summary>
        /// 学年
        /// </summary>
        public string Year { get; set; }
        /// <summary>
        /// Invoice ID
        /// </summary>
        //public string IID { get; set; }
        /// <summary>
        /// 总学时长
        /// </summary>
        public string Minutes { get; set; }
        /// <summary>
        /// 考试分数
        /// </summary>
        public string Score { get; set; }
        /// <summary>
        /// 是否结业
        /// </summary>
       // public string Status { get; set; }
        /// <summary>
        /// 注册时间
        /// </summary>
        //public string RegDate { get; set; }

        /// <summary>
        /// 结业
        /// </summary>
        public string CommitDate { get; set; }

        public string RegionCode { get; set; }
    }
}
