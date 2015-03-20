<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        string CDN_Private = ConfigurationManager.AppSettings.Get("CDN_Private");
        string CDN_Public = ConfigurationManager.AppSettings.Get("CDN_Public");
    %>

    <%
        var lt = (List<com.hooyes.lms.Model.Invoice>)ViewData["invoice"];
        var invoice = new com.hooyes.lms.Model.Invoice();
        //if (lt.Count > 0)
        //{
        //    invoice = lt[0];
        //}
        var CashAmount = (com.hooyes.lms.Model.Results)ViewData["CashAmount"];

        var invoice_amount = Math.Round(CashAmount.DecimalValue, 2);
        
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
            <div id="invoicediv">
                <form id="invoiceform" method="post">
                    <input id="IID" name="IID" value="0" type="hidden" />
                    <input id="Text1" name="Amount" type="hidden" value="<%=invoice_amount %>" />

                    <table id="invoicetb" style="width: 100%">

                        <tr>
                            <td style="width: 20%;">可开发票金额：
                            </td>
                            <td>￥ <span class="amount"><%=invoice_amount %></span>
                            </td>
                        </tr>
                        <tr>
                            <td>单位抬头：
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
                            <td>收件人：
                            </td>
                            <td>
                                <input id="Text3" name="Name" class="input required" type="text" maxlength="20" value="<% = invoice.Name %>" />
                            </td>
                        </tr>
                        <tr>
                            <td>电话：
                            </td>
                            <td>
                                <input id="Text4" name="Tel" class="input required" type="text" maxlength="20" value="<% = invoice.Tel %>" />
                            </td>
                        </tr>

                        <tr>
                            <td>邮寄地址：
                            </td>
                            <td>
                                <input id="Text5" name="Address" class="input required" type="text" maxlength="300"
                                    style="width: 400px" value="<% = invoice.Address %>" />
                            </td>
                        </tr>
                        <tr>
                            <td>邮编：
                            </td>
                            <td>
                                <input id="Text6" name="Zip" class="input required" type="text" maxlength="6" value="<% = invoice.Zip %>" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input id="invoice_btn" <% if (CashAmount.DecimalValue <= 0)
                                                           { %>
                                    disabled="disabled" <% }%> type="button" value="提交申请" />
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
            <div class="clear">
            </div>

            <% if (lt.Count > 0)
               { %>
            <div class="board board2">
                已申请的发票
            </div>
            <div id="invoicediv_1">
                <% foreach (var invoice2 in lt)
                   { %>
                <table class="commontb" style="width: 100%; margin-bottom: 10px;">
                    <tr>
                        <td style="width: 20%;">发票金额：
                        </td>
                        <td>
                            <%=Math.Round(invoice2.Amount, 2)%>
                        </td>
                    </tr>
                    <tr>
                        <td>单位抬头：
                        </td>
                        <td>
                            <% = invoice2.Title %>
                        </td>
                    </tr>
                    <tr>
                        <td>收件人：
                        </td>
                        <td>
                            <% = invoice2.Name %>
                        </td>
                    </tr>
                    <tr>
                        <td>电话：
                        </td>
                        <td>
                            <% = invoice2.Tel %>
                        </td>
                    </tr>

                    <tr>
                        <td>邮寄地址：
                        </td>
                        <td>
                            <% = invoice2.Address %>
                        </td>
                    </tr>
                    <tr>
                        <td>邮编：
                        </td>
                        <td>
                            <% = invoice2.Zip %>
                        </td>
                    </tr>
                </table>
                <% }%>
            </div>
            <div class="clear">
            </div>
            <% } %>

            <script src="<% = CDN_Public %>/jquery-validate/1.9.0/jquery.validate.min.js" type="text/javascript"></script>
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
            </script>

        </div>
    </div>
</asp:Content>
