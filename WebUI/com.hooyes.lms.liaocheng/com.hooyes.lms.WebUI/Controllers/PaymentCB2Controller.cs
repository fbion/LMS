using System;
using System.Web.Mvc;
using com.hooyes.lms.Model;


namespace com.hooyes.lms.Controllers
{
    /// <summary>
    /// Payment Callback Controller 给银行回调使用
    /// </summary>
    public class PaymentCB2Controller : Controller
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();
        /// <summary>
        /// 后台服务器段调用,已无登录状态
        /// </summary>
        /// <returns></returns>
        public ActionResult CallBack()
        {
            string retText = string.Empty;
            bool IsSuccess = false;
            var Glog = new GatewayLog();
            try
            {
                string MerId = Request["MerId"];//商户号
                string BusiId = Request["BusiId"];//业务标识
                string OrdId = Request["OrdId"];//订单号
                string OrdAmt = Request["OrdAmt"];//订单金额
                string CuryId = Request["CuryId"];//币种
                string Version = Request["Version"];//版本
                string BgRetUrl = Request["BgRetUrl"];//后台地址
                string PageRetUrl = Request["PageRetUrl"];//前台地址
                string GateId = Request["GateId"];//网关

                string Param1 = Request["Param1"];//参数  MID
                string Param2 = Request["Param2"];//参数  Order.ID
                string Param3 = Request["Param3"];//参数
                string Param4 = Request["Param4"];//参数
                string Param5 = Request["Param5"];//参数
                string Param6 = Request["Param6"];//参数
                string Param7 = Request["Param7"];//参数
                string Param8 = Request["Param8"];//参数
                string Param9 = Request["Param9"];//参数
                string Param10 = Request["Param10"];//参数

                string ShareType = Request["ShareType"];//分账类型
                string ShareData = Request["ShareData"];//分账数据
                string Priv1 = Request["Priv1"];//商户私有域

                string CustomIp = Request["CustomIp"]; //IP

                string ChkValue = Request["ChkValue"]; //
                string PayStat = Request["PayStat"]; //PayStat表示交易状态，只有"1001"表示支付成功，其他状态均表示未成功的交易。因此验证签名数据通过后，还需要判定交易状态代码是否为"1001"
                string PayTime = Request["PayTime"]; //支付时间

                string plain = MerId + BusiId + OrdId + OrdAmt + CuryId + Version + GateId + Param1 + Param2 + Param3 + Param4 + Param5
                    + Param6 + Param7 + Param8 + Param9 + Param10 + ShareType + ShareData + Priv1 + CustomIp + PayStat + PayTime;


                Glog.MerId = MerId;//varchar(20)
                Glog.BusiId = BusiId;//varchar(10)
                Glog.OrdId = OrdId;//varchar(20)
                Glog.OrdAmt = OrdAmt;//decimal(18,0)
                Glog.Version = Version;//decimal(18,0)
                Glog.BgRetUrl = BgRetUrl;//varchar(100)
                Glog.PageRetUrl = PageRetUrl;//varchar(100)
                Glog.GateId = GateId;//decimal(18,0)
                Glog.Param1 = Param1;//nvarchar(100)
                Glog.Param2 = Param2;//nvarchar(100)
                Glog.Param3 = Param3;//nvarchar(100)
                Glog.Param4 = Param4;//nvarchar(100)
                Glog.Param5 = Param5;//nvarchar(100)
                Glog.Param6 = Param6;//nvarchar(100)
                Glog.Param7 = Param7;//nvarchar(100)
                Glog.Param8 = Param8;//nvarchar(100)
                Glog.Param9 = Param9;//nvarchar(100)
                Glog.Param10 = Param10;//nvarchar(100)
                Glog.OrdDesc = string.Empty;//nvarchar(256)
                Glog.ShareType = ShareType;//varchar(10)
                Glog.ShareData = ShareData;//nvarchar(100)
                Glog.Priv1 = Priv1;//nvarchar(60)
                Glog.CustomIp = CustomIp;//varchar(60)
                Glog.ChkValue = ChkValue;//varchar(256)
                Glog.Plain = plain;//varchar(256)
                Glog.PayStat = PayStat;//varchar(10)
                Glog.PayTime = PayTime;//varchar(20)

                // byte[] buffer = System.Text.UTF8Encoding.UTF8.GetBytes(plain);
                // plain = System.Text.Encoding.Default.GetString(buffer);

                string flag = string.Empty;
                try
                {
                    flag = com.hooyes.chinapay.Core2.checkData(plain, ChkValue);
                }
                catch (Exception ex1)
                {
                    flag = "-1"; //验签异常
                    log.Fatal("{0},{1}", ex1.Message, ex1.StackTrace);
                }

                Glog.Flag = flag;
                //验证签名数据通过后，一定要判定交易状态代码是否为"1001"
                if (flag == "0")
                {
                    int MID = Convert.ToInt32(Param1);
                    int ID = Convert.ToInt32(Param2); //Order.ID;
                    if (PayStat == "1001")
                    {
                        
                        var OrderInfo = DAL.Get.Order(MID, ID);
                        if (OrderInfo.Status < 10 && OrderInfo.ID > 0)
                        {
                            var r = DAL.Update.CommitOrder(OrderInfo);

                            if (r.Code == 0)
                            {
                                // 订单完成
                                IsSuccess = true;
                                log.Info("CommitOrder Success,{0},{1}", MID, ID);
                               
                            }
                            else
                            {
                                log.Fatal("CommitOrder Error:{0},{1},{2},{3}", MID, ID, r.Code, r.Message);
                                OrderInfo.Status = 9; //订单标记为异常
                                OrderInfo.Memo = r.Message;
                                r = DAL.Update.Order(OrderInfo);
                            }
                           
                        }
                        else
                        {
                            if (OrderInfo.Status == 10)
                            {
                                IsSuccess = true;
                                log.Info("OrderInfo is Success {0},{1}", OrderInfo.OrderID, OrderInfo.Status);
                            }
                            else
                            {
                                log.Fatal("OrderInfo is Error {0},{1}", OrderInfo.OrderID, OrderInfo.Status);
                            }
                            
                        }
                    }
                    else
                    {
                        // 取消订单
                        var p = new Order();
                        p.MID = MID;
                        p.ID = ID;
                        p.Status = 400;
                        p.Memo = PayStat;
                        var r = DAL.Update.Order(p);
                    }
                }

            }
            catch (Exception ex)
            {
                log.Fatal("{0},{1}", ex.Message, ex.StackTrace);
            }
            finally
            {
                // 日志记录
                log.Info("Glog:--{0}--{1}--", IsSuccess, Glog.OrdId);
                var t = Glog.GetType();
                foreach (var item in t.GetProperties())
                {
                    log.Info("{0}:{1}", item.Name, item.GetValue(Glog, null));
                }
                var r = DAL.Update.GatewayLog(Glog);
                log.Info("--LogToDB:{0},{1}", r.Code, r.Message);
                /*
                         
                    商户后台地址接收到请求时，请立即返回包含eduok字样的响应信息。
                    统一支付平台则认为商户接收成功。如果商户不返回eduok这样的信息，
                    则统一支付平台将会每分钟发送1次，最多10次。直到商户返回eduok字样的成功信息。
                    
                    日志记录成功后返回 
                         
                */
                if (r.Code == 0 && IsSuccess)
                {
                    retText = "eduok";
                }
                else
                {
                    log.Fatal("OrdId:{0}, CommitOrder Fail Retrying", Glog.OrdId);
                }
            }

            return Content(retText);
        }

