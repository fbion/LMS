﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var CL = (List<com.hooyes.lms.Model.MyCourses>)ViewData["MyCourses"];
        var Report = (com.hooyes.lms.Model.Report)ViewData["Report"];
        var DisplayYear = (int)ViewData["DisplayYear"];
        decimal ExamMin = 0;
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

            <div class="lesson">
                <div class="lesson2011">
                    <h3>
                        <%= DisplayYear%>
                        年继续教育课程表</h3>
                    <table>
                        <tr>
                            <th>课程名称
                            </th>
                            <th>主讲老师
                            </th>
                            <th>课时
                            </th>
                            <th>听课
                            </th>
                            <th>状态
                            </th>
                            <th>已学时长
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
                                <a href="<%=com.hooyes.lms.C.APP %>/Account/Contents/<%= c.CID %>" target="_blank"><span class="icon_listen"></span></a>
                            </td>
                            <td>
                                <%= status%>
                            </td>
                            <td>
                                <% = c.Minutes.ToString("0.#")%> 分钟
                            </td>
                        </tr>
                        <%
                            }

                            ExamMin = Total_Minutes;
                            if (ExamMin < Report.Minutes)
                            {
                                ExamMin = Report.Minutes;
                            }
                        %>
                        <tr style="">
                            <td colspan="5">本年度总学时长
                            </td>
                            <td>
                                <% = Total_Minutes.ToString("0.#")%> 分钟
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">考试成绩  

                               <span class="exlinksp">
                                   <%
                                       if (Report.Score < 60)
                                       {
                                           // 考试及格后，不再显示考试按钮
                                           if (ExamMin >= 1080)
                                           { %>
                                   <a class="on" href="<%=com.hooyes.lms.C.APP %>/Account/Paper/<%=DisplayYear %>" target="_blank">[进入考试]</a>
                                   <%}
                                           else
                                           { %>
                                   <script type="text/javascript">
                                       function msg_for_exam() {
                                           alert("您需要完成至少1080分钟的学习后，才可以进入考试，\n请继续学习。");
                                       }
                                   </script>
                                   <a class="off" onclick="msg_for_exam()">[进入考试]</a>
                                   <% }
                                       }
                                   %>
                               </span>
                            </td>
                            <td>
                                <%=Report.Score %>
                                                                                            
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">本年度结业状态
                            </td>
                            <td>
                                <% if (Report.Minutes >= 1080 && Report.Score >= 60)
                                   {
                                %>
                                已结业
                                <%}
                                   else
                                   { %>
                                未结业
                                <%} %>
                            </td>
                        </tr>
                        <tr style="background-color: #f8f3f3">
                            <td colspan="6" style="text-align: left">* 课程任选，学满 1080 分钟后可参加考试，考试合格分为60分，通过考试后可打印本年度证书。考试完请刷新本页查看最新成绩。</td>
                        </tr>
                    </table>

                </div>
            </div>
        </div>
        <div class="clear">
        </div>

    </div>

</asp:Content>
