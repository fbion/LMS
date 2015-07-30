using System;
using System.Collections.Generic;
using System.Text;

namespace com.hooyes.lms.Model
{
    public class Products
    {
        /// <summary>
        /// Products ID
        /// </summary>
        public int ID { get; set; }
        public int PID { get; set; }
        public decimal Price { get; set; }
        public string Name { get; set; }
        public string Memo { get; set; }
        /// <summary>
        /// dbo.My_Products ID  0 -- 未购  > 0 已购
        /// </summary>
        public int MyID { get; set; }
    }
    public class MyProducts
    {
        public int ID { get; set; }
        public int PID { get; set; }
        public int MID { get; set; }
        public DateTime CreateDate { get; set; }
        public string Memo { get; set; }
    }
}
