using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using com.hooyes.lms.Model;
using com.hooyes.lms.API;

namespace com.hooyes.lms.DAL
{
    public class Login
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        public static R Check(string loginID, string loginPWD)
        {
            R r = new R();
            try
            {
                if (!string.IsNullOrEmpty(loginID))
                {
                    loginID = loginID.Trim();
                }
                if (!string.IsNullOrEmpty(loginPWD))
                {
                    loginPWD = loginPWD.Trim();
                }
                SqlParameter[] param =
                {
                    new SqlParameter("@R",0),
                    new SqlParameter("@Code",0),
                    new SqlParameter("@Message",string.Empty),
                    new SqlParameter("@LoginID",loginID),
                    new SqlParameter("@LoginPWD",loginPWD)
                };
                param[0].Direction = ParameterDirection.ReturnValue;
                param[1].Direction = ParameterDirection.Output;
                param[2].Direction = ParameterDirection.Output;
                int _r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Check_Login", param);
                r.Code = Convert.ToInt32(param[1].Value);
                r.Message = Convert.ToString(param[2].Value);
                r.Value = Convert.ToInt32(param[0].Value);
                if (r.Code == 200)
                {
                    r = CheckAPI(loginID, loginPWD);
                }
                //检查是否允许登录
                r = Inspector(r);
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
        /// <summary>
        /// 移动端登录允许同时在线
        /// </summary>
        /// <param name="loginID"></param>
        /// <param name="loginPWD"></param>
        /// <returns></returns>
        public static R CheckByApps(string loginID, string loginPWD)
        {
            R r = new R();
            try
            {
                if (!string.IsNullOrEmpty(loginID))
                {
                    loginID = loginID.Trim();
                }
                if (!string.IsNullOrEmpty(loginPWD))
                {
                    loginPWD = loginPWD.Trim();
                }
                SqlParameter[] param =
                {
                    new SqlParameter("@R",0),
                    new SqlParameter("@Code",0),
                    new SqlParameter("@Message",string.Empty),
                    new SqlParameter("@LoginID",loginID),
                    new SqlParameter("@LoginPWD",loginPWD)
                };
                param[0].Direction = ParameterDirection.ReturnValue;
                param[1].Direction = ParameterDirection.Output;
                param[2].Direction = ParameterDirection.Output;
                int _r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Check_Login", param);
                r.Code = Convert.ToInt32(param[1].Value);
                r.Message = Convert.ToString(param[2].Value);
                r.Value = Convert.ToInt32(param[0].Value);
                /*
                if (r.Code == 200)
                {
                    r = CheckAPI(loginID, loginPWD);
                }

                */
                //检查是否允许登录
                //r = Inspector(r);
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
        public static R CheckAPI(string loginID, string loginPWD)
        {
            R r = new R();
            var param = new ProveParams();
            param.certId = loginPWD;
            param.orderId = loginID;
            var prove = Teach.TeachProveAction(param);
            if (prove.proveValue == "prove000")
            {
                var member = new Member();
                member.MID = 0;
                member.Name = prove.personName;
                member.Year = Convert.ToInt32(prove.yearValue);
                member.IDCard = loginPWD;
                member.IDSN = loginID;
                member.Level = -1;
                member.Type = -1;
                r = Update.Member(member);
            }
            else
            {
                r.Code = 202;
                r.Message = string.Format("{0}",prove.proveValue);
                r.Value = -1;
                log.Warn("{0},{1},{2}", loginID, loginPWD, prove.proveValue);
            }

            return r;
        }
        public static R Inspector(R r)
        {
            var rx = r;
            if (r.Code == 0)
            {
                var ms = DAL.Get.MSessions(r.Value);
                if (ms.Code == 0 && !string.IsNullOrEmpty(ms.SessionId))
                {
                    var InSessions = ASPState.InSessions(ms.SessionId);
                    if (InSessions.Code == 0 && InSessions.Value > 0)
                    {
                        //已在别处登录 拒绝登录
                        /*
                        rx.Code = 501;
                        rx.Value = r.Value;
                        if (!string.IsNullOrEmpty(ms.IP))
                        {
                            rx.Message = string.Format("IP:{0}", ms.IP);
                        }
                        */

                        //已在别处登录 踢出前者
                        ASPState.KillPrevSessions(ms.SessionId);
                    }
                }
               
            }
            return rx;
        }

        public static R CheckAdmin(string loginID, string loginPWD)
        {
            R r = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@R",0),
                    new SqlParameter("@Code",0),
                    new SqlParameter("@Message",string.Empty),
                    new SqlParameter("@LoginID",loginID),
                    new SqlParameter("@LoginPWD",loginPWD)
                };
                param[0].Direction = ParameterDirection.ReturnValue;
                param[1].Direction = ParameterDirection.Output;
                param[2].Direction = ParameterDirection.Output;
                param[2].Size = 200;
                int _r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "M_Check_Login", param);
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

        public static R Check(string loginID)
        {
            var r = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@R",0),
                    new SqlParameter("@Code",0),
                    new SqlParameter("@Message",string.Empty),
                    new SqlParameter("@LoginID",loginID),
                };
                param[0].Direction = ParameterDirection.ReturnValue;
                param[1].Direction = ParameterDirection.Output;
                param[2].Direction = ParameterDirection.Output;
                int _r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Check_LoginID", param);
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
    }
}
