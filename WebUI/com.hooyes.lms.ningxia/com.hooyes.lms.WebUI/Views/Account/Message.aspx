<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        string NextUrl = (string)ViewData["NextUrl"];
    %>
    <div class="errorDiv">
        <h5>提示：</h5>
        <p class="msg">
            <%= ViewData["Message"] %>
            <% if (!string.IsNullOrEmpty(NextUrl))
               { %>
               >> <a href="<%=NextUrl %>">点击进入</a>
            <%} %>
        </p>
    </div>
</asp:Content>
