<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Import MP4</h2>
    <form id="f1" action="" method="post" onsubmit="return ApplyImport()">
    <table id="invoicetb">
        <tr>
            <td style="width: 50px;">
                sCName
            </td>
            <td>
                <input id="Text1" type="text" name="sCName" />
            </td>
        </tr>
      
        <tr>
        <td colspan="2">
            <input id="Submit1" type="submit" value="submit" /></td>
        </tr>
    </table>
    </form>
 
<script type="text/javascript">
    function ApplyImport() {
        $.ajax({
            url: MasterController + "ImportCs2",
            type: "POST",
            data: $("#f1").serialize(),
            dataType: "html",
            success: function (data) {
                alert(data);
            },
            error: function (data) {
                alert(data);
            }
        });

        return false;
    }
</script>
</asp:Content>
