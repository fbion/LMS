<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var MID = Convert.ToInt32(Request.QueryString.Get("MID"));
        var IID = Convert.ToInt32(Request.QueryString.Get("IID"));
        var invoice = com.hooyes.lms.DAL.Get.Invoice(MID, IID);
       
    %>
    <h2>发票信息</h2>

    <div id="invoicediv_show">
        <table id="invoicetb" style="width: 100%">

            <tr>
                <td style="width: 100px;">发票金额：
                </td>
                <td>
                    <% = Math.Round( invoice.Amount,2) %>
                </td>
            </tr>
            <tr>
                <td>发票抬头：
                </td>
                <td>
                    <% = invoice.Title %>
                </td>
            </tr>
            <tr>
                <td>收件人：
                </td>
                <td>
                    <% = invoice.Name %>
                </td>
            </tr>
            <tr>
                <td>电话：
                </td>
                <td>
                    <% = invoice.Tel %>
                </td>
            </tr>
            <tr>
                <td>邮寄地址：
                </td>
                <td>
                    <% = invoice.Address %>
                </td>
            </tr>
            <tr>
                <td>邮编：
                </td>
                <td>
                    <% = invoice.Zip %>
                </td>
            </tr>
            <tr>
                <td>申请时间：
                </td>
                <td>
                    <% = invoice.CreateDate>DateTime.MinValue ? invoice.CreateDate.ToString("yyyy-MM-dd HH:mm:ss") : ""%>
                </td>
            </tr>
            <%
                if (com.hooyes.lms.Client.CheckTag(8))
                { %>
            <tr>
                <td colspan="2">

                    <button id="invoice_btn_edit" class="flatbtn" type="button">修改</button>

                </td>
            </tr>
            <%} %>
        </table>
    </div>
    <%
        if (com.hooyes.lms.Client.CheckTag(8))
        { %>
    <div id="invoicediv_edit" class="none">
        <form id="invoiceform" method="post">
            <input id="IID" name="IID" value="<%=IID %>" type="hidden" />
            <input id="MID" name="MID" value="<%=MID %>" type="hidden" />
            <input id="IDSN" name="IDSN" value="<%=invoice.IDSN %>" type="hidden" />
            <table id="Table1" class="commontb" style="width: 100%">


                <tr>
                    <td style="width: 100px;">发票金额：
                    </td>
                    <td>
                        <input id="Text1" name="Amount" class="input required" type="text" maxlength="6"
                            value="<%=Math.Round( invoice.Amount,2) %>" />
                    </td>
                </tr>
                <tr>
                    <td>发票抬头：
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
                    <td>申请时间：
                    </td>
                    <td>
                        <% = invoice.CreateDate>DateTime.MinValue ? invoice.CreateDate.ToString("yyyy-MM-dd HH:mm:ss") : ""%>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button class="flatbtn" id="invoice_btn_cancel" type="button">取消</button>
                        <button class="flatbtn" id="invoice_btn" type="button">提交修改</button>
                    </td>
                </tr>
            </table>
        </form>
        <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/jquery.validate.min.js" type="text/javascript"></script>
        <script type="text/javascript">
            var MasterController = AppRoot + "Master/";
            function ApplyInvoice() {
                $.ajax({
                    url: MasterController + "Invoice",
                    type: "POST",
                    data: $("#invoiceform").serialize(),
                    dataType: "json",
                    success: function (data) {
                        if (data.Code == 0) {
                            $("#IID").val(data.Value);
                            //alert("提交成功");
                            $("#invoice_btn").removeAttr("disabled");
                            window.location = window.location.href;
                        } else {
                            alert("提交错误，请重试");
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
                    $("#invoice_btn").attr("disabled", "disabled");
                    ApplyInvoice();
                }
            });



            $(function () {
                $("#invoice_btn_edit").click(function () {

                    $("#invoicediv_show").hide();
                    $("#invoicediv_edit").show();

                });

                $("#invoice_btn_cancel").click(function () {

                    $("#invoicediv_show").show();
                    $("#invoicediv_edit").hide();

                });
            });
        </script>
    </div>

    <%} %>
</asp:Content>
