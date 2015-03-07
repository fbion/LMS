<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var MID = Convert.ToInt32(Request.QueryString.Get("MID"));
        var Year = Convert.ToInt32(Request.QueryString.Get("Year"));
        var Type = Convert.ToInt32(Request.QueryString.Get("Type"));
        var CL = com.hooyes.lms.DAL.Get.MyCourses(MID, Year, Type);
    %>
    <h2>
        课程信息
    </h2>
    <% Html.RenderPartial("MemberCard"); %>
    <form id="f1" action="CreditCourses" method="post" onsubmit="return xConfirm()">
    <input type="hidden" name="MID" value="<%=MID %>" />
    <table class="commontb">
        <tr>
            <th style="text-align:left">
                <input id="checkall" type="checkbox" value="0" />
            </th>
            <th>
                课程名称
            </th>
            <th>
                主讲老师
            </th>
            <th>
                课时
            </th>
            <th>
                状态
            </th>
            <th>
                已学时长
            </th>
        </tr>
        <%
            decimal Total_Minutes = 0;
            foreach (var c in CL)
            {
                c.Minutes = (c.Minutes > c.Length * 45) ? c.Length * 45 : c.Minutes;
                c.Minutes = (c.Status == 1) ? c.Length * 45 : c.Minutes;
                var status = (c.Second > 0) ? "学习中" : "未听";
                status = (c.Status == 1) ? "已完成" : status;
                Total_Minutes = Total_Minutes + c.Minutes;
        %>
        <tr>
            <td>
                <input name="CID" type="checkbox" value="<%= c.CID %>" class="checkbox" />
                <%-- <% if (c.Status == 1)
               {%>
                <input name="CID" type="checkbox" value="<%= c.CID %>" disabled="disabled" />
            <%}
               else
               { %>
               <input name="CID" type="checkbox" value="<%= c.CID %>" />
            <%} %>--%>
            </td>
            <td class="t_a_l">
                <% = c.Name %>
            </td>
            <td>
                <%= c.Teacher %>
            </td>
            <td>
                <%= c.Length.ToString("0.#")%>
            </td>
            <td>
                <%= status%>
            </td>
            <td>
                <% = c.Minutes.ToString("0.#")%>
                分钟
            </td>
        </tr>
        <%
            } 
        %>
        <tr>
            <td colspan="2">
                <input id="Submit1" type="submit" value="确定" />
                <input id="Button1" type="button" value="手机验证" onclick="zConfirm()" />
            </td>
            <td colspan="3">
                总学时长
            </td>
            <td>
                <% = Total_Minutes.ToString("0.#")%>
                分钟
            </td>
        </tr>
    </table>
    </form>
     <%
        if (com.hooyes.lms.Client.CheckTag(10))
        { %>
    
    <form action="CreditScore" method="post" onsubmit="return yConfirm()">
    <input type="hidden" name="MID" value="<%=MID %>" />
    <table class="commontb" style="margin-top:10px">
        <tr>
            <td style="width:40px">考试</td>
            <td style="width:50px">
                <input id="Score" name="Score" type="text" size="4" maxlength="3" />
            </td>
            <td>
                <input id="Submit2" type="submit" value="确定" />
            </td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </form>
   <%} %>
    <script type="text/javascript">
        function xConfirm() {
            return confirm("确定?");
        }
        function yConfirm() {
            return confirm("确定?");
        }
        function zConfirm() {
            if (confirm("确定通过验证?")) {
                ApplyZ();
            }
        }

        function ApplyZ() {
            $.ajax({
                url: "ValidateCourses",
                type: "POST",
                data: $("#f1").serialize(),
                dataType: "json",
                success: function (data) {
                    if (data.Code == 0) {
                        alert("操作成功");
                        //window.location = AccountController + "Invoice?show";
                    } else {
                        alert("操作失败，请稍后重试");
                    }
                },
                error: function () {

                }
            });
        }

        $(function () {
            $("#checkall").click(function () {
                if ($(this).is(":checked")) {
                    $(".checkbox").attr("checked", "checked");
                } else {
                    $(".checkbox").removeAttr("checked");
                }
            });
        });
    </script>
</asp:Content>
