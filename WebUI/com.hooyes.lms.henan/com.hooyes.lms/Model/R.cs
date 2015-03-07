/*
 关于R 中 Code的数值约定
接口参数错误
 * 用101~199以内的数字表示。
存储过程错误
 * 用201~299以内的数字表示。
程序访问数据库异常
 * 用301~399以内的数字表示。
程序异常
 * 用401~499以内的数字表示。
接口调用成功
 * 用数字0表示。
*/
using System;
using System.Text;

namespace com.hooyes.lms.Model
{
    public class R
    {
        public int Code { get; set; }
        public int Value { get; set; }
        public string Message { get; set; }
    }
    /// <summary>
    /// 用户认证信息
    /// </summary>
    public class RL
    {
        public int Code { get; set; }
        public int Value { get; set; }
        public int MID { get; set; }
        public int Year { get; set; }
        public int Level { get; set; }
        public string Message { get; set; }
        public string Name { get; set; }
        public bool IsAdmin { get; set; }
    }
}
