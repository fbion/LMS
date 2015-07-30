<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%
        var Products = (List<com.hooyes.lms.Model.Products>)ViewData["Products"];
        int CurrentCateID = (int)ViewData["CateID"];
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

            <div class="category">
                <ul class="category-ul">
                    <li class="cate--1"><a href="/Payment/Buy/-1">所有</a></li>
                    <li class="cate-1"><a href="/Payment/Buy/1">会计类</a></li>
                    <li class="cate-2"><a href="/Payment/Buy/2">审计类</a></li>
                    <li class="cate-3"><a href="/Payment/Buy/3">税务类</a></li>
                    <li class="cate-4"><a href="/Payment/Buy/4">管理类</a></li>
                    <li class="cate-5"><a href="/Payment/Buy/5">金融类</a></li>
                    <li class="cate-0"><a href="/Payment/Buy/0">其他</a></li>
                </ul>
            </div>
            <!-- 买课 -->
            <% if (Products.Count > 0)
               { %>
            <form action="/Payment/CreateOrders" method="post">
                <table id="invoicetb" class="commontb paymenttb paymenttb" style="width: 100%">
                    <tr class="title">
                        <td colspan="4">可以购买的课程</td>
                    </tr>
                    <tr>
                        <th>课程名称</th>
                        <th>价格</th>
                        <th>学习期限</th>
                        <th></th>
                    </tr>
                    <% if (Products.Count == 0)
                       { %>
                    <tr class="emptytr">
                        <td colspan="4">您已购买了全部课程</td>
                    </tr>
                    <%} %>
                    <%
                   foreach (var p in Products)
                   {
                    %>
                    <tr>
                        <td><%=p.Name %></td>
                        <td><%=Math.Round(p.Price, 0)%> 元</td>
                        <td><%=p.Duration %> 个月</td>
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
                <div id="paybanner" class="board board3 paybanner">
                    <div class="paytext">
                        需要支付金额：￥<span id="totalamount" class="orderamount">0</span>
                    </div>
                    <div class="next">
                        <button id="order_next_btn" class="btn-checkout" disabled="disabled" type="submit"></button>
                    </div>
                </div>
                <input id="totalamount_input" type="hidden" value="0" />
            </form>
            <%} %>
        </div>
        <div class="clear">
        </div>
    </div>
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/buy.public.js"></script>
    <script>
        $(function () {
            var CurrentCate= <%=CurrentCateID%>;
            $(".category-ul > li").removeClass("on");
            $(".category-ul > li.cate-<%=CurrentCateID%>").addClass("on");
        });
    </script>
</asp:Content>
