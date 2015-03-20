<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        string CDN_Private = ConfigurationManager.AppSettings.Get("CDN_Private");
        string CDN_Public = ConfigurationManager.AppSettings.Get("CDN_Public");
    %>
    <%
        var My_Products = (List<com.hooyes.lms.Model.Products>)ViewData["My_Products"];
        var Products = (List<com.hooyes.lms.Model.Products>)ViewData["Products"];
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
            <div class="clear" style="margin-bottom: 10px">
            </div>
            <%} %>
            <!-- 买课 -->
            <% if (Products.Count > 0)
               { %>
            <form action="CreateOrders" method="post">
                <table id="invoicetb" class="commontb paymenttb" style="width: 100%">
                    <tr class="title">
                        <td colspan="3">未激活的课程</td>
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
                        <td style="width: 20%">
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
                            <ul class="tr-act-ul">
                                <li class="h"><%=p.Name %></li>
                                <li>
                                  <span style="display:none"> 卡号：<input type="text" id="code_<%=p.ID %>" name="code" value="" maxlength="20" class="act-input" />
                                  </span> 
                                    激活卡密码：
                                    <input id="input_1_<%=p.ID %>" type="text" maxlength="19" class="act-input-4" onkeyup="toNext(1,<%=p.ID %>);pasteIt(this,<%=p.ID %>)" onblur="pasteIt(this,<%=p.ID %>)" oninput="pasteIt(this,<%=p.ID %>)"  onkeydown="toCheck(1,<%=p.ID %>)"  />
                                    <input type="text" maxlength="1" class="act-input-1" value="-" readonly="readonly" />
                                    <input id="input_2_<%=p.ID %>" type="text" maxlength="4" class="act-input-4" onkeyup="toNext(2,<%=p.ID %>);toPrevious(2,<%=p.ID %>)" />
                                    <input type="text" maxlength="1" class="act-input-1" value="-" readonly="readonly" />
                                    <input id="input_3_<%=p.ID %>" type="text" maxlength="4" class="act-input-4" onkeyup="toNext(3,<%=p.ID %>);toPrevious(3,<%=p.ID %>)" />
                                    <input type="text" maxlength="1" class="act-input-1" value="-" readonly="readonly" />
                                    <input id="input_4_<%=p.ID %>" type="text" maxlength="4" class="act-input-4" onkeyup="toPrevious(4,<%=p.ID %>)" />
                                    <button class="act-btn" onclick="SubmitActiveOrders(<%=p.ID %>)" type="button">激活</button>
                                    <button class="act-btn-c" onclick="HideBox(<%=p.ID %>)" type="button">取消</button>
                                </li>
                            </ul>

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
    <script src="<% = CDN_Private %>/Scripts/buy.act.1.js"></script>
    <script>
        function toNext(a, b) {
            var id = "#input_" + a + "_" + b;
            if ($(id).val().length == 4) {
                $("#input_" + (a + 1) + "_" + b).focus();
            }

        }

        function toCheck(a, b) {
            var id = "#input_" + a + "_" + b;
            var e = e || event;
            var cuurKey = e.keyCode || e.which || e.charCode;
            if (!(cuurKey == 8 || cuurKey == 46) && $(id).val().length >= 4) {
                $("#input_" + (a + 1) + "_" + b).focus();
            }
        }

        function toPrevious(a, b) {
            var id = "#input_" + a + "_" + b;
            var obj = $(id);
            var e = e || event;
            var cuurKey = e.keyCode || e.which || e.charCode;
            if ((cuurKey == 8 || cuurKey == 46) && obj.val().length == 0) {

                $("#input_" + (a - 1) + "_" + b).focus();
                $("#input_" + (a - 1) + "_" + b).val($("#input_" + (a - 1) + "_" + b).val());
            }
        }
        function pasteIt(obj, b) {
            if (obj.value.length > 4) {
                var temp = obj.value;
                obj.value = temp.substr(0, 4);
                var arr = temp.split("-");
                if (arr.length == 4) {
                    $("#input_2_" + b).val(arr[1]);
                    $("#input_3_" + b).val(arr[2]);
                    $("#input_4_" + b).val(arr[3]);
                }
            }
        }
    </script>
</asp:Content>
