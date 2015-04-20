<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%
    string CDN_Private = ConfigurationManager.AppSettings.Get("CDN_Private");
    string CDN_Public = ConfigurationManager.AppSettings.Get("CDN_Public");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=8" />
    <title><%=ConfigurationManager.AppSettings.Get("web_title") %> -- 北京国家会计学院</title>
    <link href="<% = CDN_Private %>/public/css/commen.css" type="text/css" rel="stylesheet" />
    <link href="<% = CDN_Private %>/public/css/content.css" type="text/css" rel="stylesheet" />
    <link href="<% = CDN_Private %>/Css/r/yunfu.css?t=20150210" rel="stylesheet" type="text/css" />
    <link href="<% = CDN_Private %>/favicon.ico" rel="Bookmark" />
    <link href="<% = CDN_Private %>/favicon.ico" rel="Shortcut Icon" />
    <script src="<% = CDN_Public %>/jquery/1.7.1/jquery.min.js"></script>
    <script src="<% = CDN_Private %>/Scripts/config.js"></script>
    <script src="<% = CDN_Private %>/Scripts/account-2.js"></script>

</head>
<body>

    <!--header 开始-->
    <div class="header">

        <div class="header-inner"></div>
    </div>
    <!--header 结束-->
    <!--nav 开始-->
    <!--nav 结束-->

    <!--页面主体-->
    <input type="hidden" value="" id="repeat">
    <input type="hidden" value="" id="l">
    <!--wrapper 开始-->
    <div class="wrapper">
        <div class="loginMain">
            <div class="loginFocus">
                <div class="loginFocusInner" id="loginFocusInnertaizhou">
                    <ul class="pics" style="width: 1212px; left: 0px;">
                        <li class="ons"><a href="#" target="_blank">
                            <img src="<% = CDN_Private %>/courses/ad/image/ad/140679784053.jpg" alt="banner"></a></li>
                        <li class=""><a href="#" target="_blank">
                            <img src="<% = CDN_Private %>/courses/ad/image/ad/140679784150.jpg" alt="banner"></a></li>
                        <li class=""><a href="#" target="_blank">
                            <img src="<% = CDN_Private %>/courses/ad/image/ad/140679784257.jpg" alt="banner"></a></li>
                    </ul>
                    <ul class="posi">
                        <li class="on">1</li>
                        <li class="">2</li>
                        <li class="">3</li>
                    </ul>
                </div>
            </div>
            <script type="text/javascript" src="<% = CDN_Private %>/courses/ad/ad_js/taizhou_70.js"></script>

            <div class="loginFlow" style="height: auto; padding: 15px 0px 0px 0px;">
                <div style="width: 100%; border-bottom: 1px solid #DEDEDE;">
                    <img src="<% = CDN_Private %>/public/image/xxxz.jpg">
                    <div style="width: 620px; height: auto; padding: 10px;">
                        <div id="noticeContent" style="font-size: 13px; line-height: 25px">
                            <p>&nbsp;&nbsp;&nbsp;&nbsp;北京国家会计学院远程教育网“广东云浮市会计人员继续教育”网络学习开始，现开设<span style="color: red;">2013</span>和<span style="color: red;">2014</span>两个年度的“<span style="color: red;">企业类、小企业类、行政事业类</span>”三类课程的学习。收费标准：<span style="color: red;">100元/人。</span></p>
                            <p>
                                <span style="color: red; font-weight: bold">1.系统说明：</span><br>
                                &nbsp;&nbsp;本系统适合广东省云浮市所有参加继续教育的会计人员。<br>
                                &nbsp;&nbsp;广东省云浮市财政局认可会计人员通过本系统参加继续教育培训的过程和结果。
                            </p>

                            <p>
                                <span style="color: red; font-weight: bold">2.学习流程：</span><br>
                                &nbsp;&nbsp;<span style="color: blue; font-weight: bold">注册登陆</span>-&gt;
							<span style="color: blue; font-weight: bold">网上缴费</span>-&gt;
							<span style="color: blue; font-weight: bold">选课学习</span>-&gt;
							<span style="color: blue; font-weight: bold">在线考试</span>-&gt;
							<span style="color: blue; font-weight: bold">打印证书</span>-&gt;
							<span style="color: blue; font-weight: bold">审核确认</span>。<br>
                                &nbsp;&nbsp;更详细学习说明请参考：<a href="javascript:void(0)" target="blank">广东省云浮市会计人员继续教育学习流程。</a>
                            </p>

                            <p>
                                <span style="color: red; font-weight: bold">3.学习考试:</span><br>
                                &nbsp;&nbsp;&lt;课时&gt;<br>
                                &nbsp;&nbsp;所选课程的课时总数须大于24学时。<br>
                                &nbsp;&nbsp;&lt;学习&gt;<br>
                                &nbsp;&nbsp;学员可直接通过互联网点播课件学习，由系统自动记录学习时间。<br>
                                &nbsp;&nbsp;&lt;考试&gt;<br>
                                &nbsp;&nbsp;考试为综合考试，学习时间为24学分，不限学习次数，考试次数，60分考试合格。
