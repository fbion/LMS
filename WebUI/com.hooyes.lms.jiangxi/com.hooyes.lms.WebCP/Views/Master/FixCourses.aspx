<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var CL = com.hooyes.lms.DAL.Get.MyCourses(1, 2012, 0);
    %>
    <h2>
    </h2>
    <table class="commontb">
        <tr>
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
                听课
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
                var status = (c.Second > 0) ? "学习中" : "未听";
                status = (c.Status == 1) ? "已完成" : status;
                Total_Minutes = Total_Minutes + c.Minutes;
        %>
        <tr>
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
                <a href="Contents?cid=<%= c.CID %>" target="_blank"><span class="icon_listen"></span>
                </a>
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
            <td colspan="5">
                总学时长
            </td>
            <td>
                <% = Total_Minutes.ToString("0.#")%>
                分钟
            </td>
        </tr>
    </table>
</asp:Content>
