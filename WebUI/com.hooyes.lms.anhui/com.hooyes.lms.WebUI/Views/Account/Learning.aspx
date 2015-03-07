<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<com.hooyes.lms.Client>" %>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var CL = (List<com.hooyes.lms.Model.MyCourses>)ViewData["MyCourses"];
        var TypeString = (com.hooyes.lms.Client.Type == 0) ? "行政事业类" : "企业类";
        var CateCount1 = (int)ViewData["CateCount1"];
        var CateCount0 = (int)ViewData["CateCount0"];
    %>
    <div id="main">
        <div id="left">
            <div class="login">
                <% Html.RenderPartial("LogOnUserControl"); %>
            </div>
            <div class="expl">
                <div class="hotline">
                </div>
            </div>
        </div>
        <div id="right">
            <div class="board board2">
                听课列表
            </div>
            <div class="lesson">
                <div class="lesson2011">
                    <h3>
                        <%= com.hooyes.lms.Client.Year%>
                        课程列表</h3>
                    <table>
                        <tr>
                            <th colspan="2">
                                类别
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
                            int i = 0;
                            int Cate1 = 0;
                            int Cate0 = 0;
                            decimal Total_Minutes = 0;
                            foreach (var c in CL)
                            {
                                i++;
                                if (c.Cate == 1)
                                {
                                    Cate1++;
                                }
                                if (c.Cate == 0)
                                {
                                    Cate0++;
                                }
                                
                                //已学分钟数超出，显示当前课时长
                                
                                c.Minutes = (c.Minutes > c.Length * 45) ? c.Length * 45 : c.Minutes;
                                c.Minutes = (c.Status == 1) ? c.Length * 45 : c.Minutes;
                                var status = (c.Second > 0) ? "学习中" : "未听";
                                status = (c.Status == 1) ? "已完成" : status;
                                Total_Minutes = Total_Minutes + c.Minutes;
                        %>
                        <tr>
                            <% if (i == 1)
                               { %>
                            <td rowspan="<%= CL.Count %>" class="font_w">
                                <%= TypeString%>
                            </td>
                            <%}
                               if (c.Cate == 1 && Cate1 == 1)
                               {
                            %>
                            <td rowspan="<% = CateCount1 %>">
                                必修
                            </td>
                            <%} if (c.Cate == 0 && Cate0 == 1)
                               { %>
                            <td rowspan="<% = CateCount0 %>">
                                选修
                            </td>
                            <% } %>
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
                               <% = c.Minutes.ToString("0.#")%> 分
                            </td>
                        </tr>
                        <%
                            } 
                        %>
                        <tr>
                            <td colspan="7">
                                总学时长
                            </td>
                            <td>
                            <% = Total_Minutes.ToString("0.#")%> 分
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
