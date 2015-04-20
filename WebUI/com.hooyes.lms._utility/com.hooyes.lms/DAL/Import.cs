using System;
using System.Collections.Generic;
using System.Text;
using System.Xml;
using System.Data;
using com.hooyes.lms.Model;
using System.Data.SqlClient;

namespace com.hooyes.lms.DAL
{
    public class Import
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        public static R Courses(string imsmanifest, Courses course)
        {
            var m = new R();
            try
            {
                var rl = new List<Contents>();
                var xd = new XmlDocument();
                var nsmgr = new XmlNamespaceManager(xd.NameTable);
                nsmgr.AddNamespace("a", "http://www.imsproject.org/xsd/imscp_rootv1p1p2");
                xd.Load(imsmanifest);

                var xtilte = xd.SelectSingleNode("//a:organization//a:title[1]", nsmgr);
                course.Name = xtilte.InnerText;
                if (!string.IsNullOrEmpty(course.Name))
                {
                    course.Name = course.Name.Trim().Trim(' ');
                }


                var xnl = xd.SelectNodes("//a:organization//a:item[@identifierref]", nsmgr);
                for (int i = 0; i < xnl.Count; i++)
                {
                    var xn = xnl.Item(i);
                    var xn2 = xd.SelectSingleNode("//a:resources/a:resource[@identifier='" + xn.Attributes["identifierref"].Value + "']", nsmgr);
                    var c = new Contents();
                    c.CName = course.CName;
                    c.CCID = i + 1;
                    c.CCName = xn.Attributes["identifier"].Value;
                    c.Name = xn.FirstChild.InnerText;
                    c.Url = xn2.Attributes["href"].Value;
                    rl.Add(c);
                }
                m = CoursesSavedb(course, rl);
                log.Info("import:{0},{1},{2}", m.Code, m.Value, m.Message);
            }
            catch (Exception ex)
            {
                log.Error(ex.Message);
                log.Error(ex.StackTrace);
                m.Message = ex.Message;
                m.Code = 300;
            }
            return m;
        }
        public static R Courses(Courses courses, List<Contents> contents)
        {
            var m = new R();
            try
            {

                string SQL1 = @"INSERT INTO [Courses]([CID],[CName],[Name],[Type],[Year],[Memo],[Cate],[Sort],[Teacher],[Length])
                                VALUES({0},'{1}','{2}',{3},{4},'{5}',{6},{7},'{8}',{9})";
                string SQL2 = @"INSERT INTO [Contents]([CID],[CCID],[CCName],[Name],[Duration],[Url])
                                VALUES({0},{1},'{2}','{3}',{4},'{5}')";
                var SQL = new StringBuilder();
                SQL.Append("BEGIN");
                SQL.AppendLine();
                SQL.AppendFormat("DELETE FROM [Courses] WHERE CID = {0}", courses.CID);
                SQL.AppendLine();
                SQL.AppendFormat("DELETE FROM [Contents] WHERE CID = {0}", courses.CID);
                SQL.AppendLine();
                SQL.AppendFormat(SQL1, courses.CID, courses.CName, courses.Name, courses.Type, courses.Year, courses.Memo
                    , courses.Cate
                    , courses.Sort
                    , courses.Teacher
                    , courses.Length
                    );
                foreach (var c in contents)
                {
                    SQL.AppendLine();
                    SQL.AppendFormat(SQL2, c.CID, c.CCID, c.CCName, c.Name, c.Duration, c.Url);
                }
                SQL.AppendLine();
                SQL.Append("END");
                log.Info(SQL.ToString());
                var r = SqlHelper.ExecuteNonQuery(SqlHelper.Local, CommandType.Text, SQL.ToString());
                m.Code = 0;
            }
            catch (Exception ex)
            {
                m.Code = 300;
                m.Message = ex.Message;
                log.Error(ex.Message);
            }

            return m;
        }
        public static R Courses(string excelPath, Courses course, bool isMP4)
        {
            var m = new R();
            try
            {
                var rl = new List<Contents>();


                //rl.Add(c);

                string SQL = "Select * from [sheet1$]";
                var dr = excel.ExcuteReader(excelPath, SQL);
                int i = 0;
                while (dr.Read())
                {
                    i = i + 1;
                    try
                    {
                        if (dr["章节"] != DBNull.Value && dr["文件"] != DBNull.Value)
                        {
                            var c = new Contents();

                            c.CName = course.CName;
                            c.CCID = i;
                            c.CCName = "";
                            c.Name = Convert.ToString(dr["章节"]);
                            c.Url = Convert.ToString(dr["文件"]);
                            c.MIME = "video/mp4";

                            rl.Add(c);
                        }
                    }
                    catch (Exception ex1)
                    {
                        m.Code = 301;
                        m.Message = ex1.Message;
                        log.Error("{0},{1}", ex1.Message, ex1.StackTrace);
                    }

                }
                dr.Close();
                dr.Dispose();

                m = CoursesSavedb(course, rl);
                log.Info("import:{0},{1},{2}", m.Code, m.Value, m.Message);
            }
            catch (Exception ex)
            {
                log.Error(ex.Message);
                log.Error(ex.StackTrace);
                m.Message = ex.Message;
                m.Code = 300;
            }
            return m;
        }
        public static R CoursesSavedb(Courses courses, List<Contents> contents)
        {
            var m = new R();
            try
            {

                string SQL1 = @"INSERT INTO [CoursesImport]([CName],[Name],[Type],[Year],[Memo],[Cate],[Sort],[Teacher],[Length])
                                VALUES('{0}','{1}',{2},{3},'{4}',{5},{6},'{7}',{8})";
                string SQL2 = @"INSERT INTO [Contents]([CName],[CCID],[CCName],[Name],[Duration],[Url])
                                VALUES('{0}',{1},'{2}','{3}',{4},'{5}')";
                var SQL = new StringBuilder();
                SQL.Append("BEGIN");
                SQL.AppendLine();
                SQL.AppendFormat("DELETE FROM [CoursesImport] WHERE CName = '{0}'", courses.CName);
                SQL.AppendLine();
                SQL.AppendFormat("DELETE FROM [Contents] WHERE CName = '{0}'", courses.CName);
                SQL.AppendLine();
                SQL.AppendFormat(SQL1, courses.CName, courses.Name, courses.Type, courses.Year, courses.Memo
                    , courses.Cate
                    , courses.Sort
                    , courses.Teacher
                    , courses.Length
                    );
                foreach (var c in contents)
                {
                    SQL.AppendLine();
                    SQL.AppendFormat(SQL2, c.CName, c.CCID, c.CCName, c.Name, c.Duration, c.Url);
                }
                SQL.AppendLine();
                SQL.Append("END");
                log.Info(SQL.ToString());
                var r = SqlHelper.ExecuteNonQuery(SqlHelper.Local, CommandType.Text, SQL.ToString());
                m.Code = 0;
            }
            catch (Exception ex)
            {
                m.Code = 300;
                m.Message = ex.Message;
                log.Error(ex.Message);
            }

            return m;
        }
        //public static R Member(string excelPath)
        //{
        //    var m = new R();
        //    try
        //    {
        //        string SQL = "Select * from [sheet1$]";
        //        var dr = excel.ExcuteReader(excelPath, SQL);
        //        while (dr.Read())
        //        {

