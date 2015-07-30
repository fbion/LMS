<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var MID = Convert.ToInt32(Request.QueryString.Get("MID"));
        var Year = Convert.ToInt32(Request.QueryString.Get("Year"));
        var Type = Convert.ToInt32(Request.QueryString.Get("Type"));
        var CL = com.hooyes.lms.DAL.Get.MyCourses(MID, Year, Type);
        var CL_1 = CL.FindAll(n => n.Cate == 1);
        var CL_0 = CL.FindAll(n => n.Cate == 0);
        bool CanCredit = com.hooyes.lms.Client.CheckTag(16);
    %>
    <h2>课程信息
    </h2>
    <% Html.RenderPartial("MemberCard"); %>
    <form id="f1" action="CreditCourses" method="post" onsubmit="return xConfirm()">
        <input type="hidden" name="MID" value="<%=MID %>" />
        <div class="nav-h">
            <h2>课程</h2>
        </div>
        <table class="commontb">
            <tr>
                <%if (CanCredit)
                  { %><th></th>
                <%} %>
                <th>课程名称
                </th>
                <th>主讲老师
                </th>
                <th>课时
                </th>
                <th>状态
                </th>
                <th>已学时长
                </th>
            </tr>
            <%
                decimal Total_Minutes = 0;
                foreach (var c in CL_1)
                {
                    c.Minutes = (c.Minutes > c.Length * 45) ? c.Length * 45 : c.Minutes;
                    c.Minutes = (c.Status == 1) ? c.Length * 45 : c.Minutes;
                    var status = (c.Second > 0) ? "学习中" : "未听";
                    status = (c.Status == 1) ? "已完成" : status;
                    Total_Minutes = Total_Minutes + c.Minutes;
            %>
            <tr>
                <%if (CanCredit)
                  { %>
                <td>
                    <input name="CID" type="checkbox" value="<%= c.CID %>" />
                </td>
                <%} %>
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
                <%if (CanCredit)
                  {%>
                <td colspan="2">
                    <input id="Submit1" type="submit" value="确定" />
                </td>
                <%}
                  else
                  { %>
                <td></td>
                <%} %>
                <td colspan="3">总学时长
                </td>
                <td>
                    <% = Total_Minutes.ToString("0.#")%>
                分钟
                </td>
            </tr>
        </table>
        <%if (CL_0.Count > 0)
          { %>
        <!-- 选修 Begin -->
        <div class="nav-h" style="margin-top: 10px">
            <h2>选修课程 (不记入总学时)</h2>
        </div>
        <table class="commontb">
            <tr>
                <%if (CanCredit)
                  { %><th></th>
                <%} %>
                <th>课程名称
                </th>
                <th>主讲老师
                </th>
                <th>课时
                </th>
                <th>状态
                </th>
                <th>已学时长
                </th>
            </tr>
            <%
                  Total_Minutes = 0;
                  foreach (var c in CL_0)
                  {
                      c.Minutes = (c.Minutes > c.Length * 45) ? c.Length * 45 : c.Minutes;
                      c.Minutes = (c.Status == 1) ? c.Length * 45 : c.Minutes;
                      var status = (c.Second > 0) ? "学习中" : "未听";
                      status = (c.Status == 1) ? "已完成" : status;
                      Total_Minutes = Total_Minutes + c.Minutes;
            %>
            <tr>
                <%if (CanCredit)
                  { %>
                <td>
                    <input name="CID" type="checkbox" value="<%= c.CID %>" />
                </td>
                <%} %>
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
                <%if (CanCredit)
                  {%>
                <td colspan="2">
                    <input id="Submit3" type="submit" value="确定" />
                </td>
                <%}
                  else
                  { %>
                <td></td>
                <%} %>
                <td colspan="3">总学时长
                </td>
                <td>
                    <% = Total_Minutes.ToString("0.#")%>
                分钟
                </td>
            </tr>
        </table>
        <!-- 选修 End -->
        <%} %>
    </form>
    <%
        if (com.hooyes.lms.Client.CheckTag(10))
        { %>

    <form action="CreditScore" method="post" onsubmit="return yConfirm()">
        <input type="hidden" name="MID" value="<%=MID %>" />
        <input type="hidden" name="Year" value="<%=Year %>" />
        <table class="commontb" style="margin-top: 10px">
            <tr>
                <td style="width: 40px">考试</td>
                <td style="width: 50px">
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
    </script>
</asp:Content>
