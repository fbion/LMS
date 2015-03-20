using com.hooyes.lms.Model;
using com.hooyes.lms.SMS;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;

namespace com.hooyes.lms.Controllers
{
    [CustomAuthorize]
    public class PaymentController : Controller
    {
        private static NLog.Logger log = NLog.LogManager.GetCurrentClassLogger();

        public ActionResult Buy()
        {
            var Products = DAL.Get.Products(Client.MID);
            ViewData["Products"] = Products.FindAll(n => n.MyID <= 0);
            ViewData["My_Products"] = Products.FindAll(n => n.MyID > 0);
            return View();
        }

        public ActionResult Orders(int ID, int Refresh = 0)
        {
            if (Refresh == 1)
            {
                var p = new Order();
                p.MID = Client.MID;
                p.ID = ID;
                DAL.Update.RefreshOrder(p);
            }
            var Order = DAL.Get.Order(Client.MID, ID);
            if (Order.Status < 10 && Order.ID > 0)
            {
                var Balance = DAL.Get.Balance(Client.MID);
                //余额若已不足以支付订单，刷新订单
                if (Order.Credit > Balance.Amount)
                {
                    DAL.Update.RefreshOrder(Order);
                    Order = DAL.Get.Order(Client.MID, ID);
                }
                ViewData["Order"] = Order;
                ViewData["Balance"] = Balance;
            }
            else
            {
                string Url = string.Format("{0}/Payment/Buy?OrderID={1}&msg={2}", C.APP, Order.OrderID, "Success");
                Response.Redirect(Url);
            }
            return View();
        }

