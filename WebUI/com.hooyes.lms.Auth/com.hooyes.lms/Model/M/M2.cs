using System;
using System.Collections.Generic;
using System.Text;

namespace com.hooyes.lms.Model.M
{
    /// <summary>
    /// Invoice
    /// </summary>
    public class M2
    {
        public int ID { get; set; }
        public int IID { get; set; }
        public int MID { get; set; }
        public int Year { get; set; }
        public int Type { get; set; }
        public string IDSN { get; set; }
        public string IDCARD { get; set; }
        /// <summary>
        /// 学员
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// 收件人
        /// </summary>
        public string NameContact { get; set; }
        public string Amount { get; set; }
        public string Title { get; set; }
        public string Tel { get; set; }
        public string Province { get; set; }
        public string City { get; set; }
        public string Address { get; set; }
        public string Zip { get; set; }
        public string CreateDate { get; set; }

    }
    /// <summary>
    /// 用于导出CSV
    /// </summary>
    public class Invoice
    {
        public string ID { get; set; }
        //public string MID { get; set; }
        //public string Year { get; set; }
        //public string IDSN { get; set; }
        public string Name { get; set; }
        public string IDCARD { get; set; }
        public string Amount { get; set; }
        public string Title { get; set; }
        public string NameContact { get; set; }
        public string Tel { get; set; }
        //public string City { get; set; }
        public string Address { get; set; }
        public string Zip { get; set; }
        public string CreateDate { get; set; }
    }
}
