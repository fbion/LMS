﻿using com.hooyes.lms.Model;
using System;
using System.Data;
using System.Data.SqlClient;

namespace com.hooyes.lms.DAL.M
{
    public class Update
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        public static R Courses(int MID, int CID)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID),
                    new SqlParameter("@CID",CID)
                   
                };
                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "M_Update_Courses", param);
                m.Code = 0;
                m.Value = 0;
            }
            catch (Exception ex)
            {
                m.Code = 300;
                m.Message = ex.Message;
                log.Fatal("{0},{1}",ex.Message,ex.StackTrace);
               
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
                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "M_Update_Invoice", param);
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
        public static R Password(int AID,string Password)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@R",0),
                    new SqlParameter("@AID",AID),
                    new SqlParameter("@Password",Password)
                   
                };
                param[0].Direction = ParameterDirection.ReturnValue;
                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "M_Update_Password", param);
                m.Code = 0;
                m.Value = Convert.ToInt32(param[0].Value);
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
        public static R Courses(Courses info)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@CID",info.CID),
                    new SqlParameter("@CName",info.CName),
                    new SqlParameter("@Name",info.Name),
                    new SqlParameter("@Type",info.Type),
                    new SqlParameter("@Year",info.Year),
                    new SqlParameter("@Cate",info.Cate),
                    new SqlParameter("@Sort",info.Sort),
                    new SqlParameter("@Teacher",info.Teacher),
                    new SqlParameter("@ActMinutes",info.ActMinutes),
                    new SqlParameter("@Length",info.Length),
                    new SqlParameter("@Tag",info.Tag),
                    new SqlParameter("@Memo",info.Memo)
                };
                //param[0].Direction = ParameterDirection.InputOutput;
                string SQL = @"INSERT INTO [Courses]
                                           (  CID ,
                                              CName ,
                                              Name ,
                                              Type ,
                                              Year ,
                                              Cate ,
                                              Sort ,
                                              Teacher ,
                                              ActMinutes ,
                                              Length ,
                                              Tag ,
                                              Memo)
                                     VALUES
                                           (  @CID,
                                              @CName ,
                                              @Name ,
                                              @Type ,
                                              @Year ,
                                              @Cate ,
                                              @Sort ,
                                              @Teacher ,
                                              @ActMinutes ,
                                              @Length ,
                                              @Tag ,
                                              @Memo)";
                var r = SqlHelper.ExecuteNonQuery(SqlHelper.Local, CommandType.Text, SQL, param);
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
    }
}