        public ActionResult Pay(int ID)
        {
            string HTML = "";
            var Order = DAL.Get.Order(Client.MID, ID);
            if (Order.Status < 10 && Order.Cash > 0)
            {
                string PayAmount = string.Format("{0}", Math.Round(Order.Cash * 100, 0)); //人币民 分 

                string GateWayUrl = ConfigurationManager.AppSettings.Get("ChinaPay_GateWay_Url");
                string MerId = ConfigurationManager.AppSettings.Get("ChinaPay_Merchant_ID");//商户号
                string BusiId = ""; //业务标识
                string OrdId = Order.OrderID;// com.hooyes.chinapay.Core.getMerSeqId();
                string OrdAmt = PayAmount;//订单金额 (分)
                string CuryId = "156";//币种
                string Version = ConfigurationManager.AppSettings.Get("ChinaPay_Merchant_Version");//版本
                string BgRetUrl = ConfigurationManager.AppSettings.Get("ChinaPay_Notify_Backend_Url");//后台地址
                string PageRetUrl = ConfigurationManager.AppSettings.Get("ChinaPay_Notify_Front_Url");//前台地址
                string GateId = "";//网关

                string Param1 = Client.MID.ToString();//参数 MID
                string Param2 = Order.ID.ToString();//参数   ID
                string Param3 = Client.IDCard;//参数
                string Param4 = "";//参数
                string Param5 = "";//参数
                string Param6 = "";//参数
                string Param7 = "";//参数
                string Param8 = "";//参数
                string Param9 = "";//参数
                string Param10 = "";//参数

                string ShareType = "0001";//分账类型
                string ShareData = string.Format("{0}^{1}", ConfigurationManager.AppSettings.Get("ChinaPay_Merchant_Branch_ID"), PayAmount);//分账数据
                /*
                    ShareData:
                    所有分账数据金额之和必须等于订单金额，且分账方必须存在
                    账户分账格式为：分账方代号^分账金额(分); 分账方代号^分账金额(分);
                    费用分账格式为:  费用类型A^分账金额(分); 费用类型B^分账金额(分);
                 */

                string Priv1 = "";//商户私有域

                string CustomIp = ""; //IP

                string OrdDesc = "开通课程";

                //准备签名的数据
                string plain = MerId + BusiId + OrdId + OrdAmt + CuryId + Version + BgRetUrl + PageRetUrl + GateId + Param1 + Param2 + Param3 + Param4 + Param5 + Param6 + Param7 + Param8 + Param9 + Param10 + ShareType + ShareData + Priv1 + CustomIp;

                string ChkValue = com.hooyes.chinapay.Core.signData(MerId, plain); // 签名

                var sb = new StringBuilder();
                sb.AppendFormat("<html><head><title>{0}</title></head><body>", "请稍等...");
                sb.AppendLine("<form name='hooyesPayForm' method='post' action='" + GateWayUrl + "'>");         //支付地址
                sb.AppendFormat("<input type=\"hidden\" name=\"MerId\" value=\"{0}\" />", MerId);
                sb.AppendFormat("<input type=\"hidden\" name=\"BusiId\" value=\"{0}\" />", BusiId);
                sb.AppendFormat("<input type=\"hidden\" name=\"OrdId\" value=\"{0}\" />", OrdId);
                sb.AppendFormat("<input type=\"hidden\" name=\"OrdAmt\" value=\"{0}\" />", OrdAmt);
                sb.AppendFormat("<input type=\"hidden\" name=\"CuryId\" value=\"{0}\" />", CuryId);
                sb.AppendFormat("<input type=\"hidden\" name=\"Version\" value=\"{0}\" />", Version);
                sb.AppendFormat("<input type=\"hidden\" name=\"BgRetUrl\" value=\"{0}\" />", BgRetUrl);
                sb.AppendFormat("<input type=\"hidden\" name=\"PageRetUrl\" value=\"{0}\" />", PageRetUrl);
                sb.AppendFormat("<input type=\"hidden\" name=\"GateId\" value=\"{0}\" />", GateId);
                sb.AppendFormat("<input type=\"hidden\" name=\"Param1\" value=\"{0}\" />", Param1);
                sb.AppendFormat("<input type=\"hidden\" name=\"Param2\" value=\"{0}\" />", Param2);
                sb.AppendFormat("<input type=\"hidden\" name=\"Param3\" value=\"{0}\" />", Param3);
                sb.AppendFormat("<input type=\"hidden\" name=\"Param4\" value=\"{0}\" />", Param4);
                sb.AppendFormat("<input type=\"hidden\" name=\"Param5\" value=\"{0}\" />", Param5);
                sb.AppendFormat("<input type=\"hidden\" name=\"Param6\" value=\"{0}\" />", Param6);
                sb.AppendFormat("<input type=\"hidden\" name=\"Param7\" value=\"{0}\" />", Param7);
                sb.AppendFormat("<input type=\"hidden\" name=\"Param8\" value=\"{0}\" />", Param8);
                sb.AppendFormat("<input type=\"hidden\" name=\"Param9\" value=\"{0}\" />", Param9);
                sb.AppendFormat("<input type=\"hidden\" name=\"Param10\" value=\"{0}\" />", Param10);
                sb.AppendFormat("<input type=\"hidden\" name=\"ShareType\" value=\"{0}\" />", ShareType);
                sb.AppendFormat("<input type=\"hidden\" name=\"ShareData\" value=\"{0}\" />", ShareData);
                sb.AppendFormat("<input type=\"hidden\" name=\"Priv1\" value=\"{0}\" />", Priv1);
                sb.AppendFormat("<input type=\"hidden\" name=\"OrdDesc\" value=\"{0}\" />", OrdDesc);
                sb.AppendFormat("<input type=\"hidden\" name=\"ChkValue\" value=\"{0}\" />", ChkValue);
                sb.AppendLine("</form><script>");
                sb.AppendLine("document.hooyesPayForm.submit();");
                sb.AppendLine("</script>");
                sb.AppendLine("</body>");
                sb.AppendLine("</html>");

                HTML = sb.ToString();
            }
            else if (Order.Status < 10 && Order.Cash == 0)
            {
                string Url = string.Format("{0}/Payment/OrdersDetail/{1}", C.APP, Order.ID);
                var r = DAL.Update.CommitOrder(Order);
                if (r.Code == 0)
                {
                    Response.Redirect(Url);
                }
                else
                {
                    HTML = "请求错误";
                }
            }
            else
            {
                HTML = "非法请求";
            }
            return Content(HTML);

        }

