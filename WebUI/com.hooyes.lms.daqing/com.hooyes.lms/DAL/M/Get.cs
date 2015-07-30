using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using com.hooyes.lms.Model;
using com.hooyes.lms.Model.M;

namespace com.hooyes.lms.DAL.M
{
    public class Get : BaseGet
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        new public static List<M1> M1(string keyword)
        {
            var l = new List<M1>();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@keyword",keyword) 
                };
                var dr = SqlHelper.ExecuteReader(SqlHelper.Local, CommandType.StoredProcedure, "M_Get_Member", param);
                while (dr.Read())
                {
                    var m = new M1();
                    m.ID = Convert.ToInt32(dr["ID"]);
                    m.MID = Convert.ToInt32(dr["MID"]);
                    if (dr["PID"] != DBNull.Value)
                        m.PID = Convert.ToInt32(dr["PID"]);
                    m.Name = Convert.ToString(dr["Name"]);
                    m.Year = Convert.ToInt32(dr["Year"]);
                    m.IDCard = Convert.ToString(dr["IDCard"]);
                    m.IDSN = Convert.ToString(dr["IDSN"]);
                    m.Level = Convert.ToInt32(dr["Level"]);
                    m.Type = Convert.ToInt32(dr["Type"]);
                    m.Phone = Convert.ToString(dr["Phone"]);
                    m.IID = Convert.ToInt32(dr["IID"]);
                    m.Status = Convert.ToInt32(dr["Status"]);
                    m.Minutes = Convert.ToDecimal(dr["Minutes"]);
                    m.Score = Convert.ToInt32(dr["Score"]);
                    if (dr["RegDate"] != DBNull.Value)
                        m.RegDate = Convert.ToDateTime(dr["RegDate"]);
                  
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
