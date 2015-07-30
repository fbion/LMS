<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MobileSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        string CDN_Private = ConfigurationManager.AppSettings.Get("CDN_Private");
        string CDN_Public = ConfigurationManager.AppSettings.Get("CDN_Public");
%>
    <div class="banner">
        <img src="<%=CDN_Private %>/img/mobile-header-bg.jpg" />
    </div>
    <ul class="cate-ul">
        <li><a onclick="GoLink(1,'')">1、关于开展2015年度会计人员继续教育的通知</a></li>
        <li><a onclick="GoLink(2,'')">2、成都市2015年度会计人员继续教育学习流程</a></li>
    </ul>
    <script type="text/javascript" src="http://static.nai.hooyes.com/scripts/jsb/jsb.js"></script>
    <script>
        function GoLink(id, title) {
            jsb.require('nextPage', { 'CID': id, 'Title': title }, function (response) {
                //alert('调用messagebox回来啦\n' + JSON.stringify(response));
            });
        }
        function GoSearch() {
            var keyword = document.getElementById("search_text").value;
            jsb.require('nextSearch', { 'keyword': keyword }, function (response) {
                //alert('调用messagebox回来啦\n' + JSON.stringify(response));
            });
        }
    </script>
</asp:Content>
