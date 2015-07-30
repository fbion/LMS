using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using com.hooyes.lms.Model;


namespace com.hooyes.lms.DAL
{
    public class Get : BaseGet
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        new public static List<Question> MyPaper(int MID, int Year, int Type)
        {
            var l = new List<Question>();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID),
                    new SqlParameter("@Year",Year),
                    new SqlParameter("@Type",Type)
                    
                };
                var dr = SqlHelper.ExecuteReader(SqlHelper.Local, CommandType.StoredProcedure, "Get_MyPaper", param);
                while (dr.Read())
                {
                    var m = new Question();
                    m.QID = Convert.ToInt32(dr["QID"]);
                    //m.CID = Convert.ToInt32(dr["CID"]);
                    m.Subject = Convert.ToString(dr["Subject"]);
                    m.Answer = Convert.ToString(dr["Answer"]);
                    m.Score = Convert.ToInt32(dr["Score"]);
                    m.Cate = Convert.ToInt32(dr["Cate"]);
                    if (DBNull.Value != dr["A"])
                        m.A = Convert.ToString(dr["A"]);
                    if (DBNull.Value != dr["B"])
                        m.B = Convert.ToString(dr["B"]);
                    if (DBNull.Value != dr["C"])
                        m.C = Convert.ToString(dr["C"]);
                    if (DBNull.Value != dr["D"])
                        m.D = Convert.ToString(dr["D"]);
                    l.Add(m);
                }
                dr.Close();
            }
            catch (Exception ex)
            {

                log.Fatal(ex.Message);
                log.FatalException(ex.Message, ex);
            }
            return l;
        }
        new public static Report Report(int MID, int Year)
        {
            var m = new Report();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID),
                    new SqlParameter("@Year",Year)
                    
                };
                string SQL = "SELECT * FROM dbo.Report WHERE MID=@MID AND [Year]=@Year";
                var dr = SqlHelper.ExecuteReader(SqlHelper.Local, CommandType.Text, SQL, param);
                if (dr.Read())
                {
                    m.ID = Convert.ToInt32(dr["ID"]);
                    m.MID = Convert.ToInt32(dr["MID"]);
                    m.Year = Convert.ToInt32(dr["Year"]);
                    if (DBNull.Value != dr["Minutes"])
                        m.Minutes = Convert.ToDecimal(dr["Minutes"]);
                    if (DBNull.Value != dr["Score"])
                        m.Score = Convert.ToInt32(dr["Score"]);
                    if (DBNull.Value != dr["Compulsory"])
                        m.Compulsory = Convert.ToDecimal(dr["Compulsory"]);
                    if (DBNull.Value != dr["Elective"])
                        m.Elective = Convert.ToDecimal(dr["Elective"]);
                    if (DBNull.Value != dr["Status"])
                        m.Status = Convert.ToInt32(dr["Status"]);
                    if (DBNull.Value != dr["Memo"])
                        m.Memo = Convert.ToString(dr["Memo"]);
                    if (DBNull.Value != dr["CreateDate"])
                        m.CreateDate = Convert.ToDateTime(dr["CreateDate"]);
                    if (DBNull.Value != dr["UpdateDate"])
                        m.UpdateDate = Convert.ToDateTime(dr["UpdateDate"]);
                    if (DBNull.Value != dr["CommitDate"])
                        m.CommitDate = Convert.ToDateTime(dr["CommitDate"]);
                    if (DBNull.Value != dr["Flag"])
                        m.Flag = Convert.ToInt32(dr["Flag"]);
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                log.Fatal(ex.Message);
                log.Fatal(ex.StackTrace);
            }
            return m;
        }
        new public static List<Products> Products(int MID)
        {
            var l = new List<Products>();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID)
                    
                };
                var dr = SqlHelper.ExecuteReader(SqlHelper.Local, CommandType.StoredProcedure, "Get_Products", param);
                while (dr.Read())
                {
                    var m = new Products();
                    m.ID = Convert.ToInt32(dr["ID"]);
                    m.PID = Convert.ToInt32(dr["PID"]);
                    m.Price = Convert.ToDecimal(dr["Price"]);
                    m.Name = Convert.ToString(dr["Name"]);
                    m.Memo = Convert.ToString(dr["Memo"]);
                    m.Cate = Convert.ToInt32(dr["Cate"]);
                    if (dr["Duration"] != DBNull.Value)
                        m.Duration = Convert.ToInt32(dr["Duration"]);
                    m.MyID = Convert.ToInt32(dr["MyID"]);
                    l.Add(m);
                }
                dr.Close();
            }
            catch (Exception ex)
            {

                log.Fatal(ex.Message);
                log.FatalException(ex.Message, ex);
            }
            return l;
        }
        public static List<Products> Products(string IDs)
        {
            var l = new List<Products>();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@IDs",IDs)
                    
                };
                var dr = SqlHelper.ExecuteReader(SqlHelper.Local, CommandType.StoredProcedure, "Get_ProductsByIDs", param);
                while (dr.Read())
                {
                    var m = new Products();
                    m.ID = Convert.ToInt32(dr["ID"]);
                    m.PID = Convert.ToInt32(dr["PID"]);
                    m.Price = Convert.ToDecimal(dr["Price"]);
                    m.Name = Convert.ToString(dr["Name"]);
                    m.Memo = Convert.ToString(dr["Memo"]);
                    if (dr["Duration"] != DBNull.Value)
                        m.Duration = Convert.ToInt32(dr["Duration"]);
                    l.Add(m);
                }
                dr.Close();
            }
            catch (Exception ex)
            {

                log.Fatal(ex.Message);
                log.FatalException(ex.Message, ex);
            }
            return l;
        }
        public static List<Products> Products(int MID,string IDs)
        {
            var l = new List<Products>();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID),
                    new SqlParameter("@IDs",IDs)
                    
                };
                var dr = SqlHelper.ExecuteReader(SqlHelper.Local, CommandType.StoredProcedure, "Get_ProductsByIDs", param);
                while (dr.Read())
                {
                    var m = new Products();
                    m.ID = Convert.ToInt32(dr["ID"]);
                    m.PID = Convert.ToInt32(dr["PID"]);
                    m.Price = Convert.ToDecimal(dr["Price"]);
                    m.Name = Convert.ToString(dr["Name"]);
                    m.Memo = Convert.ToString(dr["Memo"]);
                    if (dr["Duration"] != DBNull.Value)
                        m.Duration = Convert.ToInt32(dr["Duration"]);
                    m.MyID = Convert.ToInt32(dr["MyID"]);
                    l.Add(m);
                }
                dr.Close();
            }
            catch (Exception ex)
            {

                log.Fatal(ex.Message);
                log.FatalException(ex.Message, ex);
            }
            return l;
        }
        public static List<Products> ProductsByCate(int MID, int CateID)
        {
            var l = new List<Products>();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID),
                    new SqlParameter("@CateID",CateID)
                    
                };
                var dr = SqlHelper.ExecuteReader(SqlHelper.Local, CommandType.StoredProcedure, "Get_ProductsByCate", param);
                while (dr.Read())
                {
                    var m = new Products();
                    m.ID = Convert.ToInt32(dr["ID"]);
                    m.PID = Convert.ToInt32(dr["PID"]);
                    m.Price = Convert.ToDecimal(dr["Price"]);
                    m.Name = Convert.ToString(dr["Name"]);
                    m.Cate = Convert.ToInt32(dr["Cate"]);
                    m.Memo = Convert.ToString(dr["Memo"]);
                    if (dr["Duration"] != DBNull.Value)
                        m.Duration = Convert.ToInt32(dr["Duration"]);
                    l.Add(m);
                }
                dr.Close();
            }
            catch (Exception ex)
            {

                log.Fatal(ex.Message);
                log.FatalException(ex.Message, ex);
            }
            return l;
        }
        public static GuangdongCommitParams CommitInfo(int MID, int PID)
        {
            var m = new GuangdongCommitParams();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID),
                    new SqlParameter("@PID",PID)
                };
                var dr = SqlHelper.ExecuteReader(SqlHelper.Local, CommandType.StoredProcedure, "Get_Commit_info", param);
                if (dr.Read())
                {

                    m.ID = Convert.ToInt32(dr["ID"]);
                    m.MID = Convert.ToInt32(dr["MID"]);
                    m.PID = Convert.ToInt32(dr["PID"]);
                    m.cardNumberType = Convert.ToString(dr["cardNumberType"]);
                    m.cardNumber = Convert.ToString(dr["cardNumber"]);
                    m.areaName = Convert.ToString(dr["areaName"]);
                    m.year = Convert.ToString(dr["year"]);
                    m.classCode = Convert.ToString(dr["classCode"]);
                    m.classLearnTimeCount = Convert.ToString(dr["classLearnTimeCount"]);
                    m.score = Convert.ToString(dr["score"]);
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                log.Fatal("{0},{1}", ex.StackTrace);
            }
            return m;
        }
        public static List<MyProductsFull> MyProductsFull(int MID)
        {
            var l = new List<MyProductsFull>();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID)
                    
                };
                var dr = SqlHelper.ExecuteReader(SqlHelper.Local, CommandType.StoredProcedure, "Get_MyProductsFull", param);
                while (dr.Read())
                {
                    var m = new MyProductsFull();
                   //From MyProducts
                    m.PID = Convert.ToInt32(dr["PID"]);
                    m.MID = Convert.ToInt32(dr["MID"]);
                    if (dr["CreateDate"] != DBNull.Value)
                        m.CreateDate = Convert.ToDateTime(dr["CreateDate"]);
                    if (dr["ExpireDate"] != DBNull.Value)
                        m.ExpireDate = Convert.ToDateTime(dr["ExpireDate"]);
                    if (dr["Memo"] != DBNull.Value)
                        m.Memo = Convert.ToString(dr["Memo"]);
                    m.MyID = Convert.ToInt32(dr["MyID"]);
                    //From Products 
                    m.ID = Convert.ToInt32(dr["ID"]);
                    m.Price = Convert.ToDecimal(dr["Price"]);
                    m.Name = Convert.ToString(dr["Name"]);
                    m.Memo = Convert.ToString(dr["Memo"]);
                    

                    l.Add(m);
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                log.Fatal("{0},{1}",ex.Message,ex.StackTrace);
            }
            return l;
        }

    }
}
