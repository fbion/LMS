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
                    if (dr["ExpireDate"] != DBNull.Value)
                        m.ExpireDate = Convert.ToDateTime(dr["ExpireDate"]);
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

    }
}