试题从所有学完课程的试题中抽取。课程时间未学完者，只记录该科目学时，但该科目不能入选考试科目课程。<br>
                                &nbsp;&nbsp;&lt;证书&gt;<br>
                                &nbsp;&nbsp; 考试成绩大于等于60分者即可打印证书。
                            </p>

                            <p>
                                <span style="color: red; font-weight: bold">4.支付方式：</span><br>
                                &nbsp;&nbsp;
   支付方式为网银支付，本次学习不提供其他缴费方式。
                            </p>

                            <p>
                                <span style="color: red; font-weight: bold">5.审核确认：</span><br>
                                &nbsp;&nbsp;
   学员完成网络学习后，凭合格证书到当地会计主管机构办理会计继续教育证书的审核或新证颁发手续。
                            </p>
                            <p>
                                <span style="color: red; font-weight: bold">6.热线咨询：</span><br>
                                &nbsp;&nbsp;
    如果您在使用网校课件中遇到任何问题，请随时拨打24小时客服热线：400 063 0318，010-64505252，我们将竭诚为您服务！
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="loginSide">
            <div class="loginBlock">
                <div class="loginFunc">
                    <h3>公告</h3>

                </div>
                <div class="gonggao" id="showmessage">
                    <p>1.&nbsp;<a style="cursor: pointer;" id="m_318" class="showmessage">学习流程</a></p>
                    <p>2.&nbsp;<a style="cursor: pointer;" id="m_320" class="showmessage">学习帐号和密码</a></p>

                </div>
            </div>
        </div>

        <div class="loginSide">
            <div class="loginBlock">
                <div class="loginFunc">
                    <h3>登录</h3>
                </div>
                <div class="loginForm">
                    <form class="login_form" id="login_form" action="" onsubmit="return Login()" method="post">

                        <div class="loginInt" id="userName" style="margin-bottom: 0;">
                            <input type="text" value="" placeholder="身份证号" class="loginInput" id="ID" name="ID" tabindex="1" />
                        </div>
                        <div class="forgetPwdLine">
                            <%-- <a href="/index.php/Index/forget" target="_blank">忘记密码?</a>--%>
                        </div>
                        <div class="loginInt" id="passWord">
                            <input type="text" value="" placeholder="密码" class="loginInput" id="PWD" name="PWD" tabindex="2" />
                        </div>
                        <%-- <p style='font-size: 13px;'>
                            请输入<span style='color: red; font-size: 13px; font-weight: bold;'>
                                身份证
                            </span>和<span style='color: red; font-size: 13px; font-weight: bold;'> 姓名</span>登陆，选择好专区和年度再使用学习卡激活专区。
                        </p>--%>
                        <div class="loginBtn">
                            <input type="submit" id="login_btn" value="登 录" />
                            <span class="lfBtnReg"><a href="/signup" title="">注 册</a></span>
                        </div>
                        <%--<div class="loginFormConf" style="margin-bottom: 5px;">
                            <div class="loginFormVer">
                                <a href="/index.php/Help" target="_blank">帮助中心</a>
                            </div>
                            <div class="loginFormService">
                                <a href="http://get.adobe.com/cn/flashplayer/" target="_blank">Flash插件下载</a>
                            </div>
                        </div>--%>
                    </form>
                </div>
            </div>
            <div class="loginAbout">
            </div>
        </div>
    </div>
    <%--    <!--广告浮动-->
    <div id="floatdiv" onmouseover="floatStop();" onmouseout="floatStart();" style="position: absolute;">
        <p style="cursor: pointer;" id="cursor">关闭</p>
        <a href="#" style="border: 0px;">
            <!--<img src="/public/image/si.png" />-->
            <div>
                <img src="/courses/fd_img/1419906435.png" border="0" usemap="#Map" />
              
            </div>


        </a>
    </div>
    <script src="/public/js/fd.js"></script>
    <!--广告浮动结束-->--%>

    <!--wrapper 结束-->


    <div class="footer">
        <div class="inner">
            <p>版权所有:北京国家会计学院  联系电话：010-53663523 </p>
            <p>京公网安备11011302000821号  京ICP备05004616号</p>
        </div>
    </div>
    <div style="font-size: 14px; width: 135px; z-index: 2147483647; position: fixed ! important; right: 0px; bottom: 117px;">
        24小时免费咨询电话<p style="font-weight: bold; margin-left: 17px;">400-063-0318</p>
    </div>

    <script src="<% = CDN_Private %>/Scripts/header.js"></script>
    <script>
        HeaderShow.A();
    </script>
    <script src="http://wt.zoosnet.net/JS/LsJS.aspx?siteid=LRW32745646&float=1&lng=cn" type="text/javascript"></script>
</body>
</html>
