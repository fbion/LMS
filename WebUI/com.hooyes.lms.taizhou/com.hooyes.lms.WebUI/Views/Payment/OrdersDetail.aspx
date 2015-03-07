<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        string CDN_Private = ConfigurationManager.AppSettings.Get("CDN_Private");
        string CDN_Public = ConfigurationManager.AppSettings.Get("CDN_Public");
    %>
    <%
        var Order = (com.hooyes.lms.Model.Order)ViewData["Order"];
        string PayStatus = "";
        if (Order.Status == 10)
        {
            PayStatus = "支付成功";
        }
        else if (Order.Status < 10)
        {
            PayStatus = "未完成";
        }
        else
        {
            PayStatus = "订单已取消";
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
            <div class="message">
                <table id="Table1" class="commontb paymenttb" style="width: 100%">
                    <tr class="title">
                        <td colspan="2">您的订单</td>
                    </tr>
                    <tr>
                        <td colspan="2">状态：<span class="strong"><%=PayStatus %></span></td>
                    </tr>
                    <tr>
                        <td colspan="2">订单号：<%=Order.OrderID %></td>
                    </tr>
                    <tr>
                        <td colspan="2"><a href="<%=com.hooyes.lms.C.APP %>/Payment/Buy">查看已购买的课程</a></td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>

</asp:Content>
