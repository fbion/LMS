<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div class="icons icons-login">
</div>
<h3>学员登录</h3>
<%
    if (!com.hooyes.lms.Client.IsLogin)
    {
%>
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
            <tr>
                <td colspan="2" style="text-align: center">
                    <span style="line-height: 25px;">
                        <a href="http://218.22.1.72/ahkj/portal/self_center/webEduLog/" target="_blank">网络继续教育报名</a>
                        <%--<br />
                        <a target="_blank" href="/home/help">使用指导手册</a>--%>
                    </span>
                </td>
            </tr>


        </table>
    </form>
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/account.js?v=2013030101" type="text/javascript"></script>
</div>
<%}
    else
    {
%>
<div class="login_info">
    <ul>
        <li><span class="nick">
            <%=com.hooyes.lms.Client.Name %></span>,您好！ </li>

        <li class="t_a_c linkli2"><a href="<% = com.hooyes.lms.C.APP %>/Payment/Buy">【课程列表】</a></li>
        <li class="t_a_c linkli2"><a href="<% = com.hooyes.lms.C.APP %>/Account/Invoice">【申请发票】</a></li>
        <li class="t_a_c linkli2"><a href="<% = com.hooyes.lms.C.APP %>/login/logout">【退出登录】</a></li>
    </ul>
   <%-- <p class="cert">
        <b>会计证所属地：安徽省</b>
    </p>--%>

</div>
<%} %>
