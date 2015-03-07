<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        decimal SN = Convert.ToDecimal(Request["SN"]);
        GridView1.DataSource = com.hooyes.lms.DAL.Import.GetCreditList(SN);
        GridView1.DataBind();
    %>
    <h2>
        导入已完成</h2>
    <div id="Container">
        <div id="tip" class="style16">
            完成！
        </div>
        <form runat="server" id="aspnet">
        <asp:GridView ID="GridView1" runat="server" CssClass="commontb" >
        </asp:GridView>
        </form>
    </div>
</asp:Content>
