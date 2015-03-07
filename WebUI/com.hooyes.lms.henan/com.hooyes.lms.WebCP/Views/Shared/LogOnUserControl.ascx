<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<h3>学员登陆</h3>
<%
    if (!com.hooyes.lms.Client.IsLogin)
    {
%>
<div class="login_not">
    <form class="login_form" id="login_form" action="" onsubmit="return Login()" method="post">
        <input type="hidden" name="sid" id="sid" value="2012" />
        <table class="login_tb">
            <tr>
                <td style="width: 60px">报名序号：
                </td>
                <td>
                    <input name="ID" id="ID" type="text" maxlength="20" class="input w2" />
                </td>
            </tr>
            <tr>
                <td>身份证号：
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
                    <input name="login_btn" id="login_btn" type="submit" value="登 陆" class="btn" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <a href="http://www.hncz.gov.cn:8001/he-eams/NetService/ExternService/Apply/Comp/Apply_Comp_GetOrderId_CertId.jsp?flag=orderContTeach"
                        target="_blank">[ 查询报名序号 ]</a>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">如您已缴费还无法正常登陆学习<br />
                    请致电我网校：4000630318
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
        <li><span>
            <%=com.hooyes.lms.Client.Name %></span>,您好！ </li>
        <%
        if (com.hooyes.lms.Client.Report_Status == 1)
        {
        %>
        <li class="t_a_c linkli2 LiTip" style="height: auto; text-align: left">恭喜您已完成 24 课时的继续教育课程<br />
            培训结业！</li>
        <%
        }
        %>
        <li class="t_a_c linkli2"><a href="<% = com.hooyes.lms.C.APP %>/Account/Learning">【课程列表】</a></li>
        <% if (com.hooyes.lms.Client.Year >= 2012)
           { %>
        <li class="t_a_c linkli2"><a href="<% = com.hooyes.lms.C.APP %>/Account/Paper" target="_blank">【考试入口】</a></li>
        <%} %>
        <li class="t_a_c linkli2"><a href="<% = com.hooyes.lms.C.APP %>/Account/Invoice"
            target="_blank">【申请发票】</a></li>
        <li class="t_a_c linkli2"><a href="<% = com.hooyes.lms.C.APP %>/login/logout">【退出登录】</a></li>
    </ul>
    <p class="cert">
        <b>会计证所属地：河南省</b>
    </p>

    <%
           //已在本平台学完，但对方系统未结业的学员提示
           if (com.hooyes.lms.Client.Learning_Finish == 1 && com.hooyes.lms.Client.Report_Status != 1)
           {
    %>
    <script type="text/javascript">
        setTimeout(function () {
            alert("网上考试合格、学完24学时，稍后可登陆河南省会计信息管理系统查询教育情况，如果查询结果不符请与本网校联系");
        }, 900);
    </script>
    <%
           }
    %>
</div>
<%} %>
