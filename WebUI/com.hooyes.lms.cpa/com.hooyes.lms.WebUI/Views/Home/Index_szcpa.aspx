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
    <link href="<% = CDN_Private %>/Css/r/szcpa.css?t=20150210" rel="stylesheet" type="text/css" />
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

            <div class="loginFlow" style="height: auto; padding: 0px 0px 0px 0px;">
                <div class="about-flow">
                    <ul class="ul-content">
                        <li class="t">致非执业专区各位学员：</li>
                        <li class="c">
                            <p>
                                本专区学习周期为：2014年11月15日——2015年5月31日。
                            </p>
                            <p>
                                现已开放2010年--2013年补学课程，请往年度没有学习的学员抓紧时间缴费学习。
                            </p>
                            <p>
                                补学课程截止到2015年5月31日。补学流程同2014年度学习流程一致。

                            </p>
                            <p>
                                新学员学习流程：个人信息注册 -- 交费70元 -- 完成所有必修课程，获得25学时(选修课程凭兴趣学习，不计学时） --
                                 打印证书，完成本次在线学习。
                            </p>
                            <p>
                                2013年已注册学员可以直接登录，账号：身份证号(或注册会计师证号)，密码：000000，登录后请完善个人信息。
                            </p>

                        </li>

                        <li class="t">学习流程</li>
                        <li class="c">
                            <p class="cp" style="margin: 0; padding: 0;">
                                <img src="<% = CDN_Private %>/public/images/learning_7.jpg" alt="" style="width: 605px;" />
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
                            <input type="text" value="" placeholder="身份证号" class="loginInput" id="ID" name="ID" tabindex="1" disabled="disabled" />
                        </div>
                        <div class="forgetPwdLine">
                            <%-- <a href="/index.php/Index/forget" target="_blank">忘记密码?</a>--%>
                        </div>
                        <div class="loginInt" id="passWord">
                            <input type="password" value="" placeholder="密码" class="loginInput" id="PWD" name="PWD" tabindex="2" disabled="disabled" />
                        </div>
                        <%-- <p style='font-size: 13px;'>
                            请输入<span style='color: red; font-size: 13px; font-weight: bold;'>
                                身份证
                            </span>和<span style='color: red; font-size: 13px; font-weight: bold;'> 姓名</span>登陆，选择好专区和年度再使用学习卡激活专区。
                        </p>--%>
                        <div class="loginBtn">
                            培训结束，系统已关闭<br /><br />
                            <input type="submit" id="login_btn" value="登 录" disabled="disabled" />
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
