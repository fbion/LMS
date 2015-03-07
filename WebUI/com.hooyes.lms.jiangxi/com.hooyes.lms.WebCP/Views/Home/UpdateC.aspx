<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Update</h2>
    <form id="f1" action="" method="post" onsubmit="return Apply()">
    <table id="invoicetb">
        <tr>
            <td style="width: 50px;">
                CID
            </td>
            <td>
                <input id="CID" type="text" name="CID" />
                <input type="button" id="btn_get" onclick="Get()" value="GET" />
            </td>
        </tr>
        <tr>
            <td>
                Name
            </td>
            <td>
                <input id="Name" type="text" name="Name" />
            </td>
        </tr>
        <tr>
            <td>
                Type
            </td>
            <td>
                <select id="Type" name="Type">
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
                <select id="Cate" name="Cate">
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
                <select id="Year" name="Year">
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
                <input id="Teacher" type="text" name="Teacher" />
            </td>
        </tr>
        <tr>
            <td>
                ActMinutes
            </td>
            <td>
                <input id="ActMinutes" type="text" name="ActMinutes" />
            </td>
        </tr>
        <tr>
            <td>
                Length
            </td>
            <td>
                <input id="Length" type="text" name="Length" />
            </td>
        </tr>
        <tr>
            <td>
                Sort
            </td>
            <td>
                <input id="Sort" type="text" name="Sort" />
            </td>
        </tr>
        <tr>
            <td>
                Memo
            </td>
            <td>
                <input id="Memo" type="text" name="Memo" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input id="Submit1" type="submit" value="submit" />
            </td>
        </tr>
    </table>
    </form>
    <script type="text/javascript">
        function Apply() {
            $.ajax({
                url: HomeController + "UpdateC",
                type: "POST",
                data: $("#f1").serialize(),
                dataType: "json",
                success: function (data) {
                    alert(data.Message);
                },
                error: function (data) {
                    alert(data);
                }
            });

            return false;
        }

        function Get() {
            $.ajax({
                url: HomeController + "GetC",
                type: "POST",
                data: $("#f1").serialize(),
                dataType: "json",
                success: function (data) {
                    FillForm(data);
                },
                error: function (data) {
                    alert(data);
                }
            });

            return false;
        }
        function FillForm(data) {
            //var data = { "CID": 2105, "CName": "2105", "Name": "专业领导综合素质提升", "Type": 0, "Year": 2012, "Cate": 0, "Sort": 0, "Teacher": "", "Length": 0, "Memo": null };
            $("#Name").val(data.Name);
            $("#Type").val(data.Type);
            $("#Year").val(data.Year);
            $("#Cate").val(data.Cate);
            $("#Sort").val(data.Sort);
            $("#Teacher").val(data.Teacher);
            $("#Length").val(data.Length);
            $("#Memo").val(data.Memo);
            $("#ActMinutes").val(data.ActMinutes);
        }
    </script>
</asp:Content>
