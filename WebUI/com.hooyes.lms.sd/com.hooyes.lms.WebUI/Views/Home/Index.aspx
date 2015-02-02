<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="从业资格考试辅导, 在线考试, 在线会计实操系统, 注册会计师培训, 初级职称考试培训, 中级职称考试培训, 注册税务师考试培训,会计网校, 会计继续教育, 名师课件, 轻松过关, 辅导书" />
    <meta name="description" content="北国会提供注册会计师考试培训,初级、中级会计职称考试培训,注册税务师考试培训,会计继续教育培训,从业资格考试辅导。另外提供各类考试真题,模拟试卷,名师课件,疑难解答,考前强化,考后成绩查询等考试信息。" />
    <meta name="author" content="北国会" />
    <title>北京国家会计学院会计从业资格考试考前辅导</title>
    <!-- 
	<link type="text/css"      rel="stylesheet" href="css/index.css"/> -->
    <link type="text/css" rel="stylesheet" href="css/south.css" />
    <!--所有的IE都起作用-->
    <!--[if IE]><link rel="stylesheet" type="text/css" href="css/w_center_ie.css"/><![endif]-->
    <!--IE以外的浏览器起作用-->
    <!--[if !IE]><!-->
    <link rel="stylesheet" type="text/css" href="css/w_center.css" />
    <!--<![endif]-->
    <script type="text/javascript" src="js/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript" src="js/artDialog.js?skin=default"></script>
    <script src="js/jquery.slides.js"></script>
    <script type="text/javascript" src="js/pop.js"></script>
    <script type="text/javascript" src="js/goods/cart.js"></script>
    <script type="text/javascript" src="js/goods/curriculumCenter.js"></script>
    <script type="text/javascript" src="js/testcoach/learnCard.js"></script>
    <script type="text/javascript" src="js/testcoach/pop.js"></script>
    <%--<script type="text/javascript" src="js/testcoach/singletonUserLogin.js"></script>--%>
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/config.js" type="text/javascript"></script>
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/account.js?v=2014060101" type="text/javascript"></script>
    <script type="text/javascript">

        $().ready(function () {

            ResetLink();
            // Login Logic
            //genRandomImage();
            //$("#validImage").click(genRandomImage);

            $('#username').val("用户名或注册邮箱");
            $('#username').focus(defUserClear);
            $('#username').blur(textUserDef);

            $('#password').val("请输入密码");
            $('#password').focus(defPwdClear);
            /*
            $('#validcode').val("验证码");
            $('#validcode').focus(defValidCodeClear);
            $('#validcode').blur(textValidCodeDef);
            */
            $('#login').click(function () {
                Login();
            });

            $('input').keydown(function () {
                var msg_id = this.id + '_msg';
                $('#' + msg_id).val('');
            });

            //
            /*
            $.post('getHomePageNews.do', {}, function (datas) {

                if (datas) {
                    $('div.z_tab ul').empty();
                    var boards = $.parseJSON(datas);
                    var boardsLi = "";
                    var newsCtx = "";
                    var newsTop = "";
                    $.each(boards, function (index) {
                        if (index == 0) {
                            boardsLi += "<li id='news" + boards[index].boardCode + "' name='news" + index + "' class='news_btn'>" + boards[index].boardName + "</li>";
                        } else {
                            boardsLi += "<li id='news" + boards[index].boardCode + "' name='news" + index + "'  >" + boards[index].boardName + "</li>";
                        }
                        if (index == 0) {
                            newsCtx += "<div id='news" + boards[index].boardCode + "_ctx' name='news" + index + "'  class='ctx'><div class='z_news_c'><ul>";
                        } else {
                            newsCtx += "<div id='news" + boards[index].boardCode + "_ctx' name='news" + index + "'  class='ctx' style='display:none;'><div class='z_news_c'><ul>";
                        }
                        var newsLst = boards[index].newsLst;
                        $.each(newsLst, function (i) {
                            newsCtx += "<li><span>" + newsLst[i].newsTimeString + "</span>";
                            //newsCtx += "<span class='clickRate'>["+ newsLst[i].clickRate +"点击]</span>";
                            //newsCtx += "<span class='clickRate'>["+ newsLst[i].divisionName +"]</span>";
                            //newsCtx += "<span class='division'>["+ newsLst[i].divisionName +"]</span>";
                            if (newsLst[i].top == '1') {
                                newsTop = "<img src='images/news/top.gif' />";
                            } else {
                                newsTop = "";
                            }

                            if (i < 4) {
                                newsCtx += "<a  target='_blank' href='getNewsContent.do?newsId=" + newsLst[i].newsId + "&boardIndex=" + index + "&newsIndex=" + i + "'>" + newsLst[i].newsTitle.substring(0, 15) + "<img src='images/news/new20141124.gif' />" + newsTop + "</a></li>";
                            } else {
                                newsCtx += "<a  target='_blank' href='getNewsContent.do?newsId=" + newsLst[i].newsId + "&boardIndex=" + index + "&newsIndex=" + i + "'>" + newsLst[i].newsTitle.substring(0, 15) + " " + newsTop + "</a></li>";
                            }
                        });

                        newsCtx += "</ul><div style='clear:both'></div></div></div>";
                    });

                    $('div.z_tab ul').html(boardsLi);
                    $('div.z_news').html(newsCtx);

                    var tagName = "news" + boards[0].boardCode;
                    var newLiName = $('#' + tagName).attr('name');
                    var boardId = tagName.replace("news", "");
                    var baord_index = newLiName.replace("news", "");
                    $("#moreNews").attr("href", "./moreNews.do?boardId=" + boardId + "&baord_index=" + baord_index);

                    $('div.z_tab ul li').mouseover(function () {
                        $('div.z_tab ul li').removeClass('news_btn');
                        $(this).addClass('news_btn');
                        var tagName = this.id;
                        $('div[class=ctx]').hide();
                        $('#' + tagName + '_ctx').show();

                        var newLiName = $('#' + tagName).attr('name');
                        var boardId = tagName.replace("news", "");
                        var baord_index = newLiName.replace("news", "");
                        $("#moreNews").attr("href", "./moreNews.do?boardId=" + boardId + "&baord_index=" + baord_index);
                    });
                }
            });
            */
        });


        function ResetLink() {
            $("a").click(function () {
                var orginUrl = $(this).attr("href");
                var orginHost = "http://122.114.17.35/";
                var finalUrl = orginHost + orginUrl;
                $(this).attr("href", finalUrl);
                return true;
            });
        }

        function genRandomImage() {
            var random = "";
            for (var i = 0; i < 4; i++) random += Math.floor(Math.random() * 10);
            $("#validImage").attr("src", "genVerifyCode.do?width=70&height=29&num=" + random + "&mode=" + 1);
        }

        function login() {

            try {

                var username = $('#username').val();
                if (username == '' || username == '用户名或注册邮箱') {
                    alert("请输入用户名！");
                    return;
                }

                var password = $('#password').val();
                if (password == '' || password == '请输入密码') {
                    alert("请输入密码！");
                    return;
                }

                var validcode = $('#validcode').val();
                if (validcode == '') {
                    alert("请输入验证码！");
                    return;
                }

                var params = {};
                params.username = username;
                params.password = password;
                params.validcode = validcode;

                $.post('login.do', params, function (data) {
                    var error = null;

                    if (data != null) {
                        error = $.parseJSON(data);

                        if (error.code == -1) {
                            alert(error.msg);
                            genRandomImage();
                        } else if (error.code == -3) {
                            alert(error.msg);
                            genRandomImage();
                        } else if (error.code == -99) {
                            keeponLogin();
                        } else if (error.code == -90) {
                            window.location = 'http://www.happyacc.com/ws/userdirect.php?passport=' + error.msg;
                        } else {// 登录成功
                            window.location.href = 'toHomePage.do';
                        }
                    }
                });
            } catch (e) {
                alert(e.message);
            }
            return false;
        }

        function defUserClear() {
            var username = $("#username").val();
            if (username == '用户名或注册邮箱') {
                $('#username').val('');
            }
        }

        function textUserDef() {

            var username = $("#username").val();
            if (username == '') {
                $('#username').val('用户名或注册邮箱');
                $('#username_msg').val('');
            }
        }

        function defPwdClear() {
            var pwd = $("#password").val();
            if (pwd == '请输入密码') {
                $('#password').remove();
                $('#pass').html("<input type='password' id='password' name='password'  class='txt'/>");
                $('#password')[0].focus();
                $('#password')[0].focus();
                $('#password').blur(textPwdDef);
            }

        }

        function textPwdDef() {
            var pwd = $('#password').val();
            if (pwd == '') {
                $('#pass').html("<input type='text' id='password' name='password' class='txt'/>");
                $('#password').val("请输入密码");
                $('#password').focus(defPwdClear);
            }

        }

        function defValidCodeClear() {
            var validcode = $("#validcode").val();
            if (validcode == '验证码') {
                $('#validcode').val('');
            }
        }

        function textValidCodeDef() {

            var validcode = $("#validcode").val();
            if (validcode == '') {
                $('#validcode').val('验证码');
                $('#validcode_msg').val('');
            }
        }
        //弹出窗
        function shwoalt() {
            art.dialog({
                opacity: 0.47,	// 透明度
                title: false,
                content: '<img src="images/gg/wzgg.jpg" >',
                lock: true
            });
        }
    </script>
    <script type="text/javascript" src="js/myfocus-2.0.4.min.js"></script>
    <style type="text/css">
        #myFocus {
            width: 760px;
            height: 220px;
            margin: 0 auto;
            float: right;
        }
    </style>

    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            list-style-type: none;
        }

        a, img {
            border: 0;
        }

        body {
            font: 12px/180% Arial, Helvetica, sans-serif,"宋体";
        }

        .scrolltitle {
            height: 24px;
            font-size: 14px;
            width: 742px;
            border-bottom: solid 1px #ddd;
            margin: 20px auto 15px auto;
        }

        a.abtn {
            display: block;
            height: 120px;
            width: 17px;
            overflow: hidden;
            background: url(images/arrow3.png) no-repeat 0px 50%;
        }

        a.aleft {
            float: left;
        }

        a.agrayleft {
            cursor: default;
            background-position: -34px 50%;
        }

        a.aright {
            float: right;
            background-position: -17px 50%;
        }

        a.agrayright {
            cursor: default;
            background-position: -51px 50%;
        }

        .scrolllist {
            width: 502px;
            height: 118px;
            margin: 0 auto;
        }

            .scrolllist .imglist_w {
                width: 454px;
                height: 118px;
                overflow: hidden;
                float: left;
                position: relative; /*必要元素*/
            }

                .scrolllist .imglist_w ul {
                    width: 20000px;
                    position: absolute;
                    left: 0px;
                    top: 0px;
                }

                .scrolllist .imglist_w li {
                    width: 96px;
                    float: left;
                    padding: 0 10px;
                }

                    .scrolllist .imglist_w li img {
                        padding: 2px;
                        border: solid 1px #ddd;
                        width: 100px;
                        height: 112px;
                    }

                    .scrolllist .imglist_w li a {
                        color: #3366cc;
                        text-decoration: none;
                        float: left;
                    }

                        .scrolllist .imglist_w li a:hover img {
                            filter: alpha(opacity=86);
                            -moz-opacity: 0.86;
                            opacity: 0.86;
                        }

                    .scrolllist .imglist_w li p {
                        height: 48px;
                        line-height: 24px;
                        overflow: hidden;
                        float: left;
                    }
    </style>
    <script type="text/javascript">
        //设置
        myFocus.set({
            id: 'myFocus',//焦点图盒子ID
            time: 8,//切换时间间隔(秒)
            pattern: 'mF_kdui',//风格应用的名称
            txtHeight: '0'//文字层高度设置(像素),'default'为默认高度，0为隐藏
        });
    </script>

