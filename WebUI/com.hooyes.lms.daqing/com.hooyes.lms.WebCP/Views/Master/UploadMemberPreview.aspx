<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        GridView1.DataSource = ViewData["data"];
        GridView1.DataBind();

        string fileName = (string)ViewData["fileName"];
        string SN = (string)ViewData["SN"];
        string Tag = (string)ViewData["Tag"];
    %>

    <div id="Container">
        <div id="tip" class="style16" style="height: 20px; padding: 10px;">
            <form action="../master/UploadMemberCommit" method="post">
                <input type="hidden" name="fileName" value="<%=fileName %>" />
                <input type="hidden" name="SN" value="<%=SN %>" />
                <input type="hidden" name="Tag" value="<%=Tag %>" />
                <ul class="c-ul">
                    <li>
                        <button type="submit">数据无误，提交导入</button></li>
                </ul>
            </form>

        </div>
        <form runat="server" id="aspnet">
            <asp:GridView ID="GridView1" runat="server" CssClass="commontb">
            </asp:GridView>
        </form>
    </div>
</asp:Content>
