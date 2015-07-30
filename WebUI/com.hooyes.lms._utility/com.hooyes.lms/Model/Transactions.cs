using System;
using System.Collections.Generic;
using System.Text;

namespace com.hooyes.lms.Model
{
    public class Transactions
    {
        public int ID { get; set; }
        public int MID { get; set; }
        public decimal Amount { get; set; }
        public int Cate { get; set; }
        public string Source { get; set; }
        public string Memo { get; set; }
        public DateTime CreateDate { get; set; }
    }
}