        //            try
        //            {
        //                if (dr["身份证号"] != DBNull.Value && dr["报名序号"] != DBNull.Value)
        //                {
        //                    SqlParameter[] param =
        //                {
        //                    new SqlParameter("@R",0),
        //                    new SqlParameter("@Code",0),
        //                    new SqlParameter("@Message",string.Empty),
        //                    new SqlParameter("@Name",dr["姓名"].ToString()),
        //                    new SqlParameter("@IDCard",dr["身份证号"].ToString()),
        //                    new SqlParameter("@IDSN",dr["报名序号"].ToString()),
        //                    new SqlParameter("@Year",dr["教育年份"].ToString()),
        //                    new SqlParameter("@Phone",dr["电话"].ToString())
        //                };
        //                    param[0].Direction = ParameterDirection.ReturnValue;
        //                    param[1].Direction = ParameterDirection.Output;
        //                    param[2].Direction = ParameterDirection.Output;

        //                    var r = SqlHelper.ExecuteNonQuery(SqlHelper.Local, CommandType.StoredProcedure, "M_Import_Member", param);
        //                    log.Info("M_Import_Member:{0},{1},{2}", param[0].Value, param[1].Value, param[2].Value);
        //                }
        //            }
        //            catch (Exception ex1)
        //            {
        //                m.Code = 301;
        //                m.Message = ex1.Message;
        //                log.Error("{0},{1}", ex1.Message, ex1.StackTrace);
        //            }

