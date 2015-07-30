using System;
using System.Collections.Generic;
using System.Text;

namespace com.hooyes.lms.Model
{
    public class MSessions : R
    {
        public int MID { get; set; }
        //public string SessionId { get; set; }
        public string IP { get; set; }
        public DateTime Created { get; set; }
    }
}
