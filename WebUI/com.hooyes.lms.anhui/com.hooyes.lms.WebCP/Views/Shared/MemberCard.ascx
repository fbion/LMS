<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    var MID = Convert.ToInt32(Request.QueryString.Get("MID"));
    var Year = Convert.ToInt32(Request.QueryString.Get("Year"));
    var memeber = com.hooyes.lms.DAL.Get.Member(MID);
    var report = com.hooyes.lms.DAL.Get.Report(MID, Year);
    
%>
<div id="MemberDiv" style="margin-bottom: 5px">
    <table id="Table2" class="commontb">
        <tr>
            <td>姓名
            </td>
            <td>身份证号
            </td>
            <td>年份
            </td>
            <td>已学课时</td>
            <td>结业状态</td>
            <td style="background-color: #0094ff; color: #FFF">提交状态
            </td>
            <td style="background-color: #0094ff; color: #FFF">提交时间</td>
        </tr>
        <tr>
            <td>
                <%= memeber.Name %>
            </td>
            <td>
                <%= memeber.IDCard %>
            </td>
            <td>
                <%= report.Year %>
            </td>
            <td>
                <%= Math.Round( report.Minutes,0) %> 分钟
            </td>
            <td>
                <%if (report.Status == 1)
                  { %>
                已结业
                <%}
                  else
                  { %>
                --
                <%} %>
            </td>
            <td>
                <%if (report.Flag == 1)
                  {%>
                   已提交
                <%}
                  else
                  { %>
                   --
                <%} %>
            </td>
            <td>
                <%if (report.Flag == 1)
                  {%>
                <%=report.CommitDate %>
                <%}
                  else
                  { %>
                 --
                <%} %>
            </td>
        </tr>
    </table>
</div>
