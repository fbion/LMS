<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%
        var My_Products = (List<com.hooyes.lms.Model.Products>)ViewData["My_Products"];
        //var Products = (List<com.hooyes.lms.Model.Products>)ViewData["Products"];
        var Products = new List<com.hooyes.lms.Model.Products>(); // 暂时不显示可以激活的课程 2014-09-05
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

            <% if (My_Products.Count > 0)
               { %>
            <table id="Table1" class="commontb paymenttb" style="width: 100%">
                <tr class="title">
                    <td colspan="3">已激活的课程</td>
                </tr>
                <%
                   foreach (var p in My_Products)
                   {
                %>
                <tr>
                    <td><%=p.Name %></td>
                    <%-- <td><%=Math.Round(p.Price, 0)%> 元</td>--%>
                    <% if (p.MyID > 0)
                       { %>

                    <td style="width: 20%">
                        <a href="<% = com.hooyes.lms.C.APP %>/Account/LearningX/<%=p.PID %>">进入课表</a>
                    </td>
                    <%} %>
                </tr>
                <%} %>
            </table>
               <div class="clear" style="margin-bottom:10px">
            </div>
            <%} %>
            <!-- 买课 -->
            <% if (Products.Count > 0)
               { %>
            <form action="CreateOrders" method="post">
                <table id="invoicetb" class="commontb paymenttb" style="width: 100%">
                    <tr class="title">
                        <td colspan="3">可以激活的课程</td>
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
                    <tr class="tr1-act" id="tr1_act_<%=p.ID %>">
                        <td><%=p.Name %>
                        </td>
                       
                        <% if (p.MyID == 0)
                           { %>
                        <td style="width:20%">
                            <input type="hidden" id="t_c_<%=p.ID %>" value="<%=Math.Round(p.Price, 2)%>" />
                            <input name="IDS" type="radio" id="c_<%=p.ID %>" class="paymentcb" value="<%=p.ID %>" />

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
                    <tr class="tr-act none" id="tr_act_<%=p.ID %>">
                        <td colspan="2">
                            激活码：<input type="text" id="code_<%=p.ID %>" name="code" value="" maxlength="15" class="act-input" /> <button class="act-btn" onclick="SubmitActiveOrders(<%=p.ID %>)" type="button">激活</button>
                        </td>
                    </tr>
                    <%} %>
                </table>
                <div class="board board3 paybanner none">
                    需要支付金额：￥<span id="totalamount" class="orderamount">0</span>
                    <input id="totalamount_input" type="hidden" value="0" />
                    <div class="next">
                        <button id="order_next_btn" disabled="disabled" type="submit">下一步</button>
                    </div>
                </div>
            </form>
            <%} %>
        </div>
        <div class="clear">
        </div>
    </div>
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/buy.js"></script>
</asp:Content>
