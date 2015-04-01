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
        <div class="nav-h" style="margin-top:15px">
            <h2>必修课程</h2>
        </div>
        <table class="commontb">
            <tr>
                <%if (CanCredit)
                  { %><th style="text-align: left">

                      <input id="checkall" type="checkbox" value="0" />
                  </th>
                <%} %>
                <th style="width:35%">课程名称
                </th>
                <th>主讲老师
                </th>
                <th>课时
                </th>
                <th>状态
                </th>
                <th>已学时长
                </th>
                <th>成绩</th>
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
                    <input name="CID" type="checkbox" value="<%= c.CID %>" class="checkbox" />
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
                <td>

                    <input name="CID_Score_<%= c.CID %>" type="text" size="3" maxlength="3" value="<%= c.Score %>" />
                    <input name="CID_Score" type="hidden" value="<%= c.CID %>" />

                </td>
            </tr>
            <%
                } 
            %>
            <tr>
                <%if (CanCredit)
                  {%>
                <td colspan="2">
                    <input id="Submit1" type="button" onclick="xSubmit('#f1')" value="确定" />
                </td>
                <%}
                  else
                  { %>
                <td></td>
                <%} %>
                <td colspan="3">必修总时长
                </td>
                <td>
                    <% = Total_Minutes.ToString("0.#")%>
                分钟
                </td>
                <td>
                    <%
                        if (com.hooyes.lms.Client.CheckTag(10))
                        { %>
                    <input id="Submit2" type="button" onclick="ySubmit('#f1')" value="修改成绩" />
                    <br />
                    *课程学完后才可以改成绩
                    <%} %>
                </td>
            </tr>
        </table>
    </form>
    <form id="f0" action="CreditCourses" method="post" onsubmit="return xConfirm()">
        <input type="hidden" name="MID" value="<%=MID %>" />
        <div class="nav-h" style="margin-top:15px">
            <h2>选修课程</h2>
        </div>
        <table class="commontb">
            <tr>
                <%if (CanCredit)
                  { %><th style="text-align: left">

                      <input id="checkall_0" type="checkbox" value="0" />
                  </th>
                <%} %>
                <th style="width:35%">课程名称
                </th>
                <th>主讲老师
                </th>
                <th>课时
                </th>
                <th>状态
                </th>
                <th>已学时长
                </th>
                <th>成绩</th>
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
                    <input name="CID" type="checkbox" value="<%= c.CID %>" class="checkbox_0" />
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
                <td>

                    <input name="CID_Score_<%= c.CID %>" type="text" size="3" maxlength="3" value="<%= c.Score %>" />
                    <input name="CID_Score" type="hidden" value="<%= c.CID %>" />

                </td>
            </tr>
            <%
                } 
            %>
            <tr>
                <%if (CanCredit)
                  {%>
                <td colspan="2">
                    <input id="Button1" type="button" onclick="xSubmit('#f0')" value="确定" />
                </td>
                <%}
                  else
                  { %>
                <td></td>
                <%} %>
                <td colspan="3">选修总时长
                </td>
                <td>
                    <% = Total_Minutes.ToString("0.#")%>
                分钟
                </td>
                <td>
                    <%
                        if (com.hooyes.lms.Client.CheckTag(10))
                        { %>
                    <input id="Button2" type="button" onclick="ySubmit('#f0')" value="修改成绩" />
                    <br />
                    *课程学完后才可以改成绩
                    <%} %>
                </td>
            </tr>
        </table>
    </form>

    <script type="text/javascript">
        function xConfirm() {
            return confirm("确定?");
        }
        function yConfirm() {
            return confirm("确定?");
        }
        function xSubmit(id) {
            $(id).attr("action", "CreditCourses");
            $(id).submit();
        }
        function ySubmit(id) {
            $(id).attr("action", "CreditSingleScore");
            $(id).submit();
        }

        $(function () {
            $("#checkall").click(function () {
                if ($(this).is(":checked")) {
                    $(".checkbox").attr("checked", "checked");
                } else {
                    $(".checkbox").removeAttr("checked");
                }
            });

            $("#checkall_0").click(function () {
                if ($(this).is(":checked")) {
                    $(".checkbox_0").attr("checked", "checked");
                } else {
                    $(".checkbox_0").removeAttr("checked");
                }
            });
        });
    </script>
</asp:Content>
