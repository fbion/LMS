using System;
using System.Data;
using System.Data.SqlClient;
using com.hooyes.lms.Svc.Model;

namespace com.hooyes.lms.Svc.DAL
{
    public class Get
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        public static DataSet Summary()
        {
            var m = new DataSet();
            try
            {
                SqlParameter[] param =
                {
                    
                };

                 m = SqlHelper.ExecuteDataSet(SqlHelper.Local, CommandType.StoredProcedure, "S_Get_Summary", param);
               
            }
            catch (Exception ex)
            {
                log.Fatal(ex.Message);
                log.FatalException(ex.Message, ex);
            }
            return m;
        }
    }
}