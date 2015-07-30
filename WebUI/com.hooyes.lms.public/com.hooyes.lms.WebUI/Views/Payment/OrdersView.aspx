<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        string CDN_Private = ConfigurationManager.AppSettings.Get("CDN_Private");
        string CDN_Public = ConfigurationManager.AppSettings.Get("CDN_Public");
    %>
    <%
        var Order = (com.hooyes.lms.Model.Order)ViewData["Order"];
        var Balance = (com.hooyes.lms.Model.Balance)ViewData["Balance"];
        var Products = (List<com.hooyes.lms.Model.Products>)ViewData["Products"];
        decimal originOrderAmount = 0;
        string PayStatus = "";
        if (Order.Status == 10)
        {
            PayStatus = "支付成功";
        }
        else if (Order.Status < 10)
        {
            PayStatus = "未完成";
        }
        else
        {
            PayStatus = "订单已取消";
        }
    %>
    <div id="main">
        <div id="left">
            <div class="login">
                <% Html.RenderPartial("LogOnUserControl"); %>
            </div>
            <div class="expl">
                <div class="hotline">
                </div>
            </div>
        </div>
        <div id="right">
            <!-- Tip -->
            <div id="OverLay" class="OverLay none">
                <div id="PayOverlay" class="PayOverlay">
                </div>
                <div id="PayOverlay_tip" class="PayOverlay_tip">
                    <div class="PayOverlay_tip_btn">
                        <h3>正在网上银行支付...</h3>
                        <hr />
                        <span class="pspt">请在新开网银页面完成支付后选择：</span><br />
                        <br />
                        <button type="button" id="pay_check_success">支付成功</button>
                        &nbsp;&nbsp;
                    <button type="button" id="pay_check_fail">支付遇到问题，重新支付</button>
                    </div>
                </div>
            </div>
            <!-- Tip -->
            <%--<div class="board board2">
                确认订单
            </div>--%>
            <form id="OrderForm" action="<% = com.hooyes.lms.C.APP %>/Payment/Pay" method="post" target="_blank" onsubmit="return ShowTip();">
                <input type="hidden" id="ID" name="ID" value="<%=Order.ID %>" />
                <input type="hidden" id="OrderID" name="OrderID" value="<%=Order.OrderID %>" />
                <input type="hidden" id="cashamount_input" value="<%=Math.Round(Order.Cash, 2)%>" />
                <table id="invoicetb" class="paymenttb" style="width: 100%">
                    <tr>
                        <td colspan="2">状态：<span class="strong" ><%=PayStatus %></span></td>
                    </tr>
                    <tr>
                        <td colspan="2">订单号：<%=Order.OrderID %></td>
                    </tr>
                    <tr id="ordersdetail">
                        <td colspan="2">
                            <table id="Table1" class="commontb paymenttb paymenttb" style="width: 100%;margin-top:5px;margin-bottom:5px">
                                <tr>
                                    <th>课程名称</th>
                                    <th>价格</th>
                                    <th>学习期限</th>
                                </tr>
                                <% if (Products.Count == 0)
                                   { %>
                                <tr class="emptytr">
                                    <td colspan="4">你没有选择课程</td>
                                </tr>
                                <%} %>
                                <%
                                    foreach (var p in Products)
                                    {
                                        originOrderAmount = originOrderAmount + p.Price;
                                %>
                                <tr>
                                    <td><%=p.Name %></td>
                                    <td><%=Math.Round(p.Price, 0)%> 元</td>
                                    <td style="width:30.5%"><%=p.Duration %> 个月</td>
                                </tr>
                                <%} %>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:right">订单金额：
                        </td>
                        <td style="width:31%">
                            ￥<span id="orderamout" class="amount"><%=Math.Round(Order.Amount, 2)%></span>
                            <%if(originOrderAmount>Order.Amount){ %>
                             &nbsp;(原价 <del>￥<%=Math.Round(originOrderAmount,2) %> </del>)
                            <%} %>
                        </td>
                    </tr>
                    <%-- <tr>
                        <td>学习卡支付：
                        </td>
                        <td>
                            -￥  <span id="Span1" class="amount"> <%=Math.Round(Order.Credit, 2)%></span>
                        </td>
                    </tr>--%>
                    <tr>
                        <td style="text-align:right">余额支付：
                        </td>
                        <td>-￥<span id="creditamout" class="amount"> <%=Math.Round(Order.Credit, 2)%></span>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:right">应付总额：
                        </td>
                        <td>￥  <span id="cashamount" class="orderamount"><%=Math.Round(Order.Cash, 2)%> </span>
                        </td>
                    </tr>
                    <%--  <tr>
                        <td colspan="2">账户余额：￥<span id="balance" class="amount"><%=Math.Round(Balance.Amount, 2)%></span>
                            <span id="guidcard" class="guidcard"><a id="aguidcard" href="javascript:void(0)">使用充值卡,充值</a></span>
                        </td>

                    </tr>--%>
                    <tr id="c_car_tr" class="none">
                        <td colspan="2">充值卡号：
                            <input id="card_sn" type="text" value="" maxlength="18" />
                            <button class="shortbtn" type="button" id="card_btn">充值</button>
                        </td>
                    </tr>
                </table>
               <%-- <div class="board board3 paybanner paybanner2">
                   <%if(Order.Status==10){ %>
                    <div class="next nextpay">
                        订单已完成
                    </div>
                    <%}else{ %>
                    <div class="next nextpay">
                        <button id="pay_btn_2" onclick="Pay2()" type="button">快捷支付(无需开通网银)</button>
                    </div>
                    <div class="next nextpay">
                        <button type="submit">网上银行付款</button>
                    </div>
                    <div class="next blancepay none">
                        <button type="submit">提交完成订单</button>
                    </div>
                    <%} %>
                </div>--%>
            </form>
        </div>
        <div class="clear">
        </div>
    </div>
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/payment.js"></script>
    <script type="text/javascript">
        function Pay2() {
            var newAction = "<% = com.hooyes.lms.C.APP %>/Payment/Pay2";
            $("#OrderForm").attr("action", newAction);
            $("#OrderForm").submit();
        }
        SwithPaymentBtn(<%=Order.Cash%>);
    </script>
</asp:Content>
