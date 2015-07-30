<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%
        var My_Products = (List<com.hooyes.lms.Model.Products>)ViewData["My_Products"];
        var Products = (List<com.hooyes.lms.Model.Products>)ViewData["Products"];
        var Announcement = (com.hooyes.lms.Model.Announcement)ViewData["Announcement"];
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

            <% if (My_Products.Count > 0)
               { %>
            <table id="Table1" class="commontb paymenttb" style="width: 100%">
                <tr class="title">
                    <td colspan="3">已开通的课程</td>
                </tr>
                <%
                   foreach (var p in My_Products)
                   {
                %>
                <tr>
                    <td><%=p.Name %></td>
                    <%-- <td><%=Math.Round(p.Price, 0)%> 元</td>--%>
                    <% if (p.MyID > 0 && p.ExpireDate > DateTime.Now)
                       { %>

                    <td style="width: 20%">
                        <a href="<% = com.hooyes.lms.C.APP %>/Account/LearningX/<%=p.PID %>">进入课表</a>
                    </td>
                    <%}%>

                    <%if (p.ExpireDate < DateTime.Now)
                      { %>
                    <td style="width: 20%">
                        学习已截止
                    </td>
                    <%} %>
                </tr>
                <%} %>
            </table>
            <div class="clear" style="margin-bottom: 10px">
            </div>
            <%} %>
            <!-- 买课 -->
            <% if (Products.Count > 0)
               { %>
            <form action="CreateOrders" method="post">
                <table id="invoicetb" class="commontb paymenttb paymenttb" style="width: 100%">
                    <tr class="title">
                        <td colspan="3">可以购买的课程</td>
                    </tr>
                    <% if (Products.Count == 0)
                       { %>
                    <tr class="emptytr">
                        <td colspan="3">您已购买了全部课程</td>
                    </tr>
                    <%} %>
                    <%
                   foreach (var p in Products)
                   {
                    %>
                    <tr>
                        <td><%=p.Name %></td>
                        <td><%=Math.Round(p.Price, 0)%> 元</td>
                        <% if (p.MyID == 0)
                           { %>
                        <td style="width: 20%">
                            <input type="hidden" id="t_c_<%=p.ID %>" value="<%=Math.Round(p.Price, 2)%>" />
                            <input name="IDS" type="checkbox" id="c_<%=p.ID %>" class="paymentcb" value="<%=p.ID %>" />

                            <label class="paymentlb" for="c_<%=p.ID %>">选择</label>

                        </td>
                        <%}
                           else
                           { %>
                        <td>
                            <a href="<% = com.hooyes.lms.C.APP %>/Account/Learningx/<%=p.PID %>">已购买</a>
                        </td>
                        <%} %>
                    </tr>
                    <%} %>
                </table>
                <div class="board board3 paybanner">
                    需要支付金额：￥<span id="totalamount" class="orderamount">0</span>
                    <input id="totalamount_input" type="hidden" value="0" />
                    <div class="next">
                        <button id="order_next_btn" disabled="disabled" type="submit">下一步</button>
                    </div>
                </div>
            </form>
            <%} %>

            <!-- inner announcement-->
            <div class="announcement">
                <%=Announcement.Content %>
            </div>
            <!-- inner announcement-->

        </div>
        <div class="clear">
        </div>
    </div>
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/buy-2.js"></script>
</asp:Content>
