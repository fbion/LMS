<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var CL = (List<com.hooyes.lms.Model.MyCourses>)ViewData["MyCourses_1"];
        var CL_0 = (List<com.hooyes.lms.Model.MyCourses>)ViewData["MyCourses_0"];
        var Report = (com.hooyes.lms.Model.Report)ViewData["Report"];
        var DisplayYear = (int)ViewData["DisplayYear"];
        var Product = (com.hooyes.lms.Model.ProductsEx)ViewData["Product"];
        decimal Total_Minutes = 0;
        bool showSubTitle = false;
        showSubTitle = CL.Count > 0 && CL_0.Count > 0;
         
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
                    <div class="icons icons-star">
                    </div>
                    <h3>
                        <%=Product.Name %></h3>
                    <table>
                        


                        <!-- 必修Begin -->
                        <%if (showSubTitle)
                          { %>
                        <tr class="cl1">
                            <td colspan="7">
                                <span class="cl-span">必修课：</span></td>
                        </tr>
                        <%} %>
                        <tr>

                            <th>课程名称
                            </th>
                            <th style="width: 100px">主讲老师
                            </th>
                            <th>学分
                            </th>
                            <th style="width: 60px">状态
                            </th>
                            <th style="width: 100px">已学时长
                            </th>
                            <th>听课
                            </th>
                            <th style="width: 110px">成绩</th>
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
                                <%if (c.Score >= 60)
                                  { %>
                                <%=c.Score%> 分
                                <%}
                                  else if (c.Score > 0 && c.Score < 60)
                                  { %>
                                <%=c.Score%> 分 |
                                <% 
                                  }
                                  if (c.Score < 60)
                                  { %>
                                <a class="on" href="<%=com.hooyes.lms.C.APP %>/Account/Paper/p/<%=DisplayYear %>/<%= c.CID %>" target="_blank">进入考试</a>
                                <%}%>
                                
                            </td>
                            <%} %>
                        </tr>
                        <%
                            }
                          
                        %>
                        <!-- 必修End -->

                        <!-- 选修Begin -->
                        <%if (showSubTitle)
                          { %>
                        <tr class="cl2">
                            <td colspan="7">
                                <span class="cl-span">选修课：</span></td>
                        </tr>

                        <tr>

                            <th>课程名称
                            </th>
                            <th style="width: 100px">主讲老师
                            </th>
                            <th>学分
                            </th>
                            <th style="width: 60px">状态
                            </th>
                            <th style="width: 100px">已学时长
                            </th>
                            <th>听课
                            </th>
                            <th style="width: 110px">成绩</th>
                        </tr>
                        <%} %>
                        <%
                            
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
                                <%if (c.Score >= 60)
                                  { %>
                                <%=c.Score%> 分
                                <%}
                                  else if (c.Score > 0 && c.Score < 60)
                                  { %>
                                <%=c.Score%> 分 |
                                <% 
                                  }
                                  if (c.Score < 60)
                                  { %>
                                <a class="on" href="<%=com.hooyes.lms.C.APP %>/Account/Paper/p/<%=DisplayYear %>/<%= c.CID %>" target="_blank">进入考试</a>
                                <%}%>
                                
                            </td>
                            <%} %>
                        </tr>
                        <%
                            }
                          
                        %>
                        <!-- 选修End-->

                        <tr style="">
                            <td colspan="5">本年度已获得总学分
                            </td>
                            <td>
                                <% = ( Report.Compulsory + Report.Elective ).ToString("0.#")%> 分
                            </td>
                            <td>-</td>
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
                            <td>-</td>
                        </tr>

                       <tr style="background-color: #f8f3f3">
                            <td colspan="7" style="text-align: left">* 结业条件：
                                           <%if(CL.Count>0){ %>
                                           <br />必修课必需全部学完。
                                           <%} %>
                                           <br />每门课程学完，并参加考试后获得该课程学分，学满24学分后结业。
                            </td>
                        </tr>
                    </table>

                </div>
            </div>
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


        $(function () {

            var obj = $(".Recomend").find(".t_a_l");
            obj.html("<span class='sup-c'>安徽省财政厅推荐课程</span>" + obj.html());

        });

    </script>
</asp:Content>
