<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var member = (com.hooyes.lms.Model.Member)ViewData["member"];
        var Invoices = (List<com.hooyes.lms.Model.Invoice>)ViewData["Invoices"];
        var Orders = (List<com.hooyes.lms.Model.Order>)ViewData["Orders"];
        var Cert = (com.hooyes.lms.Model.Certificate)ViewData["Cert"];
        var Reports = (List<com.hooyes.lms.Model.Report>)ViewData["Reports"];
    %>
    <h2>学员信息</h2>
    <div id="viewdiv">
        <table id="Table1" class="commontb">
            <tr class="title-1">
                <td style="width: 20%;">姓名
                </td>
                <td>
                    <%= member.Name %>
                </td>
            </tr>
            <tr>
                <td>身份证号
                </td>
                <td>
                    <%= member.IDCard %>
                </td>
            </tr>
            <tr>
                <td>区域代码
                </td>
                <td>
                    <%= member.RegionCode %>
                </td>
            </tr>
            <tr>
                <td style="width: 20%;">用户名
                </td>
                <td>
                    <%= member.Login %> 
                </td>
            </tr>
            <tr>
                <td>密码
                </td>
                <td>********* (默认为姓名)
                </td>
            </tr>
           
           <%-- <tr>
                <td colspan="2">
                    <button class="flatbtn" id="edit_btn_1" type="button">修改</button>
                </td>

            </tr>--%>
        </table>
    </div>
    <div id="editdiv" class="none">
        <form id="form1" action="" method="post">
            <input type="hidden" value="<%=member.MID %>" name="MID" />
            <input id="Text_Login" name="Login" type="hidden" class="required" value="<%= member.Login %>" />
            <%--<input id="Text_Password" name="Password" type="hidden" class="required" value="<%= member.Name %>" />--%>
            <table id="Table2" class="commontb">
                <tr>
                    <td style="width: 20%;">姓名
                    </td>
                    <td>
                        <input id="Text_Name" name="Name" type="text" maxlength="15" class="required" value="<%= member.Name %>" />
                    </td>
                </tr>
                <tr>
                    <td>身份证号
                    </td>
                    <td>
                        <input id="Text_IDCard" name="IDCard" type="text" maxlength="20" class="required" value="<%= member.IDCard %>" />
                    </td>
                </tr>

                <tr>
                    <td>区域代码
                    </td>
                    <td>
                        <input id="Text3" name="RegionCode" type="text" maxlength="10" class="required number" value="<%= member.RegionCode %>" />
                    </td>
                </tr>
                <tr>
                    <td>用户名
                    </td>
                    <td>
                        <input id="Text_Login_1" type="text" maxlength="20" class="required" disabled="disabled" value="<%= member.Login %>" />
                        (默认为身份证号)
                    </td>
                </tr>
                <tr>
                    <td style="width: 20%;">密码
                    </td>
                    <td>
                        <input id="Text_Password" name="Password" type="text" maxlength="15" class="" value="" />
                        (默认为姓名，若不修改请留空)
                    </td>
                </tr>
                
                <tr>
                    <td colspan="2">
                        <button class="flatbtn" id="edit_btn_2" type="button">取消</button>
                        <button class="flatbtn" id="edit_btn_3" type="button">提交</button>
                    </td>

                </tr>
            </table>
        </form>
    </div>
    <div id="Div2" style="margin-top: 5px;">
        <h2>课程</h2>
        <table class="commontb" style="width: 100%;">
            <% if (Reports.Count > 0)
               { %>
            <tr>
                <td>年份</td>
                <td>已学课时</td>
                <td>成绩</td>
            </tr>
            <%foreach (var r in Reports)
              { %>
            <tr>
                <td>
                    <% = r.Year %> 年
                </td>
                <td>
                    <a href="ViewCourses?MID=<%= r.MID%>&year=<% = r.Year %>&type=0" target="_blank">
                        <%= Math.Round(r.Minutes,0) %>
                    分钟 </a>
                </td>
                <td><% =r.Score %></td>
            </tr>
            <%} %>
            <%}
               else
               { %>
            <tr>
                <td style="width: 20%;">课程：
                </td>
                <td>未开通</td>
            </tr>
            <%} %>
            <tr>
                <td style="width: 20%;">合格证书编号：
                </td>
                <td colspan="2">
                    <%if (Cert.ID > 0)
                      { %>
                    <%= Cert.ID %>
                    <%}
                      else
                      { %>
                    未获得
                    <%} %>

                </td>
            </tr>
        </table>
    </div>
    <div id="invoicediv1" style="margin-top: 5px;">
        <h2>发票</h2>
        <% if (Invoices.Count > 0)
           { %>

        <table class="commontb" style="width: 100%;">
            <tr>
                <td>发票抬头</td>
                <td>金额</td>
                <td>收件人</td>
                <td>电话</td>
                <td>地址</td>
                <td>邮编</td>
            </tr>
            <% foreach (var invoice2 in Invoices)
               { %>
            <tr>
                <td>
                    <a href="ViewInvoice?MID=<%=member.MID%>&IID=<%=invoice2.IID %>&Year=0" target="_blank">
                        <% = invoice2.Title %>
                    </a>
                </td>
                <td><%=Math.Round(invoice2.Amount, 2)%></td>
                <td><% = invoice2.Name %></td>
                <td><% = invoice2.Tel %></td>
                <td><% = invoice2.Address %></td>
                <td><% = invoice2.Zip %></td>
            </tr>

            <% }%>
        </table>
        <% }
           else
           { %>
        <table class="commontb" style="width: 100%;">
            <tr>
                <td>未申请</td>
            </tr>
        </table>
        <%} %>
    </div>
    <div id="Div1" style="margin-top: 5px;">
        <h2>订单</h2>
        <%if (Orders.Count > 0)
          { %>
        <table class="commontb" style="width: 100%;">
            <tr>
                <td>订单编号</td>
                <td>订单金额</td>
                <td>余额支付(激活卡)</td>
                <td>网银支付</td>
                <td>状态</td>
            </tr>
            <%foreach (var order in Orders)
              { %>
            <tr>
                <td><%=order.OrderID %></td>
                <td><%=Math.Round(order.Amount,2) %></td>
                <td><%=Math.Round(order.Credit,2) %></td>
                <td><%=Math.Round(order.Cash,2) %></td>
                <td><%if (order.Status == 10)
                      { %>
                支付成功
                <%}
                      else
                      { %>
                未支付
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

    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            var cnmsg = {
                required: "必填",
                number: "请输入数字"
            };
            $.extend($.validator.messages, cnmsg);
            $("#form1").validate();


            $("#edit_btn_1").click(function () {
                $("#viewdiv").hide();
                $("#editdiv").show();
            });

            $("#edit_btn_2").click(function () {
                $("#viewdiv").show();
                $("#editdiv").hide();

            });

            $("#edit_btn_3").click(function () {
                if ($("#Text_Login").val() == "") {
                    $("#Text_Login").val($("#Text_IDCard").val());
                }
                //if ($("#Text_Password").val() == "") {
                //    $("#Text_Password").val($("#Text_Name").val());
                //}
                if ($("#form1").valid()) {
                    ApplyUpdateMember();
                }
            });
        });

        var MasterController = AppRoot + "Master/";
        function ApplyUpdateMember() {
            $.ajax({
                url: MasterController + "UpdateMember",
                type: "POST",
                data: $("#form1").serialize(),
                dataType: "json",
                success: function (data) {
                    if (data.Code == 0) {
                        alert("修改成功");
                        window.location.href = MasterController + "ViewMember?MID=" + data.Value + "&" + new Date().valueOf();
                    } else {
                        alert("提交错误，请重试");
                    }
                },
                error: function () {

                }
            });
        }
    </script>
</asp:Content>
