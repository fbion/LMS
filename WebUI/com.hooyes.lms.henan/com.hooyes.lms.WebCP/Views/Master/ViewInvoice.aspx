<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var MID = Convert.ToInt32(Request.QueryString.Get("MID"));
        var invoice = com.hooyes.lms.DAL.Get.Invoice(MID);
       
    %>
    <h2>发票信息</h2>
    <% Html.RenderPartial("MemberCard"); %>
    <div id="invoicediv_show">
        <table id="invoicetb" style="width: 100%">
            <tr>
                <td style="width: 20%">报名序号：
                </td>
                <td>
                    <%= invoice.IDSN %>
                </td>
            </tr>
            <%--          <tr>
            <td>
                发票序号
            </td>
            <td>
                <%= invoice.IID %>
            </td>
        </tr>--%>
            <tr>
                <td>汇款金额：
                </td>
                <td>
                    <% = invoice.Amount %>
                </td>
            </tr>
            <tr>
                <td>单位抬头：
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
                <td>城市：
                </td>
                <td>
                    <% = invoice.City %>
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

                    <input id="invoice_btn_edit" type="button" value="修改" />

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
            <input id="IID" name="IID" value="0" type="hidden" />
            <input id="MID" name="MID" value="<%=MID %>" type="hidden" />
            <input id="IDSN" name="IDSN" value="<%=invoice.IDSN %>" type="hidden" />
            <table id="Table1" class="commontb" style="width: 100%">
                <tr>
                    <td style="width: 20%">报名序号：
                    </td>
                    <td>
                        <%= invoice.IDSN %>
                    </td>
                </tr>

                <tr>
                    <td>汇款金额：
                    </td>
                    <td>
                        <input id="Text1" name="Amount" class="input required" type="text" maxlength="6"
                            value="<%=invoice.Amount %>" />
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
                    <td>城市：
                    </td>
                    <td>
                        <select id="city" name="city">
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
                        <input id="invoice_btn_cancel" type="button" value="取消" />
                        <input id="invoice_btn" type="button" value="提交修改" />
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

            $("#city").val("<%=invoice.City%>");

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
