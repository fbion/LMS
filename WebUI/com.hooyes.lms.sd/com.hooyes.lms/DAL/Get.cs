using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using com.hooyes.lms.Model;


namespace com.hooyes.lms.DAL
{
    public class Get
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        public static Member Member(int MID)
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
                    m.Level = Convert.ToInt32(dr["Level"]);
                    m.Type = Convert.ToInt32(dr["Type"]);
                    m.Phone = Convert.ToString(dr["Phone"]);
                    if (dr["RegionCode"] != DBNull.Value)
                        m.RegionCode = Convert.ToInt32(dr["RegionCode"]);
                    if (dr["RegionName"] != DBNull.Value)
                        m.RegionName = Convert.ToString(dr["RegionName"]);
                    if (dr["RegDate"] != DBNull.Value)
                        m.RegDate = Convert.ToDateTime(dr["RegDate"]);
                    if (dr["IDCert"] != DBNull.Value)
                        m.IDCert = Convert.ToString(dr["IDCert"]);
                    if (dr["Company"] != DBNull.Value)
                        m.Company = Convert.ToString(dr["Company"]);
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
        public static List<Contents> Contents(int CID)
        {
            var l = new List<Contents>();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@CID",CID)
                    
                };
                var dr = SqlHelper.ExecuteReader(C.conn, CommandType.StoredProcedure, "Get_Contents", param);
                while (dr.Read())
                {
                    var m = new Contents();
                    m.CID = Convert.ToInt32(dr["CID"]);
                    m.CCID = Convert.ToInt32(dr["CCID"]);
                    m.Name = Convert.ToString(dr["Name"]);
                    m.Duration = Convert.ToInt32(dr["Duration"]);
                    m.Url = Convert.ToString(dr["Url"]);
                    if (dr["MIME"] != DBNull.Value)
                    {
                        m.MIME = Convert.ToString(dr["MIME"]);
                    }
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
        public static List<MyCourses> MyCourses(int MID,int Year,int Type)
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

                    //m.CName = "";
                    //m.Memo = "";
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
        public static List<Question> MyPaper(int MID, int Year, int Type)
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
                    m.CID = Convert.ToInt32(dr["CID"]);
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
        public static List<MyConents> Contents(int MID, int CID)
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
        public static List<Courses> CoursesList(int Year,int Type)
        {
            var l = new List<Courses>();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@Year",Year),
                    new SqlParameter("@Type",Type)
                    
                };
                var dr = SqlHelper.ExecuteReader(C.conn, CommandType.StoredProcedure, "Get_CoursesList", param);
                while (dr.Read())
                {
                    var m = new Courses();
                    m.CID = Convert.ToInt32(dr["CID"]);
                    m.Name = Convert.ToString(dr["Name"]);
                    //m.Second = Convert.ToInt32(dr["Second"]);
                    //m.Minutes = Convert.ToInt32(dr["Minutes"]);
                    //m.Status = Convert.ToInt32(dr["Status"]);
                    if (DBNull.Value != dr["Cate"])
                        m.Cate = Convert.ToInt32(dr["Cate"]);
                    if (DBNull.Value != dr["Sort"])
                        m.Sort = Convert.ToInt32(dr["Sort"]);
                    if (DBNull.Value != dr["Teacher"])
                        m.Teacher = Convert.ToString(dr["Teacher"]);
                    if (DBNull.Value != dr["Length"])
                        m.Length = Convert.ToDecimal(dr["Length"]);
                    m.Type = Convert.ToInt32(dr["Type"]);
                    l.Add(m);
                }
                dr.Close();
            }
            catch (Exception ex)
            {

                log.Fatal(ex.Message);
                log.Fatal(ex.StackTrace);
            }
            return l;
        }
        public static List<Member> Member()
        {
            var l = new List<Member>();
            try
            {
                SqlParameter[] param =
                {
                   
                    
                };
                var dr = SqlHelper.ExecuteReader(C.conn, CommandType.StoredProcedure, "Get_MemberList", param);
                while (dr.Read())
                {
                    var m = new Member();
                    m.Code = 0;
                    m.ID = Convert.ToInt32(dr["ID"]);
                    m.MID = Convert.ToInt32(dr["MID"]);
                    m.Name = Convert.ToString(dr["Name"]);
                    m.Year = Convert.ToInt32(dr["Year"]);
                    m.IDCard = Convert.ToString(dr["IDCard"]);
                    m.IDSN = Convert.ToString(dr["IDSN"]);
                    m.Level = Convert.ToInt32(dr["Level"]);
                    m.Type = Convert.ToInt32(dr["Type"]);
                    m.Phone = Convert.ToString(dr["Phone"]);
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
        public static List<Products> Products(int MID)
        {
            var l = new List<Products>();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID)
                    
                };
                var dr = SqlHelper.ExecuteReader(C.conn, CommandType.StoredProcedure, "Get_Products", param);
                while (dr.Read())
                {
                    var m = new Products();
                    m.ID = Convert.ToInt32(dr["ID"]);
                    m.PID = Convert.ToInt32(dr["PID"]);
                    m.Price = Convert.ToDecimal(dr["Price"]);
                    m.Name = Convert.ToString(dr["Name"]);
                    m.Memo = Convert.ToString(dr["Memo"]);
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
        public static List<MyProducts> MyProducts(int MID)
        {
            var l = new List<MyProducts>();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID)
                    
                };
                var dr = SqlHelper.ExecuteReader(C.conn, CommandType.StoredProcedure, "Get_MyProducts", param);
                while (dr.Read())
                {
                    var m = new MyProducts();
                    m.ID = Convert.ToInt32(dr["ID"]);
                    m.PID = Convert.ToInt32(dr["PID"]);
                    m.MID = Convert.ToInt32(dr["MID"]);
                    if (dr["CreateDate"] != DBNull.Value)
                        m.CreateDate = Convert.ToDateTime(dr["CreateDate"]);
                    if (dr["Memo"] != DBNull.Value)
                        m.Memo = Convert.ToString(dr["Memo"]);
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
        public static List<Report> MyReport(int MID)
        {
            var lt = new List<Report>();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID)
                };
                var dr = SqlHelper.ExecuteReader(C.conn, CommandType.StoredProcedure, "Get_MyReport", param);
                while (dr.Read())
                {
                    var m = new Report();
                    m.ID = Convert.ToInt32(dr["ID"]);
                    m.MID = Convert.ToInt32(dr["MID"]);
                    m.Year = Convert.ToInt32(dr["Year"]);
                    if (DBNull.Value != dr["Minutes"])
                        m.Minutes = Convert.ToDecimal(dr["Minutes"]);
                    if (DBNull.Value != dr["Score"])
                        m.Score = Convert.ToInt32(dr["Score"]);
                    m.Compulsory = Convert.ToDecimal(dr["Compulsory"]);
                    m.Elective = Convert.ToDecimal(dr["Elective"]);
                    m.Status = Convert.ToInt32(dr["Status"]);
                    m.Memo = Convert.ToString(dr["Memo"]);
                    if (DBNull.Value != dr["CreateDate"])
                        m.CreateDate = Convert.ToDateTime(dr["CreateDate"]);
                    if (DBNull.Value != dr["UpdateDate"])
                        m.UpdateDate = Convert.ToDateTime(dr["UpdateDate"]);
                    if (DBNull.Value != dr["CommitDate"])
                        m.CommitDate = Convert.ToDateTime(dr["CommitDate"]);
                    lt.Add(m);
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                log.Fatal(ex.Message);
                log.Fatal(ex.StackTrace);
            }
            return lt;
        }
        public static Courses Courses(int CID)
        {
            var m = new Courses();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@CID",CID)
                    
                };
                var dr = SqlHelper.ExecuteReader(C.conn, CommandType.StoredProcedure, "Get_Courses", param);
                if (dr.Read())
                {
                    m.CID = CID;
                    m.CName = Convert.ToString(dr["CName"]);
                    m.Name = Convert.ToString(dr["Name"]);
                    m.Type = Convert.ToInt32(dr["Type"]);
                    m.Year = Convert.ToInt32(dr["Year"]);
                    m.Cate = Convert.ToInt32(dr["Cate"]);
                    m.Sort = Convert.ToInt32(dr["Sort"]);
                    m.Teacher = Convert.ToString(dr["Teacher"]);
                    m.ActMinutes = Convert.ToDecimal(dr["ActMinutes"]);
                    m.Length = Convert.ToDecimal(dr["Length"]);
                    m.Memo = Convert.ToString(dr["Memo"]);

                }
                dr.Close();
            }
            catch (Exception ex)
            {
                log.Fatal("{0},{1}", ex.Message, ex.StackTrace);
            }
            return m;
        }
        public static Courses Courses(int CID,int MID,int Year,int Type)
        {
            var m = new Courses();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@CID",CID),
                    new SqlParameter("@MID",CID),
                    new SqlParameter("@Year",CID),
                    new SqlParameter("@Type",CID)
                    
                };
                var dr = SqlHelper.ExecuteReader(C.conn, CommandType.StoredProcedure, "Get_Courses", param);
                if (dr.Read())
                {
                    m.CID = CID;
                    m.CName = Convert.ToString(dr["CName"]);
                    m.Name = Convert.ToString(dr["Name"]);
                    m.Type = Convert.ToInt32(dr["Type"]);
                    m.Year = Convert.ToInt32(dr["Year"]);
                    m.Cate = Convert.ToInt32(dr["CateX"]);
                    m.Sort = Convert.ToInt32(dr["Sort"]);
                    m.Teacher = Convert.ToString(dr["Teacher"]);
                    m.Length = Convert.ToDecimal(dr["Length"]);
                    m.Memo = Convert.ToString(dr["Memo"]);

                }
                dr.Close();
            }
            catch (Exception ex)
            {
                log.Fatal("{0},{1}", ex.Message, ex.StackTrace);
            }
            return m;
        }
        public static MyCourses Courses(int MID, int CID)
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
        public static Report Report(int MID)
        {
            var m = new Report();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID)
                    
                };
                var dr = SqlHelper.ExecuteReader(C.conn, CommandType.StoredProcedure, "Get_Report", param);
                if (dr.Read())
                {
                    m.ID = Convert.ToInt32(dr["ID"]);
                    m.MID = Convert.ToInt32(dr["MID"]);
                    m.Year = Convert.ToInt32(dr["Year"]);
                    if (DBNull.Value != dr["Minutes"])
                        m.Minutes = Convert.ToDecimal(dr["Minutes"]);
                    if (DBNull.Value != dr["Score"])
                        m.Score = Convert.ToInt32(dr["Score"]);
                    m.Compulsory = Convert.ToDecimal(dr["Compulsory"]);
                    m.Elective = Convert.ToDecimal(dr["Elective"]);
                    m.Status = Convert.ToInt32(dr["Status"]);
                    m.Memo = Convert.ToString(dr["Memo"]);
                    if (DBNull.Value != dr["CreateDate"])
                        m.CreateDate = Convert.ToDateTime(dr["CreateDate"]);
                    if (DBNull.Value != dr["UpdateDate"])
                        m.UpdateDate = Convert.ToDateTime(dr["UpdateDate"]);
                    if (DBNull.Value != dr["CommitDate"])
                        m.CommitDate = Convert.ToDateTime(dr["CommitDate"]);
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
        public static Report Report(int MID,int Year)
        {
            var m = new Report();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID),
                    new SqlParameter("@Year",Year)
                    
                };
                var dr = SqlHelper.ExecuteReader(C.conn, CommandType.StoredProcedure, "Get_Report", param);
                if (dr.Read())
                {
                    m.ID = Convert.ToInt32(dr["ID"]);
                    m.MID = Convert.ToInt32(dr["MID"]);
                    m.Year = Convert.ToInt32(dr["Year"]);
                    if (DBNull.Value != dr["Minutes"])
                        m.Minutes = Convert.ToDecimal(dr["Minutes"]);
                    if (DBNull.Value != dr["Score"])
                        m.Score = Convert.ToInt32(dr["Score"]);
                    m.Compulsory = Convert.ToDecimal(dr["Compulsory"]);
                    m.Elective = Convert.ToDecimal(dr["Elective"]);
                    m.Status = Convert.ToInt32(dr["Status"]);
                    m.Memo = Convert.ToString(dr["Memo"]);
                    if (DBNull.Value != dr["CreateDate"])
                        m.CreateDate = Convert.ToDateTime(dr["CreateDate"]);
                    if (DBNull.Value != dr["UpdateDate"])
                        m.UpdateDate = Convert.ToDateTime(dr["UpdateDate"]);
                    if (DBNull.Value != dr["CommitDate"])
                        m.CommitDate = Convert.ToDateTime(dr["CommitDate"]);
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
        public static MSessions MSessions(int MID)
        {
            var m = new MSessions();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID)
                    
                };
                var dr = SqlHelper.ExecuteReader(C.conn, CommandType.StoredProcedure, "Get_MSessions", param);
                if (dr.Read())
                {
                    m.Code = 0;
                    m.MID = MID;
                    m.SessionId = Convert.ToString(dr["SessionId"]);
                    m.IP = Convert.ToString(dr["IP"]);
                    if (DBNull.Value != dr["Created"])
                        m.Created = Convert.ToDateTime(dr["Created"]);
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
        public static List<Invoice> Invoice(int MID)
        {
            var lt = new List<Invoice>();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID)
                    
                };
                var dr = SqlHelper.ExecuteReader(C.conn, CommandType.StoredProcedure, "Get_Invoice", param);
                while (dr.Read())
                {
                    var m = new Invoice();
                    m.MID = MID;
                    if (DBNull.Value != dr["IID"])
                        m.IID = Convert.ToInt32(dr["IID"]);
                    if (DBNull.Value != dr["IDSN"])
                        m.IDSN = Convert.ToString(dr["IDSN"]);
                    if (DBNull.Value != dr["Name"])
                        m.Name = Convert.ToString(dr["Name"]);
                    if (DBNull.Value != dr["Amount"])
                        m.Amount = Convert.ToDecimal(dr["Amount"]);
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
                    if (DBNull.Value != dr["CreateDate"])
                        m.CreateDate = Convert.ToDateTime(dr["CreateDate"]);

                    lt.Add(m);
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                log.Fatal(ex.Message);
                log.Fatal(ex.StackTrace);
            }
            return lt;
        }
        public static Invoice Invoice(int MID,int IID)
        {
            var m = new Invoice();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID),
                    new SqlParameter("@IID",IID)
                };
                var dr = SqlHelper.ExecuteReader(C.conn, CommandType.StoredProcedure, "Get_Invoice", param);
                if (dr.Read())
                {
                    
                    m.MID = MID;
                    if (DBNull.Value != dr["IID"])
                        m.IID = Convert.ToInt32(dr["IID"]);
                    if (DBNull.Value != dr["IDSN"])
                        m.IDSN = Convert.ToString(dr["IDSN"]);
                    if (DBNull.Value != dr["Name"])
                        m.Name = Convert.ToString(dr["Name"]);
                    if (DBNull.Value != dr["Amount"])
                        m.Amount = Convert.ToDecimal(dr["Amount"]);
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
                    if (DBNull.Value != dr["CreateDate"])
                        m.CreateDate = Convert.ToDateTime(dr["CreateDate"]);

                   
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
        public static Order Order(int MID,int ID)
        {
            var m = new Order();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID),
                    new SqlParameter("@ID",ID)
                };
                var dr = SqlHelper.ExecuteReader(C.conn, CommandType.StoredProcedure, "Get_Order", param);
                if (dr.Read())
                {
                    m.ID = ID;
                    m.OrderID = Convert.ToString(dr["OrderID"]);
                    m.MID = Convert.ToInt32(dr["MID"]);
                    m.Amount = Convert.ToDecimal(dr["Amount"]);
                    m.Cash = Convert.ToDecimal(dr["Cash"]);
                    m.Credit = Convert.ToDecimal(dr["Credit"]);
                    m.Status = Convert.ToInt32(dr["Status"]);
                    m.Tags = Convert.ToString(dr["Tags"]);
                    if (DBNull.Value != dr["CreateDate"])
                        m.CreateDate = Convert.ToDateTime(dr["CreateDate"]);
                    if (DBNull.Value != dr["UpdateDate"])
                        m.UpdateDate = Convert.ToDateTime(dr["UpdateDate"]);
                    if (DBNull.Value != dr["Memo"])
                        m.Memo = Convert.ToString(dr["Memo"]);
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
        public static List<Order> Order(int MID)
        {
            var lt = new List<Order>();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID)
                };
                var dr = SqlHelper.ExecuteReader(C.conn, CommandType.StoredProcedure, "Get_Order", param);
                while (dr.Read())
                {
                    var m = new Order();
                    m.ID = Convert.ToInt32(dr["ID"]);
                    m.OrderID = Convert.ToString(dr["OrderID"]);
                    m.MID = Convert.ToInt32(dr["MID"]);
                    m.Amount = Convert.ToDecimal(dr["Amount"]);
                    m.Cash = Convert.ToDecimal(dr["Cash"]);
                    m.Credit = Convert.ToDecimal(dr["Credit"]);
                    m.Status = Convert.ToInt32(dr["Status"]);
                    m.Tags = Convert.ToString(dr["Tags"]);
                    if (DBNull.Value != dr["CreateDate"])
                        m.CreateDate = Convert.ToDateTime(dr["CreateDate"]);
                    if (DBNull.Value != dr["UpdateDate"])
                        m.UpdateDate = Convert.ToDateTime(dr["UpdateDate"]);
                    if (DBNull.Value != dr["Memo"])
                        m.Memo = Convert.ToString(dr["Memo"]);
                    lt.Add(m);
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                log.Fatal(ex.Message);
                log.Fatal(ex.StackTrace);
            }
            return lt;
        }
        public static Balance Balance(int MID)
        {
            var m = new Balance();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID),
                    new SqlParameter("@Amount",SqlDbType.Money),
                    new SqlParameter("@Cash",SqlDbType.Money),
                    new SqlParameter("@Rebate",SqlDbType.Money)
                    
                };
                param[1].Direction = ParameterDirection.Output;
                param[2].Direction = ParameterDirection.Output;
                param[3].Direction = ParameterDirection.Output;
                var _r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Get_Balance", param);
                m.Amount = Convert.ToDecimal(param[1].Value);
                m.Cash = Convert.ToDecimal(param[2].Value);
                m.Rebate = Convert.ToDecimal(param[3].Value);
                
            }
            catch (Exception ex)
            {
                log.Fatal(ex.Message);
                log.Fatal(ex.StackTrace);
            }
            return m;
        }
        public static Cards Cards(string SN)
        {
            var m = new Cards();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@SN",SN)
                    
                };

                var dr = SqlHelper.ExecuteReader(C.conn, CommandType.StoredProcedure, "Get_Cards", param);
                if (dr.Read())
                {
                    m.ID = Convert.ToInt32(dr["ID"]);
                    m.SN = Convert.ToString(dr["SN"]);
                    m.Amount = Convert.ToDecimal(dr["Amount"]);
                    m.Status = Convert.ToInt32(dr["Status"]);
                    if (dr["CreateDate"] != DBNull.Value)
                        m.CreateDate = Convert.ToDateTime(dr["CreateDate"]);
                    if (dr["UpdateDate"] != DBNull.Value)
                        m.UpdateDate = Convert.ToDateTime(dr["UpdateDate"]);
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
        public static R CheckPhone(int MID,int Year, string Phone)
        {
            R r = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@R",0),
                    new SqlParameter("@Code",0),
                    new SqlParameter("@Message",string.Empty),
                    new SqlParameter("@MID",MID),
                    new SqlParameter("@Year",Year),
                    new SqlParameter("@Phone",Phone)
                };
                param[0].Direction = ParameterDirection.ReturnValue;
                param[1].Direction = ParameterDirection.Output;
                param[2].Direction = ParameterDirection.Output;
                int _r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Check_Phone", param);
                r.Code = Convert.ToInt32(param[1].Value);
                r.Message = Convert.ToString(param[2].Value);
                r.Value = Convert.ToInt32(param[0].Value);
            }
            catch (Exception ex)
            {
                r.Code = 300;
                r.Message = ex.Message;
                r.Value = 0;
                log.Fatal(ex.Message);
                log.FatalException(ex.Message, ex);
            }
            return r;
        }
        public static R CheckHours(int MID)
        {
            R r = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@R",0),
                    new SqlParameter("@Code",0),
                    new SqlParameter("@Message",string.Empty),
                    new SqlParameter("@MID",MID)
                    
                };
                param[0].Direction = ParameterDirection.ReturnValue;
                param[1].Direction = ParameterDirection.Output;
                param[2].Direction = ParameterDirection.Output;
                int _r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Check_Hours", param);
                r.Code = Convert.ToInt32(param[1].Value);
                r.Message = Convert.ToString(param[2].Value);
                r.Value = Convert.ToInt32(param[0].Value);
            }
            catch (Exception ex)
            {
                r.Code = 300;
                r.Message = ex.Message;
                r.Value = 0;
                log.Fatal(ex.Message);
                log.FatalException(ex.Message, ex);
            }
            return r;
        }
        public static Results AvailableInvoiceCash(int MID)
        {
            var r = new Results();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@R",0),
                    new SqlParameter("@Code",0),
                    new SqlParameter("@Message",string.Empty),
                    new SqlParameter("@MID",MID)
                    
                };
                param[0].Direction = ParameterDirection.ReturnValue;
                param[1].Direction = ParameterDirection.Output;
                param[2].Direction = ParameterDirection.Output;
                var _r = SqlHelper.ExecuteScalar(C.conn, CommandType.StoredProcedure, "Get_InoviceCash", param);
                r.Code = Convert.ToInt32(param[1].Value);
                r.Message = Convert.ToString(param[2].Value);
                r.DecimalValue = Convert.ToDecimal(_r);
            }
            catch (Exception ex)
            {
                r.Code = 300;
                r.Message = ex.Message;
                r.Value = 0;
                log.Fatal("{0},{1}",ex.Message,ex.StackTrace);
                
            }
            return r;
        }
        public static Certificate Certificate(int MID)
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

    }
}
