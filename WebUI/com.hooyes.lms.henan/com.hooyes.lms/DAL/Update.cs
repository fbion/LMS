using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using com.hooyes.lms.Model;

namespace com.hooyes.lms.DAL
{
    public class Update
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        public static R MyContents(MyConents myContents)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",myContents.MID),
                    new SqlParameter("@CID",myContents.CID),
                    new SqlParameter("@CCID",myContents.CCID),
                    new SqlParameter("@Second",myContents.Second),
                    new SqlParameter("@Status",myContents.Status)
                };
                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Update_MyContents", param);
                m.Code = 0;
            }
            catch (Exception ex)
            {
                m.Code = 300;
                m.Message = ex.Message;
                log.Fatal(ex.Message);
                log.FatalException(ex.Message, ex);
            }

            return m;
        }
        public static R Invoice(Invoice invoice)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@IID",invoice.IID),
                    new SqlParameter("@MID",invoice.MID),
                    new SqlParameter("@IDSN",invoice.IDSN),
                    new SqlParameter("@Name",invoice.Name),
                    new SqlParameter("@Amount",invoice.Amount),
                    new SqlParameter("@Title",invoice.Title),
                    new SqlParameter("@Tel",invoice.Tel),
                    new SqlParameter("@Province",invoice.Province),
                    new SqlParameter("@City",invoice.City),
                    new SqlParameter("@Address",invoice.Address),
                    new SqlParameter("@Zip",invoice.Zip)
                };
                param[0].Direction = ParameterDirection.InputOutput;
                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Update_Invoice", param);
                m.Code = 0;
                m.Value = Convert.ToInt32(param[0].Value);
            }
            catch (Exception ex)
            {
                m.Code = 300;
                m.Message = ex.Message;
                log.Fatal(ex.Message);
                log.FatalException(ex.Message, ex);
            }

            return m;
        }
        public static R MyQuestion(MyQuestion myQuestion)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",myQuestion.MID),
                    new SqlParameter("@QID",myQuestion.QID),
                    new SqlParameter("@Answer",myQuestion.Answer),
                    new SqlParameter("@Score",myQuestion.Score),
                    new SqlParameter("@Flag",myQuestion.Flag)
                };
                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Update_MyQuestion", param);
                m.Code = 0;
                // m.Value = Convert.ToInt32(param[0].Value);
            }
            catch (Exception ex)
            {
                m.Code = 300;
                m.Message = ex.Message;
                log.Fatal(ex.Message);
                log.FatalException(ex.Message, ex);
            }

            return m;
        }
        public static R Member(Member member)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",member.MID),
                    new SqlParameter("@Name",member.Name),
                    new SqlParameter("@IDCard",member.IDCard),
                    new SqlParameter("@IDSN",member.IDSN),
                    new SqlParameter("@Year",member.Year),
                    new SqlParameter("@Type",member.Type),
                    new SqlParameter("@Level",member.Level)
                };
                param[0].Direction = ParameterDirection.InputOutput;
                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Update_Member", param);
                m.Code = 0;
                m.Value = Convert.ToInt32(param[0].Value);
                m.Message = "sucess";
            }
            catch (Exception ex)
            {
                m.Code = 300;
                m.Message = ex.Message;
                log.Fatal(ex.Message);
                log.FatalException(ex.Message, ex);
            }
            return m;
        }
        public static R Setting(Member member)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",member.MID),
                    new SqlParameter("@Type",member.Type),
                    new SqlParameter("@Phone",member.Phone)
                };
                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Update_Setting", param);
                m.Code = 0;
                m.Value = 0;
                m.Message = "sucess";
            }
            catch (Exception ex)
            {
                m.Code = 300;
                m.Message = ex.Message;
                log.Fatal(ex.Message);
                log.FatalException(ex.Message, ex);
            }
            return m;
        }
        public static R MSessions(MSessions ms)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",ms.MID),
                    new SqlParameter("@SessionId",ms.SessionId),
                    new SqlParameter("@IP",ms.IP)
                };
                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Update_MSessions", param);
                m.Code = 0;
                m.Value = 0;
                m.Message = "sucess";
            }
            catch (Exception ex)
            {
                m.Code = 300;
                m.Message = ex.Message;
                log.Fatal(ex.Message);
                log.FatalException(ex.Message, ex);
            }
            return m;
        }
        public static R UpdateC(Courses c)
        {
            var m = new R();
            try
            {
                string SQL = @"UPDATE [Courses]
                                SET 
                                     [Type] = @Type
                                    ,[Year] = @Year
                                    ,[Cate] = @Cate
                                    ,[Sort] = @Sort
                                    ,[Teacher] = @Teacher
                                    ,[ActMinutes] = @ActMinutes
                                    ,[Length] = @Length
                                    ,[Memo] = @Memo
                                WHERE [CID] = @CID";
                SqlParameter[] param =
                {
                    new SqlParameter("@CID",c.CID),
                    new SqlParameter("@Type",c.Type),
                    new SqlParameter("@Year",c.Year),
                    new SqlParameter("@Cate",c.Cate),
                    new SqlParameter("@Sort",c.Sort),
                    new SqlParameter("@ActMinutes",c.ActMinutes),
                    new SqlParameter("@Teacher",c.Teacher),
                    new SqlParameter("@Length",c.Length),
                    new SqlParameter("@Memo",c.Memo)
                };
                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.Text, SQL, param);
                m.Code = 0;
                m.Value = 0;
                m.Message = "sucess";
            }
            catch (Exception ex)
            {
                m.Code = 300;
                m.Message = ex.Message;
                log.Fatal(ex.Message);
                log.FatalException(ex.Message, ex);
            }
            return m;
        }
        public static R Validate(int MID, int CID, int Validate)
        {
            var m = new R();
            try
            {
                string SQL = "Update_MyCourses_Validate";
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID),
                    new SqlParameter("@CID",CID),
                    new SqlParameter("@Validate",Validate)
                };
                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, SQL, param);
                m.Code = 0;
                m.Value = 0;
                m.Message = "sucess";
            }
            catch (Exception ex)
            {
                m.Code = 300;
                m.Message = ex.Message;
                log.Fatal(ex.Message);
                log.FatalException(ex.Message, ex);
            }
            return m;
        }
        public static R Report(Report re)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",re.MID),
                    new SqlParameter("@Score",re.Score),
                    new SqlParameter("@Compulsory",re.Compulsory),
                    new SqlParameter("@Elective",re.Elective),
                    new SqlParameter("@Status",re.Status),
                    new SqlParameter("@Memo",re.Memo)
                };
                
                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Update_Report", param);
                m.Code = 0;
                m.Message = "sucess";
                log.Info("MID:{0},code:{1}", re.MID, m.Code);
            }
            catch (Exception ex)
            {
                m.Code = 300;
                m.Message = ex.Message;
                log.Fatal(ex.Message);
                log.FatalException(ex.Message, ex);
            }
            return m;
        }
        public static R Survey(Survey p)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@Cate",p.Cate),
                    new SqlParameter("@Name",p.Name),
                    new SqlParameter("@IDCard",p.IDCard),
                    new SqlParameter("@IDSN",p.IDSN),
                    new SqlParameter("@IDCert",p.IDCert),
                    new SqlParameter("@Phone",p.Phone),
                    new SqlParameter("@IP",p.IP),
                    new SqlParameter("@Comment",p.Comment)
                };

                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Update_Survey", param);
                m.Code = 0;
                m.Message = "sucess";
                
            }
            catch (Exception ex)
            {
                m.Code = 300;
                m.Message = ex.Message;
                log.Fatal(ex.Message);
                log.FatalException(ex.Message, ex);
            }
            return m;
        }
    }
}
