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
    <link href="<% = CDN_Private %>/public/css/content.css?t=20150505" type="text/css" rel="stylesheet" />
    <link href="<% = CDN_Private %>/Css/r/hncpa-leading.css?t=20150505" rel="stylesheet" type="text/css" />
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
    <div class="study-flow">
        <div class="study-flow-inner">

            <ul class="study-flow-ul">
                <li style="margin-left: 115px">
                    <div class="icon login"></div>
                    <div class="text">登录平台</div>
                </li>
                <li class="arrow">
                    <div class="arrow-div"></div>
                </li>
                <li>
                    <div class="icon info"></div>
                    <div class="text">完善信息</div>
                </li>
                <li class="arrow">
                    <div class="arrow-div"></div>
                </li>
                <%-- <li>
                    <div class="icon pay"></div>
                    <div class="text">充值缴费</div>
                </li>
                <li class="arrow">
                    <div class="arrow-div"></div>
                </li>--%>
                <li>
                    <div class="icon study"></div>
                    <div class="text">在线学习</div>
                </li>
                <li class="arrow">
                    <div class="arrow-div"></div>
                </li>
                <li>
                    <div class="icon test"></div>
                    <div class="text">在线考试</div>
                </li>
                <li class="arrow">
                    <div class="arrow-div"></div>
                </li>
                <li>
                    <div class="icon cert"></div>
                    <div class="text">打印证书</div>
                </li>
            </ul>
        </div>
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
                            <img src="<% = CDN_Private %>/courses/ad/image/ad/140368197575.png" alt="banner"></a>
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

            <div class="loginFlow" style="height: auto; padding: 0px 0px 0px 0px; margin-top: 163px">
                <div class="about-flow">
                    <ul class="ul-content">
                        <li class="t">致河南注协领军各位学员：</li>
                        <li class="c">
                            <p>
                                第二次集训网上培训现已开通，学习时间：2015.4.17-2015.6.17。
                            </p>
                            <p>
                                学习流程：学员直接凭注册会计师证号和初始密码（六个零）登录——选课学习（必修必须全部学完，选修不限，即至少学40课时必修方可参加考试）——考试（综合考试，考试范围为必修课，选修不列入）——打印证书。

                            </p>


                        </li>




                    </ul>
                </div>
            </div>
        </div>
        <%--<div class="loginSide">
            <div class="loginBlock">
                <div class="loginFunc">
                    <h3>公告</h3>

                </div>
                <div class="gonggao" id="showmessage">
                    <p>1.&nbsp;<a style="cursor: pointer;" id="m_318" class="showmessage">学习流程</a></p>
                    <p>2.&nbsp;<a style="cursor: pointer;" id="m_320" class="showmessage">学习帐号和密码</a></p>

                </div>
            </div>
        </div>--%>

        <div class="loginSide">
            <div class="loginBlock" style="height: 277px">
                <div class="loginFunc">
                    <h3>登录</h3>
                </div>
                <div class="loginForm">
                    <form class="login_form" id="login_form" action="" onsubmit="return Login('/Account/landing')" method="post">

                        <div class="loginInt" id="userName" style="margin-bottom: 0;">
                            用户名：<span class="login-tips">注册会计师证号（身份证号）</span>
                            <input type="text" value="" placeholder="" class="loginInput" id="ID" name="ID" tabindex="1" />
                        </div>
                        <div class="forgetPwdLine">
                            <%-- <a href="/index.php/Index/forget" target="_blank">忘记密码?</a>--%>
                        </div>
                        <div class="loginInt" id="passWord">
                            密码：<span class="login-tips">初始密码 000000</span>
                            <input type="password" value="" placeholder="" class="loginInput" id="PWD" name="PWD" tabindex="2" />
                        </div>
                        <%-- <p style='font-size: 13px;'>
                            请输入<span style='color: red; font-size: 13px; font-weight: bold;'>
                                身份证
                            </span>和<span style='color: red; font-size: 13px; font-weight: bold;'> 姓名</span>登陆，选择好专区和年度再使用学习卡激活专区。
                        </p>--%>
                        <div class="loginBtn">
                            <input type="submit" id="login_btn" value="登 录" />
                            <%--<span class="lfBtnReg"><a href="/signup" title="">注 册</a></span>--%>
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
            <div class="loginAbout" style="margin-top: 164px; background-position: center 10px; height: 185px">
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
