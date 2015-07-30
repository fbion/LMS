<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%
        var My_Products = (List<com.hooyes.lms.Model.MyProductsFull>)ViewData["My_Products"];
                    //var Products = (List<com.hooyes.lms.Model.Products>)ViewData["Products"];
    %>
    <div id="main" class="event-cl">
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

            <% if (My_Products.Count > 0)
               { %>
            <table id="Table1" class="commontb paymenttb" style="width: 100%">
                <tr class="title">
                    <td colspan="3">已购买的课程</td>
                </tr>
                <tr>
                    <th>课程名称</th>
                    <th>有效期至</th>
                    <th></th>
                </tr>
                <%
                   foreach (var p in My_Products)
                   {
                %>
                <tr>
                    <td><%=p.Name %></td>
                    <td style="width: 18%;text-align:center"><%=p.ExpireDate.ToString("yyyy年MM月dd日")%> </td>
                    <td style="width: 18%;text-align:center">
                        <a href="<% = com.hooyes.lms.C.APP %>/Account/LearningX/<%=p.PID %>">课程详情</a>
                    </td>
                </tr>
                <%} %>
            </table>
            <div class="clear" style="margin-bottom: 10px">
            </div>
            <%}
               else
               { %>
            <div class="no-records">
                <div class="t"></div>
                <div class="c">您尚未开通课程  <a href="/Payment/Buy">购买课程</a></div>
            </div>
            <%} %>
        </div>
        <div class="clear">
        </div>
    </div>
</asp:Content>
