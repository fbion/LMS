<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        string Message = (string)ViewData["Message"];
    %>

    <h2>导入完成，请注意以下信息</h2>

    <p>
        <%= Message %>
    </p>
    <p>
        <a href="UploadMember">继续导入</a>
    </p>
</asp:Content>
