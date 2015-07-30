using System;
using System.Collections.Generic;
using System.Text;

namespace com.hooyes.lms.Model
{
    public class Contents 
    {
        public int CID { get; set; }
        public string CName { get; set; }
        public int CCID { get; set; }
        public string CCName { get; set; }
        public string Name { get; set; }
        public int Duration { get; set; }
        public string Url { get; set; }
        public string MIME { get; set; }
    }
    public class MyConents : Contents
    {
        public int MID { get; set; }
        public int Minutes { get; set; }
        public decimal Second { get; set; }
        public int Status { get; set; }
    }
}
