using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using com.hooyes.lms.Model.M;

namespace com.hooyes.lms.Controllers
{
    [RequiredMaster]
    public class ExportController : Controller
    {
        public ActionResult M1()
        {
            int Count = 0;
            var L = DAL.M.Get.M1(0, 0, out Count);
            string CSV = U.ConvertToCSV<M1>(L);
            U.ExportCSV(CSV);
            return Content(string.Empty);
        }
        public ActionResult Invoice(int PageSize, int CurrentPage)
        {
            int Count = 0;
            List<Invoice> TL = new List<Model.M.Invoice>();
            //第一行
            var TM = new Invoice();
            TM.ID = "序号";
            TM.MID = "学员号";
            TM.Year = "年份";
            TM.IDSN = "报名序号";
            TM.IDCARD = "身份证号";
            TM.Name = "学员姓名";
            TM.NameContact = "收件人";
            TM.Amount = "发票金额";
            TM.Title = "发票抬头";
            TM.Tel = "电话";
            TM.City = "城市";
            TM.Address = "邮件地址";
            TM.Zip = "邮编";
            TM.CreateDate = "申请时间";
            TL.Add(TM);
            //数据行
            var L = DAL.M.Get.M2(PageSize, CurrentPage, out Count);
            foreach (var m in L)
            {
                TM = new Invoice();
                TM.ID = m.ID.ToString();
                TM.MID = m.MID.ToString();
                TM.Year = m.Year.ToString();
                TM.IDSN = "'" + m.IDSN;
                TM.IDCARD = "'" + m.IDCARD;
                TM.Name = m.Name;
                TM.NameContact = m.NameContact;
                TM.Amount = m.Amount;
                TM.Title = m.Title;
                TM.Tel = m.Tel;
                TM.City = m.City;
                TM.Address = m.Address;
                TM.Zip = m.Zip;
                TM.CreateDate = m.CreateDate;
                TL.Add(TM);
            }
            string CSV = U.ConvertToCSV<Invoice>(TL);
            U.ExportCSV(CSV);
            return Content(string.Empty);
        }
        public ActionResult InvoiceV2(int PageSize, int CurrentPage, Model.M.M2Params m2params)
        {
            m2params.Years = Request.QueryString.Get("Years"); //Years 多条
            string Filter = U.BuildFilter(m2params);
            int Count = 0;
            List<Invoice> TL = new List<Model.M.Invoice>();
            //第一行
            var TM = new Invoice();
            TM.ID = "序号";
            TM.MID = "学员号";
            TM.Year = "年份";
            TM.IDSN = "报名序号";
            TM.IDCARD = "身份证号";
            TM.Name = "学员姓名";
            TM.NameContact = "收件人";
            TM.Amount = "发票金额";
            TM.Title = "发票抬头";
            TM.Tel = "电话";
            TM.City = "城市";
            TM.Address = "邮件地址";
            TM.Zip = "邮编";
            TM.CreateDate = "申请时间";
            TL.Add(TM);
            //数据行
            var L = DAL.M.Get.M2(PageSize, CurrentPage, Filter, out Count);
            foreach (var m in L)
            {
                TM = new Invoice();
                TM.ID = m.ID.ToString();
                TM.MID = m.MID.ToString();
                TM.Year = m.Year.ToString();
                TM.IDSN = "'" + m.IDSN;
                TM.IDCARD = "'" + m.IDCARD;
                TM.Name = m.Name;
                TM.NameContact = m.NameContact;
                TM.Amount = m.Amount;
                TM.Title = m.Title;
                TM.Tel = m.Tel;
                TM.City = m.City;
                TM.Address = m.Address;
                TM.Zip = m.Zip;
                TM.CreateDate = m.CreateDate;
                TL.Add(TM);
            }
            string CSV = U.ConvertToCSV<Invoice>(TL);
            U.ExportCSV(CSV);
            return Content(string.Empty);
        }
        public ActionResult Member(int PageSize, int CurrentPage)
        {
            int Count = 0;
            List<Member> TL = new List<Model.M.Member>();
            //第一行
            var TM = new Member();
            TM.ID = "序号";
            TM.MID = "学员号";
            TM.IDSN = "报名序号";
            TM.IDCard = "身份证号";
            TM.Name = "学员姓名";
            TM.Type = "类型";
            TM.Year = "年份";
            TM.Minutes = "课时(分钟)";
            TM.IID = "发票";
            TM.Score = "考试";
            TM.Status = "结业";
            TM.RegDate = "注册时间";
            TL.Add(TM);
            //数据行
            var L = DAL.M.Get.M1(PageSize, CurrentPage, out Count);
            foreach (var m in L)
            {
                TM = new Member();
                TM.ID = m.ID.ToString();
                TM.MID = m.MID.ToString();
                TM.IDSN = "'" + m.IDSN;
                TM.IDCard = "'" + m.IDCard;
                TM.Name = m.Name;
                TM.Type = m.Type == 0 ? "行政" : "企业";
                TM.Year = m.Year.ToString();
                TM.Minutes = string.Format("{0}", m.Minutes.ToString("0.#"));
                TM.IID = m.IID > 0 ? "发票" : "-";
                TM.Score = m.Score > 0 ? m.Score.ToString() : "-";
                TM.Status = m.Status == 1 ? "结业" : "-";
                TM.RegDate = m.RegDate.ToString();
                TL.Add(TM);
            }
            string CSV = U.ConvertToCSV<Member>(TL);
            U.ExportCSV(CSV);
            return Content(string.Empty);
        }
        public ActionResult MemberV2(int PageSize, int CurrentPage, Model.M.M1Params m1params)
        {
            m1params.Years = Request.QueryString.Get("Years"); //Years 多条
            string Filter = U.BuildFilter(m1params);
            int Count = 0;
            List<Member> TL = new List<Model.M.Member>();
            //第一行
            var TM = new Member();
            TM.ID = "序号";
            TM.MID = "学员号";
            TM.IDSN = "报名序号";
            TM.IDCard = "身份证号";
            TM.Name = "学员姓名";
            TM.Phone = "手机";
            TM.Type = "类型";
            TM.Year = "年份";
            TM.Minutes = "课时(分钟)";
            TM.IID = "发票";
            TM.Score = "考试";
            TM.Status = "结业";
            TM.RegDate = "注册时间";
            TM.CommitDate = "结业时间";
            TL.Add(TM);
            //数据行
            var L = DAL.M.Get.M1(PageSize, CurrentPage, Filter, out Count);
            foreach (var m in L)
            {
                TM = new Member();
                TM.ID = m.ID.ToString();
                TM.MID = m.MID.ToString();
                TM.IDSN = "'" + m.IDSN;
                TM.IDCard = "'" + m.IDCard;
                TM.Name = m.Name;
                TM.Phone = m.Phone;
                TM.Type = m.Type == 0 ? "行政" : "企业";
                TM.Year = m.Year.ToString();
                TM.Minutes = string.Format("{0}", m.Minutes.ToString("0.#"));
                TM.IID = m.IID > 0 ? "发票" : "-";
                TM.Score = m.Score > 0 ? m.Score.ToString() : "-";
                TM.Status = m.Status == 1 ? "已结业" : "-";
                TM.RegDate = m.RegDate.ToString();
                if (m.CommitDate > DateTime.MinValue)
                {
                    TM.CommitDate = m.CommitDate.ToString();
                }
                TL.Add(TM);
            }
            string CSV = U.ConvertToCSV<Member>(TL);
            U.ExportCSV(CSV);
            return Content(string.Empty);
        }
        public ActionResult Survey(int PageSize, int CurrentPage, Model.M.SurveyParams Params)
        {
            string Filter = U.BuildFilter(Params);
            int Count = 0;
            var TL = new List<Model.M.Survey>();
            var L = DAL.M.Get.Survey(PageSize, CurrentPage, Filter, out Count);
            foreach (var m in L)
            {
                m.IDCard = "'" + m.IDCard;
                m.IDSN = "'" + m.IDSN;
                m.IDCert = "'" + m.IDCert;
                TL.Add(m);
            }
            string CSV = U.ConvertToCSV<Model.M.Survey>(TL);
            var sb = new StringBuilder();
            sb.Append("\"序号\",\"类型\",\"姓名\",\"电话\",\"报名序号\",\"身份证号\",\"会计证号\",\"IP\",\"其它问题\",\"日期\"");
            sb.AppendLine();
            CSV = sb.ToString() + CSV;
            U.ExportCSV(CSV);
            return Content(string.Empty);
        }
    }
}
