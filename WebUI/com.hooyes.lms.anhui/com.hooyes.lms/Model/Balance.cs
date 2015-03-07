using System;
using System.Collections.Generic;
using System.Text;

namespace com.hooyes.lms.Model
{
   public class Balance
    {
       public int MID { get; set; }
       public decimal Cash { get; set; }
       public decimal Rebate { get; set; }
       public decimal Amount { get; set; }
       public DateTime UpdateDate { get; set; }
    }
}
