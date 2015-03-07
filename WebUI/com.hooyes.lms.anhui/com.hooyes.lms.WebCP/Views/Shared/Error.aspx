<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<System.Web.Mvc.HandleErrorInfo>" %>

<asp:Content ID="errorContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="errorDiv">
    <h5>提示：</h5>
    <p>
        <%= ViewData["Message"] %>
    </p>
    </div>
</asp:Content>
