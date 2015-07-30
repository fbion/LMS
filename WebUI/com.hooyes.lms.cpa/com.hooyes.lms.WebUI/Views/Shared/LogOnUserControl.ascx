<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    string CDN_Private = ConfigurationManager.AppSettings.Get("CDN_Private");
    string CDN_Public = ConfigurationManager.AppSettings.Get("CDN_Public");
%>

<%
    if (!com.hooyes.lms.Client.IsLogin)
    {
%>
<h3>学员登陆</h3>
<div class="login_not">
    <form class="login_form" id="login_form" action="" onsubmit="return Login()" method="post">
        <input type="hidden" name="sid" id="sid" value="2013" />
        <table class="login_tb">
            <tr>
                <td style="width: 60px; text-align: right">身份证号：
                </td>
                <td>
                    <input name="ID" id="ID" type="text" maxlength="20" class="input w2" />
                </td>
            </tr>
            <tr>
                <td style="width: 60px; text-align: right">姓名：
                </td>
                <td>
                    <input name="PWD" id="PWD" type="text" maxlength="18" class="input w2" />
                </td>
            </tr>
            <%--<tr>
            <td>
                验 证 码：
            </td>
            <td>
                <input name="Captcha" id="Captcha" type="text" size="5" maxlength="4" class="input" />
                <img onclick="CaptchaRefresh(this)" src="<% = com.hooyes.lms.C.APP %>/login/code?sid=2012&hash=1"
                    alt="Captcha" />
            </td>
        </tr>--%>
            <tr>
                <td colspan="2" style="text-align: center">
                    <input name="login_btn" id="login_btn" type="submit" value="登 录" class="btn" />
                </td>
            </tr>


        </table>
    </form>
    <script src="<% = CDN_Private %>/Scripts/account.js?v=2013030101" type="text/javascript"></script>
</div>
<%}
    else
    {
%>
<h3>学员信息</h3>
<div class="login_info">
    <ul>
        <li><span class="nick">
            <%=com.hooyes.lms.Client.Name %></span>,您好！ </li>

        <li class="t_a_c linkli2"><a href="<% = com.hooyes.lms.C.APP %>/Payment/Buy">【课程列表】</a></li>
        <li class="t_a_c linkli2 link-invoice"><a href="<% = com.hooyes.lms.C.APP %>/Account/Invoice">【申请发票】</a></li>
        <li class="t_a_c linkli2 link-photo"><a href="<% = com.hooyes.lms.C.APP %>/Upload/Photo">【上传照片】</a></li>
        <li class="t_a_c linkli2 link-profiles"><a href="<% = com.hooyes.lms.C.APP %>/Account/Profiles">【个人信息】</a></li>
        <li class="t_a_c linkli2"><a href="<% = com.hooyes.lms.C.APP %>/login/logout">【退出登录】</a></li>
    </ul>
    <p class="cert">
        <%-- <b>会计证所属地：<%=ConfigurationManager.AppSettings.Get("web_region") %></b>--%>
    </p>

</div>
<%} %>
