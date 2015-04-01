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
                    new SqlParameter("@RegionName",member.RegionName)
                };
                param[0].Direction = ParameterDirection.InputOutput;
                var r = SqlHelper.ExecuteNonQuery(SqlHelper.Local, CommandType.StoredProcedure, "Update_Member", param);
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
        public static R Report(int MID, int Year, decimal Compulsory)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID),
                    new SqlParameter("@Year",Year),
                    new SqlParameter("@Compulsory",Compulsory)
                };
                string SQL = "UPDATE dbo.Report SET Compulsory = @Compulsory,UpdateDate=GETDATE() WHERE MID = @MID AND [Year] = @Year";
                var r = SqlHelper.ExecuteNonQuery(SqlHelper.Local, CommandType.Text, SQL, param);
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
        public static R ReportStatus(int MID, int Year, int Status)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID),
                    new SqlParameter("@Year",Year),
                    new SqlParameter("@Status",Status)
                };
                string SQL = "UPDATE dbo.Report SET Status = @Status,UpdateDate=GETDATE() WHERE MID = @MID AND [Year] = @Year";
                var r = SqlHelper.ExecuteNonQuery(SqlHelper.Local, CommandType.Text, SQL, param);
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
        public static R ReportFlag(int MID, int Year, int Flag)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID),
                    new SqlParameter("@Year",Year),
                    new SqlParameter("@Flag",Flag)
                };
                string SQL = "UPDATE dbo.Report SET Flag = @Flag,UpdateDate=GETDATE() WHERE MID = @MID AND [Year] = @Year";
                if (Flag == 1)
                {
                    SQL = "UPDATE dbo.Report SET Flag = @Flag,UpdateDate=GETDATE(),CommitDate=GETDATE() WHERE MID = @MID AND [Year] = @Year";
                }
                var r = SqlHelper.ExecuteNonQuery(SqlHelper.Local, CommandType.Text, SQL, param);
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
        public static R MemberExt(int MID, string IDSN, int Flag)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID),
                    new SqlParameter("@IDSN",IDSN),
                    new SqlParameter("@Flag",Flag)
                };
                string SQL = "UPDATE dbo.MemberExt SET Flag = @Flag WHERE MID = @MID AND [IDSN] = @IDSN";
                var r = SqlHelper.ExecuteNonQuery(SqlHelper.Local, CommandType.Text, SQL, param);
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
        public static R MemberExt(MemberExt memberExt)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@IDSN",memberExt.IDSN),
                    new SqlParameter("@Flag",memberExt.Flag)
                };
                string SQL = "UPDATE dbo.MemberExt SET Flag = @Flag WHERE [IDSN] = @IDSN";
                var r = SqlHelper.ExecuteNonQuery(SqlHelper.Local, CommandType.Text, SQL, param);
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
    }
}
