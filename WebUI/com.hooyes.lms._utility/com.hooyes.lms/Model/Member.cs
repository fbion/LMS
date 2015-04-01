﻿using System;
using System.Text;

namespace com.hooyes.lms.Model
{
    public class Member : R
    {
        public int ID { get; set; }
        public int MID { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
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
        /// 会计师证号
        /// </summary>
        public string IDCert { get; set; }
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

        public int RegionCode { get; set; }

        public string RegionName { get; set; }

        public string Company { get; set; }

        public string Address { get; set; }

        public string Email { get; set; }

        public string City { get; set; }

        public string Photo { get; set; }

        public string TagName { get; set; }


    }
    public class MemberExt : R
    {
        public int ID { get; set; }
        public int MID { get; set; }
        public string IDSN { get; set; }
        public int PID { get; set; }
        public int Flag { get; set; }
    }
    public enum MemberType
    {
        Administration = 0,
        Enterprise = 1
    }
    public enum MemberLevel
    {
        User = 0,
        Administrator = 1
    }
}
