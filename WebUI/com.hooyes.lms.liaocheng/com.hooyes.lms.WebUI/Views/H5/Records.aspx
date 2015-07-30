<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MobileSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        string CDN_Private = ConfigurationManager.AppSettings.Get("CDN_Private");
        string CDN_Public = ConfigurationManager.AppSettings.Get("CDN_Public");
    %>
    <%
        var report = (com.hooyes.lms.Model.Report)ViewData["Report"];
    %>
    <ul class="record-ul">
        <li class="title"><%=report.Year %>年度学习记录</li>
        <li class="c">已学习： <%=report.Minutes %> 分钟</li>
        <li class="c">考试成绩： <%=report.Score %> 分</li>
        <li class="c">结业状态： <% if (report.Status == 1)
                    { %>已结业 <%}
                    else
                    { %>未结业<%} %></li>

        <li class="exam-join">
            <button class="exam-join-btn" onclick="JoinExam(<%=report.Year %>,<%=report.MID %>)" type="button">参加考试</button>
        </li>
    </ul>
    <script type="text/javascript" src="http://static.nai.hooyes.com/scripts/jsb/jsb.js"></script>
    <script>
        function GoLink(id, title) {
            jsb.require('nextPage', { 'CID': id, 'Title': title }, function (response) {
             
            });
        }
        function JoinExam(id, MID) {
            jsb.require('joinExam', { 'ID': id, 'MID': MID }, function (response) {
               
            });
        }
        function GoSearch() {
            var keyword = document.getElementById("search_text").value;
            jsb.require('nextSearch', { 'keyword': keyword }, function (response) {
               
            });
        }
    </script>
</asp:Content>
