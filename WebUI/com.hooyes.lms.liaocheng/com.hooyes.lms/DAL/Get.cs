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
        new public static Member Member(int MID)
        {
            var m = new Member();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID)
                    
                };
                var dr = SqlHelper.ExecuteReader(C.conn, CommandType.StoredProcedure, "Get_Member", param);
                if (dr.Read())
                {
                    m.Code = 0;
                    m.MID = MID;
                    m.Name = Convert.ToString(dr["Name"]);
                    m.Login = Convert.ToString(dr["Login"]);
                    m.Password = Convert.ToString(dr["Password"]);
                    m.Year = Convert.ToInt32(dr["Year"]);
                    m.IDCard = Convert.ToString(dr["IDCard"]);
                    m.IDSN = Convert.ToString(dr["IDSN"]);
                    if (dr["IDCert"] != DBNull.Value)
                        m.IDCert = Convert.ToString(dr["IDCert"]);
                    m.Level = Convert.ToInt32(dr["Level"]);
                    m.Type = Convert.ToInt32(dr["Type"]);
                    m.Phone = Convert.ToString(dr["Phone"]);
                    if (dr["RegionCode"] != DBNull.Value)
                        m.RegionCode = Convert.ToInt32(dr["RegionCode"]);
                    if (dr["RegDate"] != DBNull.Value)
                        m.RegDate = Convert.ToDateTime(dr["RegDate"]);
                    if (dr["Photo"] != DBNull.Value)
                        m.Photo = Convert.ToString(dr["Photo"]);
                    if (dr["Company"] != DBNull.Value)
                        m.Company = Convert.ToString(dr["Company"]);
                    if (dr["Job"] != DBNull.Value)
                        m.Job = Convert.ToString(dr["Job"]);
                    if (dr["Address"] != DBNull.Value)
                        m.Address = Convert.ToString(dr["Address"]);
                    if (dr["Zip"] != DBNull.Value)
                        m.Zip = Convert.ToString(dr["Zip"]);
                    if (dr["Phone"] != DBNull.Value)
                        m.Phone = Convert.ToString(dr["Phone"]);
                    if (dr["Email"] != DBNull.Value)
                        m.Email = Convert.ToString(dr["Email"]);
                    if (dr["Gender"] != DBNull.Value)
                        m.Gender = Convert.ToString(dr["Gender"]);
                    if (dr["City"] != DBNull.Value)
                        m.City = Convert.ToString(dr["City"]);
                    if (dr["Birthday"] != DBNull.Value)
                        m.Birthday = Convert.ToDateTime(dr["Birthday"]);
                    if (dr["Race"] != DBNull.Value)
                        m.Race = Convert.ToString(dr["Race"]);
                    if (dr["Education"] != DBNull.Value)
                        m.Education = Convert.ToString(dr["Education"]);
                    if (dr["Degree"] != DBNull.Value)
                        m.Degree = Convert.ToString(dr["Degree"]);
                    if (dr["Major"] != DBNull.Value)
                        m.Major = Convert.ToString(dr["Major"]);
                }
                else
                {
                    m.Code = 101;
                    m.Message = "no records";
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                m.Code = 300;
                log.Fatal(ex.Message);
                log.FatalException(ex.Message, ex);
            }
            return m;
        }
        new public static List<MyCourses> MyCourses(int MID, int Year, int Type)
        {
            var l = new List<MyCourses>();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID),
                    new SqlParameter("@Year",Year),
                    new SqlParameter("@Type",Type)
                    
                };
                var dr = SqlHelper.ExecuteReader(C.conn, CommandType.StoredProcedure, "Get_MyCoursesList", param);
                while (dr.Read())
                {
                    var m = new MyCourses();
                    m.CID = Convert.ToInt32(dr["CID"]);
                    m.Name = Convert.ToString(dr["Name"]);
                    if (dr["CName"] != DBNull.Value)
                        m.CName = Convert.ToString(dr["CName"]);
                    m.Second = Convert.ToInt32(dr["Second"]);
                    m.Minutes = Convert.ToInt32(dr["Minutes"]);
                    m.Status = Convert.ToInt32(dr["Status"]);
                    if (DBNull.Value != dr["Cate"])
                        m.Cate = Convert.ToInt32(dr["Cate"]);
                    if (DBNull.Value != dr["Sort"])
                        m.Sort = Convert.ToInt32(dr["Sort"]);
                    if (DBNull.Value != dr["Teacher"])
                        m.Teacher = Convert.ToString(dr["Teacher"]);
                    if (DBNull.Value != dr["Length"])
                        m.Length = Convert.ToDecimal(dr["Length"]);
                    if (DBNull.Value != dr["Memo"])
                        m.Memo = Convert.ToString(dr["Memo"]);
                    if (DBNull.Value != dr["Tag"])
                        m.Tag = Convert.ToString(dr["Tag"]);
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
                var dr = SqlHelper.ExecuteReader(C.conn, CommandType.StoredProcedure, "Get_MyPaper", param);
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
        public static List<Question> MyPaperResult(int MID)
        {
            var l = new List<Question>();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID)
                    //new SqlParameter("@Year",Year),
                    //new SqlParameter("@Type",Type)
                    
                };
                string SQL = @"
                    SELECT  q.*,my_Answer=myq.Answer,my_status=myq.Status
                    FROM    dbo.My_Question myq
                            INNER JOIN dbo.Question q ON myq.QID = q.QID
                    WHERE   myq.MID = @MID
                    ORDER BY myq.ID ASC
              ";
                var dr = SqlHelper.ExecuteReader(C.conn, CommandType.Text, SQL, param);
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
        new public static MyCourses Courses(int MID, int CID)
        {
            var m = new MyCourses();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID),
                    new SqlParameter("@CID",CID)
                    
                };
                var dr = SqlHelper.ExecuteReader(C.conn, CommandType.StoredProcedure, "Get_MyCourses", param);
                if (dr.Read())
                {
                    m.CID = CID;
                    m.MID = MID;
                    m.Name = Convert.ToString(dr["Name"]);
                    m.Year = Convert.ToInt32(dr["Year"]);
                    if (DBNull.Value != dr["Minutes"])
                        m.Minutes = Convert.ToInt32(dr["Minutes"]);
                    if (DBNull.Value != dr["Second"])
                        m.Second = Convert.ToDecimal(dr["Second"]);
                    m.Validate = Convert.ToInt32(dr["Validate"]);
                    m.Length = Convert.ToDecimal(dr["Length"]);
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                log.Fatal("{0},{1}", ex.Message, ex.StackTrace);
            }
            return m;
        }
        new public static Certificate Certificate(int MID)
        {
            var m = new Certificate();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID)
                    
                };
                var dr = SqlHelper.ExecuteReader(C.conn, CommandType.StoredProcedure, "Get_Certificate", param);
                if (dr.Read())
                {
                    m.ID = Convert.ToInt32(dr["ID"]);
                    m.MID = Convert.ToInt32(dr["MID"]);

                    if (DBNull.Value != dr["CreateDate"])
                        m.CreateDate = Convert.ToDateTime(dr["CreateDate"]);
                    if (DBNull.Value != dr["BeginDate"])
                        m.BeginDate = Convert.ToDateTime(dr["BeginDate"]);
                    if (DBNull.Value != dr["EndDate"])
                        m.EndDate = Convert.ToDateTime(dr["EndDate"]);
                    if (DBNull.Value != dr["CertID"])
                        m.CertID = Convert.ToString(dr["CertID"]);
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
                    if (DBNull.Value != dr["Sort"])
                        m.Sort = Convert.ToInt32(dr["Sort"]);

                    l.Add(m);
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                log.Fatal("{0},{1}", ex.Message, ex.StackTrace);
            }
            return l;
        }
    }
}
