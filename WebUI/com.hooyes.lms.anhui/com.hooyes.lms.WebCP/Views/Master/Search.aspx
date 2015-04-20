<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        string keyword = Request.QueryString.Get("search");
        bool CanViewMember = com.hooyes.lms.Client.CheckTag(17);
    %>
    <h2>查找学员
    </h2>
    <form action="" method="get">
        <table id="Table1" class="commontb" style="margin-bottom: 5px">
            <tr>
                <td style="height: 35px;">身份证号/姓名
                    <input id="search-text" name="search" class="search-input" value="<%=keyword %>" type="text" />
                    <button type="submit" class="search-btn">查找</button>
                </td>
            </tr>
        </table>
    </form>
    <%
        
        if (!string.IsNullOrEmpty(keyword))
        {
            keyword = com.hooyes.lms.U.LikeKeyword(keyword);
            var ListM = com.hooyes.lms.DAL.M.Get.M1(keyword);
            if (ListM.Count > 0)
            {
    %>
    <table id="Table2" class="commontb">
        <tr>
            <td>姓名
            </td>
            <td>身份证号
            </td>
            <td>已开通学年
            </td>
            <td>课时
            </td>
            <td>结业状态</td>
            <td style="background-color: #0094ff; color: #FFF">提交状态
            </td>
            <td style="background-color: #0094ff; color: #FFF">提交时间</td>
        </tr>
        <% 
                int odd = 0;
                var oddClass = "";
                foreach (var m in ListM)
                {
                    if (odd == 1)
                    {
                        oddClass = "odd";
                        odd = 0;
                    }
                    else
                    {
                        odd = 1;
                        oddClass = "";
                    }

                    var YearString = "-";
                    if (m.Year > 0)
                    {
                        YearString = m.Year.ToString();
                    }

                    
        %>
        <tr class="<%=oddClass %>">
            <td>
                <%if (CanViewMember)
                  { %>
                <a href="ViewMember?MID=<%= m.MID%>" target="_blank"><%= m.Name%></a>
                <%}
                  else
                  { %>
                <%= m.Name%>
                <%} %>
            </td>
            <td>
                <%= m.IDCard%>
            </td>
            <td>

                <%= YearString%>
            </td>
            <td>
                <a href="ViewCourses?MID=<%= m.MID%>&year=<% = m.PID %>&type=<% = m.Type %>" target="_blank">
                    <%= Math.Round(m.Minutes,0) %>
                    分钟 </a>
            </td>
            <td>
                <%if (m.Status == 1)
                  { %>
                已结业
                <%}
                  else
                  { %>
                --
                <%} %>
            </td>
            <td>
                <%if (m.Flag == 1)
                  {%>
                   已提交
                <%}
                  else
                  { %>
                   --
                <%} %>
            </td>
            <td>
                <%if (m.Flag == 1)
                  {%>
                <%=m.CommitDate %>
                <%}
                  else
                  { %>
                 --
                <%} %>
            </td>
        </tr>
        <%} %>
    </table>
    <%
            }
            else
            {
    %>
    <table id="Table3" class="commontb">
        <tr>
            <td>无记录</td>
        </tr>
    </table>
    <%
            }
        }
    %>
    <%--<table id="Table4" class="commontb">
        <tr>
            <td><a target="_blank" href="http://218.22.1.72/ahkj/portal/self_center/webEduLog/login.jsp">安徽省财政厅查询系统</a></td>
        </tr>
    </table>--%>
</asp:Content>
