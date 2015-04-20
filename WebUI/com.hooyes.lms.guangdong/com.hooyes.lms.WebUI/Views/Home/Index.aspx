<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%
    string CDN_Private = ConfigurationManager.AppSettings.Get("CDN_Private");
    string CDN_Public = ConfigurationManager.AppSettings.Get("CDN_Public");
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=8" />
    <title><%=ConfigurationManager.AppSettings.Get("web_title") %> -- 北京国家会计学院</title>
    <link href="<% = CDN_Private %>/public/css/commen.css" type="text/css" rel="stylesheet" />
    <link href="<% = CDN_Private %>/public/css/content.css" type="text/css" rel="stylesheet" />
    <link href="<% = CDN_Private %>/Css/r/guangdong.css?t=20150210" rel="stylesheet" type="text/css" />
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
                        <li class="ons"><a href="javascript:void(0);">
                            <img src="<% = CDN_Private %>/courses/ad/image/ad/140125593839.png" alt="banner"></a>
                        </li>
                        <li class=""><a href="javascript:void(0);">
                            <img src="<% = CDN_Private %>/courses/ad/image/ad/140368197575.png" alt="banner"></a>
                        </li>
                        <li class=""><a href="javascript:void(0);">
                            <img src="<% = CDN_Private %>/courses/ad/image/ad/140368198122.png" alt="banner"></a>
                        </li>
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
                    <div style="width: 620px; height: 460px; padding: 10px;">
                        <div id="noticeContent" style="font-size: 13px; line-height: 25px">
                            <p>&nbsp;&nbsp;&nbsp;&nbsp;北京国家会计学院远程教育网“广东省直会计人员继续教育”网络学习开始，现开设<span style="color: red;">2013</span>和<span style="color: red;">2014</span>两个年度的“<span style="color: red;">企业类、小企业类、行政事业类</span>”三类课程的学习。达标学时为24学时，考试为综合考试，收费标准：<span style="color: red;">100元/人。</span></p>
                            <p>
                                1.会计人员继续教育实际完成情况查询和证书打印
							<a target="_blank" href="http://210.76.65.189:8086/gdkjJXJY/NetService/jxjy/cxfw/cy_user_search.jsp?prePage=%E4%BB%8E%E4%B8%9A%E4%BA%BA%E5%91%98%E6%9F%A5%E8%AF%A2">(点击进入)</a>
                            </p>
                            <p>
                                2.关于2015年会计人员继续教育培训有关事项的通知
							<a target="_blank" href="http://www.gdczt.gov.cn/adminfo/am/201503/t20150318_55371.htm">(点击进入)</a>
                            </p>

                          <%--  <p>
                                3.广东省直会计人员继续教育学习流程
							<a target="_blank" href="javascript:void(0);">(点击进入)</a>
                            </p>--%>

                            <p>
                                3.广东省会计信息服务平台
							<a target="_blank" href="http://210.76.65.189:8080/gdkjcms/">(点击进入)</a>
                            </p>

                            <p>
                                4.广东省属会计人员继续教育事项登记办事指南
							<a target="_blank" href="http://210.76.65.189:8080/gdkjcms/kjxxhzxtz/1783.jhtml">(点击进入)</a>
                            </p>

                            <p>
                                5.广东省财政厅会计信息服务平台“从业诚信档案查询”
							<a target="_blank" href="http://210.76.65.189:8081/gd-comp/NetService/ExternService/Apply/Comp_Query_Login.jsp?functionName=search">(点击进入)</a>
                            </p>
                            <br>
                            <p style="color: red;">温馨提示：广大学员在继续教育完成学习时间并参加考试后,<span style="color: blue; font-weight: bold">需要回传至广东省财政厅复核,请于一周左右</span>登录广东省会计信息服务平台上查询您的继续教育完成信息。</p>
                        </div>

                        <img src="<% = CDN_Private %>/public/image/gdxxlc.jpg" style="padding-top: 15px;">
                    </div>
                    <!--<img src="/courses/learningImg/learning_13.jpg"  style=" padding-top:15px;"/>-->

                </div>
            </div>
        </div>
        <div class="loginSide">
            <div class="loginBlock">
                <div class="loginFunc">
                    <h3>公告</h3>

                </div>
                <div class="gonggao" id="showmessage">
                   <%-- <p>1.&nbsp;<a style="cursor: pointer;" id="m_318" class="showmessage">学习流程</a></p>--%>
                     <p>
                        1.会计人员继续教育实际完成情况查询和证书打印
							<a target="_blank" href="http://210.76.65.189:8086/gdkjJXJY/NetService/jxjy/cxfw/cy_user_search.jsp?prePage=%E4%BB%8E%E4%B8%9A%E4%BA%BA%E5%91%98%E6%9F%A5%E8%AF%A2">(点击进入)</a>
                    </p>
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
                            <input type="text" value="" placeholder="姓名" class="loginInput" id="PWD" name="PWD" tabindex="2" />
                        </div>
                        <p style='font-size: 13px;'>
                            请输入<span style='color: red; font-size: 13px; font-weight: bold;'>
                                身份证号
                            </span>和<span style='color: red; font-size: 13px; font-weight: bold;'> 姓名 </span>登录
                        </p>
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
