using System;
using System.Collections.Generic;
using System.Text;

namespace com.hooyes.lms.Model
{
    public class Courses
    {
        public int CID { get; set; }
        public string CName { get; set; }
        public string Name { get; set; }
        /// <summary>
        /// 0 行政事业类 1 企业类
        /// </summary>
        public int Type { get; set; }
        public int Year { get; set; }
        /// <summary>
        /// 0 选修 1 必修
        /// </summary>
        public int Cate { get; set; }
        public int Sort { get; set; }
        public string Teacher { get; set; }
        /// <summary>
        /// 课程实际分钟数
        /// </summary>
        public decimal ActMinutes { get; set; }
        public decimal Length { get; set; }
        /// <summary>
        /// 多功能Tag
        /// </summary>
        public string Tag { get; set; }
        public string Memo { get; set; }
    }
    public class MyCourses : Courses
    {
        public int MID { get; set; }
        public decimal Minutes { get; set; }
        public decimal Second { get; set; }
        public int Status { get; set; }
        public int Validate { get; set; }
    }
}