        public ActionResult OrdersDetail(int ID)
        {
            var Order = DAL.Get.Order(Client.MID, ID);
            ViewData["Order"] = Order;
            return View();
        }

        [HttpPost]
        public ActionResult CreateOrders()
        {
            string Tags = Request["IDS"];
            var p = new Order();
            p.MID = Client.MID;
            p.Tags = Tags;
            p.Memo = Tags;
            var r = DAL.Update.CreateOrder(p);
            if ((r.Code == 0 || r.Code == 1) && r.Value > 0)
            {
                string Url = string.Format("{0}/Payment/Orders/{1}?S={2}&Refresh={3}", C.APP, r.Value, r.Message, r.Code);
                Response.Redirect(Url);
            }

            return Content(string.Empty);
        }

        [HttpPost]
        public JsonResult TopupByCards(string SN)
        {
            var p = new Cards();
            p.SN = SN;
            var r = DAL.Update.BalanceTopupByCards(Client.MID, p);
            return Json(r);
        }

        [HttpPost]
        public JsonResult OrdersData(int ID, int Refresh = 0)
        {
            if (Refresh == 1)
            {
                var p = new Order();
                p.MID = Client.MID;
                p.ID = ID;
                DAL.Update.RefreshOrder(p);
            }
            var Order = DAL.Get.Order(Client.MID, ID);
            var Balance = DAL.Get.Balance(Client.MID);

            var JSON = new { Order = Order, Balance = Balance };

            return Json(JSON);
        }

        [HttpPost]
        public JsonResult ActiveOrders(int ID,string NO, string SN)
        {
            var r = new R();
            var Card = DAL.Get.Cards(NO, SN);
            if (Card.Status == 1)
            {
                #region 卡有效的处理逻辑
                //卡有效
                var p = new Order();
                p.MID = Client.MID;
                p.Tags = ID.ToString();
                p.Memo = ID.ToString();
                var _r = DAL.Update.CreateOrder(p);

                if ((_r.Code == 0 || _r.Code == 1) && _r.Value > 0)
                {
                    //订单生成成功  _r.Value = 返回的内部订单号
                    p.ID = _r.Value;
                    if (_r.Code == 1)
                    {
                        DAL.Update.RefreshOrder(p);
                    }
                    var Order = DAL.Get.Order(Client.MID, _r.Value);
                    // 可以考虑 Card.Amount + Balance.Amount >= Order.Amount
                    if (Card.Amount == Order.Amount)
                    {
                        // 充值
                        var C = new Cards();
                        C.SN = SN;
                        var _r2 = DAL.Update.BalanceTopupByCards(Client.MID, C);
                        if (_r2.Code == 0)
                        {
                            var Balance = DAL.Get.Balance(Client.MID);
                            if (Balance.Amount >= Order.Amount)
                            {
                                DAL.Update.RefreshOrder(p);
                                Order = DAL.Get.Order(Client.MID, _r.Value);
                                r = DAL.Update.CommitOrder(Order);
                                if (r.Code != 0)
                                {
                                    log.Fatal("ActiveOrders.CommitOrder Fail,{0},{1}", Client.MID, ID);
                                }
                                // 订单激活成功！
                            }
                            else
                            {
                                r.Code = 201;
                                r.Message = "Insufficient Balance";

                            }
                        }
                        else
                        {
                            r.Code = 201;
                            r.Message = "充值失败";
                            log.Fatal("ActiveOrders.BalanceTopupByCards Fail,{0},{1}", Client.MID, ID);
                        }
                    }
                    else
                    {
                        r.Code = 102;
                        r.Message = "该卡金额无法激活本订单";
                    }

                }
                else
                {
                    r.Code = 101;
                    r.Message = "订单生成失败";
                }
                #endregion
            }
            else
            {
                //卡无效
                r.Code = 100;
                r.Message = "卡号无效";
                r.Value = Card.Status;
            }

            return Json(r);
        }
    }
}
