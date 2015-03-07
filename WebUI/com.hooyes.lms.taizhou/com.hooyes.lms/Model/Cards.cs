using System;
using System.Collections.Generic;
using System.Text;

namespace com.hooyes.lms.Model
{
    public class Cards
    {
        public int ID { get; set; }
        public string NO { get; set; }
        public string SN { get; set; }
        public decimal Amount { get; set; }
        public int Status { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime UpdateDate { get; set; }
        public DateTime ExpDate { get; set; }
    }
}
