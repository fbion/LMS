using System;
namespace com.hooyes.lms.Model
{
    public class SurveyRecords
    {
        public int ID { get; set; }
        public int UserID { get; set; }
        public int ItemID { get; set; }
        /// <summary>
        /// 1 - INT  2 - TEXT
        /// </summary>
        public int ItemValueType { get; set; }
        public string ItemValue { get; set; }
    }

    public class SurveyRecordsInt
    {
        public int ID { get; set; }
        public int UserID { get; set; }
        public int ItemID { get; set; }
        public int ItemValue { get; set; }
        public DateTime CreateDate { get; set; }
    }

    public class SurveyRecordsText
    {
        public int ID { get; set; }
        public int UserID { get; set; }
        public int ItemID { get; set; }
        public string ItemValue { get; set; }
        public DateTime CreateDate { get; set; }
    }
}
