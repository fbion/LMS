using System;
using System.Collections.Generic;
using System.Text;

namespace com.hooyes.lms.Model
{
   public  class Invoice
    {
       public int ID { get; set; }
       public int IID { get; set; }
       public int MID { get; set; }
       public string IDSN { get; set; }
       public string Name { get; set; }
       public decimal Amount { get; set; }
       public string Title { get; set; }
       public string Tel { get; set; }
       public string Province { get; set; }
       public string City { get; set; }
       public string Address { get; set; }
       public string Zip { get; set; }
       public DateTime CreateDate { get; set; }

    }
}
