<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Import</h2>
    <form id="f1" action="" method="post" onsubmit="return ApplyImport()">
    <table id="invoicetb">
        <tr>
            <td style="width: 50px;">
                sCID
            </td>
            <td>
                <input id="Text1" type="text" name="sCID" />
            </td>
        </tr>
        <tr>
            <td>
                Type
            </td>
            <td>
                <select id="Select1" name="Type">
                    <option value="0">行政事业类</option>
                    <option value="1">企业类</option>
                    <option value="3">企业类、行政事业类</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                Cate
            </td>
            <td>
                <select id="Select2" name="Cate">
                    <option value="0">选修</option>
                    <option value="1">必修</option>
                    <option value="100">行政选修,企业必修</option>
                    <option value="101">行政必修,企业选修</option>
                    <option value="99">不区分</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                Year
            </td>
            <td>
                <select id="Select3" name="Year">
                    <option value="2013">2013</option>
                    <option value="2012">2012</option>
                    <option value="2011">2011</option>
                    <option value="2010">2010</option>
                    <option value="2009">2009</option>
                    <option value="2008">2008</option>
                    <option value="2007">2007</option>
                    <option value="2006">2006</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>
                Teacher
            </td>
            <td>
                <input id="Text2" type="text" name="Teacher" />
            </td>
        </tr>
        <tr>
            <td>
                Length
            </td>
            <td>
                <input id="Text3" type="text" name="Length" />
            </td>
        </tr>
                <tr>
            <td>
                Sort
            </td>
            <td>
                <input id="Text4" type="text" name="Sort" />
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
            url: HomeController + "ImportC",
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