        //        }
        //        dr.Close();
        //        dr.Dispose();

        //    }
        //    catch (Exception ex)
        //    {
        //        m.Code = 300;
        //        m.Message = ex.Message;
        //        log.Error("{0},{1}", ex.Message, ex.StackTrace);
        //    }
        //    return m;
        //}
        public static R MemberCredit(string excelPath, decimal SN)
        {
            var m = new R();
            try
            {
                string SQL = "Select * from [sheet1$]";
                var dr = excel.ExcuteReader(excelPath, SQL);
                while (dr.Read())
                {

                    try
                    {
                        if (dr["身份证号"] != DBNull.Value && dr["报名序号"] != DBNull.Value)
                        {
                            SqlParameter[] param =
                        {
                            new SqlParameter("@R",0),
                            new SqlParameter("@Code",0),
                            new SqlParameter("@Message",string.Empty),
                            new SqlParameter("@SN",SN),
                            new SqlParameter("@Name",""),
                            new SqlParameter("@IDCard",dr["身份证号"].ToString().Trim()),
                            new SqlParameter("@IDSN",dr["报名序号"].ToString().Trim()),
                            new SqlParameter("@Year",0),
                        };
                            param[0].Direction = ParameterDirection.ReturnValue;
                            param[1].Direction = ParameterDirection.Output;
                            param[2].Direction = ParameterDirection.Output;

                            var r = SqlHelper.ExecuteNonQuery(SqlHelper.Local, CommandType.StoredProcedure, "M_Import_MemberCredit", param);
                            log.Info("M_Import_Member:{0},{1},{2}", param[0].Value, param[1].Value, param[2].Value);
                        }
                    }
                    catch (Exception ex1)
                    {
                        m.Code = 301;
                        m.Message = ex1.Message;
                        log.Error("{0},{1}", ex1.Message, ex1.StackTrace);
                    }

                }
                dr.Close();
                dr.Dispose();

            }
            catch (Exception ex)
            {
                m.Code = 300;
                m.Message = ex.Message;
                log.Error("{0},{1}", ex.Message, ex.StackTrace);
            }
            return m;
        }
        public static R MemberCreditTask()
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                };
                var r = SqlHelper.ExecuteNonQuery(SqlHelper.Local, CommandType.StoredProcedure, "M_Task_MemberCredit", param);
                m.Code = 0;
                m.Value = 0;

            }
            catch (Exception ex)
            {
                m.Code = 300;
                m.Message = ex.Message;
                log.Error("{0},{1}", ex.Message, ex.StackTrace);
            }
            return m;
        }
        public static R Invoice(string excelPath, decimal SN)
        {
            var m = new R();
            try
            {
                string SQL = "Select * from [sheet1$]";
                var dr = excel.ExcuteReader(excelPath, SQL);
                while (dr.Read())
                {

                    try
                    {
                        if (dr["身份证号"] != DBNull.Value && dr["报名序号"] != DBNull.Value)
                        {
                            SqlParameter[] param =
                        {
                            new SqlParameter("@R",0),
                            new SqlParameter("@Code",0),
                            new SqlParameter("@Message",string.Empty),
                            new SqlParameter("@SN",SN),
                            new SqlParameter("@IDCard",dr["身份证号"].ToString().Trim()),
                            new SqlParameter("@IDSN",dr["报名序号"].ToString().Trim()),
                            new SqlParameter("@Name",dr["收件人姓名"].ToString().Trim()),
                            new SqlParameter("@Amount",dr["金额"].ToString().Trim()),
                            new SqlParameter("@Title",dr["发票抬头"].ToString().Trim()),
                            new SqlParameter("@Tel",dr["电话"].ToString().Trim()),
                            new SqlParameter("@City",dr["城市"].ToString().Trim()),
                            new SqlParameter("@Address",dr["地址"].ToString().Trim()),
                            new SqlParameter("@Zip",dr["邮编"].ToString().Trim())
                        };
                            param[0].Direction = ParameterDirection.ReturnValue;
                            param[1].Direction = ParameterDirection.Output;
                            param[2].Direction = ParameterDirection.Output;

                            var r = SqlHelper.ExecuteNonQuery(SqlHelper.Local, CommandType.StoredProcedure, "M_Import_Invoice", param);
                            log.Info("M_Import_Invoice:{0},{1},{2}", param[0].Value, param[1].Value, param[2].Value);
                        }
                    }
                    catch (Exception ex1)
                    {
                        m.Code = 301;
                        m.Message = ex1.Message;
                        log.Error("{0},{1}", ex1.Message, ex1.StackTrace);
                    }

                }
                dr.Close();
                dr.Dispose();

            }
            catch (Exception ex)
            {
                m.Code = 300;
                m.Message = ex.Message;
                log.Error("{0},{1}", ex.Message, ex.StackTrace);
            }
            return m;
        }
        public static R InvoiceTask(decimal SN)
        {
            var m = new R();
            try
            {
                SqlParameter[] param =
                {
                    new SqlParameter("@SN",SN)
                };
                var r = SqlHelper.ExecuteNonQuery(SqlHelper.Local, CommandType.StoredProcedure, "M_Task_Invoice", param);
                m.Code = 0;
                m.Value = 0;

            }
            catch (Exception ex)
            {
                m.Code = 300;
                m.Message = ex.Message;
                log.Error("{0},{1}", ex.Message, ex.StackTrace);
            }
            return m;
        }

        public static DataSet GetCreditList(decimal SN)
        {
            var m = new DataSet();
            try
            {

                SqlParameter[] param =
                {
                    new SqlParameter("@SN",SN)
                };
                m = SqlHelper.ExecuteDataSet(SqlHelper.Local, CommandType.StoredProcedure, "M_Get_CreditList", param);
            }
            catch (Exception ex)
            {
                log.Error("{0},{1}", ex.Message, ex.StackTrace);
            }
            return m;
        }
        public static DataSet GetInvoiceImportList(decimal SN)
        {
            var m = new DataSet();
            try
            {

                SqlParameter[] param =
                {
                    new SqlParameter("@SN",SN)
                };
                m = SqlHelper.ExecuteDataSet(SqlHelper.Local, CommandType.StoredProcedure, "M_Get_InvoiceImportList", param);
            }
            catch (Exception ex)
            {
                log.Error("{0},{1}", ex.Message, ex.StackTrace);
            }
            return m;
        }

        public static DataSet PreviewQuestion(string excelPath)
        {
            var ds = new DataSet();
            try
            {

                string SQL = @"SELECT
                               [CName]
                              ,[Subject]
                              ,[A]
                              ,[B]
                              ,[C]
                              ,[D]
                              ,[Answer]
                              ,[Score]
                              ,[Cate]
                          FROM [Final$]";

                ds = excel.ExcuteDataset(excelPath, SQL);

            }
            catch (Exception ex)
            {
                log.Fatal("{0},{1}", ex.Message, ex.StackTrace);
            }
            return ds;
        }

        public static R Question(string excelPath)
        {
            var r = new R();

            var ds = PreviewQuestion(excelPath);

            var dt = ds.Tables[0];

            foreach (DataRow dr in dt.Rows)
            {
                var info = new Question();
                info.CName = Convert.ToString(dr["CName"]);
                info.Subject = Convert.ToString(dr["Subject"]);
                info.A = Convert.ToString(dr["A"]);
                info.B = Convert.ToString(dr["B"]);
                info.C = Convert.ToString(dr["C"]);
                info.D = Convert.ToString(dr["D"]);
                info.Answer = Convert.ToString(dr["Answer"]);
                info.Score = Convert.ToInt32(dr["Score"]);
                info.Cate = Convert.ToInt32(dr["Cate"]);
                DAL.M.BaseUpdate.Question(info);
            }

            return r;
        }

        public static DataSet PreviewCs(string excelPath)
        {
            var ds = new DataSet();
            try
            {

                string SQL = @"SELECT
                               [CName]
                              ,[Name]
                              ,[Year]
                              ,[Cate]
                              ,[Teacher]
                              ,[Length]
                              ,[ActMinutes]
                              ,[Memo]
                          FROM [Courses$]";
                //log.Info(excelPath);
                ds = excel.ExcuteDataset(excelPath, SQL);

            }
            catch (Exception ex)
            {
                log.Fatal("{0},{1}", ex.Message, ex.StackTrace);
            }
            return ds;
        }

        public static R Cs(string excelPath)
        {
            var r = new R();

            var ds = PreviewCs(excelPath);

            var dt = ds.Tables[0];

            //int CurrentCID = BaseGet.Seed(2);

            foreach (DataRow dr in dt.Rows)
            {
                var info = new Courses();
                info.CID = BaseGet.Seed(2);
                info.CName = Convert.ToString(dr["CName"]);
                info.Name = Convert.ToString(dr["Name"]);
                info.Year = Convert.ToInt32(dr["Year"]);
                info.Cate = Convert.ToInt32(dr["Cate"]);
                info.Teacher = Convert.ToString(dr["Teacher"]);
                info.Length = Convert.ToDecimal(dr["Length"]);
                info.ActMinutes = Convert.ToDecimal(dr["ActMinutes"]);
                info.Tag = "";
                info.Memo = Convert.ToString(dr["Memo"]);
                DAL.M.BaseUpdate.Courses(info);
            }

            return r;
        }

        public static DataSet PreviewMember(string excelPath)
        {
            var ds = new DataSet();
            try
            {

                string SQL = @"SELECT
                                [Login]
                               ,[Password]
                               ,[Name]
                               ,[IDCard]
                               ,[Phone]
                               ,[RegionCode]
                          FROM [member$]";
                //log.Info(excelPath);
                ds = excel.ExcuteDataset(excelPath, SQL);

            }
            catch (Exception ex)
            {
                log.Fatal("{0},{1}", ex.Message, ex.StackTrace);
            }
            return ds;
        }

        public static R Member(string excelPath)
        {
            var r = new R();

            var ds = PreviewMember(excelPath);

            var dt = ds.Tables[0];

            foreach (DataRow dr in dt.Rows)
            {
                var member = new Member();
                member.MID = 0;
                member.Login = Convert.ToString(dr["Login"]);
                member.Password = Convert.ToString(dr["Password"]);
                member.Name = Convert.ToString(dr["Name"]);
                member.IDCard = Convert.ToString(dr["IDCard"]);
                member.RegionCode = Convert.ToInt32(dr["RegionCode"]);
                member.IDSN = "0";
                member.Phone = Convert.ToString(dr["Phone"]);
                DAL.BaseUpdate.Member(member);
            }

            return r;
        }
    }
}
