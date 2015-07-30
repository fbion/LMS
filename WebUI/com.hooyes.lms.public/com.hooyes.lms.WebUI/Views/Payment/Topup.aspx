<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        string CDN_Private = ConfigurationManager.AppSettings.Get("CDN_Private");
        string CDN_Public = ConfigurationManager.AppSettings.Get("CDN_Public");
    %>
    <%
                    //var Balance = (com.hooyes.lms.Model.Balance)ViewData["Balance"];
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
            <%-- <div class="blance-sum">
            <ul>
            <li><strong>可用余额</strong></li>
            <li>￥<span id="orderamout" class="amount"><%=Math.Round(Balance.Amount, 2)%></span></li>
            <li class="topup-li"><a href="Topup">充值</a></li>
            </ul>
        </div>--%>
            <div class="topup-detail">
                <div class="t">充值卡充值</div>
                <div class="l">
                    充值卡号：<input id="card_sn" type="text" value="" maxlength="18" />
                    <button class="shortbtn" type="button" id="card_btn">充值</button>
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>

    <script src="<% = CDN_Private %>/Scripts/topup.public.js"></script>
</asp:Content>
