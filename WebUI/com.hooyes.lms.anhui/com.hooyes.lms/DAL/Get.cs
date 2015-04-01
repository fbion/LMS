using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using com.hooyes.lms.Model;


namespace com.hooyes.lms.DAL
{
    public class Get : BaseGet
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
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
        new public static List<MyConents> Contents(int MID, int CID)
        {
            var l = new List<MyConents>();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID),
                    new SqlParameter("@CID",CID)
                    
                };
                var dr = SqlHelper.ExecuteReader(C.conn, CommandType.StoredProcedure, "Get_MyContents", param);
                while (dr.Read())
                {
                    var m = new MyConents();
                    m.CID = CID;
                    m.MID = MID;
                    m.CCID = Convert.ToInt32(dr["CCID"]);
                    m.Name = Convert.ToString(dr["Name"]);
                    m.Url = Convert.ToString(dr["Url"]);
                    if (DBNull.Value != dr["Minutes"])
                        m.Minutes = Convert.ToInt32(dr["Minutes"]);
                    if (DBNull.Value != dr["Second"])
                        m.Second = Convert.ToDecimal(dr["Second"]);
                    if (DBNull.Value != dr["Status"])
                        m.Status = Convert.ToInt32(dr["Status"]);
                    if (DBNull.Value != dr["MIME"])
                        m.MIME = Convert.ToString(dr["MIME"]);

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
        public static List<ProductsEx> ProductsEx(int MID)
        {
            var l = new List<ProductsEx>();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID)
                };
                var dr = SqlHelper.ExecuteReader(SqlHelper.Local, CommandType.StoredProcedure, "Get_Products", param);
                while (dr.Read())
                {
                    var m = new ProductsEx();
                    m.ID = Convert.ToInt32(dr["ID"]);
                    m.PID = Convert.ToInt32(dr["PID"]);
                    m.Price = Convert.ToDecimal(dr["Price"]);
                    m.Name = Convert.ToString(dr["Name"]);
                    m.Memo = Convert.ToString(dr["Memo"]);
                    m.MyID = Convert.ToInt32(dr["MyID"]);
                    if (dr["Flag"] != DBNull.Value)
                        m.Flag = Convert.ToInt32(dr["Flag"]);
                    if (dr["IDSN"] != DBNull.Value)
                        m.IDSN = Convert.ToString(dr["IDSN"]);
                    if (dr["PayDate"] != DBNull.Value)
                        m.PayDate = Convert.ToDateTime(dr["PayDate"]);
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
        public static ProductsEx ProductsEx(int MID, int PID)
        {
            var m = new ProductsEx();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID),
                    new SqlParameter("@PID",PID),
                    
                };
                var dr = SqlHelper.ExecuteReader(SqlHelper.Local, CommandType.StoredProcedure, "Get_Products", param);
                if (dr.Read())
                {

                    m.ID = Convert.ToInt32(dr["ID"]);
                    m.PID = Convert.ToInt32(dr["PID"]);
                    m.Price = Convert.ToDecimal(dr["Price"]);
                    m.Name = Convert.ToString(dr["Name"]);
                    m.Memo = Convert.ToString(dr["Memo"]);
                    m.MyID = Convert.ToInt32(dr["MyID"]);
                    if (dr["Flag"] != DBNull.Value)
                        m.Flag = Convert.ToInt32(dr["Flag"]);
                    if (dr["IDSN"] != DBNull.Value)
                        m.IDSN = Convert.ToString(dr["IDSN"]);
                    if (dr["PayDate"] != DBNull.Value)
                        m.PayDate = Convert.ToDateTime(dr["PayDate"]);
                }
                dr.Close();
            }
            catch (Exception ex)
            {

                log.Fatal(ex.Message);
                log.FatalException(ex.Message, ex);
            }
            return m;
        }
        public static MemberExtMy MemberExtMy(string IDSN)
        {
            var m = new MemberExtMy();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@IDSN",IDSN)
                };
                string SQL = @"
                                SELECT  ext.*,MyID = myp.PID,PayDate=myp.CreateDate
                                FROM    dbo.MemberExt ext
                                        LEFT JOIN dbo.My_Products myp ON ext.MID = myp.MID
                                                                         AND myp.PID = ext.PID
                                WHERE   ext.IDSN = @IDSN";
                var dr = SqlHelper.ExecuteReader(SqlHelper.Local, CommandType.Text, SQL, param);
                if (dr.Read())
                {

                    m.ID = Convert.ToInt32(dr["ID"]);
                    m.MID = Convert.ToInt32(dr["MID"]);
                    m.PID = Convert.ToInt32(dr["PID"]);
                    if (dr["MyID"] != DBNull.Value)
                        m.MyID = Convert.ToInt32(dr["MyID"]);
                    if (dr["Flag"] != DBNull.Value)
                        m.Flag = Convert.ToInt32(dr["Flag"]);
                    if (dr["IDSN"] != DBNull.Value)
                        m.IDSN = Convert.ToString(dr["IDSN"]);
                    if (dr["PayDate"] != DBNull.Value)
                        m.PayDate = Convert.ToDateTime(dr["PayDate"]);
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                m.Code = 300;
                m.Message = ex.Message;
                log.Fatal("{0},{1}", ex.Message, ex.StackTrace);

            }
            return m;
        }
    }
}
