using System;
using System.Collections.Generic;
using System.Web;
using System.Web.Mvc;
using com.hooyes.lms.API;
using com.hooyes.lms.Model;

namespace com.hooyes.lms.WebUI.Controllers
{
    public class ApiController : Controller
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        public ActionResult ReceiveAcctInfo(string seq_num, string user_name, string card_id, string department_code)
        {
            string result = "1"; // Api Return 1 Success , 0 Fail
            var member = new Member();
            var logResult = new R();
            logResult.Code = -1;
            string ip = Request.UserHostAddress;
            int MID = 0;
            try
            {
                if (!string.IsNullOrEmpty(seq_num) && !string.IsNullOrEmpty(user_name) && !string.IsNullOrEmpty(card_id) && !string.IsNullOrEmpty(department_code))
                {
                    
                    member.IDSN = "0";
                    member.Name = Cipher.Decrypt(user_name);
                    member.IDCard = Cipher.Decrypt(card_id);
                    member.RegionCode = Cipher.Decrypt(department_code);

                    member.Login = member.IDCard;
                    member.Password = member.Name;

                    if (!string.IsNullOrEmpty(member.Login) && !string.IsNullOrEmpty(member.Password) && !string.IsNullOrEmpty(member.IDSN))
                    {

                        // Check MID
                        var r1 = DAL.Login.Check(member.Login);
                        if (r1.Code == 0)
                        {
                            MID = r1.Value;  // Login Exists
                        }

                        // Signup 
                        if (MID == 0)
                        {
                            var r2 = DAL.Update.Member(member);
                            if (r2.Code != 0)
                            {
                                result = "0";
                            }
                            else
                            {
                                MID = r2.Value;
                            }

                            logResult.Message = logResult.Message + string.Format("->R2-{0}:{1}", r2.Code, r2.Message);
                        }

                        // IDSN Append!
                        if (MID > 0)
                        {
                            var memberExt = new MemberExt();

                            memberExt.MID = MID;
                            memberExt.IDSN = Cipher.Decrypt(seq_num);
                            memberExt.Year = Convert.ToInt32(memberExt.IDSN.Substring(0, 4));
                            memberExt.Flag = 10; 
                            var r3 = DAL.Update.Member(memberExt);
                            if (r3.Code != 0)
                            {
                                result = "0";
                            }
                            logResult.Message = logResult.Message + string.Format("->R3-{0}:{1}", r3.Code, r3.Message);
                        }
                        
                    }
                    else
                    {
                        logResult.Code = 101;
                        logResult.Message = "parameters error";
                    }
                }
            }
            catch (Exception ex)
            {
                result = "0";
                logResult.Code = 300;
                logResult.Message = string.Format("-->Ex-{0},{1}", ex.Message, ex.StackTrace);
            }
            finally
            {
                if (result == "1")
                {
                    log.Info("IP:{0}", ip);
                    log.Info("S:{0},{1},{2},{3}", seq_num, user_name, card_id, department_code);
                    log.Info("P:{0},{1},{2},{3}", member.IDSN, member.Name, member.IDCard, member.RegionCode);
                    log.Info("{0},{1}", logResult.Code, logResult.Message);
                }
                else
                {
                    log.Warn("IP:{0}", ip);
                    log.Warn("S:{0},{1},{2},{3}", seq_num, user_name, card_id, department_code);
                    log.Warn("P:{0},{1},{2},{3}", member.IDSN, member.Name, member.IDCard, member.RegionCode);
                    log.Warn("{0},{1}", logResult.Code, logResult.Message);
                }
            }
            return Content(result);
        }
        public ActionResult DeleteAcctInfo(string seq_num)
        {
            string result = "1"; // Api Return 1 Success , 0 Fail
            var memberExt = new MemberExt();
            var logResult = new R();
            logResult.Code = -1;
            string ip = Request.UserHostAddress;
            try
            {
                if (!string.IsNullOrEmpty(seq_num))
                {
                    memberExt.MID = 0;
                    memberExt.IDSN = Cipher.Decrypt(seq_num);
                    memberExt.Year = Convert.ToInt32(memberExt.IDSN.Substring(0, 4));
                    memberExt.Flag = 0;
                    var r3 = DAL.Update.Member(memberExt);
                    if (r3.Code != 0)
                    {
                        result = "0";
                    }
                    logResult.Message = logResult.Message + string.Format("->R3-{0}:{1}", r3.Code, r3.Message);

                }
            }
            catch (Exception ex)
            {
                result = "0";
                logResult.Code = 300;
                logResult.Message = string.Format("-->Ex-{0},{1}", ex.Message, ex.StackTrace);
            }
            finally
            {
                if (result == "1")
                {
                    log.Info("IP:{0}", ip);
                    log.Info("S:{0}", seq_num);
                    log.Info("P:{0}", memberExt.IDSN);
                    log.Info("{0},{1}", logResult.Code, logResult.Message);
                }
                else
                {
                    log.Warn("IP:{0}", ip);
                    log.Warn("S:{0}", seq_num);
                    log.Warn("P:{0}", memberExt.IDSN);
                    log.Warn("{0},{1}", logResult.Code, logResult.Message);
                }
            }
            return Content(result);
        }

    }
}
