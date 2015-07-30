<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var invoice = (com.hooyes.lms.Model.Invoice)ViewData["invoice"];
        string act = (string)ViewData["act"];
        var has_invoice = !string.IsNullOrEmpty(invoice.IDSN);
        var edit_invoice = (act == "edit");
        var invoice_amount = 80;
        bool CurrentYear = false;
        if (com.hooyes.lms.Client.Year == DateTime.Now.Year)
        {
            invoice_amount = 40;
            CurrentYear = true;
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
            <div class="board board2">
                申请发票
            </div>
            <% if (has_invoice && !edit_invoice)
               { %>
            <div id="invoicediv">
                <table id="invoicetb" style="width: 100%">
                    <tr>
                        <td style="width: 20%">
                            学员代码：
                        </td>
                        <td>
                            <%= com.hooyes.lms.Client.IDSN %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            继续教育地区：
                        </td>
                        <td>
                            河南省 [<%= com.hooyes.lms.Client.Year %>]
                        </td>
                    </tr>
                    <tr>
                        <td>
                            发票金额：
                        </td>
                        <td>
                            <% = invoice.Amount %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            单位抬头：
                        </td>
                        <td>
                            <% = invoice.Title %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            收件人：
                        </td>
                        <td>
                            <% = invoice.Name %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            电话：
                        </td>
                        <td>
                            <% = invoice.Tel %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            城市：
                        </td>
                        <td>
                            <% = invoice.City %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            邮寄地址：
                        </td>
                        <td>
                            <% = invoice.Address %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            邮编：
                        </td>
                        <td>
                            <% = invoice.Zip %>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="clear">
            </div>
            <% }
               else
               { %>
            <div id="invoicediv">
                <form id="invoiceform" method="post">
                <input id="IID" name="IID" value="0" type="hidden" />
                <table id="invoicetb" style="width: 100%">
                    <tr>
                        <td style="width: 20%">
                            学员代码：
                        </td>
                        <td>
                            <%= com.hooyes.lms.Client.IDSN %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            继续教育地区：
                        </td>
                        <td>
                            河南省 [<%= com.hooyes.lms.Client.Year %>]
                        </td>
                    </tr>
                    <tr>
                        <td>
                            发票金额：
                        </td>
                        <td>
                           <%-- <input id="Text1" name="Amount" class="input required" type="text" maxlength="6"
                                value="<%=invoice_amount %>"  />--%>
                            <input name="Amount" type="radio" value="<%=invoice_amount %>" class="required" checked="checked" /> <%=invoice_amount %>元
                            <%if(!CurrentYear){ %>
                            <input name="Amount" type="radio" value="80" class="required" /> 80元
                            <%} %>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            单位抬头：
                        </td>
                        <td>
                        <%
                   if (string.IsNullOrEmpty(invoice.Title))
                   {
                       invoice.Title = "定额";
                   }
                         %>
                            <input id="Text2" name="Title" class="input required" type="text" maxlength="100"
                                value="<% = invoice.Title %>" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            收件人：
                        </td>
                        <td>
                            <input id="Text3" name="Name" class="input required" type="text" maxlength="20" value="<% = invoice.Name %>" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            电话：
                        </td>
                        <td>
                            <input id="Text4" name="Tel" class="input required" type="text" maxlength="20" value="<% = invoice.Tel %>" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            城市：
                        </td>
                        <td>
                            <select name="city">
                                <option>郑州市</option>
                                <option>开封市</option>
                                <option>洛阳市</option>
                                <option>平顶山市</option>
                                <option>安阳市</option>
                                <option>鹤壁市</option>
                                <option>新乡市</option>
                                <option>焦作市</option>
                                <option>濮阳市</option>
                                <option>许昌市</option>
                                <option>漯河市</option>
                                <option>三门峡市</option>
                                <option>南阳市</option>
                                <option>商丘市</option>
                                <option>信阳市</option>
                                <option>周口市</option>
                                <option>驻马店市</option>
                                <option>其它</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            邮寄地址：
                        </td>
                        <td>
                            <input id="Text5" name="Address" class="input required" type="text" maxlength="300"
                                style="width: 400px" value="<% = invoice.Address %>" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            邮编：
                        </td>
                        <td>
                            <input id="Text6" name="Zip" class="input required" type="text" maxlength="6" value="<% = invoice.Zip %>" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input id="invoice_btn" type="button" value="提交申请" />
                        </td>
                    </tr>
                </table>
                </form>
            </div>
            <div class="clear">
            </div>
            <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/jquery.validate.min.js" type="text/javascript"></script>
            <script type="text/javascript">
                function ApplyInvoice() {
                    $.ajax({
                        url: AccountController + "Invoice",
                        type: "POST",
                        data: $("#invoiceform").serialize(),
                        dataType: "json",
                        success: function (data) {
                            if (data.Code == 0) {
                                $("#IID").val(data.Value);
                                alert("提交成功");
                                window.location = AccountController + "Invoice?show";
                            } else {
                                alert("请重试");
                            }
                        },
                        error: function () {

                        }
                    });
                }
                var cnmsg = {
                    required: "必填"
                };
                $.extend($.validator.messages, cnmsg);
                $("#invoiceform").validate();
                $("#invoice_btn").click(function () {
                    if ($("#invoiceform").valid()) {
                        ApplyInvoice();
                    }
                });

                //$("input[name='Amount'][value='<%=invoice_amount%>']").attr("checked", "checked");
            </script>
            <%} %>
        </div>
    </div>
</asp:Content>
