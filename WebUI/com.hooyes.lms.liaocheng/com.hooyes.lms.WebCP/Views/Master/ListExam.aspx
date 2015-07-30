<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var CL = new List<com.hooyes.lms.Model.Courses>();
        var i = 0;
    %>
    <h2>试题管理</h2>

    <!-- 历年课表 Begin-->
    <div class="lesson1" style="width: 100%">
         <div class="">
            <h3>2015课程试题管理</h3>
            <table class="commontb">
                <tr>

                    <th>课程名称
                    </th>
                    <th>主讲老师
                    </th>
                    <th>课时
                    </th>
                </tr>
                <!-- All -->
                <%
                                
                    CL = com.hooyes.lms.DAL.Get.CoursesList(2015, -1);
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
        <div class="">
            <h3>2014课程试题管理</h3>
            <table class="commontb">
                <tr>

                    <th>课程名称
                    </th>
                    <th>主讲老师
                    </th>
                    <th>课时
                    </th>
                </tr>
                <!-- All -->
                <%
                                
                    CL = com.hooyes.lms.DAL.Get.CoursesList(2014, -1);
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
        <div class="lesson2013">
            <h3>2013课程试题管理</h3>
            <table class="commontb">
                <tr>

                    <th>课程名称
                    </th>
                    <th>主讲老师
                    </th>
                    <th>课时
                    </th>
                </tr>
                <!-- All -->
                <%
                                
                    CL = com.hooyes.lms.DAL.Get.CoursesList(2013, -1);
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
        <div class="lesson2012">
            <h3>2012课程试题管理</h3>
            <table class="commontb">
                <tr>

                    <th>课程名称
                    </th>
                    <th>主讲老师
                    </th>
                    <th>课时
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
            <h3>2011课程试题管理</h3>
            <table class="commontb">
                <tr>

                    <th>课程名称
                    </th>
                    <th>主讲老师
                    </th>
                    <th>课时
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
    </div>
</asp:Content>
