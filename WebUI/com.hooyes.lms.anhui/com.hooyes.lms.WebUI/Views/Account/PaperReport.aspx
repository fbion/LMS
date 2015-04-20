<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        //var Report = (com.hooyes.lms.Model.Report)ViewData["Report"];
        var MyCourses = (com.hooyes.lms.Model.MyCourses)ViewData["MyCourses"];
        var DisplayYear = (int)ViewData["DisplayYear"];
    %>
    <div id="main">
        <div id="right" style="width: 100%">
            <div class="board board2" style="text-align: center; font-weight: bold">
                <%=MyCourses.Name %>  考试题 
            </div>
            <div id="paperdiv scorediv">
                <div class="score">
                    考试成绩：<b style="font-size: 28px;"><%= MyCourses.Score %></b> 分
               
                    <a href="<%=com.hooyes.lms.C.APP %>/Account/Paper/p/<%=DisplayYear %>/<%=MyCourses.CID %>">再考一次</a>
                    <br />
                    <a href="<%=com.hooyes.lms.C.APP %>/Account/LearningX/<%=DisplayYear %>">继续学习</a>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
