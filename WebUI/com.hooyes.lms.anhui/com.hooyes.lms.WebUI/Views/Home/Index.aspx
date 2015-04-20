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
    <link href="<% = CDN_Private %>/Css/r/anhui.css?t=20150210" rel="stylesheet" type="text/css" />
    <link href="<% = CDN_Private %>/favicon.ico" rel="Bookmark" />
    <link href="<% = CDN_Private %>/favicon.ico" rel="Shortcut Icon" />
    <script src="<% = CDN_Public %>/jquery/1.7.1/jquery.min.js"></script>
    <script src="<% = CDN_Private %>/Scripts/config.js"></script>
    <script src="<% = CDN_Private %>/Scripts/account.js"></script>
    <!--页面css,jquery-->
</head>
<body>
    <!--公共头部-->
    <!--topbar 开始-->
    <%--    <div class="topbar">
        <div class="inner">
            <ul class="topbarLeft">
                <li><a href="/">首页</a>&nbsp;|&nbsp;</li>
                <li><a href="javascript:;" onclick="return add_favorite(this,'会院');">加入收藏</a>&nbsp;&nbsp;</li>
                <!-- <li><a id="gnjs" href="javascript:void(0);">功能介绍</a></li>-->
            </ul>
            <ul class="topbarRight">
                <li>您好，今天是:</li>
                <li id='time' style='position: relative; right: 10px'></li>
            </ul>
        </div>
    </div>--%>
    <!--topbar 结束-->
    <!--header 开始-->
    <div class="header">
        <%--  <div class="inner">
            <!--logo-->
            <div class="logo">
            </div>
            <div class="logo-tit">
                <div class="logo-main">泰州会计人员继续教育</div>
            </div>
            <!--搜索-->
        </div>--%>
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
                            <img src="<% = CDN_Private %>/courses/ad/image/ad/139323124341.png" alt="banner"></a>
                        </li>
                        <li class=""><a href="javascript:void(0);">
                            <img src="<% = CDN_Private %>/courses/ad/image/ad/140368198122.png" alt="banner"></a>
                        </li>
                    </ul>
                    <ul class="posi">
                        <li class="on">1</li>
                        <li class="">2</li>
                    </ul>
                </div>
            </div>
            <script type="text/javascript" src="<% = CDN_Private %>/courses/ad/ad_js/taizhou_70.js"></script>

            <div class="loginFlow" style="height: auto; padding: 0px 0px 0px 0px;">
                <div class="about-flow">
                    <ul class="ul-content">
                        <li class="t">关于2015年度会计人员继续教育的通知</li>
                        <li class="c">
                            <p>
                                点击下载：<a href="http://news.online.nai.edu.cn/anhui/2015年安徽继续教育通知.doc" target="_blank">2015年安徽继续教育通知.doc</a>
                            </p>
                        </li>
                        <li class="t">学习流程</li>
                        <li class="c">
                           <p> 学员登陆安徽会计网报名我院网校后，使用身份证号码和姓名直接登录我院网校缴费学习。
                             缴费成功后，可自主选择本人需学习的课程，网校课件自动记录学习的时间，每门课程学习完毕并考试成功后获得该课程的学分，学满24学分后结业，学员信息将自动传往安徽会计网。</p>
<p>相关继续教育信息自动登记到从业资格档案中。学员可登陆安徽省会计人员继续教育系统查询教育登记的情况，如果查询结果不符，请与网校联系。</p>
<p>学员需先登陆安徽省会计人员网络继续教育系统，网上报名成功后，方可登陆学习。
                            </p>
                            <p>
                                <a href="http://218.22.1.72/ahkj/portal/self_center/webEduLog/" target="_blank">点击进入安徽省会计人员网络继续教育报名系统。</a>
                            </p>
                        </li>
                        <li class="t">安徽省会计人员继续教育网上学习流程
                        </li>
                        <li class="c">
                            <p style="padding: 0px; margin: 0px;">
                                <img src="<% = CDN_Private %>/public/images/an.jpg" alt="" />
                            </p>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="loginSide">
            <div class="loginBlock">
                <div class="loginFunc">
                    <h3>公告</h3>

                </div>
                <div class="gonggao" id="showmessage">
                    <%--  <p>1.&nbsp;<a style="cursor: pointer;" id="m_318" class="showmessage">学习须知</a></p>
                    <p>2.&nbsp;<a style="cursor: pointer;" id="m_320" class="showmessage">2014年继续教育重要通知</a></p>--%>
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
                            身份证号：<br />
                            <input type="text" value="" placeholder="身份证号" class="loginInput" id="ID" name="ID" tabindex="1" />
                        </div>
                        <div class="forgetPwdLine">
                            <%-- <a href="/index.php/Index/forget" target="_blank">忘记密码?</a>--%>
                        </div>
                        <div class="loginInt" id="passWord">
                            姓名：<br />
                            <input type="text" value="" placeholder="姓名" class="loginInput" id="PWD" name="PWD" tabindex="2" />
                        </div>
                        <%-- <p style='font-size: 13px;'>
                            请输入<span style='color: red; font-size: 13px; font-weight: bold;'>
                                身份证
                            </span>和<span style='color: red; font-size: 13px; font-weight: bold;'> 姓名</span>登陆，选择好专区和年度再使用学习卡激活专区。
                        </p>--%>
                        <div class="loginBtn">
                            <input type="submit" id="login_btn" value="登 录" />
                            <%--<span class="lfBtnReg"><a title="该专区不允许学员自行注册">注 册</a></span>--%>
                        </div>
                        <div class="loginFormConf" style="margin-bottom: 5px; display:none">
                            <div class="loginFormVer">
                                <a href="/index.php/Help" target="_blank">帮助中心</a>
                            </div>
                            <div class="loginFormService">
                                <a href="http://get.adobe.com/cn/flashplayer/" target="_blank">Flash插件下载</a>
                            </div>
                        </div>
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
