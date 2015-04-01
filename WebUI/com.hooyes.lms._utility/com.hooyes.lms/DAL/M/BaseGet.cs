using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using com.hooyes.lms.Model;
using com.hooyes.lms.Model.M;

namespace com.hooyes.lms.DAL.M
{
    public class BaseGet
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        public static List<M1> M1(string keyword)
        {
            var l = new List<M1>();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@keyword",keyword) 
                };
                var dr = SqlHelper.ExecuteReader(SqlHelper.Local, CommandType.StoredProcedure, "M_Get_Member", param);
                while (dr.Read())
                {
                    var m = new M1();
                    m.ID = Convert.ToInt32(dr["ID"]);
                    m.MID = Convert.ToInt32(dr["MID"]);
                    m.Name = Convert.ToString(dr["Name"]);
                    m.Year = Convert.ToInt32(dr["Year"]);
                    m.IDCard = Convert.ToString(dr["IDCard"]);
                    m.IDSN = Convert.ToString(dr["IDSN"]);
                    m.Level = Convert.ToInt32(dr["Level"]);
                    m.Type = Convert.ToInt32(dr["Type"]);
                    m.Phone = Convert.ToString(dr["Phone"]);
                    m.IID = Convert.ToInt32(dr["IID"]);
                    m.Status = Convert.ToInt32(dr["Status"]);
                    m.Minutes = Convert.ToDecimal(dr["Minutes"]);
                    m.Score = Convert.ToInt32(dr["Score"]);
                    if (dr["RegDate"] != DBNull.Value)
                        m.RegDate = Convert.ToDateTime(dr["RegDate"]);
                    l.Add(m);
                }

