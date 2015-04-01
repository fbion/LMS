using System;
using System.Collections.Generic;
using System.Text;

namespace com.hooyes.lms.Model
{
    public class Report
    {
        public int ID { get; set; }
        public int MID { get; set; }
        public int Year { get; set; }
        public int Score { get; set; }
        public decimal Compulsory { get; set; }
        public decimal Elective { get; set; }
        public int Status { get; set; }
        public decimal Minutes { get; set; }
        public string Memo { get; set; }
        public DateTime CreateDate { get; set; }
        public DateTime UpdateDate { get; set; }
        public DateTime CommitDate { get; set; }
        public int Flag { get; set; }

    }


}
