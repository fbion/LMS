<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var Orders = (List<com.hooyes.lms.Model.Order>)ViewData["Orders"];
    %>
    <div id="main" class="event-cl">
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
            <div class="board board2">
                我的订单
            </div>
            <div id="Div1" style="margin-top: 5px;">
                <%if (Orders.Count > 0)
                  { %>
                <table class="commontb" style="width: 100%;">
                    <tr>
                        <td>订单编号</td>
                        <td>订单金额</td>
                        <%-- <td>余额支付(激活卡)</td>
                        <td>网银支付</td>--%>
                        <td>状态</td>
                    </tr>
                    <%foreach (var order in Orders)
                      { %>
                    <tr>
                        <td><%=order.OrderID %></td>
                        <td><%=Math.Round(order.Amount,2) %></td>
                        <%--<td><%=Math.Round(order.Credit,2) %></td>
                        <td><%=Math.Round(order.Cash,2) %></td>--%>
                        <td><%if (order.Status == 10)
                              { %>
                            <a href="OrdersView/<%=order.ID %>?S=<%=order.OrderID %>">已完成 </a>
                            <%}
                              else
                              { %>
                            <a href="Orders/<%=order.ID %>?S=<%=order.OrderID %>&Refresh=1">未支付 </a>
                            <%} %>
                        </td>
                    </tr>
                    <%} %>
                </table>
                <%}
                  else
                  {   %>
                <table class="commontb" style="width: 100%;">
                    <tr>
                        <td>无订单</td>
                    </tr>
                </table>
                <%} %>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>

</asp:Content>
