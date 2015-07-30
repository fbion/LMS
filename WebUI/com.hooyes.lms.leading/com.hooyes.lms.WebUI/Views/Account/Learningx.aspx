<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var CL = (List<com.hooyes.lms.Model.MyCourses>)ViewData["MyCourses_1"];
        var CL_0 = (List<com.hooyes.lms.Model.MyCourses>)ViewData["MyCourses_0"];
        var Report = (com.hooyes.lms.Model.Report)ViewData["Report"];
        var DisplayYear = (int)ViewData["DisplayYear"];
        var Product = (com.hooyes.lms.Model.Products)ViewData["Product"];
        decimal ExamMin = 0;
        decimal Total_Minutes = 0;
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
            <!-- 必修 -->
            <% if(CL.Count>0){ %>
            <div class="lesson">
                <div class="lesson2011">
                    <div class="icons icons-star">
                    </div>
                    <h3>
                        <%=Product.Name %> &nbsp;&nbsp;必修</h3>
                    <table>
                        <tr>
                            <th>课程名称
                            </th>
                            <th>主讲老师
                            </th>
                            <th>课时
                            </th>
                             <th style="width:60px">状态
                            </th>
                            <th style="width:80px">已学时长
                            </th>
                            <th>听课
                            </th>
                            <th style="width:110px">成绩</th>
                        </tr>
                        <%
                            Total_Minutes = 0;
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
                            <td colspan="4">
                                <span id="sp_1_<%=c.CID %>" onclick="show_package(<%=c.CID %>)" class="ctrl-1">【展开】</span>
                                <span id="sp_2_<%=c.CID %>" onclick="hide_package(<%=c.CID %>)" class="none ctrl-1-1">【收起】</span>
                            </td>
                            <%}
                              else
                              { %>

                            <td>
                                <%= status%>
                            </td>
                            <td>
                                <% = c.Minutes.ToString("0.#")%> 分钟
                            </td>
                            <td>
                                <a href="<%=com.hooyes.lms.C.APP %>/Account/Contents/<%= c.CID %>" target="_blank"><span class="icon_listen"></span></a>
                            </td>
                            <td>
                                <%if (c.Score >= 100)
                                  { %>
                                    <%=c.Score%> 分
                                <%}
                                  else if (c.Score > 0 && c.Score < 100)
                                  { %>
                                    <%=c.Score%> 分 |
                                <% 
                                  }
                                  if (c.Score < 100)
                                  { %>
                                     <a class="on" href="<%=com.hooyes.lms.C.APP %>/Account/Paper/p/<%=DisplayYear %>/<%= c.CID %>" target="_blank">进入考试</a>
                                <%}%>
                                
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
                        %>
                        <tr style="">
                            <td colspan="5">必修总学时长
                            </td>
                            <td>
                                <% = Total_Minutes.ToString("0.#")%> 分钟
                            </td>
                            <td>-</td>
                        </tr>
                        
                        <%--<tr>
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
                            <td>-</td>
                        </tr>--%>

                        <tr style="background-color: #f8f3f3">
                            <td colspan="7" style="text-align: left">* 1 课时 = 45 分钟</td>
                        </tr>
                    </table>

                </div>
            </div>
            <%} %>
            <!-- 必修 -->

            <!-- 选修 -->
            <% if(CL_0.Count>0){ %>
            <div class="lesson">
                <div class="lesson2011">
                    <div class="icons icons-star">
                    </div>
                    <h3>
                        <%=Product.Name %> &nbsp;&nbsp;选修</h3>
                    <table>
                        <tr>
                            <th>课程名称
                            </th>
                            <th>主讲老师
                            </th>
                            <th>课时
                            </th>
                            <th style="width:60px">状态
                            </th>
                            <th style="width:80px">已学时长
                            </th>
                            <th>听课
                            </th>
                            <th style="width:110px">成绩</th>
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
                            <td colspan="4">
                                <span id="sp_1_<%=c.CID %>" onclick="show_package(<%=c.CID %>)" class="ctrl-1">【展开】</span>
                                <span id="sp_2_<%=c.CID %>" onclick="hide_package(<%=c.CID %>)" class="none ctrl-1-1">【收起】</span>
                            </td>
                            <%}
                              else
                              { %>

                            <td>
                                <%= status%>
                            </td>
                            <td>
                                <% = c.Minutes.ToString("0.#")%> 分钟
                            </td>
                            <td>
                                <a href="<%=com.hooyes.lms.C.APP %>/Account/Contents/<%= c.CID %>" target="_blank"><span class="icon_listen"></span></a>
                            </td>
                            <td>
                                <%if (c.Score >= 100)
                                  { %>
                                <%=c.Score%> 分
                                <%}
                                  else if (c.Score > 0 && c.Score < 100)
                                  { %>
                                <%=c.Score%> 分 |
                                <% 
                                  }
                                  if (c.Score < 100)
                                  { %>
                                <a class="on" href="<%=com.hooyes.lms.C.APP %>/Account/Paper/p/<%=DisplayYear %>/<%= c.CID %>" target="_blank">进入考试</a>
                                <%}%>
                                
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
                        %>
                        <tr style="">
                            <td colspan="5">选修总学时长
                            </td>
                            <td>
                                <% = Total_Minutes.ToString("0.#")%> 分钟
                            </td>
                            <td>-</td>
                        </tr>

                        <%--<tr>
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
                            <td>-</td>
                        </tr>--%>

                        <tr style="background-color: #f8f3f3">
                            <td colspan="7" style="text-align: left">* 1 课时 = 45 分钟</td>
                        </tr>
                    </table>

                </div>
            </div>
            <%} %>
            <!-- 选修 -->
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
