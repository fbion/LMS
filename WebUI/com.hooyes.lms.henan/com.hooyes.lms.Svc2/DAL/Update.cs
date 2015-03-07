using System;
using System.Data;
using System.Data.SqlClient;
using com.hooyes.lms.Svc.Model;

namespace com.hooyes.lms.Svc.DAL
{
    public class Update
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        public static R MemberCredit(M1 mc)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@R",0),
                    new SqlParameter("@Code",0),
                    new SqlParameter("@Message",SqlDbType.VarChar,200),
                    new SqlParameter("@SN",mc.SN),
                    new SqlParameter("@Name",mc.Name),
                    new SqlParameter("@IDCard",mc.IDCard),
                    new SqlParameter("@IDSN",mc.IDSN),
                    new SqlParameter("@Year",mc.Year),
                    new SqlParameter("@sType",mc.sType),
                    new SqlParameter("@Type",mc.Type),
                    new SqlParameter("@Phone",mc.Phone),
                    new SqlParameter("@Tag",mc.tag)
                };
                param[0].Direction = ParameterDirection.ReturnValue;
                param[1].Direction = ParameterDirection.Output;
                param[2].Direction = ParameterDirection.Output;
                var r = SqlHelper.ExecuteNonQuery(SqlHelper.Local, CommandType.StoredProcedure, "S_Import_MemberCredit", param);
                m.Code = Convert.ToInt32(param[1].Value);
                m.Message = Convert.ToString(param[2].Value);
            }
            catch (Exception ex)
            {
                m.Code = 300;
                m.Message = ex.Message;
                log.Fatal("Fatal:{0},{1}", mc.IDCard, mc.IDSN);
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
                    new SqlParameter("@Level",member.Level),
                    new SqlParameter("@Tag",member.Tag)
                };
                param[0].Direction = ParameterDirection.InputOutput;
                var r = SqlHelper.ExecuteNonQuery(SqlHelper.Local, CommandType.StoredProcedure, "S_Update_Member", param);
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
    }
}