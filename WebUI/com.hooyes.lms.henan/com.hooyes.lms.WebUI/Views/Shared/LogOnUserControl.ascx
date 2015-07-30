<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%
    string CDN_Private = ConfigurationManager.AppSettings.Get("CDN_Private");
    string CDN_Public = ConfigurationManager.AppSettings.Get("CDN_Public");
%>
<div id="Survey" class="Survey none">
    <div id="closediv" class="close-div">
        <button class="btn_close closex">X</button>
    </div>
    <h3>&nbsp;在线帮助</h3>
    <div id="SurveryContent" class="Survey-Content">
        <div id="SurveryMessage" class="Survery-Message none">
            <div id="SurveryMessageText">
                您的问题已经受理，请耐心等待。<br />
                处理成功后我们会及时通知您。
            </div>
            <div id="SurveryMessageBtn">
                <button class="btn_close" type="button">关闭窗口</button>
            </div>
        </div>
        <form id="survey_form" method="post">
            <ul id="Survey_Item_1" class="Survey-Item">
                <li class="title">您遇到什么问题？</li>
                <li class="li_s1">
                    <input type="radio" name="Cate" id="ra1" value="1" /><label for="ra1">付款成功，但是没有报名序号</label>
                </li>
                <li class="li_s1">
                    <input type="radio" name="Cate" id="ra2" value="2" /><label for="ra2">付款成功，但是报名序号提示无效</label>
                </li>
                <li>
                    <input type="radio" name="Cate" id="ra3" value="3" /><label for="ra3">学习完毕，但是省网站上查不到记录</label>
                </li>
                <li class="other">
                    <input type="radio" name="Cate" id="ra4" value="4" /><label for="ra4">其他问题</label>
                    <p>
                        <textarea class="text" id="Comment" name="Comment" maxlength="100" disabled="disabled"></textarea>
                    </p>
                </li>
                <li class="submit">
                    <button type="button" id="btn_SurveyNext">下一步</button>
                    <button type="button" id="btn_SurveyPost_1" class="btn_SurveyPost none">提交问题</button>
                </li>
            </ul>
            <ul id="Survey_Item_2" class="Survey-Item Surver-User none">
                <li>您的姓名<input type="text" name="Name" id="S_Name" value="" class="required SName" />*</li>
                <li>身份证号<input type="text" name="IDCard" id="S_IDCard" value="" class="required IDCard" />*</li>
                <li>手机号码<input type="text" name="Phone" id="S_Phone" value="" class="required Phone" />*</li>
                <li id="li_IDSN">报名序号<input type="text" name="IDSN" id="S_IDSN" value="" class="required IDSN" />*</li>
                <li id="li_IDCert" class="none">会计证号<input type="text" name="IDCert" id="S_IDCert" value="" class="required IDCert" />*</li>
                <li class="submit">
                    <button type="button" id="btn_SurveyPre">上一步</button>
                    <button type="button" id="btn_SurveyPost_2" class="btn_SurveyPost">提交问题</button>
                </li>
            </ul>
        </form>
    </div>
    <script type="text/javascript">
        <%if (com.hooyes.lms.Client.IsLogin)
          {%>
        var ISLOGIN = true;
        <%}
          else
          {%>
        var ISLOGIN = false;
        <%}%>
    </script>
    <script src="<% = CDN_Public %>/jquery-validate/1.9.0/jquery.validate.min.js" type="text/javascript"></script>
    <script src="<% = CDN_Private %>/Scripts/survey.js" type="text/javascript"></script>
</div>
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
            <%--<tr class="o-tip">
                <td colspan="2" style="text-align: center">
                    <a href="http://www.hncz.gov.cn:8001/he-eams/NetService/ExternService/Apply/Comp/Apply_Comp_GetOrderId_CertId.jsp?flag=orderContTeach"
                        target="_blank">[ 查询报名序号 ]</a>
                </td>
            </tr>
            <tr class="o-tip">
                <td colspan="2" style="text-align: center">如您已缴费还无法正常登陆学习<br />
                    请致电我网校：4000630318
                </td>
            </tr>--%>
        </table>
    </form>
    <script src="<% = CDN_Private %>/Scripts/account.henan.js?v=2013030101" type="text/javascript"></script>
</div>
<div id="help_div" class="help-div beta">
    <p id="help_div_msg">如您已缴费还无法正常登陆学习，<br />
        请选择以下帮助</p>
    <ul>
        <li class="a"><a href="<% = com.hooyes.lms.C.APP %>/home/faq" id="A1" target="_blank">常见问题</a></li>
        <li><a href="javascript:void(0);" id="help_1">在线帮助</a></li>
        <li class="c"><a href="http://www.hncz.gov.cn:8001/he-eams/NetService/ExternService/Apply/Comp/Apply_Comp_GetOrderId_CertId.jsp?flag=orderContTeach" target="_blank" id="help_2">查询报名序号</a></li>
    </ul>
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
        <%-- <% if (com.hooyes.lms.Client.Year >= 2012)
           { %>
        <li class="t_a_c linkli2"><a href="<% = com.hooyes.lms.C.APP %>/Account/Paper" target="_blank">【考试入口】</a></li>
        <%} %>--%>
        <li class="t_a_c linkli2"><a href="<% = com.hooyes.lms.C.APP %>/Account/Invoice"
            target="_blank">【申请发票】</a></li>
        <li class="t_a_c linkli2"><a href="<% = com.hooyes.lms.C.APP %>/Survey" target="_blank">【培训调查】</a>
        </li>
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