        /// <summary>
        /// 前端调用
        /// </summary>
        /// <returns></returns>
        public ActionResult CallBack_Front()
        {
            var Glog = new GatewayLog();
            try
            {
                string MerId = Request["MerId"];//商户号
                string BusiId = Request["BusiId"];//业务标识
                string OrdId = Request["OrdId"];//订单号
                string OrdAmt = Request["OrdAmt"];//订单金额
                string CuryId = Request["CuryId"];//币种
                string Version = Request["Version"];//版本
                string BgRetUrl = Request["BgRetUrl"];//后台地址
                string PageRetUrl = Request["PageRetUrl"];//前台地址
                string GateId = Request["GateId"];//网关

                string Param1 = Request["Param1"];//参数  MID
                string Param2 = Request["Param2"];//参数  Order.ID
                string Param3 = Request["Param3"];//参数
                string Param4 = Request["Param4"];//参数
                string Param5 = Request["Param5"];//参数
                string Param6 = Request["Param6"];//参数
                string Param7 = Request["Param7"];//参数
                string Param8 = Request["Param8"];//参数
                string Param9 = Request["Param9"];//参数
                string Param10 = Request["Param10"];//参数

                string ShareType = Request["ShareType"];//分账类型
                string ShareData = Request["ShareData"];//分账数据
                string Priv1 = Request["Priv1"];//商户私有域

                string CustomIp = Request["CustomIp"]; //IP

                string ChkValue = Request["ChkValue"]; //
                string PayStat = Request["PayStat"]; //PayStat表示交易状态，只有"1001"表示支付成功，其他状态均表示未成功的交易。因此验证签名数据通过后，还需要判定交易状态代码是否为"1001"
                string PayTime = Request["PayTime"]; //支付时间

                string plain = MerId + BusiId + OrdId + OrdAmt + CuryId + Version + GateId + Param1 + Param2 + Param3 + Param4 + Param5
                    + Param6 + Param7 + Param8 + Param9 + Param10 + ShareType + ShareData + Priv1 + CustomIp + PayStat + PayTime;


                Glog.MerId = MerId;//varchar(20)
                Glog.BusiId = BusiId;//varchar(10)
                Glog.OrdId = OrdId;//varchar(20)
                Glog.OrdAmt = OrdAmt;//decimal(18,0)
                Glog.Version = Version;//decimal(18,0)
                Glog.BgRetUrl = BgRetUrl;//varchar(100)
                Glog.PageRetUrl = PageRetUrl;//varchar(100)
                Glog.GateId = GateId;//decimal(18,0)
                Glog.Param1 = Param1;//nvarchar(100)
                Glog.Param2 = Param2;//nvarchar(100)
                Glog.Param3 = Param3;//nvarchar(100)
                Glog.Param4 = Param4;//nvarchar(100)
                Glog.Param5 = Param5;//nvarchar(100)
                Glog.Param6 = Param6;//nvarchar(100)
                Glog.Param7 = Param7;//nvarchar(100)
                Glog.Param8 = Param8;//nvarchar(100)
                Glog.Param9 = Param9;//nvarchar(100)
                Glog.Param10 = Param10;//nvarchar(100)
                Glog.OrdDesc = "Front";//nvarchar(256)
                Glog.ShareType = ShareType;//varchar(10)
                Glog.ShareData = ShareData;//nvarchar(100)
                Glog.Priv1 = Priv1;//nvarchar(60)
                Glog.CustomIp = CustomIp;//varchar(60)
                Glog.ChkValue = ChkValue;//varchar(256)
                Glog.Plain = plain;//varchar(256)
                Glog.PayStat = PayStat;//varchar(10)
                Glog.PayTime = PayTime;//varchar(20)

                // byte[] buffer = System.Text.UTF8Encoding.UTF8.GetBytes(plain);
                // plain = System.Text.Encoding.Default.GetString(buffer);

                string flag = string.Empty;
                try
                {
                    flag = com.hooyes.chinapay.Core2.checkData(plain, ChkValue);
                }
                catch (Exception ex1)
                {
                    flag = "-1"; //验签异常
                    log.Fatal("{0},{1}", ex1.Message, ex1.StackTrace);
                }

                Glog.Flag = flag;
                //验证签名数据通过后，一定要判定交易状态代码是否为"1001"
                if (flag == "0")
                {
                    int MID = Convert.ToInt32(Param1);
                    int ID = Convert.ToInt32(Param2); //Order.ID;
                    if (PayStat == "1001")
                    {
                        var OrderInfo = DAL.Get.Order(MID, ID);
                        if (OrderInfo.Status < 10 && OrderInfo.ID > 0)
                        {
                            var r = DAL.Update.CommitOrder(OrderInfo);

                            if (r.Code == 0)
                            {
                                // 订单完成
                                log.Info("CommitOrder success,{0},{1}", MID, ID);
                            }
                            else
                            {
                                log.Fatal("CommitOrder Error:{0},{1},{2},{3}", MID, ID, r.Code, r.Message);
                                OrderInfo.Status = 9; //订单标记为异常
                                OrderInfo.Memo = r.Message;
                                r = DAL.Update.Order(OrderInfo);
                            }
                        }
                    }
                    else
                    {
                        // 取消订单
                        var p = new Order();
                        p.MID = MID;
                        p.ID = ID;
                        p.Status = 400;
                        p.Memo = PayStat;
                        var r = DAL.Update.Order(p);
                    }
                }

            }
            catch (Exception ex)
            {
                log.Fatal("{0},{1}", ex.Message, ex.StackTrace);
            }
            finally
            {
                // 日志记录
                log.Info("Glog:");
                var t = Glog.GetType();
                foreach (var item in t.GetProperties())
                {
                    log.Info("{0}:{1}", item.Name, item.GetValue(Glog, null));
                }
                var r = DAL.Update.GatewayLog(Glog);
                log.Info("--LogToDB:{0},{1}", r.Code, r.Message);

                // 进入确认页
                string Url = string.Format("{0}/Payment/OrdersDetail/{1}", C.APP, Glog.Param2);
                Response.Redirect(Url);
            }

            return Content(string.Empty);
        }
    }
}
