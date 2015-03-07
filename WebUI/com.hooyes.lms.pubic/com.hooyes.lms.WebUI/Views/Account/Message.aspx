<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

 <div class="errorDiv">
    <h5>提示：</h5>
    <p class="msg">
        <%= ViewData["Message"] %>
    </p>
    </div>
</asp:Content>
