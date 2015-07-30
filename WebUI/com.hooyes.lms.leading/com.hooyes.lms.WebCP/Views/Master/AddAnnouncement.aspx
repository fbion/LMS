<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var R = (com.hooyes.lms.Model.R)ViewData["R"];
    %>

    <h2>AddAnnouncement</h2>
    <div class="AddAnnouncement">
        <form action="AddAnnouncement" method="post" id="form1">
            <ul>
                <li>RegionCode：<br />
                    <input type="number" value="" name="RegionCode" class="required" /></li>
                <li>Content：<br />
                    <textarea name="Content" class="Content required"></textarea>
                </li>
                <li>
                    <button type="submit">Submit</button>
                </li>
            </ul>
        </form>
    </div>

    <div class="result">
        <ul>
            <li>Code:<%=R.Code %></li>
            <li>Value:<%=R.Value %></li>
            <li>Message:<%=R.Message %></li>
        </ul>
    </div>
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script>
        $(function () {
            $("#form1").validate();
        });
    </script>
</asp:Content>
