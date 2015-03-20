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

        public static R Member2(Member member)
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
                    new SqlParameter("@RegionCode",member.RegionCode)
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
                    new SqlParameter("@Year",re.Year),
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
        public static R CreateOrder(Order p)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@r",0),
                    new SqlParameter("@OrderID",0),
                    new SqlParameter("@Code",0),
                    new SqlParameter("@Message",SqlDbType.NVarChar,4000),
                    new SqlParameter("@MID",p.MID),
                    new SqlParameter("@Tags",p.Tags),
                    new SqlParameter("@Memo",p.Memo)
                    
                };
                param[0].Direction = ParameterDirection.ReturnValue;
                param[1].Direction = ParameterDirection.Output; //OrderID
                param[2].Direction = ParameterDirection.Output; //Code
                param[3].Direction = ParameterDirection.Output; //Message
                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Update_CreateOrder", param);
                m.Code = Convert.ToInt32(param[2].Value);
                m.Message = Convert.ToString(param[1].Value);
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
        public static R RefreshOrder(Order p)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@r",0),
                    new SqlParameter("@Code",0),
                    new SqlParameter("@Message",SqlDbType.NVarChar,4000),
                    new SqlParameter("@MID",p.MID),
                    new SqlParameter("@ID",p.ID)
                    
                };
                param[0].Direction = ParameterDirection.ReturnValue;
                param[1].Direction = ParameterDirection.Output;
                param[2].Direction = ParameterDirection.Output;
                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Update_RefreshOrder", param);
                m.Code = Convert.ToInt32(param[1].Value);
                m.Message = Convert.ToString(param[2].Value);
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
        public static R CommitOrder(Order p)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@r",0),
                    new SqlParameter("@Code",0),
                    new SqlParameter("@Message",SqlDbType.NVarChar,4000),
                    new SqlParameter("@MID",p.MID),
                    new SqlParameter("@ID",p.ID),
                    new SqlParameter("@Cash",p.Cash),
                    new SqlParameter("@Credit",p.Credit)
                    
                };
                param[0].Direction = ParameterDirection.ReturnValue;
                param[1].Direction = ParameterDirection.Output;
                param[2].Direction = ParameterDirection.Output;
                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Update_CommitOrder", param);
                m.Code = Convert.ToInt32(param[1].Value);
                m.Message = Convert.ToString(param[2].Value);
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
        public static R Order(Order p)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@r",0),
                    new SqlParameter("@Code",0),
                    new SqlParameter("@Message",SqlDbType.NVarChar,4000),
                    new SqlParameter("@MID",p.MID),
                    new SqlParameter("@ID",p.ID),
                    new SqlParameter("@Status",p.Status),
                    new SqlParameter("@Memo",p.Memo)
                    
                };
                param[0].Direction = ParameterDirection.ReturnValue;
                param[1].Direction = ParameterDirection.Output;
                param[2].Direction = ParameterDirection.Output;
                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Update_Order", param);
                m.Code = Convert.ToInt32(param[1].Value);
                m.Message = Convert.ToString(param[2].Value);
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
        public static R BalanceTopupByCards(int MID, Cards p)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@r",0),
                    new SqlParameter("@Code",0),
                    new SqlParameter("@Message",SqlDbType.NVarChar,4000),
                    new SqlParameter("@MID",MID),
                    new SqlParameter("@SN",p.SN)
                    
                };
                param[0].Direction = ParameterDirection.ReturnValue;
                param[1].Direction = ParameterDirection.Output;
                param[2].Direction = ParameterDirection.Output;
                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Update_BalanceTopupByCards", param);
                m.Code = Convert.ToInt32(param[1].Value);
                m.Message = Convert.ToString(param[2].Value);
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
        public static R GatewayLog(GatewayLog p)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MerId",p.MerId),        //varchar(20)
                    new SqlParameter("@BusiId",p.BusiId),      //varchar(10)
                    new SqlParameter("@OrdId",p.OrdId),        //varchar(20)
                    new SqlParameter("@OrdAmt",p.OrdAmt),      //decimal(18,0)
                    new SqlParameter("@Version",p.Version),    //decimal(18,0)
                    new SqlParameter("@BgRetUrl",p.BgRetUrl),  //varchar(100)
                    new SqlParameter("@PageRetUrl",p.PageRetUrl),//varchar(100)
                    new SqlParameter("@GateId",p.GateId),        //decimal(18,0)
                    new SqlParameter("@Param1",p.Param1),        //nvarchar(100)
                    new SqlParameter("@Param2",p.Param2),        //nvarchar(100)
                    new SqlParameter("@Param3",p.Param3),        //nvarchar(100)
                    new SqlParameter("@Param4",p.Param4),        //nvarchar(100)
                    new SqlParameter("@Param5",p.Param5),        //nvarchar(100)
                    new SqlParameter("@Param6",p.Param6),        //nvarchar(100)
                    new SqlParameter("@Param7",p.Param7),        //nvarchar(100)
                    new SqlParameter("@Param8",p.Param8),        //nvarchar(100)
                    new SqlParameter("@Param9",p.Param9),        //nvarchar(100)
                    new SqlParameter("@Param10",p.Param10),      //nvarchar(100)
                    new SqlParameter("@OrdDesc",p.OrdDesc),      //nvarchar(256)
                    new SqlParameter("@ShareType",p.ShareType),  //varchar(10)
                    new SqlParameter("@ShareData",p.ShareData),  //nvarchar(100)
                    new SqlParameter("@Priv1",p.Priv1),          //nvarchar(60)
                    new SqlParameter("@CustomIp",p.CustomIp),    //varchar(60)
                    new SqlParameter("@ChkValue",p.ChkValue),    //varchar(256)
                    new SqlParameter("@Plain",p.Plain),          //varchar(256)
                    new SqlParameter("@PayStat",p.PayStat),      //varchar(10)
                    new SqlParameter("@PayTime",p.PayTime),      //varchar(20)
                    new SqlParameter("@Flag",p.Flag)            //varchar(10)
                    
                };

                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Update_GatewayLog", param);
                m.Code = 0;
                m.Message = string.Empty;
                m.Value = 0;

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
        public static R Certificate(int MID)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID)
                };
                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Update_Certificate", param);
                m.Code = 0;
            }
            catch (Exception ex)
            {
                m.Code = 300;
                m.Message = ex.Message;
                log.Fatal("MID:{0},{1}", MID, ex.Message);
                log.FatalException(ex.Message, ex);
            }

            return m;
        }
    }
}
