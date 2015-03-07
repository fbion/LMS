<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="main">
        <div id="left">
            <div class="login">
                <% Html.RenderPartial("LogOnUserControl"); %>
            </div>
            <div class="expl">
                <h3>
                    网络培训相关说明</h3>
                <div class="con">
                    <p>
                        根据《中华人民共和国会计法》、《会计人员继续教育规定》的要求， 我省会计人员继续教育采取网上学习
                    </p>
                    <div class="line">
                    </div>
                    
                </div>
            </div>
        </div>
        <div id="right">
           <%-- <div class="board">
                <p>
                    会计人员参加网上学习，系统自动记录学习时间，正式开课后每10分钟网校与学员互动，弹出回答问题窗口，不回答的即停止计时，原计时有效，可以在一个年度内累计。请牢记报名序号及学习网址，二次及以后学习请直接登录本网站进行学习。网上考试合格、学完24学时，稍后可登陆江西省会计信息管理系统查询教育情况，如果查询结果不符请与本网校联系
                </p>
            </div>--%>
            <div class="flow">
                <h3>
                    学习流程</h3>
                <img src="<% = com.hooyes.lms.C.CDN %>/Img/call.jpg" class="call">
                <img src="<% = com.hooyes.lms.C.CDN %>/Img/registration.jpg"></a><img src="<% = com.hooyes.lms.C.CDN %>/Img/dao2.gif"
                    class="dao2">
                <img src="<% = com.hooyes.lms.C.CDN %>/Img/learning.jpg"></a><img src="<% = com.hooyes.lms.C.CDN %>/Img/dao2.gif"
                    class="dao2">
                <img src="<% = com.hooyes.lms.C.CDN %>/Img/Learning finish.jpg"></a><img src="<% = com.hooyes.lms.C.CDN %>/Img/dao2.gif"
                    class="dao2">
                <img src="<% = com.hooyes.lms.C.CDN %>/Img/Exam.jpg"></a><img src="<% = com.hooyes.lms.C.CDN %>/Img/dao2.gif"
                    class="dao2">
                <img src="<% = com.hooyes.lms.C.CDN %>/Img/Complete.jpg"></a>
            </div>
            <!-- 历年课表 Begin-->
            <div class="lesson">
               
                <div class="lesson2013">
                    <h3>
                        2013继续教育课表</h3>
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
                                
                           var  CL = com.hooyes.lms.DAL.Get.CoursesList(2013, -1);
                           var  i = 0;
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
                <div class="lesson2012">
                    <h3>
                        2012继续教育课表</h3>
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
                                
                             CL = com.hooyes.lms.DAL.Get.CoursesList(2012, -1);
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
                <div class="lesson2011">
                    <h3>
                        2011继续教育课表</h3>
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
                                
                             CL = com.hooyes.lms.DAL.Get.CoursesList(2011, -1);
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
                <div class="lesson2010">
                    <h3>
                        2010继续教育课表</h3>
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
                        2009继续教育课表</h3>
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
                        2008继续教育课表</h3>
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
                        2007继续教育课表</h3>
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
                        2006继续教育课表</h3>
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
                <div class="lesson2005">
                    <h3>
                        2005继续教育课表</h3>
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
                                
                             CL = com.hooyes.lms.DAL.Get.CoursesList(2005, -1);
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
            <!-- 历年课表 End-->
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
