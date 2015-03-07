<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        string keyword = Request.QueryString.Get("search");
    %>
    <h2>
        查找学员
    </h2>
    <form action="" method="get">
    <table id="Table1" class="commontb" style="margin-bottom: 5px">
        <tr>
            <td style="height: 35px;">
                报名序号/身份证号/姓名
                <input id="Text1" name="search" type="text" class="search-input" value="<%=keyword %>" />
                <input id="Button1" type="submit" value="查找" class="search-btn" />
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
            <td>
                课时
            </td>
            <td>
                发票
            </td>
            <td>
                考试
            </td>
            <td>
                结业
            </td>
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
                    var tystring = "未定";
                    var invoicestring = "-";
                    var statusstring = "-";
                    var score = "-";
                    if (m.Type == 0)
                    {
                        tystring = "行政";
                    }
                    if (m.Type == 1)
                    {
                        tystring = "企业";
                    }
                    if (m.IID > 0)
                    {
                        invoicestring = "发票";
                    }
                    if (m.Status == 1)
                    {
                        statusstring = "已结业";
                    }

                    if (m.Year >= 2012 && m.Score > 0)
                    {
                        score = m.Score.ToString() ;
                    }
        %>
        <tr class="<%=oddClass %>">
            <td>
                <%= m.Name%>
            </td>
            <td>
                <%= m.IDSN%>
            </td>
            <td>
                <%= m.IDCard%>
            </td>
            <td>
                <% = tystring%>
            </td>
            <td>
                <%= m.Year%>
            </td>
            <td>
                <a href="ViewCourses?MID=<%= m.MID%>&year=<% = m.Year %>&type=<% = m.Type %>" target="_blank">
                    <%= m.Minutes.ToString("0.#") %>
                    分钟 </a>
            </td>
            <td>
                <a href="ViewInvoice?MID=<%= m.MID%>&year=<% = m.Year %>&type=<% = m.Type %>" target="_blank">
                    <%= invoicestring%>
                </a>
            </td>
            <td>
                <%= score %>
            </td>
            <td>
                <%= statusstring%>
            </td>
        </tr>
        <%} %>
    </table>
    <%
            }
        }
    %>
   
</asp:Content>
