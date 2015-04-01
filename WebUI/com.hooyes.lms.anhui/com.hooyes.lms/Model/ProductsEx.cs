using System;
using System.Collections.Generic;
using System.Text;

namespace com.hooyes.lms.Model
{
    public class ProductsEx : Products
    {
        public int Flag { get; set; }
        public string IDSN { get; set; }
        public DateTime PayDate { get; set; }
    }
}
