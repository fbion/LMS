<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="main">
        <div id="left">
            <div class="login">
                <% Html.RenderPartial("LogOnUserControl"); %>
            </div>
            <div class="expl">
                <h3>网络培训相关说明</h3>
                <div class="con">
                    <p>
                        根据《中华人民共和国会计法》、《会计人员继续教育规定》的要求， 2014年度我省会计人员继续教育采取网上学习，培训内容分为：
                    </p>
                    <div class="line">
                    </div>
                    <h4>（一）必学内容 （12学分）</h4>
                    <h5>1、企业单位会计人员</h5>
                    <p>
                        （1）企业内部控制操作实务
                    </p>
                    <p>
                        （2）营改增等最新税收及会计政策解读
                    </p>
                    <p>
                        （3）企业产品成本核算制度
                    </p>
                    <h5 style="margin-top: 5px;">2、行政事业单位会计人员</h5>
                    <p>
                        （1）行政事业单位内部控制规范操作实务
                    </p>
                    <p>
                        （2）事业单位会计准则、会计制度
                    </p>
                    <p>
                        （3）部门预算
                    </p>

                    <div class="line">
                    </div>
                    <h4>（二）选学内容 （12学分）</h4>
                    <p>
                        会计人员在完成上述必学内容后，可根据需要从网校提供的其他相关课程中选学，每个参加继续教育学习的会计人员，当年所学的必学内容与选学内容须达到24个学时（含考试时间）。
                    </p>
                    <p style="font-weight: bold">
                        学员需完成12学分必学内容，再任选完成 12学分选学内容后，最后考试合格（60分），才能确定完成2014年度教育学习任务。
                    </p>
                    <p>
                        继续教育学习周期为每年1月1日至12月31日，凡在当年学习周期内没有完成规定学时学习的，须在下一年度进行补课，补课内容为网校提供的相应年度必学及选学课程。
                    </p>
                </div>
            </div>
        </div>
        <div id="right">
            <div class="board">
                <p>
                    会计人员参加网上学习，系统自动记录学习时间，正式开课后每10分钟网校与学员互动，弹出回答问题窗口，不回答的即停止计时，原计时有效，可以在一个年度内累计。请牢记报名序号及学习网址，二次及以后学习请直接登录本网站进行学习。网上考试合格、学完24学时，稍后可登陆河南省会计信息管理系统查询教育情况，会计从业资格证书上不再签章，如果查询结果不符请与本网校联系。
                </p>
                <p style="color: #020086">
                    <strong>根据河南省财政厅规定，特通知如下： </strong>
                    <br />
                    1、每年度继续教育学习周期为每年1月1日至12月31日，凡在当年学习周期内没有完成规定学时学习的，须在下一年度进行 补课，补课内容为网校提供的相应补课年度课程及选学课程。
                    <br />
                    2、凡当年度已缴费未完成学时的人员，学习时间延长至下个年度2月底。 下一年度3月1日起，需重新缴费听课。
                    <br />
                    <span class="beta">3、如果学员已缴费还无法正常学习请点击 <a class="t_online_help" href="javascript:void(0)">“在线帮助”</a>，并填写真实信息，客服会尽快给您回复。</span>
                </p>
               
            </div>
            <div class="flow">
                <h3>学习流程</h3>
                <img src="<% = com.hooyes.lms.C.CDN %>/Img/call.jpg" class="call">
                <img src="<% = com.hooyes.lms.C.CDN %>/Img/registration.jpg"><img src="<% = com.hooyes.lms.C.CDN %>/Img/dao2.gif"
                    class="dao2">
                <img src="<% = com.hooyes.lms.C.CDN %>/Img/learning.jpg"><img src="<% = com.hooyes.lms.C.CDN %>/Img/dao2.gif"
                    class="dao2">
                <img src="<% = com.hooyes.lms.C.CDN %>/Img/Exam.jpg"><img src="<% = com.hooyes.lms.C.CDN %>/Img/dao2.gif"
                    class="dao2">
                <img src="<% = com.hooyes.lms.C.CDN %>/Img/Learning finish.jpg"><img src="<% = com.hooyes.lms.C.CDN %>/Img/dao2.gif"
                    class="dao2">
                <img src="<% = com.hooyes.lms.C.CDN %>/Img/Complete.jpg">
            </div>
            <div class="lesson">
                <div class="lesson2014">
                    <h3>
                        2014 继续教育课表</h3>
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
                        </tr>
                        <!-- 行政 -->
                        <%
                                
                            var CL = com.hooyes.lms.DAL.Get.CoursesList(2014, 0);

                            var CateCount1 = CL.Count(n => n.Cate == 1);
                            var CateCount0 = CL.Count(n => n.Cate == 0);

                            int i = 0;
                            int Cate1 = 0;
                            int Cate0 = 0;
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

                                
                        %>
                        <tr>
                            <% if (i == 1)
                               {
                                   var TypeString = c.Type == 0 ? "行政事业类" : "企业类";
                            %>
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
                                <%= c.Length %>
                            </td>
                        </tr>
                        <%
                            } 
                        %>
                        <!-- 企业 -->
                        <%
                                
                             CL = com.hooyes.lms.DAL.Get.CoursesList(2014, 1);

                             CateCount1 = CL.Count(n => n.Cate == 1);
                             CateCount0 = CL.Count(n => n.Cate == 0);

                             i = 0;
                             Cate1 = 0;
                             Cate0 = 0;
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

                                
                        %>
                        <tr>
                            <% if (i == 1)
                               {
                                   var TypeString =( c.Type == 0 )? "行政事业类" : "企业类";
                            %>
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
                                <%= c.Length %>
                            </td>
                        </tr>
                        <%
                            } 
                        %>
                    </table>
                </div>
                <div class="lesson2015">
                    <h3>
                        2015 继续教育课表</h3>
                    <table>
                        <tr>
                            <th colspan="2">
                                类别
                            </th>
                            <th>
                                课程名称
                            </th>
                             <th>
                                课程介绍
                            </th>
                            <th>
                                主讲老师
                            </th>
                            <th>
                                课时
                            </th>
                        </tr>
                        <!-- 行政 -->
                        <%
                                
                             CL = com.hooyes.lms.DAL.Get.CoursesList(2015, 0);

                             CateCount1 = CL.Count(n => n.Cate == 1);
                             CateCount0 = CL.Count(n => n.Cate == 0);

                             i = 0;
                             Cate1 = 0;
                             Cate0 = 0;
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

                                
                        %>
                        <tr>
                            <% if (i == 1)
                               {
                                   var TypeString = c.Type == 0 ? "行政事业类" : "企业类";
                            %>
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
                            <td>&nbsp;</td>
                            <td>
                                <%= c.Teacher %>
                            </td>
                            <td>
                                <%= c.Length %>
                            </td>
                        </tr>
                        <%
                            } 
                        %>
                        <!-- 企业 -->
                        <%
                                
                             CL = com.hooyes.lms.DAL.Get.CoursesList(2015, 1);

                             CateCount1 = CL.Count(n => n.Cate == 1);
                             CateCount0 = CL.Count(n => n.Cate == 0);

                             i = 0;
                             Cate1 = 0;
                             Cate0 = 0;
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

                                
                        %>
                        <tr>
                            <% if (i == 1)
                               {
                                   var TypeString =( c.Type == 0 )? "行政事业类" : "企业类";
                            %>
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
                            <td>&nbsp;</td>
                            <td>
                                <%= c.Teacher %>
                            </td>
                            <td>
                                <%= c.Length %>
                            </td>
                        </tr>
                        <%
                            } 
                        %>
                    </table>
                </div>

               <div class="lesson2013">
                    <h3>
                        2013 继续教育课表</h3>
                    <table>
                        <tr>
                            <th colspan="2">
                                类别
                            </th>
                            <th>
                                课程名称
                            </th>
                             <th>
                                课程介绍
                            </th>
                            <th>
                                主讲老师
                            </th>
                            <th>
                                课时
                            </th>
                        </tr>
                        <!-- 行政 -->
                        <%
                                
                             CL = com.hooyes.lms.DAL.Get.CoursesList(2013, 0);

                             CateCount1 = CL.Count(n => n.Cate == 1);
                             CateCount0 = CL.Count(n => n.Cate == 0);

                             i = 0;
                             Cate1 = 0;
                             Cate0 = 0;
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

                                
                        %>
                        <tr>
                            <% if (i == 1)
                               {
                                   var TypeString = c.Type == 0 ? "行政事业类" : "企业类";
                            %>
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
                            <td>&nbsp;</td>
                            <td>
                                <%= c.Teacher %>
                            </td>
                            <td>
                                <%= c.Length %>
                            </td>
                        </tr>
                        <%
                            } 
                        %>
                        <!-- 企业 -->
                        <%
                                
                             CL = com.hooyes.lms.DAL.Get.CoursesList(2013, 1);

                             CateCount1 = CL.Count(n => n.Cate == 1);
                             CateCount0 = CL.Count(n => n.Cate == 0);

                             i = 0;
                             Cate1 = 0;
                             Cate0 = 0;
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

                                
                        %>
                        <tr>
                            <% if (i == 1)
                               {
                                   var TypeString =( c.Type == 0 )? "行政事业类" : "企业类";
                            %>
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
                            <td>&nbsp;</td>
                            <td>
                                <%= c.Teacher %>
                            </td>
                            <td>
                                <%= c.Length %>
                            </td>
                        </tr>
                        <%
                            } 
                        %>
                    </table>
                </div>

                <div class="lesson2012">
                    <h3>
                        2012 继续教育课表</h3>
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
                        </tr>
                        <!-- 行政 -->
                        <%
                                
                             CL = com.hooyes.lms.DAL.Get.CoursesList(2012, 0);

                             CateCount1 = CL.Count(n => n.Cate == 1);
                             CateCount0 = CL.Count(n => n.Cate == 0);

                             i = 0;
                             Cate1 = 0;
                             Cate0 = 0;
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

                                
                        %>
                        <tr>
                            <% if (i == 1)
                               {
                                   var TypeString = c.Type == 0 ? "行政事业类" : "企业类";
                            %>
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
                                <%= c.Length %>
                            </td>
                        </tr>
                        <%
                            } 
                        %>
                        <!-- 企业 -->
                        <%
                                
                             CL = com.hooyes.lms.DAL.Get.CoursesList(2012, 1);

                             CateCount1 = CL.Count(n => n.Cate == 1);
                             CateCount0 = CL.Count(n => n.Cate == 0);

                             i = 0;
                             Cate1 = 0;
                             Cate0 = 0;
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

                                
                        %>
                        <tr>
                            <% if (i == 1)
                               {
                                   var TypeString =( c.Type == 0 )? "行政事业类" : "企业类";
                            %>
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
                                <%= c.Length %>
                            </td>
                        </tr>
                        <%
                            } 
                        %>
                    </table>
                </div>
                <div class="lesson2011">
                    <h3>
                        2011河南继续教育课表</h3>
                    <table>
                        <tr>
                            <th>
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
                        </tr>
                        <!-- 行政 -->
                        <%
                                
                             CL = com.hooyes.lms.DAL.Get.CoursesList(2011, 0);
                             i = 0;
                            foreach (var c in CL)
                            {
                                i++;
                        %>
                        <tr>
                            <% if (i == 1)
                               {
                                   var TypeString =( c.Type == 0 )? "行政事业类" : "企业类";
                            %>
                            <td rowspan="<%= CL.Count %>" class="font_w">
                                <%= TypeString%>
                            </td>
                            <%} %>
                            <td class="t_a_l">
                                <% = c.Name %>
                            </td>
                            <td>
                                <%= c.Teacher %>
                            </td>
                            <td>
                                <%= c.Length %>
                            </td>
                        </tr>
                        <%
                            } 
                        %>
                        <!-- 企业 -->
                        <%
                                
                             CL = com.hooyes.lms.DAL.Get.CoursesList(2011, 1);
                             i = 0;
                            foreach (var c in CL)
                            {
                                i++;
                        %>
                        <tr>
                            <% if (i == 1)
                               {
                                   var TypeString =( c.Type == 0 )? "行政事业类" : "企业类";
                            %>
                            <td rowspan="<%= CL.Count %>" class="font_w">
                                <%= TypeString%>
                            </td>
                             <%} %>
                            <td class="t_a_l">
                                <% = c.Name %>
                            </td>
                            <td>
                                <%= c.Teacher %>
                            </td>
                            <td>
                                <%= c.Length %>
                            </td>
                        </tr>
                        <%
                            } 
                        %>
                    </table>
                </div>
                <div class="lesson2010">
                    <h3>
                        2010河南继续教育课表</h3>
                        <table>
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
                        </tr>
                        <!-- All -->
                        <%
                                
                             CL = com.hooyes.lms.DAL.Get.CoursesList(2010, -1);
                             i = 0;
                            foreach (var c in CL)
                            {
                                i++;
                        %>
                        <tr>
                           
                            <td class="t_a_l">
                                <% = c.Name %>
                            </td>
                            <td>
                                <%= c.Teacher %>
                            </td>
                            <td>
                                <%= c.Length %>
                            </td>
                        </tr>
                        <%
                            } 
                        %>
                    </table>
                </div>
                <div class="lesson2009">
                    <h3>
                        2009河南继续教育课表</h3>
                        <table>
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
                        </tr>
                        <!-- All -->
                        <%
                                
                             CL = com.hooyes.lms.DAL.Get.CoursesList(2009, -1);
                             i = 0;
                            foreach (var c in CL)
                            {
                                i++;
                        %>
                        <tr>
                           
                            <td class="t_a_l">
                                <% = c.Name %>
                            </td>
                            <td>
                                <%= c.Teacher %>
                            </td>
                            <td>
                                <%= c.Length %>
                            </td>
                        </tr>
                        <%
                            } 
                        %>
                    </table>
                </div>
                <div class="lesson2008">
                    <h3>
                        2008河南继续教育课表</h3>
                        <table>
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
                        </tr>
                        <!-- All -->
                        <%
                                
                             CL = com.hooyes.lms.DAL.Get.CoursesList(2008, -1);
                             i = 0;
                            foreach (var c in CL)
                            {
                                i++;
                        %>
                        <tr>
                           
                            <td class="t_a_l">
                                <% = c.Name %>
                            </td>
                            <td>
                                <%= c.Teacher %>
                            </td>
                            <td>
                                <%= c.Length %>
                            </td>
                        </tr>
                        <%
                            } 
                        %>
                    </table>
                </div>
                <div class="lesson2007">
                    <h3>
                        2007河南继续教育课表</h3>
                        <table>
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
                        </tr>
                        <!-- All -->
                        <%
                                
                             CL = com.hooyes.lms.DAL.Get.CoursesList(2007, -1);
                             i = 0;
                            foreach (var c in CL)
                            {
                                i++;
                        %>
                        <tr>
                           
                            <td class="t_a_l">
                                <% = c.Name %>
                            </td>
                            <td>
                                <%= c.Teacher %>
                            </td>
                            <td>
                                <%= c.Length %>
                            </td>
                        </tr>
                        <%
                            } 
                        %>
                    </table>
                </div>
                <div class="lesson2006">
                    <h3>
                        2006河南继续教育课表</h3>
                        <table>
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
                        </tr>
                        <!-- All -->
                        <%
                                
                             CL = com.hooyes.lms.DAL.Get.CoursesList(2006, -1);
                             i = 0;
                            foreach (var c in CL)
                            {
                                i++;
                        %>
                        <tr>
                           
                            <td class="t_a_l">
                                <% = c.Name %>
                            </td>
                            <td>
                                <%= c.Teacher %>
                            </td>
                            <td>
                                <%= c.Length %>
                            </td>
                        </tr>
                        <%
                            } 
                        %>
                    </table>
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