</head>

<body onload="findcartcount(0);">
    <!--head开始-->
    <%--<script type="text/javascript" src="js/artDialog.js?skin=default"></script>--%>
    <%--<script type="text/javascript" src="js/testcoach/singletonUserLogin.js"></script>--%>
    <!--登录层-->
    <div id="popDiv" class="mydiv" style="display: none;">
        <div class="close"><a href="javascript:closeDiv()">
            <img src="images/testcoach/zdel.png" width="16" height="16" /></a></div>
        <div class="popdl">
            <div class="popdl_tit">请登录！并进行之后的操作...</div>
            <dl>
                <dt>账号：</dt>
                <dd>
                    <input name="" type="text" value="请输入账号" class="in" /></dd>
                <dt>密码：</dt>
                <dd>
                    <input name="" type="text" value="请输入密码" class="in" /></dd>
                <dt></dt>
                <dd>
                    <input name="" type="checkbox" value="" />
                    记录我的登录状态
          <div>
              <a href="#" class="dl">登录</a>
          </div>
                    没有账号？
          <a href="#" class="blue">注册</a>
                    <a href="#" class="blue">忘记密码？</a>
                </dd>
            </dl>
        </div>
    </div>

    <div id="bg" class="bg" style="display: none; height: 100%;"></div>
    <!--登录层结束-->

    <!--top start-->
    <div class="top">

        <!--未登录-->
        <div>
            <div class="wid100">
                <div class="wid21000">
                    <div class="welcome">欢迎来到北京国家会计学院——会计从业资格考试考前辅导网站</div>
                    <div class="loginxx">
                        <a href="toLogon.do">登录</a>｜
	            	<a href="toRegistration.do">注册</a>｜
	            	<img src="images/testcoach/shopping_cart.gif" />
                        <a href="#" onclick="javascript:showDiv()">购物车</a>
                    </div>
                </div>
                <div style="clear: both;"></div>
            </div>
            <div class="logos">
                <div class="wid1000">
                    <div class="imgs"><a href="toHomePage.do">
                        <img src="images/testcoach/logo.gif" /></a></div>
                    <!--导航开始-->
                    <div class="nav">
                        <ul>
                            <li><a href="toHomePage.do" class="curr">
                                <img src="images/menu01.gif" /><p>首&nbsp;&nbsp;页</p>
                            </a></li>
                            <li><a target="_blank" href="moreNews.do" class="">
                                <img src="images/menu02.gif" /><p>新闻动态</p>
                            </a></li>
                            <li><a target="_blank" href="findCurricuumCenter.do" class="">
                                <img src="images/menu03.gif" /><p>课程中心</p>
                            </a></li>
                            <li><a target="_blank" href="findGoodExamPage.do" class="">
                                <img src="images/menu04.gif" /><p>在线模考</p>
                            </a></li>
                            <li><a target="_blank" href="findGoodChapter.do" class="">
                                <img src="images/menu05.gif" /><p>章节练习</p>
                            </a></li>
                        </ul>
                    </div>
                    <!--导航结束-->
                    <!--搜索开始-->
                    <div class="search">
                        <input id="newsTitle" type="text" /><img src="images/findicon.jpg" align="absmiddle" onclick="javascript:seacher();" style="cursor: pointer;" /></div>
                    <!--导航结束-->
                    <div class="user"></div>
                    <div style="clear: both;"></div>
                </div>
            </div>
        </div>
        <!--未登录结束-->
        <!--已登陆-->
        <!--已登陆结束-->

    </div>
    <form action="seachNews" method="post" id="formseach">
        <input type="hidden" id="newsT" name="newsT" value="" />
    </form>
    <!--logos over-->
    <script type="text/javascript">
        var expire = "";
        if (expire == "Y") {
            validateUserExpire();
        }

        function seacher() {
            $("#newsT").val($("#newsTitle").val());
            if ($("#newsT").val() == "") {
                art.dialog({
                    title: '提示',
                    lock: true,
                    fixed: true,
                    width: 230,
                    height: 100,
                    background: '#CDCDCD', // 背景色
                    opacity: 0.47,	// 透明度
                    content: '标题不可以为空，请输入标题！',
                    icon: 'warning',
                    button: [
                              {
                                  name: '确定',
                                  callback: function () {

                                  },
                                  focus: true
                              }
                    ],
                    cancelVal: '取消',
                    cancel: true
                });
            } else {
                $("#formseach").submit();
            }

        }

        function seacher2() {
            $("#newsT").val($("#newsTitle2").val());
            if ($("#newsT").val() == "") {
                art.dialog({
                    title: '提示',
                    lock: true,
                    fixed: true,
                    width: 230,
                    height: 100,
                    background: '#CDCDCD', // 背景色
                    opacity: 0.47,	// 透明度
                    content: '标题不可以为空，请输入标题！',
                    icon: 'warning',
                    button: [
                              {
                                  name: '确定',
                                  callback: function () {

                                  },
                                  focus: true
                              }
                    ],
                    cancelVal: '取消',
                    cancel: true
                });
            } else {
                $("#formseach").submit();
            }

        }
    </script>
    <form action="goCart.do" method="post" id="formgoCart">
        <input type="hidden" id="userid" name="userid" value="0" />
    </form>
    <!--head结束-->
    <!--center开始-->
    <div id="center">
        <!--left开始-->
        <div id="left">
            <!--登录开始-->
            <div class="login">
                <div class="bt">
                    <img src="images/yhdl.jpg" />
                </div>
                <div id="userInfo" class="nr">
                     <form class="login_form" id="login_form" action="" onsubmit="return Login()" method="post">
        <input type="hidden" name="sid" id="sid" value="2013" />
                    <table width="0" border="0" cellspacing="0" cellpadding="0" class="table">
                        <tr>
                            <td width="29%">用户名：</td>
                            <td width="71%">
                                <label>
                                    <input name="ID" id="ID" type="text" class="txt" style="vertical-align: middle;" />
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td>密&nbsp;&nbsp;&nbsp;码：</td>
                            <td>
                                <label id="pass">
                                    <input name="PWD" id="PWD" type="text" class="txt" style="vertical-align: middle;" />
                                </label>
                            </td>
                        </tr>
                        <tr style="visibility:hidden">
                            <td>验证码：</td>
                            <td>
                                <label>
                                    <input id="validcode" name="validcode" type="text" class="txt01" style="vertical-align: middle;" />
                                    <img id="validImage" style="width: 60px; height: 23px; vertical-align: middle;" alt="看不清？点击图片更换" />
                                </label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table width="0" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td align="center">
                                            <%--<img id="login" src="images/dl.jpg" width="89" height="29" style="cursor: pointer;" />--%>
                                            <input type="image" src="images/dl.jpg" />
                                        </td>
                                        <td align="center">
                                            <a href="toRegistration.do">
                                                <img src="images/zc.jpg" width="89" height="29" style="cursor: pointer;" /></a>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </form>
                </div>
            </div>
            <!--登录结束-->
            <!--小图标开始-->
            <div class="icon">
                <div class="focus-nav">
                    <ul>
                        <li><a id="menu_kc" target="_blank" href="findCurricuumCenter.do"></a></li>
                        <li><a id="menu_mk" target="_blank" href="findGoodExamPage.do"></a></li>
                        <li><a id="menu_lx" target="_blank" href="findGoodChapter.do"></a></li>
                        <li><a id="menu_ty" target="_blank" href="./findExper.do"></a></li>
                        <li><a id="menu_jh" target="_blank" href="toLearnCard.do"></a></li>
                        <li><a id="menu_gk" href="javascript:jsz();"></a></li>
                        <li><a id="menu_bz" target="_blank" href="help.do"></a></li>
                        <li><a id="menu_dy" href="javascript:jsz();"></a></li>
                        <li><a id="menu_yd" href="javascript:jsz();"></a></li>
                        <li><a id="menu_lz" href="javascript:jsz();"></a></li>
                        <li><a id="menu_lt" href="javascript:jsz();"></a></li>
                        <li><a id="menu_zb" href="javascript:jsz();"></a></li>
                    </ul>
                </div>
            </div>
            <!--小图标结束-->
            <!--学员心声开始-->
            <div class="xyxs">
                <div class="bt">
                    <a href="#">
                        <img src="images/xyxs.jpg" border="0" /></a>
                </div>
                <div class="nr">
                    <table width="0" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <th><span>[2014-10-24 14:53:03]</span>zxf118168</th>
                        </tr>
                        <tr>
                            <td>成绩出来啦，法规73，电算化88，会计基础91，第一时间来分享！上班族，就晚上看书，白天偷着看一点视频，
								感谢北国会的安心、张黎群老师！讲课生动不知不觉中把知识点都学会了，太爱你们了！
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <!--学员心声结束-->
        </div>
        <!--left结束-->
        <!--right开始-->
        <div id="right">
            <div id="myFocus">
                <!--焦点图盒子-->
                <div class="loading">
                    <img src="images/loading.gif" alt="请稍候..." />
                </div>
                <!--载入画面(可删除)-->
                <div class="pic">
                    <!--图片列表-->
                    <ul>
                        <li><a href="#1">
                            <img src="images/1.jpg" /></a></li>
                        <li><a href="#2">
                            <img src="images/2.jpg" /></a></li>
                        <li><a href="#3">
                            <img src="images/3.jpg" /></a></li>
                        <li><a href="#4">
                            <img src="images/4.jpg" /></a></li>
                        <li><a target="_blank" href="goDls.do">
                            <img src="images/5.jpg" /></a></li>
                    </ul>
                </div>
            </div>
            <div class="clear"></div>
            <!--焦点图盒子结束-->
            <!--师资开始-->
            <div class="szjs">
                <div class="bt">
                    <img src="images/szbt.jpg" onclick="javascript:location='findTeacherById.do?teacherCode=1'" style="" />
                </div>

                <div class="scrolllist" id="s1">
                    <a class="abtn aleft" href="#left" title="左移"></a>
                    <div class="imglist_w">
                        <ul class="imglist">
                            <li>
                                <a target="_blank" href="findTeacherById.do?teacherCode=4" title="">
                                    <img width="150" height="150" alt="" src="images/teacher/teacher_qrs.jpg" /></a>
                            </li>
                            <li>
                                <a target="_blank" href="findTeacherById.do?teacherCode=5" title="">
                                    <img width="150" height="150" alt="" src="images/teacher/teacher_ycc.jpg" /></a>
                            </li>
                            <li>
                                <a target="_blank" href="findTeacherById.do?teacherCode=6" title="">
                                    <img width="150" height="150" alt="" src="images/teacher/teacher_cm.jpg" /></a>
                            </li>
                            <li>
                                <a target="_blank" href="findTeacherById.do?teacherCode=8" title="">
                                    <img width="150" height="150" alt="" src="images/teacher/teacher_myy.jpg" /></a>
                            </li>
                            <li>
                                <a target="_blank" href="findTeacherById.do?teacherCode=9" title="">
                                    <img width="150" height="150" alt="" src="images/teacher/teacher_zht.jpg" /></a>
                            </li>
                            <li>
                                <a target="_blank" href="findTeacherById.do?teacherCode=10" title="">
                                    <img width="150" height="150" alt="" src="images/teacher/teacher_zql.jpg" /></a>
                            </li>
                            <li>
                                <a target="_blank" href="findTeacherById.do?teacherCode=11" title="">
                                    <img width="150" height="150" alt="" src="images/teacher/teacher_zks.jpg" /></a>
                            </li>
                            <li>
                                <a target="_blank" href="findTeacherById.do?teacherCode=12" title="">
                                    <img width="150" height="150" alt="" src="images/teacher/teacher_czj.jpg" /></a>
                            </li>
                            <li>
                                <a target="_blank" href="findTeacherById.do?teacherCode=13" title="">
                                    <img width="150" height="150" alt="" src="images/teacher/teacher_ztl.jpg" /></a>
                            </li>
                            <li>
                                <a target="_blank" href="findTeacherById.do?teacherCode=14" title="">
                                    <img width="150" height="150" alt="" src="images/teacher/teacher_hyq.jpg" /></a>
                            </li>
                            <li>
                                <a target="_blank" href="findTeacherById.do?teacherCode=15" title="">
                                    <img width="150" height="150" alt="" src="images/teacher/teacher_wf.jpg" /></a>
                            </li>
                            <li>
                                <a target="_blank" href="findTeacherById.do?teacherCode=16" title="">
                                    <img width="150" height="150" alt="" src="images/teacher/teacher_xjr.jpg" /></a>
                            </li>
                            <li>
                                <a target="_blank" href="findTeacherById.do?teacherCode=17" title="">
                                    <img width="150" height="150" alt="" src="images/teacher/teacher_yzq.jpg" /></a>
                            </li>
                            <li>
                                <a target="_blank" href="findTeacherById.do?teacherCode=18" title="">
                                    <img width="150" height="150" alt="" src="images/teacher/teacher_lxh.jpg" /></a>
                            </li>
                            <li>
                                <a target="_blank" href="findTeacherById.do?teacherCode=19" title="">
                                    <img width="150" height="150" alt="" src="images/teacher/teacher_zxl.jpg" /></a>
                            </li>
                            <li>
                                <a target="_blank" href="findTeacherById.do?teacherCode=20" title="">
                                    <img width="150" height="150" alt="" src="images/teacher/teacher_czw.jpg" /></a>
                            </li>
                            <li>
                                <a target="_blank" href="findTeacherById.do?teacherCode=21" title="">
                                    <img width="150" height="150" alt="" src="images/teacher/teacher_lxl.jpg" /></a>
                            </li>
                            <li>
                                <a target="_blank" href="findTeacherById.do?teacherCode=22" title="">
                                    <img width="150" height="150" alt="" src="images/teacher/teacher_jj.jpg" /></a>
                            </li>
                            <li>
                                <a target="_blank" href="findTeacherById.do?teacherCode=23" title="">
                                    <img width="150" height="150" alt="" src="images/teacher/teacher_yyy.jpg" /></a>
                            </li>
                            <li>
                                <a target="_blank" href="findTeacherById.do?teacherCode=24" title="">
                                    <img width="150" height="150" alt="" src="images/teacher/teacher_sn.jpg" /></a>
                            </li>
                            <li>
                                <a target="_blank" href="findTeacherById.do?teacherCode=25" title="">
                                    <img width="150" height="150" alt="" src="images/teacher/teacher_yh.jpg" /></a>
                            </li>
                            <li>
                                <a target="_blank" href="findTeacherById.do?teacherCode=27" title="">
                                    <img width="150" height="150" alt="" src="images/teacher/teacher_nxk.jpg" /></a>
                            </li>
                            <li>
                                <a target="_blank" href="findTeacherById.do?teacherCode=29" title="">
                                    <img width="150" height="150" alt="" src="images/teacher/teacher_mw.jpg" /></a>
                            </li>
                            <li>
                                <a target="_blank" href="findTeacherById.do?teacherCode=30" title="">
                                    <img width="150" height="150" alt="" src="images/teacher/teacher_hf.jpg" /></a>
                            </li>
                            <li>
                                <a target="_blank" href="findTeacherById.do?teacherCode=31" title="">
                                    <img width="150" height="150" alt="" src="images/teacher/teacher_lhz.jpg" /></a>
                            </li>
                            <li>
                                <a target="_blank" href="findTeacherById.do?teacherCode=32" title="">
                                    <img width="150" height="150" alt="" src="images/teacher/teacher_zyy.jpg" /></a>
                            </li>
                        </ul>
                        <!--imglist end-->
                    </div>
                    <a class="abtn aright" href="#right" title="右移"></a>
                </div>
                <!--scrolllist end-->
            </div>


            <!--师资结束-->
            <!--网站公告开始-->
            <div class="wzgg">
                <div class="bt">
                    <a href="#">
                        <img src="images/wzggbt.jpg" /></a>
                </div>
                <div class="nr">
                    <ul>
                        <li><a href="#">2014年11月10日网站维护通知</a></li>
                        <li><a href="#">2014年10月10日网站维护通知</a></li>
                        <li><a href="#">2014年 9月10日网站维护通知</a></li>
                        <li><a href="#">2014年 8月10日网站维护通知</a></li>
                        <li><a href="#">2014年7月北国会网站正式上线</a></li>
                    </ul>
                </div>
            </div>
            <div class="clear"></div>
            <!--网站公告结束-->
            <div class="ad01">
                <a href="findGoodExamPage.do">
                    <img src="images/ad01.jpg" /></a>
            </div>
            <div class="clear"></div>
            <!--tab新闻开始-->
         <div class="tab">
			  <div class="z_tab">
			      <ul><li id="news001001" name="news0" class="">最新消息</li><li id="news001002" name="news1" class="">政策大纲</li><li id="news001003" name="news2" class="news_btn">考试报名</li><li id="news001004" name="news3" class="">报考指南</li></ul>
			  	  <a target="_blank" href="./moreNews.do?boardId=001003&amp;baord_index=2" id="moreNews">更多&gt;&gt;</a>
			  </div>
		     <div class="z_news"><div id="news001001_ctx" name="news0" class="ctx" style="display: none;"><div class="z_news_c"><ul><li><span>2014-12-16</span><a target="_blank" href="getNewsContent.do?newsId=2329&amp;boardIndex=0&amp;newsIndex=0">2015年会计从业资格考试时间<img src="images/news/new20141124.gif"><img src="images/news/top.gif"></a></li><li><span>2014-12-09</span><a target="_blank" href="getNewsContent.do?newsId=2306&amp;boardIndex=0&amp;newsIndex=1">2014年11月份青海会计从业<img src="images/news/new20141124.gif"><img src="images/news/top.gif"></a></li><li><span>2014-11-28</span><a target="_blank" href="getNewsContent.do?newsId=2174&amp;boardIndex=0&amp;newsIndex=2">湖北省会计学会举办《女会计成才<img src="images/news/new20141124.gif"><img src="images/news/top.gif"></a></li><li><span>2015-01-13</span><a target="_blank" href="getNewsContent.do?newsId=2457&amp;boardIndex=0&amp;newsIndex=3">2015年全国各省市会计从业考<img src="images/news/new20141124.gif"></a></li><li><span>2015-01-12</span><a target="_blank" href="getNewsContent.do?newsId=2448&amp;boardIndex=0&amp;newsIndex=4">关于2015年天津会计从业资格 </a></li><li><span>2014-12-29</span><a target="_blank" href="getNewsContent.do?newsId=2436&amp;boardIndex=0&amp;newsIndex=5">宁波2015年上半年会计资格考 </a></li><li><span>2014-12-29</span><a target="_blank" href="getNewsContent.do?newsId=2434&amp;boardIndex=0&amp;newsIndex=6">福建2014第四季会计从业资格 </a></li><li><span>2014-12-29</span><a target="_blank" href="getNewsContent.do?newsId=2430&amp;boardIndex=0&amp;newsIndex=7">湖南2015年上半年会计从业资 </a></li><li><span>2014-12-26</span><a target="_blank" href="getNewsContent.do?newsId=2425&amp;boardIndex=0&amp;newsIndex=8">2015年会计从业资格考试报名 </a></li><li><span>2014-12-26</span><a target="_blank" href="getNewsContent.do?newsId=2424&amp;boardIndex=0&amp;newsIndex=9">南京市2014年下半会计从业资 </a></li></ul><div style="clear:both"></div></div></div><div id="news001002_ctx" name="news1" class="ctx" style="display: none;"><div class="z_news_c"><ul><li><span>2015-01-23</span><a target="_blank" href="getNewsContent.do?newsId=2348&amp;boardIndex=1&amp;newsIndex=0">2015年上海会计从业资格考试<img src="images/news/new20141124.gif"></a></li><li><span>2015-01-15</span><a target="_blank" href="getNewsContent.do?newsId=2463&amp;boardIndex=1&amp;newsIndex=1">浅谈2015年会计从业资格考试<img src="images/news/new20141124.gif"></a></li><li><span>2015-01-14</span><a target="_blank" href="getNewsContent.do?newsId=2461&amp;boardIndex=1&amp;newsIndex=2">陕西2015上半年会计从业资格<img src="images/news/new20141124.gif"></a></li><li><span>2015-01-14</span><a target="_blank" href="getNewsContent.do?newsId=2459&amp;boardIndex=1&amp;newsIndex=3">北京2015上半年会计从业资格<img src="images/news/new20141124.gif"></a></li><li><span>2015-01-14</span><a target="_blank" href="getNewsContent.do?newsId=2458&amp;boardIndex=1&amp;newsIndex=4">天津2015年会计从业资格考试 </a></li><li><span>2014-12-29</span><a target="_blank" href="getNewsContent.do?newsId=2432&amp;boardIndex=1&amp;newsIndex=5">关于辽宁会计事务管理系统新旧转 </a></li><li><span>2014-12-29</span><a target="_blank" href="getNewsContent.do?newsId=2431&amp;boardIndex=1&amp;newsIndex=6">福建2014年第四季会计从业资 </a></li><li><span>2014-12-26</span><a target="_blank" href="getNewsContent.do?newsId=2423&amp;boardIndex=1&amp;newsIndex=7">沈阳市第二批免试申领会计证审核 </a></li><li><span>2014-12-25</span><a target="_blank" href="getNewsContent.do?newsId=2418&amp;boardIndex=1&amp;newsIndex=8">黑龙江哈中省直单位会计人员调整 </a></li><li><span>2014-12-25</span><a target="_blank" href="getNewsContent.do?newsId=2416&amp;boardIndex=1&amp;newsIndex=9">中华人民共和国会计从业资格调转 </a></li></ul><div style="clear:both"></div></div></div><div id="news001003_ctx" name="news2" class="ctx" style="display: block;"><div class="z_news_c"><ul><li><span>2015-01-23</span><a target="_blank" href="getNewsContent.do?newsId=2474&amp;boardIndex=2&amp;newsIndex=0">2015福建第一季会计从业资格<img src="images/news/new20141124.gif"></a></li><li><span>2015-01-22</span><a target="_blank" href="getNewsContent.do?newsId=2472&amp;boardIndex=2&amp;newsIndex=1">2015青岛会计从业资格考试测<img src="images/news/new20141124.gif"></a></li><li><span>2015-01-20</span><a target="_blank" href="getNewsContent.do?newsId=2469&amp;boardIndex=2&amp;newsIndex=2">2015年湖北会计从业资格考试<img src="images/news/new20141124.gif"></a></li><li><span>2015-01-14</span><a target="_blank" href="getNewsContent.do?newsId=2460&amp;boardIndex=2&amp;newsIndex=3">2015年安徽会计从业资格考试<img src="images/news/new20141124.gif"></a></li><li><span>2015-01-13</span><a target="_blank" href="getNewsContent.do?newsId=2456&amp;boardIndex=2&amp;newsIndex=4">2015年上半年陕西会计从业资 </a></li><li><span>2015-01-13</span><a target="_blank" href="getNewsContent.do?newsId=2455&amp;boardIndex=2&amp;newsIndex=5">2015年海南会计从业资格考试 </a></li><li><span>2015-01-13</span><a target="_blank" href="getNewsContent.do?newsId=2454&amp;boardIndex=2&amp;newsIndex=6">2015年深圳会计从业资格考试 </a></li><li><span>2015-01-13</span><a target="_blank" href="getNewsContent.do?newsId=2453&amp;boardIndex=2&amp;newsIndex=7">2015年陕西会计从业资格考试 </a></li><li><span>2015-01-13</span><a target="_blank" href="getNewsContent.do?newsId=2452&amp;boardIndex=2&amp;newsIndex=8">2015年山东会计从业资格考试 </a></li><li><span>2015-01-12</span><a target="_blank" href="getNewsContent.do?newsId=2450&amp;boardIndex=2&amp;newsIndex=9">2015年河北会计从业资格考试 </a></li></ul><div style="clear:both"></div></div></div><div id="news001004_ctx" name="news3" class="ctx" style="display: none;"><div class="z_news_c"><ul><li><span>2015-01-23</span><a target="_blank" href="getNewsContent.do?newsId=2473&amp;boardIndex=3&amp;newsIndex=0">2015上半年宁夏会计从业资格<img src="images/news/new20141124.gif"></a></li><li><span>2015-01-20</span><a target="_blank" href="getNewsContent.do?newsId=2471&amp;boardIndex=3&amp;newsIndex=1">2015年第一季山东乳山会计从<img src="images/news/new20141124.gif"></a></li><li><span>2015-01-20</span><a target="_blank" href="getNewsContent.do?newsId=2470&amp;boardIndex=3&amp;newsIndex=2">2015年河北邯郸会计从业资格<img src="images/news/new20141124.gif"></a></li><li><span>2015-01-20</span><a target="_blank" href="getNewsContent.do?newsId=2468&amp;boardIndex=3&amp;newsIndex=3">2015年湖北会计从业资格考试<img src="images/news/new20141124.gif"></a></li><li><span>2015-01-14</span><a target="_blank" href="getNewsContent.do?newsId=2462&amp;boardIndex=3&amp;newsIndex=4">辽宁沈阳2015年新版会计从业 </a></li><li><span>2014-12-24</span><a target="_blank" href="getNewsContent.do?newsId=2410&amp;boardIndex=3&amp;newsIndex=5">如何备战2015会计从业资格无 </a></li><li><span>2014-12-17</span><a target="_blank" href="getNewsContent.do?newsId=2350&amp;boardIndex=3&amp;newsIndex=6">吉林会计从业资格考试报名条件 </a></li><li><span>2014-12-09</span><a target="_blank" href="getNewsContent.do?newsId=2311&amp;boardIndex=3&amp;newsIndex=7">2014年新版会计证换证 </a></li><li><span>2014-12-09</span><a target="_blank" href="getNewsContent.do?newsId=2310&amp;boardIndex=3&amp;newsIndex=8">会计从业资格证查询 </a></li><li><span>2014-12-09</span><a target="_blank" href="getNewsContent.do?newsId=2309&amp;boardIndex=3&amp;newsIndex=9">会计从业资格证书编号 </a></li></ul><div style="clear:both"></div></div></div></div>
			</div>
            <!--tab新闻结束-->
        </div>
        <div class="clear"></div>
        <!--right结束-->
        <div class="ad02">
            <a href="findGoodChapter.do">
                <img src="images/ad02.jpg" /></a>
        </div>
        <div class="spxx">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" class="btbody">
            </table>

            <table width="0" border="0" cellspacing="0" cellpadding="0" class="table">
                <tr>
                    <th style="border-left: 1px solid #dbdbdb;">商品名称</th>
                    <th>套餐名称</th>
                    <th>价格</th>
                    <th>购买</th>
                    <th>激活</th>
                </tr>
                <tr>
                    <td valign="center" rowspan="3">2014年会计从业资格考试套餐E1（含会计电算化）</td>
                    <td valign="top" nowrap="nowrap">《会计基础》（5套）</td>
                    <td valign="center" rowspan="3">180元</td>
                    <td valign="center" rowspan="3"><a href="javascript:addCart(2011,0);">
                        <img src="images/gm.jpg" width="68" height="20" /><a /></td>
                    <td valign="center" rowspan="3"><a href="javascript:showActivePad(0, 2011);">
                        <img src="images/jh.jpg" width="68" height="20" /></a></td>
                </tr>
                <tr>
                    <td valign="top" nowrap="nowrap">《财经法规与会计职业道德》（5套）</td>
                </tr>
                <tr>
                    <td valign="top" nowrap="nowrap">《会计电算化》（5套）</td>
                </tr>

                <tr>
                    <td valign="center" rowspan="3">2014年会计从业资格章节练习套餐p1（含会计电算化）</td>
                    <td valign="top" nowrap="nowrap">《会计基础》</td>
                    <td valign="center" rowspan="3">180元</td>
                    <td valign="center" rowspan="3"><a href="javascript:addCart(3011,0);">
                        <img src="images/gm.jpg" width="68" height="20" /></a></td>
                    <td valign="center" rowspan="3"><a href="javascript:showActivePad(0, 3011);">
                        <img src="images/jh.jpg" width="68" height="20" /></a></td>
                </tr>
                <tr>
                    <td valign="top" nowrap="nowrap">《财经法规与会计职业道德》</td>
                </tr>
                <tr>
                    <td valign="top" nowrap="nowrap">《会计电算化》</td>
                </tr>
            </table>

        </div>
        <div class="ad02">
            <a href="findCurricuumCenter.do">
                <img src="images/ad03.jpg" /></a>
        </div>
        <div class="kczx">
            <table width="0" border="0" cellspacing="0" cellpadding="0"
                class="kctable">
                <tr>
                    <td width="33%">
                        <table width="0" border="0" cellspacing="0" cellpadding="0" class="blue">
                            <tr>
                                <!-- "images/kc01.jpg"  -->
                                <td align="center">
                                    <img src="images/z_kjjc2.jpg" width="213" height="171" /></td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <table width="85%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <!-- 
											<td class="red">￥180元</td> -->
                                            <td class="red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                            <td><a href="javascript:audition(101,1,1);">
                                                <img src="images/st.jpg" width="45" height="23" /></a></td>
                                            <td><a href="javascript:addCarts(1001,0,'2014年会计基础考前辅导视频');">
                                                <img src="images/gm01.jpg" width="45" height="23" /></a></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">授课老师：<b>张黎群</b>(管理学博士)</td>
                            </tr>
                            <tr>
                                <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;北京国家会计学院副教授，中国注册会计师；2012年获管理学（会计学专业）博士学位（清华大学）；1997年获经济...</td>
                            </tr>

                        </table>
                    </td>
                    <td width="33%">
                        <table width="0" border="0" cellspacing="0" cellpadding="0" class="blue">
                            <tr>
                                <!-- "images/kc01.jpg"  -->
                                <td align="center">
                                    <img src="images/z_cjfg2.jpg" width="213" height="171" /></td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <table width="85%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <!-- 
											<td class="red">￥180元</td> -->
                                            <td class="red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                            <td><a href="javascript:audition(102,1,1);">
                                                <img src="images/st.jpg" width="45" height="23" /></a></td>
                                            <td><a href="javascript:addCarts(1002,0,'2014年财经法规考前辅导视频');">
                                                <img src="images/gm01.jpg" width="45" height="23" /></a></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">授课老师：<b>安  心</b>(经济学、教育心理学双硕士)</td>
                            </tr>
                            <tr>
                                <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注册会计师非执业会员，注册税务师，中国人民大学、中央财经大学外聘副教授，多年企事业单位培训经验，从事教育工作1...</td>
                            </tr>

                        </table>
                    </td>
                    <td width="33%">
                        <table width="0" border="0" cellspacing="0" cellpadding="0" class="blue">
                            <tr>
                                <!-- "images/kc01.jpg"  -->
                                <td align="center">
                                    <img src="images/z_kjdsh2.jpg" width="213" height="171" /></td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <table width="85%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <!-- 
											<td class="red">￥180元</td> -->
                                            <td class="red">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                            <td><a href="javascript:audition(103,1,1);">
                                                <img src="images/st.jpg" width="45" height="23" /></a></td>
                                            <td><a href="javascript:addCarts(1003,0,'2014年会计电算化考前辅导视频');">
                                                <img src="images/gm01.jpg" width="45" height="23" /></a></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">授课老师：<b>张玉琳</b>(管理学硕士)</td>
                            </tr>
                            <tr>
                                <td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;北京国家会计学院讲师，1999年获管理信息系统专业工学学士学位（清华大学）；2001年获管理科学与工程专业管理...</td>
                            </tr>

                        </table>
                    </td>
                </tr>
            </table>
            <!-- 购买课程跳转至学习卡页面 -->
            <form action="toLearnCards.do" method="post" id="formtoLearnCards" target="_blank">
                <input type="hidden" id="goodName" name="goodName" />
                <input type="hidden" id="goodId" name="goodId" />
            </form>
            <!-- 试听需要提交表单 -->
            <form action="player.do" method="post" id="formPlayer">
                <input type="hidden" id="lessoncode" name="lessoncode" />
                <input type="hidden" id="chaptercode" name="chaptercode" />
                <input type="hidden" id="scount" name="scount" />
                <input type="hidden" id="istry" name="istry" />
            </form>
        </div>
        <!--首页名师开始-->
        <div class="syms">
            <div class="bt">
                <a href="javascript:location='findTeacherById.do?teacherCode=1'">
                    <img src="images/syms.jpg" /></a>
            </div>
            <div class="nr">
                <table border="0" cellspacing="0" cellpadding="0" class="jstable">
                    <tr>
                        <td rowspan="2" valign="middle"><a target="_blank" href="findTeacherById.do?teacherCode=1">
                            <img src="images/teacher_zlq.jpg" width="90" height="107" /></a></td>
                        <th valign="middle">张黎群</th>
                    </tr>
                    <tr>
                        <td valign="middle"><a target="_blank" href="findTeacherById.do?teacherCode=1">管理学博士<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;北京国家会计学院副教..<br />
                        </a></td>
                    </tr>
                </table>
                <table border="0" cellspacing="0" cellpadding="0" class="jstable">
                    <tr>
                        <td rowspan="2" valign="middle"><a target="_blank" href="findTeacherById.do?teacherCode=3">
                            <img src="images/teacher_zyl.jpg" width="90" height="107" /></a></td>
                        <th valign="middle">张玉琳</th>
                    </tr>
                    <tr>
                        <td valign="middle"><a target="_blank" href="findTeacherById.do?teacherCode=3">管理学硕士<br />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;北京国家会计学院讲师..<br />
                        </a></td>
                    </tr>
                </table>
            </div>
        </div>
        <!--首页名师结束-->
        <!--center结束-->
    </div>
    <!--bottom开始-->
    <div class="bottom">
        <div class="bom1000">
            <div class="logo-hui"></div>
            <div class="right-txt">
                <div class="llinks">
                    <a href="./aboutus.do" id="aboutus">关于我们</a> | <a href="./telus.do" id="telus">联系我们</a>  | <a href="./websitmap.do" id="websitmap">网站地图</a>  | <a href="./userserver.do" id="userserver">客户服务</a>  | <a href="./websitabout.do" id="websitabout">网站声明</a>  | <a href="./help.do" id="websithelp">网站帮助</a>
                    <div>
                        版权所有:北京国家会计学院  京公网安备11011302000821号  京ICP备05004616号
						<script type="text/javascript">
						    var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
						    document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F867067f5734dc2e7a73ab99aeb4861f8' type='text/javascript'%3E%3C/script%3E"));
                        </script>
                        
                        <script src="http://kefu.qycn.com/vclient/state.php?webid=94589" language="javascript" type="text/javascript"></script>
                    </div>
                    <div>5*8小时免费咨询热线：400-063-0318 <b><font color="blue"><%--(您是本网站第：330877位访问者)--%></font></b></div>
                </div>
            </div>
        </div>
    </div>
    <!--bottom结束-->

    <%--<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>--%>
    <script type="text/javascript" src="js/slider.js"></script>
    <script type="text/javascript">
        $(function () {
            //默认状态下左右滚动
            $("#s1").xslider({
                unitdisplayed: 4,
                movelength: 1,
                autoscroll: 3000
            });
        })

        function tits() {
            art.dialog({
                title: '提示',
                lock: true,
                fixed: true,
                width: 300,
                height: 100,
                background: '#CDCDCD', // 背景色
                opacity: 0.47,	// 透明度
                content: '体验区将2014年01月01日上线，敬请期待!',
                icon: 'warning',
                button: [
                          {
                              name: '确定',
                              callback: function () {
                              },
                              focus: true
                          }
                ],
                cancelVal: '取消',
                cancel: true
            });
        }
    </script>

</body>
</html>