                dr.Close();
            }
            catch (Exception ex)
            {
                log.Fatal("{0},{1}", ex.Message, ex.Source);
            }
            return l;
        }
        public static List<M1> M1(int PageSize, int CurrentPage, out int Count)
        {
            var l = new List<M1>();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@PageSize",PageSize),
                    new SqlParameter("@CurrentPage",CurrentPage)
                };
                SqlDataReader dr = SqlHelper.ExecuteReader(SqlHelper.Local, CommandType.StoredProcedure, "M_Get_MemberList", param);
                while (dr.Read())
                {
                    var m = new M1();
                    m.ID = Convert.ToInt32(dr["ID"]);
                    m.MID = Convert.ToInt32(dr["MID"]);
                    m.Name = Convert.ToString(dr["Name"]);
                    m.Year = Convert.ToInt32(dr["Year"]);
                    m.IDCard = Convert.ToString(dr["IDCard"]);
                    m.IDSN = Convert.ToString(dr["IDSN"]);
                    m.Level = Convert.ToInt32(dr["Level"]);
                    m.Type = Convert.ToInt32(dr["Type"]);
                    m.Phone = Convert.ToString(dr["Phone"]);
                    m.IID = Convert.ToInt32(dr["IID"]);
                    m.Status = Convert.ToInt32(dr["Status"]);
                    m.Minutes = Convert.ToDecimal(dr["Minutes"]);
                    m.Score = Convert.ToInt32(dr["Score"]);
                    if (dr["RegDate"] != DBNull.Value)
                        m.RegDate = Convert.ToDateTime(dr["RegDate"]);
                    if (dr["CommitDate"] != DBNull.Value)
                        m.CommitDate = Convert.ToDateTime(dr["CommitDate"]);
                    l.Add(m);
                }
                dr.Close();
                //取总记录
                var oCount = SqlHelper.ExecuteScalar(SqlHelper.Local, CommandType.StoredProcedure, "M_Get_MemberListCount");

                Count = Convert.ToInt32(oCount);


            }
            catch (Exception ex)
            {
                log.Fatal("{0},{1}", ex.Message, ex.Source);
                Count = 0;
            }
            return l;
        }
        public static List<M1> M1(int PageSize, int CurrentPage, string Filter, out int Count)
        {
            var l = new List<M1>();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@PageSize",PageSize),
                    new SqlParameter("@CurrentPage",CurrentPage),
                    new SqlParameter("@Filter",Filter)
                };
                SqlDataReader dr = SqlHelper.ExecuteReader(SqlHelper.Local, CommandType.StoredProcedure, "M_Get_MemberList", param);
                while (dr.Read())
                {
                    var m = new M1();
                    m.ID = Convert.ToInt32(dr["ID"]);
                    m.MID = Convert.ToInt32(dr["MID"]);
                    m.PID = Convert.ToInt32(dr["PID"]);
                    m.Name = Convert.ToString(dr["Name"]);
                    m.Year = Convert.ToInt32(dr["Year"]);
                    m.IDCard = Convert.ToString(dr["IDCard"]);
                    m.IDSN = Convert.ToString(dr["IDSN"]);
                    m.Level = Convert.ToInt32(dr["Level"]);
                    m.Type = Convert.ToInt32(dr["Type"]);
                    m.Phone = Convert.ToString(dr["Phone"]);
                    m.IID = Convert.ToInt32(dr["IID"]);
                    m.Status = Convert.ToInt32(dr["Status"]);
                    m.Minutes = Convert.ToDecimal(dr["Minutes"]);
                    m.Score = Convert.ToInt32(dr["Score"]);
                    if (dr["RegDate"] != DBNull.Value)
                        m.RegDate = Convert.ToDateTime(dr["RegDate"]);
                    if (dr["CommitDate"] != DBNull.Value)
                        m.CommitDate = Convert.ToDateTime(dr["CommitDate"]);
                    if (dr["RegionCode"] != DBNull.Value)
                        m.RegionCode = Convert.ToInt32(dr["RegionCode"]);

                    l.Add(m);
                }
                dr.Close();
                //取总记录
                SqlParameter[] param2 =
                {
                    new SqlParameter("@Filter",Filter)
                };
                var oCount = SqlHelper.ExecuteScalar(SqlHelper.Local, CommandType.StoredProcedure, "M_Get_MemberListCount", param2);

                Count = Convert.ToInt32(oCount);


            }
            catch (Exception ex)
            {
                log.Fatal("{0},{1}", ex.Message, ex.Source);
                Count = 0;
            }
            return l;
        }
        public static List<M2> M2(int PageSize, int CurrentPage, out int Count)
        {
            var l = new List<M2>();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@PageSize",PageSize),
                    new SqlParameter("@CurrentPage",CurrentPage)
                };
                var dr = SqlHelper.ExecuteReader(SqlHelper.Local, CommandType.StoredProcedure, "M_Get_InvoiceList", param);
                while (dr.Read())
                {
                    var m = new M2();
                    if (DBNull.Value != dr["ID"])
                        m.ID = Convert.ToInt32(dr["ID"]);
                    if (DBNull.Value != dr["IID"])
                        m.IID = Convert.ToInt32(dr["IID"]);
                    if (DBNull.Value != dr["IDSN"])
                        m.IDSN = Convert.ToString(dr["IDSN"]);
                    if (DBNull.Value != dr["Name"])
                        m.Name = Convert.ToString(dr["Name"]);
                    if (DBNull.Value != dr["NameContact"])
                        m.NameContact = Convert.ToString(dr["NameContact"]);
                    if (DBNull.Value != dr["Amount"])
                        m.Amount = Convert.ToString(dr["Amount"]);
                    if (DBNull.Value != dr["Title"])
                        m.Title = Convert.ToString(dr["Title"]);
                    if (DBNull.Value != dr["Tel"])
                        m.Tel = Convert.ToString(dr["Tel"]);
                    if (DBNull.Value != dr["Province"])
                        m.Province = Convert.ToString(dr["Province"]);
                    if (DBNull.Value != dr["City"])
                        m.City = Convert.ToString(dr["City"]);
                    if (DBNull.Value != dr["Address"])
                        m.Address = Convert.ToString(dr["Address"]); ;
                    if (DBNull.Value != dr["Zip"])
                        m.Zip = Convert.ToString(dr["Zip"]);
                    m.MID = Convert.ToInt32(dr["MID"]);
                    m.Year = Convert.ToInt32(dr["Year"]);
                    m.IDCARD = Convert.ToString(dr["IDCARD"]);
                    m.Type = Convert.ToInt32(dr["Type"]);
                    if (DBNull.Value != dr["CreateDate"])
                        m.CreateDate = Convert.ToString(dr["CreateDate"]);
                    l.Add(m);
                }

                dr.Close();
                //取总记录
                var oCount = SqlHelper.ExecuteScalar(SqlHelper.Local, CommandType.StoredProcedure, "M_Get_InvoiceListCount");

                Count = Convert.ToInt32(oCount);
            }
            catch (Exception ex)
            {
                log.Fatal("{0},{1}", ex.Message, ex.Source);
                Count = 0;
            }
            return l;
        }
        public static List<M2> M2(int PageSize, int CurrentPage, string Filter, out int Count)
        {
            var l = new List<M2>();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@PageSize",PageSize),
                    new SqlParameter("@CurrentPage",CurrentPage),
                    new SqlParameter("@Filter",Filter)
                };
                var dr = SqlHelper.ExecuteReader(SqlHelper.Local, CommandType.StoredProcedure, "M_Get_InvoiceList", param);
                while (dr.Read())
                {
                    var m = new M2();
                    if (DBNull.Value != dr["ID"])
                        m.ID = Convert.ToInt32(dr["ID"]);
                    if (DBNull.Value != dr["IID"])
                        m.IID = Convert.ToInt32(dr["IID"]);
                    if (DBNull.Value != dr["IDSN"])
                        m.IDSN = Convert.ToString(dr["IDSN"]);
                    if (DBNull.Value != dr["Name"])
                        m.Name = Convert.ToString(dr["Name"]);
                    if (DBNull.Value != dr["NameContact"])
                        m.NameContact = Convert.ToString(dr["NameContact"]);
                    if (DBNull.Value != dr["Amount"])
                        m.Amount = Convert.ToString(dr["Amount"]);
                    if (DBNull.Value != dr["Title"])
                        m.Title = Convert.ToString(dr["Title"]);
                    if (DBNull.Value != dr["Tel"])
                        m.Tel = Convert.ToString(dr["Tel"]);
                    if (DBNull.Value != dr["Province"])
                        m.Province = Convert.ToString(dr["Province"]);
                    if (DBNull.Value != dr["City"])
                        m.City = Convert.ToString(dr["City"]);
                    if (DBNull.Value != dr["Address"])
                        m.Address = Convert.ToString(dr["Address"]); ;
                    if (DBNull.Value != dr["Zip"])
                        m.Zip = Convert.ToString(dr["Zip"]);
                    m.MID = Convert.ToInt32(dr["MID"]);
                    m.Year = Convert.ToInt32(dr["Year"]);
                    m.IDCARD = Convert.ToString(dr["IDCARD"]);
                    m.Type = Convert.ToInt32(dr["Type"]);
                    if (DBNull.Value != dr["CreateDate"])
                        m.CreateDate = Convert.ToString(dr["CreateDate"]);
                    l.Add(m);
                }

                dr.Close();
                //取总记录
                SqlParameter[] param2 =
                {
                    new SqlParameter("@Filter",Filter)
                };
                var oCount = SqlHelper.ExecuteScalar(SqlHelper.Local, CommandType.StoredProcedure, "M_Get_InvoiceListCount", param2);

                Count = Convert.ToInt32(oCount);
            }
            catch (Exception ex)
            {
                log.Fatal("{0},{1}", ex.Message, ex.Source);
                Count = 0;
            }
            return l;
        }
        public static List<Incomes> Incomes(int PageSize, int CurrentPage, string Filter, out int Count)
        {
            var l = new List<Incomes>();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@PageSize",PageSize),
                    new SqlParameter("@CurrentPage",CurrentPage),
                    new SqlParameter("@Filter",Filter)
                };
                var dr = SqlHelper.ExecuteReader(SqlHelper.Local, CommandType.StoredProcedure, "M_Get_IncomesList", param);
                while (dr.Read())
                {
                    var m = new Incomes();
                    m.Date = Convert.ToInt32(dr["Date"]);
                    m.Amount = Convert.ToDecimal(dr["Amount"]);
                    m.Count = Convert.ToInt32(dr["Count"]);
                    m.Avg = Convert.ToDecimal(dr["Avg"]);
                    l.Add(m);
                }

                dr.Close();
                //取总记录
                SqlParameter[] param2 =
                {
                    new SqlParameter("@Filter",Filter)
                };
                var oCount = SqlHelper.ExecuteScalar(SqlHelper.Local, CommandType.StoredProcedure, "M_Get_IncomesListCount", param2);

                Count = Convert.ToInt32(oCount);
            }
            catch (Exception ex)
            {
                log.Fatal("{0},{1}", ex.Message, ex.Source);
                Count = 0;
            }
            return l;
        }
        public static Results Incomes(string Filter)
        {
            var r = new Results();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@Filter",Filter),
                };

                var _r = SqlHelper.ExecuteScalar(SqlHelper.Local, CommandType.StoredProcedure, "M_Get_IncomesSum", param);
                r.Code = 0;
                r.Message = "Success";
                r.DecimalValue = Convert.ToDecimal(_r);
            }
            catch (Exception ex)
            {
                r.Code = 300;
                r.Message = ex.Message;
                r.Value = 0;
                log.Fatal("{0},{1}", ex.Message, ex.StackTrace);

            }
            return r;
        }
        public static List<Model.M.Survey> Survey(int PageSize, int CurrentPage, string Filter, out int Count)
        {
            var l = new List<Model.M.Survey>();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@PageSize",PageSize),
                    new SqlParameter("@CurrentPage",CurrentPage),
                    new SqlParameter("@Filter",Filter)
                };
                var dr = SqlHelper.ExecuteReader(SqlHelper.Local, CommandType.StoredProcedure, "M_Get_SurveyList", param);
                while (dr.Read())
                {
                    var m = new Model.M.Survey();
                    if (DBNull.Value != dr["Id"])
                        m.Id = Convert.ToInt32(dr["Id"]);
                    if (DBNull.Value != dr["Cate"])
                        m.Cate = Convert.ToInt32(dr["Cate"]);
                    if (DBNull.Value != dr["IDSN"])
                        m.IDSN = Convert.ToString(dr["IDSN"]);
                    if (DBNull.Value != dr["IDCard"])
                        m.IDCard = Convert.ToString(dr["IDCard"]);
                    if (DBNull.Value != dr["IDCert"])
                        m.IDCert = Convert.ToString(dr["IDCert"]);
                    if (DBNull.Value != dr["Name"])
                        m.Name = Convert.ToString(dr["Name"]);
                    if (DBNull.Value != dr["Phone"])
                        m.Phone = Convert.ToString(dr["Phone"]);
                    if (DBNull.Value != dr["IP"])
                        m.Comment = Convert.ToString(dr["Comment"]);
                    if (DBNull.Value != dr["IP"])
                        m.IP = Convert.ToString(dr["IP"]);
                    if (DBNull.Value != dr["CreateDate"])
                        m.CreateDate = Convert.ToDateTime(dr["CreateDate"]);
                    l.Add(m);
                }

                dr.Close();
                //取总记录
                SqlParameter[] param2 =
                {
                    new SqlParameter("@Filter",Filter)
                };
                var oCount = SqlHelper.ExecuteScalar(SqlHelper.Local, CommandType.StoredProcedure, "M_Get_SurveyListCount", param2);

                Count = Convert.ToInt32(oCount);
            }
            catch (Exception ex)
            {
                log.Fatal("{0},{1}", ex.Message, ex.Source);
                Count = 0;
            }
            return l;
        }
        public static List<Model.M.AdminMenu> AdminMenu(int AID)
        {
            var l = new List<Model.M.AdminMenu>();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@AID",AID) 
                };
                var dr = SqlHelper.ExecuteReader(SqlHelper.Local, CommandType.StoredProcedure, "M_Get_AdminMenu", param);
                while (dr.Read())
                {
                    var m = new Model.M.AdminMenu();
                    m.Id = Convert.ToInt32(dr["Id"]);
                    m.Tag = Convert.ToInt32(dr["Tag"]);
                    m.Item = Convert.ToString(dr["Item"]);
                    m.Url = Convert.ToString(dr["Url"]);
                    l.Add(m);
                }

                dr.Close();
            }
            catch (Exception ex)
            {
                log.Fatal("{0},{1}", ex.Message, ex.Source);
            }
            return l;
        }
        public static Admin Admin(int AID)
        {
            var r = new Admin();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@AID",AID),
                };

                var dr = SqlHelper.ExecuteReader(SqlHelper.Local, CommandType.StoredProcedure, "M_Get_Admin", param);
                if (dr.Read())
                {
                    r.AID = Convert.ToInt32(dr["AID"]);
                    r.Login = Convert.ToString(dr["Login"]);
                    r.Password = Convert.ToString(dr["Password"]);
                    r.Level = Convert.ToInt32(dr["Level"]);
                    r.Tag = Convert.ToString(dr["Tag"]);
                    if (dr["UpdateDate"] != DBNull.Value)
                    {
                        r.UpdateDate = Convert.ToDateTime(dr["UpdateDate"]);
                    }
                }

                dr.Close();

            }
            catch (Exception ex)
            {

                log.Fatal("{0},{1}", ex.Message, ex.StackTrace);

            }
            return r;
        }
    }
}
