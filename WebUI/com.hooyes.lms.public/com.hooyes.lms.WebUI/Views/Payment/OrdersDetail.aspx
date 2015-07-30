<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var Order = (com.hooyes.lms.Model.Order)ViewData["Order"];
        var Products = (List<com.hooyes.lms.Model.Products>)ViewData["Products"];
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
            <div class="message">
                <table id="Table1" class="commontb paymenttb" style="width: 100%">
                    <tr class="title">
                        <td colspan="2">您的订单</td>
                    </tr>
                    <tr>
                        <td colspan="2">状态：<span class="strong" ><%=PayStatus %></span></td>
                    </tr>
                    <tr>
                        <td colspan="2">订单号：<%=Order.OrderID %></td>
                    </tr>
                    <tr id="ordersdetail">
                        <td colspan="2">
                            <table id="Table2" class="commontb paymenttb paymenttb" style="width: 100%;margin-top:5px;margin-bottom:5px">
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
                                       // originOrderAmount = originOrderAmount + p.Price;
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
                        <td colspan="2"><a href="<%=com.hooyes.lms.C.APP %>/Account/MyProducts">查看已购买的课程</a></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>

</asp:Content>
