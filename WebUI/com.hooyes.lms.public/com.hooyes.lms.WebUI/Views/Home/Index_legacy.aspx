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
    <link href="<% = CDN_Private %>/public/css/content.css?t=20150525" type="text/css" rel="stylesheet" />
    <link href="<% = CDN_Private %>/Css/r/public.css?t=20150505" rel="stylesheet" type="text/css" />
    <link href="<% = CDN_Private %>/favicon.ico" rel="Bookmark" />
    <link href="<% = CDN_Private %>/favicon.ico" rel="Shortcut Icon" />
    <script src="<% = CDN_Public %>/jquery/1.7.1/jquery.min.js"></script>
    <script src="<% = CDN_Private %>/Scripts/config.js"></script>
    <script src="<% = CDN_Private %>/Scripts/account-2.js?t=20150506"></script>

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
                    <div class="text">注册/登录</div>
                </li>
                <li class="arrow">
                    <div class="arrow-div"></div>
                </li>
                <li>
                    <div class="icon info"></div>
                    <div class="text">选购课程</div>
                </li>
                <li class="arrow">
                    <div class="arrow-div"></div>
                </li>
                <li>
                    <div class="icon pay"></div>
                    <div class="text">充值缴费</div>
                </li>
                <li class="arrow">
                    <div class="arrow-div"></div>
                </li>
                <li>
                    <div class="icon study"></div>
                    <div class="text">在线学习</div>
                </li>
                <%--<li class="arrow">
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
                </li>--%>
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
                        <li class="t">学习需知：</li>
                        <li class="c">
                            <p>1、登录</p>
                            <p style="text-indent: 2em;">
                                登录名：注册会计师执业会员请用注册会计师证号，非执业会员请用非执业会员证书号，其他人员请用身份证号。
                                <br />
                                初始密码：123456
                            </p>

                            <p>2、选课/学习</p>

                            <p style="text-indent: 2em;">学员根据相关规定选课学习，学满规定学时即可进入下一环节。</p>

                            <p>3、考试</p>

                            <p style="text-indent: 2em;">试卷答题时间为1小时，题型有单选题、多选题和判断题。满分100分，及格分数为60分，考试成绩以最高答题分数记录。</p>

                            <p>4、打印结业证书</p>

                            <p style="text-indent: 2em;">当学员完成规定学时课程，并且考试达标（考试分数大于等于60分）后，即可打印本期网络培训结业证书。</p>
                            <p>
                                <br />
                            </p>
                            <p>温馨提示：学员打印完结业证书后，仍可以登录平台重复学习已选课程内容。 </p>


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
                            用户名：<span class="login-tips">身份证号</span>
                            <input type="text" value="" placeholder="" class="loginInput" id="ID" name="ID" tabindex="1" />
                        </div>
                        <div class="forgetPwdLine">
                            <%-- <a href="/index.php/Index/forget" target="_blank">忘记密码?</a>--%>
                        </div>
                        <div class="loginInt" id="passWord">
                            密码：<span class="login-tips"></span>
                            <input type="password" value="" placeholder="" class="loginInput" id="PWD" name="PWD" tabindex="2" />
                        </div>
                        <%-- <p style='font-size: 13px;'>
                            请输入<span style='color: red; font-size: 13px; font-weight: bold;'>
                                身份证
                            </span>和<span style='color: red; font-size: 13px; font-weight: bold;'> 姓名</span>登陆，选择好专区和年度再使用学习卡激活专区。
                        </p>--%>
                        <div class="loginBtn"  style="margin-top:30px;">
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
            <div class="loginAbout" style="margin-top: 164px; background-position: center 10px; height: 435px">
                <div class="side-notice" style="margin-top: 150px">
                    <ul>
                        <li class="head">通知：</li>
                        <li><a href="javascript:void(0)" target="_blank">关于北京国家会计学院公开课的通知</a></li>
                    </ul>
                </div>
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
        $("#login_notice").height($(".wrapper").height() - 445);
        HeaderShow.A();
    </script>
    <script src="http://wt.zoosnet.net/JS/LsJS.aspx?siteid=LRW32745646&float=1&lng=cn" type="text/javascript"></script>
</body>
</html>
