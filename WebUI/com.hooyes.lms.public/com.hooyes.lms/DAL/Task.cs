﻿using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using com.hooyes.lms.Model;
using com.hooyes.lms.API;

namespace com.hooyes.lms.DAL
{
    public class Task
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        public static R EvalutePaper(int MID, int Year)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID),
                    new SqlParameter("@Year",Year)
                };
                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Task_EvalutePaper", param);
                m.Code = 0;
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
        public static R ResetPaper(int MID, int Flag)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID),
                    new SqlParameter("@Flag",Flag)
                };
                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Task_ResetPaper", param);
                m.Code = 0;
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
        public static R CommitReport(Member m, Report re)
        {
            var r = new R();
            try
            {
                if (re.Status == 0)
                {
                    var para = new AnnalParams();
                    para.certId = m.IDCard;
                    para.orderId = m.IDSN;
                    para.credits = "";
                    para.classHour = "24";
                    para.startTeachDate = m.RegDate.ToString("yyyy-MM-dd");
                    para.endTeachDate = DateTime.Now.ToString("yyyy-MM-dd");
                    para.isPass = "Unpass";

                    if (m.Year >= 2012)
                    {
                        if (re.Score >= 60 && (re.Elective + re.Compulsory) * 45 >= 1080)
                        {
                            para.isPass = "Pass";
                        }
                    }
                    else
                    {
                        if ((re.Elective + re.Compulsory) * 45 >= 1080)
                        {
                            para.isPass = "Pass";
                        }
                    }

                    //已完成学习
                    if (para.isPass == "Pass")
                    {
                        var ps = Teach.TeachAnnalAction(para);
                        if (ps.annalValue == "annal000" || ps.annalValue == "annal003")
                        {
                            re.Status = 1;
                            DAL.Update.Report(re);
                            r.Value = 1;
                            r.Message = "success";
                            r.Code = 0;
                        }
                        else
                        {
                            log.Warn("{0},{1},{2}", ps.annalValue, ps.personName, ps.yearValue);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                log.Fatal("{0},{1}", ex.Message, ex.StackTrace);
            }
            return r;
        }
        public static R EvaluteCourses(int MID)
        {
            log.Info("EvaluteCourses:{0}", MID);
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID)
                };
                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Task_EvaluteCourses", param);
                m.Code = 0;
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
        public static R EvaluteCourses(int MID, int Year)
        {
            log.Info("EvaluteCourses:{0},{1}", MID, Year);
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID),
                    new SqlParameter("@Year",Year)
                };
                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Task_EvaluteCourses", param);
                m.Code = 0;
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
        public static R EvaluteContents(int MID, int CID)
        {
            log.Info("EvaluteContents:{0},{1}", MID, CID);
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@MID",MID),
                    new SqlParameter("@CID",CID)
                };
                var r = SqlHelper.ExecuteNonQuery(C.conn, CommandType.StoredProcedure, "Task_EvaluteContents", param);
                m.Code = 0;
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

        public static R CommitReport(int MID, int PID)
        {

            var m = new R();
            try
            {
                var data = DAL.Get.CommitInfo(MID, PID);
                var param = new GuangdongParams2();
                param.cardNumberType = data.cardNumberType;
                param.cardNumber = data.cardNumber;
                param.areaName = data.areaName;
                param.year = data.year;
                param.classCode = data.classCode;
                param.classLearnTimeCount = data.classLearnTimeCount;
                param.score = data.score;
             

                var r = Guangdong.saveTelOrgStuScore(param);

                if (r.ResponseCode == "ZT000")
                {
                    var ur = DAL.Update.ReportFlag(MID, PID, 1);

                    log.Info("Report Update {0},{1}", ur.Code, ur.Message);
                }
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
