<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var CL = (List<com.hooyes.lms.Model.MyCourses>)ViewData["MyCourses_1"];
        var CL_0 = (List<com.hooyes.lms.Model.MyCourses>)ViewData["MyCourses_0"];
        var Report = (com.hooyes.lms.Model.Report)ViewData["Report"];
        var DisplayYear = (int)ViewData["DisplayYear"];
        var Product = (com.hooyes.lms.Model.Products)ViewData["Product"];
        decimal ExamMin = 0;
        decimal LearningLength = 0;
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
                       <%=Product.Name %></h3>
                    <table>
                        <tr>
                            <th>课程名称
                            </th>
                            <th>主讲老师
                            </th>
                            <th>课时
                            </th>
                             <th style="width:60px;">状态
                            </th>
                            <th style="width:100px;">已学时长
                            </th>
                            <th>听课
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
                        <tr class="<%=c.Tag %>">
                            <td class="t_a_l">
                                <% = c.Name %>
                            </td>
                            <td>
                                <%= c.Teacher %>
                            </td>
                            <td>
                                <%= c.Length.ToString("0.#")%>
                            </td>


                            <%if (!string.IsNullOrEmpty(c.Tag) && c.Tag.StartsWith("Package"))
                              { %>
                            <td colspan="3">
                                <span id="sp_1_<%=c.CID %>" onclick="show_package(<%=c.CID %>)" class="ctrl-1">【展开】</span>
                                <span id="sp_2_<%=c.CID %>" onclick="hide_package(<%=c.CID %>)" class="none ctrl-1-1">【收起】</span>
                            </td>
                            <%}
                              else
                              { %>

                            <td>
                                <span class="ctrl-2"><%= status%> </span>
                            </td>
                            <td>
                                <span class="ctrl-3"><% = c.Minutes.ToString("0.#")%> 分钟 </span>
                            </td>
                            <td>

                                <a href="<%=com.hooyes.lms.C.APP %>/Account/Contents/<%= c.CID %>" target="_blank">
                                    <span class="icon_listen"></span>
                                </a>

                            </td>

                            <%} %>
                        </tr>
                        <%
                            }

                            ExamMin = Total_Minutes;
                            if (ExamMin < Report.Minutes)
                            {
                                ExamMin = Report.Minutes;
                            }

                            LearningLength = ExamMin / 45;
                        %>
                        <tr style="">
                            <td colspan="5">总学时长
                            </td>
                            <td>
                                <% = LearningLength.ToString("0.#")%> 学时
                            </td>
                        </tr>
                        <tr>
                            <td colspan="5">考试成绩  

                               <span class="exlinksp">
                                   <%
                                       if (Report.Score < 60)
                                       {
                                           // 考试及格后，不再显示考试按钮
                                           if (LearningLength >= 24)
                                           { %>
                                   <a class="on" href="<%=com.hooyes.lms.C.APP %>/Account/Paper/<%=DisplayYear %>" target="_blank">[进入考试]</a>
                                   <%}
                                           else
                                           { %>
                                   <script type="text/javascript">
                                       function msg_for_exam() {
                                           alert("您需要完成至少24学时后，才可以进入考试，请继续学习。");
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
                                <% if (Report.Status == 1)
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
                        <tr style="background-color: #f8f3f3;">
                            <td colspan="6" style="text-align: left">* 学满24学时后可参加考试，考试合格分为60分。考试完请刷新本页查看最新成绩。</td>
                        </tr>
                    </table>

                </div>
            </div>

            <% if(CL_0.Count>0){ %>
            <!-- 选修 -->

            <div class="lesson">
                <div class="lesson2011">
                    <h3>
                      <%=Product.Name %> 选修课</h3>
                    <table>
                        <tr>
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
                            <th>听课
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
                        <tr class="<%=c.Tag %>">
                            <td class="t_a_l">
                                <% = c.Name %>
                            </td>
                            <td>
                                <%= c.Teacher %>
                            </td>
                            <td>
                                <%= c.Length.ToString("0.#")%>
                            </td>


                            <%if (!string.IsNullOrEmpty(c.Tag) && c.Tag.StartsWith("Package"))
                              { %>
                            <td colspan="3">
                                <span id="Span1" onclick="show_package(<%=c.CID %>)" class="ctrl-1">【展开】</span>
                                <span id="Span2" onclick="hide_package(<%=c.CID %>)" class="none ctrl-1-1">【收起】</span>
                            </td>
                            <%}
                              else
                              { %>

                            <td>
                                <span class="ctrl-2"><%= status%> </span>
                            </td>
                            <td>
                                <span class="ctrl-3"><% = c.Minutes.ToString("0.#")%> 分钟 </span>
                            </td>
                            <td>

                                <a href="<%=com.hooyes.lms.C.APP %>/Account/Contents/<%= c.CID %>" target="_blank">
                                    <span class="icon_listen"></span>
                                </a>

                            </td>

                            <%} %>
                        </tr>
                        <%
                            }

                            ExamMin = Total_Minutes;
                           
                        %>
                        <tr style="">
                            <td colspan="5">选修总学时长
                            </td>
                            <td>
                                <% = ExamMin.ToString("0.#")%> 分钟
                            </td>
                        </tr>

                    </table>

                </div>
            </div>

            <!-- 选修 -->
            <%} %>

        </div>
        <div class="clear">
        </div>

    </div>

    <script>

        function show_package(id) {

            $(".CID-" + id).show();
            $("#sp_1_" + id).parent().parent().addClass("package-head");
            $("#sp_1_" + id).hide();
            $("#sp_2_" + id).show();
        }

        function hide_package(id) {
            $(".CID-" + id).hide();
            $("#sp_1_" + id).parent().parent().removeClass("package-head");
            $("#sp_1_" + id).show();
            $("#sp_2_" + id).hide();
        }

    </script>
</asp:Content>
