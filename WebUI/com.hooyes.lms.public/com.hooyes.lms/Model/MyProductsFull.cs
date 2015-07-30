using System;
using System.Collections.Generic;
using System.Text;

namespace com.hooyes.lms.Model
{
    public class MyProductsFull
    {
        // From Products
        public int ID { get; set; }
        public int Year { get; set; }
        public decimal Price { get; set; }
        public string Name { get; set; }
        public int Level { get; set; }
        public int Cate { get; set; }
        // From My_Products
        public int MyID { get; set; }
        public int MID { get; set; }
        public int PID { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime ExpireDate { get; set; }

        public string Memo { get; set; }
       
    }
}
