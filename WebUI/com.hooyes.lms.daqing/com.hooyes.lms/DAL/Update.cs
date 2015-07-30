using System;
using System.Data;
using System.Data.SqlClient;
using com.hooyes.lms.Model;

namespace com.hooyes.lms.DAL
{
    public class Update : BaseUpdate
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
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
    }
}
