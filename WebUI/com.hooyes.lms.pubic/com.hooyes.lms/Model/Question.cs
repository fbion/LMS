using System;
using System.Collections.Generic;
using System.Text;

namespace com.hooyes.lms.Model
{
    public class Question
    {
        public int QID { get; set; }
        public int CID { get; set; }
        public string Subject { get; set; }
        public string A { get; set; }
        public string B { get; set; }
        public string C { get; set; }
        public string D { get; set; }
        public string Answer { get; set; }
        public int Score { get; set; }
        public int Cate { get; set; }
    }
    public class MyQuestion
    {
        public int MID { get; set; }
        public int QID { get; set; }
        public string Answer { get; set; }
        public int Score { get; set; }
        public int Flag { get; set; }
    }
}
