using System;

namespace com.hooyes.lms.Model.M
{
    public class SurveyRecordsText
    {
        public int ID { get; set; }
        public int UserID { get; set; }
        public int ItemID { get; set; }
        public string ItemValue { get; set; }
        public DateTime CreateDate { get; set; }
    }
}
