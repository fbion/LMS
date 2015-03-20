<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var Report = (com.hooyes.lms.Model.Report)ViewData["Report"];
        var DisplayYear = (int)ViewData["DisplayYear"];
    %>
    <div id="main">
        <div id="right" style="width: 100%">
            <div class="board board2" style="text-align: center; font-weight: bold">
               <%=DisplayYear %>年会计人员继续教育考试题
            </div>
            <div id="paperdiv">
             <div class="score">你的考试成绩是：<b><%= Report.Score %></b> 分</div>
            </div>
        </div>
    </div>
</asp:Content>
