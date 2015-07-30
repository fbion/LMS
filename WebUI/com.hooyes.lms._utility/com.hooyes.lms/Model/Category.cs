using System;
using System.Collections.Generic;
using System.Text;

namespace com.hooyes.lms.Model
{
    public class Category
    {
        public int ID { get; set; }
        public int CateID { get; set; }
        public int ParentCateID { get; set; }
        public string CateName { get; set; }
    }
}
