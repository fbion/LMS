using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using com.hooyes.lms.Model;

namespace com.hooyes.lms.DAL
{
    public class Update : BaseUpdate
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        new public static R Member(Member member)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",member.MID),
                    new SqlParameter("@Login",member.Login),
                    new SqlParameter("@Password",member.Password),
                    new SqlParameter("@Name",member.Name),
                    new SqlParameter("@IDCard",member.IDCard),
                    new SqlParameter("@IDSN",member.IDSN),
                    new SqlParameter("@Year",member.Year),
                    new SqlParameter("@Type",member.Type),
                    new SqlParameter("@Level",member.Level),
                    new SqlParameter("@Phone",member.Phone),
                    new SqlParameter("@RegionCode",member.RegionCode),
                    new SqlParameter("@IDCert",member.IDCert),
                    new SqlParameter("@Company",member.Company),
                    new SqlParameter("@Email",member.Email),
                    new SqlParameter("@City",member.City),
                    new SqlParameter("@Address",member.Address)
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
        public static R MemberPhoto(Member member)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",member.MID),
                    new SqlParameter("@Photo",member.Photo)
                };

                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Update_MemberPhoto", param);
                m.Code = 0;
                m.Message = "success";
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
        public static R Profiles(Member member)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",member.MID),
                    new SqlParameter("@IDCert",member.IDCert),
                    //new SqlParameter("@Name",member.Name),
                    new SqlParameter("@Level",member.Level),
                    new SqlParameter("@Phone",member.Phone),
                    new SqlParameter("@Gender",member.Gender),
                    new SqlParameter("@Company",member.Company),
                    new SqlParameter("@Email",member.Email),
                    new SqlParameter("@Address",member.Address),
                    new SqlParameter("@Zip",member.Zip),
                    new SqlParameter("@Job",member.Job)
                };

                string SQL = @"UPDATE [dbo].[Member]
                               SET [IDCert]= @IDCert
                                  ,[Level] = @Level
                                  ,[Phone] = @Phone
                                  ,[Gender] = @Gender
                                  ,[Company] = @Company
                                  ,[Email] = @Email
                                  ,[Address] = @Address
                                  ,[Zip] = @Zip
                                  ,[Job] = @Job
                             WHERE MID = @MID";

                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.Text, SQL, param);
                m.Code = 0;
                m.Message = "success";
            }
            catch (Exception ex)
            {
                m.Code = 300;
                m.Message = ex.Message;
                log.Fatal("{0},{1}", ex.Message, ex.StackTrace);
            }
            return m;
        }
        public static R Profiles_10371(Member member)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",member.MID),
                    new SqlParameter("@IDCert",member.IDCert),
                   new SqlParameter("@IDCard",member.IDCard),
                    new SqlParameter("@Level",member.Level),
                    new SqlParameter("@Phone",member.Phone),
                    new SqlParameter("@Gender",member.Gender),
                    new SqlParameter("@Company",member.Company),
                    new SqlParameter("@Email",member.Email),
                    new SqlParameter("@Address",member.Address),
                    new SqlParameter("@Zip",member.Zip),
                    new SqlParameter("@Job",member.Job),
                    new SqlParameter("@City",member.City),
                    new SqlParameter("@Birthday",member.Birthday),
                    new SqlParameter("@Race",member.Race),
                    new SqlParameter("@Education",member.Education),
                    new SqlParameter("@Degree",member.Degree),
                    new SqlParameter("@Major",member.Major)
                };

                string SQL = @"UPDATE [dbo].[Member]
                               SET [IDCert]= @IDCert
                                  ,[IDCard]= @IDCard
                                  ,[Level] = @Level
                                  ,[Phone] = @Phone
                                  ,[Gender] = @Gender
                                  ,[Company] = @Company
                                  ,[Email] = @Email
                                  ,[Address] = @Address
                                  ,[Zip] = @Zip
                                  ,[Job] = @Job
                                  ,[City] = @City
                                  ,[Birthday] = @Birthday     
                                  ,[Race] = @Race 
                                  ,[Education] = @Education
                                  ,[Degree] = @Degree
                                  ,[Major] = @Major
                             WHERE MID = @MID";

                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.Text, SQL, param);
                m.Code = 0;
                m.Message = "success";
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
