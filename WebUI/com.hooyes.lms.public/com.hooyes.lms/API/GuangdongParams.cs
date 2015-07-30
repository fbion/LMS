using System;
using System.Collections.Generic;
using System.Text;

namespace com.hooyes.lms.API
{
    public class GuangdongParams
    {
        public string userID { get; set; }
        public string userPwd { get; set; }
    }
    public class GuangdongParams1 : GuangdongParams
    {
        /// <summary>
        /// 身份证明号
        /// </summary>
        public string cardNumber { get; set; }
        /// <summary>
        /// 从业档案号
        /// </summary>
        public string compId { get; set; }
        /// <summary>
        /// 从业人员姓名
        /// </summary>
        public string compName { get; set; }
        /// <summary>
        /// 行政区划名称
        /// </summary>
        public string areaName { get; set; }


    }
    public class GuangdongParams2 : GuangdongParams
    {
        /// <summary>
        /// 身份证明类型
        /// </summary>
        public string cardNumberType { get; set; }
        /// <summary>
        /// 身份证明号
        /// </summary>
        public string cardNumber { get; set; }
        /// <summary>
        /// 行政区划名称
        /// </summary>
        public string areaName { get; set; }
        /// <summary>
        /// 年度
        /// </summary>
        public string year { get; set; }
        /// <summary>
        /// 课程编码
        /// </summary>
        public string classCode { get; set; }
        /// <summary>
        /// 课程总学习时间 分钟
        /// </summary>
        public string classLearnTimeCount { get; set; }
        /// <summary>
        /// 成绩
        /// </summary>
        public string score { get; set; }
        /// <summary>
        /// 密钥 机构用户名|身份证明号|课程编码|课程总学习时间|成绩
        /// </summary>
        public string password
        {

            get
            {
                string temp = "{0}|{1}|{2}|{3}|{4}"; //机构用户名|身份证明号|课程编码|课程总学习时间|成绩
                temp = string.Format(temp, userID, cardNumber, classCode, classLearnTimeCount, score);
                return temp;
            }
        }
    }
}
