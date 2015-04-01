using System;

namespace com.hooyes.lms.Model
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
}
