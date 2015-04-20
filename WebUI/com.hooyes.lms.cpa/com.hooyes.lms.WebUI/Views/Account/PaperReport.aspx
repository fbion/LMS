<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var Report = (com.hooyes.lms.Model.Report)ViewData["Report"];
        var DisplayYear = (int)ViewData["DisplayYear"];
        var Product = (com.hooyes.lms.Model.Products)ViewData["Product"];
    %>
    <div id="main">
        <div id="right" style="width: 100%">
            <div class="board board2" style="text-align: center; font-weight: bold">
               <%=Product.Name %> 考试
            </div>
            <div id="paperdiv">
             <div class="score">你的考试成绩是：<b><%= Report.Score %></b> 分</div>
                <br />
                <a href="/Account/Learningx/<%=DisplayYear %>">继续学习</a>
            </div>
        </div>
    </div>
</asp:Content>
