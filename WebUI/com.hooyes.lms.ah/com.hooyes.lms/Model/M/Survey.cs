using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace com.hooyes.lms.Model.M
{
    public class Survey
    {
        public int Id { get; set; }
        public int Cate { get; set; }
        public string Name { get; set; }
        public string IDCard { get; set; }
        public string IDSN { get; set; }
        public string IDCert { get; set; }
        public string Phone { get; set; }
        public string IP { get; set; }
        public string Comment { get; set; }
        public DateTime CreateDate { get; set; }
    }
    public class SurveyParams
    {
        public int Cate { get; set; }
        /// <summary>
        /// 时间
        /// </summary>
        public DateTime MinDate { get; set; }
        public DateTime MaxDate { get; set; }
        /// <summary>
        /// 查询标识 1 在查 0 未查询
        /// </summary>
        public int QueryFlag { get; set; }
    }
}
