using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using com.hooyes.lms.Model;

namespace com.hooyes.lms.DAL
{
    /// <summary>
    /// 状态服务器
    /// </summary>
    public class ASPState
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        public static R InSessions(string SessionId)
        {
            var m = new R();
            try
            {
                string Sql = @"SELECT COUNT(1) 
                               FROM ASPStateTempSessions 
                               WHERE left(SessionId,24) =@SessionId
                                and DATALENGTH(SessionItemShort)>@length";
                SqlParameter[] param =
                {
                    new SqlParameter("@SessionId",SessionId),
                    new SqlParameter("@length",7)
                };
                var r = SqlHelper.ExecuteScalar(C.ASPState, CommandType.Text, Sql, param);
                m.Code = 0;
                m.Value = Convert.ToInt32(r);
                if (m.Value > 0)
                {
                    m.Message = "InSessions";
                }
                else
                {
                    m.Message = "not InSessions";
                }
            }
            catch (Exception ex)
            {
                m.Code = 300;
                m.Message = ex.Message;
                log.Fatal(ex.Message);
                log.Fatal("{0},{1}", ex.Message, ex.StackTrace);
            }

            return m;
        }
        /// <summary>
        /// 将前面登录的踢下线
        /// </summary>
        /// <param name="SessionId"></param>
        /// <returns></returns>
        public static R KillPrevSessions(string SessionId)
        {
            var m = new R();
            try
            {
                string Sql = @"DELETE 
                               FROM ASPStateTempSessions 
                               WHERE left(SessionId,24) = @SessionId";
                SqlParameter[] param =
                {
                    new SqlParameter("@SessionId",SessionId)
                };
                var r = SqlHelper.ExecuteNonQuery(C.ASPState, CommandType.Text, Sql, param);
                m.Code = 0;
               
            }
            catch (Exception ex)
            {
                m.Code = 300;
                m.Message = ex.Message;
                log.Fatal("{0},{1}",ex.Message, ex.StackTrace);
            }

            return m;
        }
    }
}
