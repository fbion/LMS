<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    var MID = Convert.ToInt32(Request.QueryString.Get("MID"));
    var memeber = com.hooyes.lms.DAL.Get.Member(MID);
    var report = com.hooyes.lms.DAL.Get.Report(MID);
    var tystring = "未定";
    if (memeber.Type == 0)
    {
        tystring = "行政";
    }
    if (memeber.Type == 1)
    {
        tystring = "企业";
    }

    var exam = "-";
    if (memeber.Year >= 2012)
    {
        if (report.Score > 0)
        {
            exam = report.Score.ToString()+"分";
        }
        
    }
    var sumbmit = "-";

    if (report.Status == 1)
    {
        sumbmit = "已结业";
    }
   
    
%>
<div id="MemberDiv" style="margin-bottom: 5px">
    <table id="Table2" class="commontb">
        <tr>
            <td>
                姓名
            </td>
            <td>
                报名序号
            </td>
            <td>
                身份证号
            </td>
            <td>
                类型
            </td>
            <td>
                年份
            </td>
            <td style="text-align: center">
                考试
            </td>
            <td style="text-align: center">
                结业
            </td>
        </tr>
        <tr>
            <td>
                <%= memeber.Name %>
            </td>
            <td>
                <%= memeber.IDSN %>
            </td>
            <td>
                <%= memeber.IDCard %>
            </td>
            <td>
                <%= tystring%>
            </td>
            <td>
                <%= memeber.Year %>
            </td>
            <td style="text-align: center">
                <% = exam %>
            </td>
            <td style="text-align: center">
                <% = sumbmit%>
            </td>
        </tr>
    </table>
</div>
