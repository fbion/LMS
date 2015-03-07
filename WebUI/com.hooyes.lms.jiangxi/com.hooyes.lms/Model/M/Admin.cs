using System;
using System.Collections.Generic;
using System.Text;

namespace com.hooyes.lms.Model.M
{
    public class Admin
    {
        public int ID { get; set; }
        public int AID { get; set; }
        public string Login { get; set; }
        public string Password { get; set; }
        public int Level { get; set; }
        public string Tag { get; set; }
        public DateTime UpdateDate { get; set; }

    }
}
