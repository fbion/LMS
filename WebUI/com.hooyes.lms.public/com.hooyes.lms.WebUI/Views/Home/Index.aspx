<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head id="web_header">
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <title>北京国家会计学院远程教育网</title>
    <link rel="stylesheet" href="http://web.static.online.nai.edu.cn/public/css/global.css" />
    <link rel="stylesheet" href="http://web.static.online.nai.edu.cn/public/css/totality.css" />
    <link rel="stylesheet" href="http://web.static.online.nai.edu.cn/public/css/skitter.styles.css" />
    <link rel="stylesheet" href="http://web.static.online.nai.edu.cn/public/default/skins/default.css?4.1.7" />
    <script type="text/javascript" src="http://cdn.staticfile.org/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="http://web.static.online.nai.edu.cn/public/default/jquery.artDialog.js?skin=default"></script>
    <script type="text/javascript" src="http://web.static.online.nai.edu.cn/public/default/plugins/iframeTools.js"></script>
    <script type="text/javascript" src="http://web.static.online.nai.edu.cn/public/js/global.js"></script>
    <script type="text/javascript" src="http://web.static.online.nai.edu.cn/public/default/HeightAuto.js"></script>
    <script src="http://static.s11.hooyes.com/Scripts/config.js" type="text/javascript"></script>    <script src="http://static.s11.hooyes.com/Scripts/account.public.js?t=20150506"></script>
    <!--[if IE 6]><style>
.content_content_right {
	width:754px;
	background: url(../images/right_body.jpg);
	float:right;
}
.content_content_right_Search {
	width:754px;
	background: url(../images/right_body.jpg);
	float:right;
	margin-top: -270px;
}
a img {
    border: 0 none;
    float: left;
}
</style><![endif]-->
</head>
<body>
    <!-- head 开始-->
    <!--[if IE 7]><style>.search_content form .textfield input{height:33px;}

</style><![endif]-->
    <div id="head">
        <div class="head_content">
            <h6>欢迎来到北京国家会计学院远程教育网</h6>
            <ul>
                <li><a onclick="AddFavorite(window.location,document.title)" href="javascript:void(0)">
                    <img src="http://web.static.online.nai.edu.cn/public/images/xin.png" />加入收藏</a></li>
                <li><a href="http://www.e-nai.cn/index.php/Document/howtouse">帮助中心</a></li>
            </ul>
        </div>
    </div>
    <!-- head 结束-->
    <!-- search 开始-->
    <div id="search">
        <div class="search_content">
            <h1>北京国家会计学院</h1>
            <form action="http://www.e-nai.cn/index.php/Index/search" method="post" onsubmit="return check_this();">
                <div class="searchbox">
                    <span style="float: right;">
                        <img src="http://web.static.online.nai.edu.cn/public/images/banner3.png" /></span><br>
                    <br>
                    <p class="textfield">
                        <input type="text" name="keyword" value="请输入课程或关键字进行搜索">
                    </p>
                    <p class="submit">
                        <input type="image" name="" src="http://web.static.online.nai.edu.cn/public/images/submit.jpg">
                    </p>
                </div>
            </form>
        </div>
    </div>
    <script type="text/javascript">  $("#cart_click").click(function () {
      art.dialog.confirm("请登录后进行操作", function () {
          window.location = "http://www.e-nai.cn/index.php/Reg";
      });
  });

        function check_this() {
            //code
            if ($(":text[name='keyword']:eq(0)").val() == "请输入课程或关键字进行搜索" || $(":text[name='keyword']:eq(0)").val() == '') {
                alert('请输入要检索的内容进行检索！');
                return false;
            }
        }

        function AddFavorite(sURL, sTitle) {
            sURL = encodeURI(sURL);
            try {
                window.external.addFavorite(sURL, sTitle);
            } catch (e) {
                try {
                    window.sidebar.addPanel(sTitle, sURL, "");
                } catch (e) {
                    alert("由于浏览器功能限制，加入收藏失败，请使用Ctrl+D进行添加,或手动在浏览器里进行设置.");
                }
            }
        }

    </script>
    <!-- search 结束-->
    <!-- nav 开始-->
    <div id="nav">
        <div class="nav_content">
            <ul>
                <li><a class='big_nav' href="http://www.e-nai.cn/index.php/Index/index">首页</a></li>
                <li><a class='big_nav' href="http://www.e-nai.cn/index.php/Document/educationalcenternew">教务中心</a></li>
                <li><a class='big_nav' href="http://www.e-nai.cn/index.php/CourseCenter/index">课程中心</a></li>
                <li><a class='big_nav' href="http://www.e-nai.cn/index.php/EdltTrends/index">远程资讯</a></li>
                <!--<li><a class='big_nav' href="http://www.e-nai.cn/index.php/Index/totalcommunity">全站社群</a></li>-->
                <!--<li><a class='big_nav' href="http://www.e-nai.cn/index.php/Group/index">全站社群</a></li>-->
                <!--<li><a class='big_nav' href="http://www.e-nai.cn/index.php/Index/ltclassroom">直播课堂</a></li>-->
                <li><a class='big_nav' href="http://www.e-nai.cn/index.php/Teacher/teachercolumn">名师专栏</a></li>
                <li><a class='big_nav' href="http://www.e-nai.cn/index.php/Laws/index">法规库</a></li>
            </ul>
        </div>
    </div>
    <script type="text/javascript">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    var url = window.location.href.replace(/.*\/index\.php\/(\w+)\/(\w+)\/?.*/, '$1');

        switch (url) {
            case 'http://www.e-nai.cn/':
                $('.big_nav:eq(0)').addClass('pick_on');
                break;
                //case
            case 'Index':
                $('.big_nav:eq(0)').addClass('pick_on');
                break;
            case 'Document':
                $('.big_nav:eq(1)').addClass('pick_on');
                break;
            case 'CourseCenter':
                $('.big_nav:eq(2)').addClass('pick_on');
                break;
                /* 
                case 'Group':
              $('.big_nav:eq(4)').addClass('pick_on');
                break;
                */
            case 'EdltTrends':
                $('.big_nav:eq(3)').addClass('pick_on');
                break;
            case 'Teacher':
                $('.big_nav:eq(4)').addClass('pick_on');
                break;
        }

    </script>
    <!-- nav 结束-->
    <style type="text/css">
        .keyword {
            color: #FF8800;
            font-weight: bold;
            font-size: inherit;
        }
    </style>
    <style>
        * {
            padding: 0px;
            margin: 0px;
        }
        /*嵌入到其他页面时可以去掉*/
        .clearfix:after {
            content: "20";
            clear: both;
            height: 0;
            display: block;
            overflow: hidden;
        }
        /*清浮*/

        .right_main_one_cotent ul li {
            position: relative;
            display: inline; /*ie6兼容*/
            list-style: none outside none; /*去掉列表默认样式*/
        }

        .right_main_one_cotent span {
            position: absolute;
            right: 0px;
            bottom: 0px;
            font-family: "宋体";
            font-size: 12px;
            padding: 2px;
            color: #fff;
            opacity: 0.7;
            background: #594D41;
        }

        img {
            border: none;
        }

        .scrollsidebar {
            position: absolute;
            z-index: 998;
            top: 150px;
        }

        .xgb {
            position: absolute;
            right: 0px;
            bottom: 0px;
            width: 20px;
            height: 20px;
            line-height: 20px;
            font-size: 20px;
            display: block;
            z-index: 9999;
            cursor: pointer;
        }

        .xgb2 {
            position: absolute;
            right: 0px;
            bottom: 0px;
            width: 20px;
            height: 20px;
            line-height: 20px;
            font-size: 20px;
            display: block;
            z-index: 9999;
            cursor: pointer;
        }
        .loginInput {
            height:30px;
            width:170px;
            line-height:30px;
        }
        #login_btn {
            height:30px;
            width:50px;
        }
    </style>
    <!-- content 开始-->
    <!--[if IE 7]><style>ul.m2 li input#m1{margin-top:-1px;}

</style><![endif]-->
    <div id="broadcasting">
    </div>
    <div id="content">
        <div class="content_content">
            <div class="content_content_left" style="min-height: 1730px;">
                <!-- 左侧导航 开始-->


                <div class="scroll">
                    <h2><span>登录<span></span></span></h2>
                    <div class="personal">
                        <div class="admin">
                            <div class="admin_content1">
                                <ul>
                                    <li>
                                        <form class="login_form" id="login_form" action="" onsubmit="return Login('/Account/landing')" method="post">

                        <div class="loginInt" id="userName" style="margin-bottom: 0;">
                            用户名：<span class="login-tips"></span>
                            <input type="text" value="" placeholder="" class="loginInput" id="ID" name="ID" tabindex="1" />
                        </div>
                        <div class="forgetPwdLine">
                            <%-- <a href="/index.php/Index/forget" target="_blank">忘记密码?</a>--%>
                        </div>
                        <div class="loginInt" id="passWord" style="margin-top:10px;">
                            密码：<span class="login-tips"></span>
                            <input type="password" value="" placeholder="" class="loginInput" id="PWD" name="PWD" tabindex="2" />
                        </div>
                        <%-- <p style='font-size: 13px;'>
                            请输入<span style='color: red; font-size: 13px; font-weight: bold;'>
                                身份证
                            </span>和<span style='color: red; font-size: 13px; font-weight: bold;'> 姓名</span>登陆，选择好专区和年度再使用学习卡激活专区。
                        </p>--%>
                        <div class="loginBtn"  style="margin-top:10px;">
                            <input type="submit" id="login_btn" value="登 录" />
                            <%--<span class="lfBtnReg"><a href="/signup" title="">注 册</a></span>--%>
                        </div>
                        
                    </form>
                                    </li>
                                    <li>还没有国会的账号？ <a href="/signup" style="color: #00a0e9; text-decoration: underline;">立即注册</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="saleprice">
                            <div class="saleprice_content">
                                <ul>
                                    <li class="saleprice_content_li1"><b>特价课程</b></li>
                                    <li><span>新经理必修课:角色转变</span></li>
                                    <li class="saleprice_content_li2"><span>特价:59元</span></li>
                                    <script type="text/javascript" src="http://web.static.online.nai.edu.cn/courses/ad/ad_js/left_courses_1.js"></script>
                                    <a href="#" target="_blank" id="left_courses_1">
                                        <li style="height: 178px; width: 136px; background-image: url(http://web.static.online.nai.edu.cn/courses/ad/image/ad/139452897294.gif)"><span></span></li>
                                    </a>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!---->
                    <div class="hot">
                        <div class="five">
                            <p style="margin: 5px auto; cursor: Pointer;">
                                <img src="http://web.static.online.nai.edu.cn/public/images/YW.png" onclick="openZoosUrl('chatwin');">
                            </p>
                            <!-- <p class="five_p1">[5x8小时]免费咨询热线：</p><p class="five_p2">400-008-7626</p><p class="five_p3">010-52908589 010-53663523</p> -->
                            <p>
                                <img src="http://web.static.online.nai.edu.cn/public/images/ershisi.png" alt="t">
                            </p>
                        </div>
                        <div class="imagec">
                            <script type="text/javascript" src="/courses/ad/ad_js/left_buttom_1.js"></script>

                            <script type="text/javascript" src="/courses/ad/ad_js/left_buttom_2.js"></script>
                        </div>
                        <p class="jygj" style="padding: 5px; color: #f60; margin-bottom: 10px; margin-top: 10px;">为了确保您的学习顺利进行，我们建议您使用以下工具：</p>
                        <p class="jygj">
                            <span class="spanA">
                                <img src="http://web.static.online.nai.edu.cn/public/images/ie.png"></span><span class="spanB"><a href="http://www.microsoft.com/zh-cn/download/internet-explorer-8-details.aspx" target="_blank">IE8.0浏览器</a></span><span class="spanC"><a href="http://www.microsoft.com/zh-cn/download/internet-explorer-8-details.aspx" target="_blank"><img src="http://web.static.online.nai.edu.cn/public/images/xz.jpg"></a></span>
                        </p>
                        <p class="jygj">
                            <span class="spanA">
                                <img src="http://web.static.online.nai.edu.cn/public/images/fl.png"></span><span class="spanB"><a href="http://get.adobe.com/cn/flashplayer/
"
                                    target="_blank">Flash Player 12.0
                                </a></span><span class="spanC"><a href="http://get.adobe.com/cn/flashplayer/
"
                                    target="_blank">
                                    <img src="http://web.static.online.nai.edu.cn/public/images/xz.jpg"></a></span>
                        </p>
                    </div>
                    <style>
                        #LRfloater0 img {
                            display: none;
                        }

                        #swtColse {
                            display: none;
                        }

                        .hot .imagec {
                            height: 110px;
                        }

                        .jygj {
                            margin: 5px auto;
                            padding: 2px 5px;
                        }

                            .jygj a {
                                color: #f60;
                            }

                        .spanA, .spanB, .spanC {
                            display: inline-block;
                            margin: 0 3px;
                        }

                        .spanB {
                            position: relative;
                            top: -20px;
                            margin-left: 5px;
                            width: 110px;
                        }

                        .spanC {
                            position: relative;
                            top: -5px;
                        }
                    </style>
                </div>


                <!-- 左侧导航 结束 -->
            </div>
            <!-- RRRRR -->

            <div class="content_content_right" style="margin-top: -270px;">
                <div class="right_main">
                    <div class="l-flow">
                        <h5 class="h5">学习流程</h5>
                        <img src="http://static.s11.hooyes.com/img/public_flow.png" style="width:750px;height:170px;" />
                    </div>
                    <!--推荐课程 开始 -->
                    <iframe scrolling="no" src="http://website.s.hooyes.com/CourseCenter/getRecommentCourse2" width="725px" height="515px" frameborder="0"></iframe>
                    <!--推荐课程 结束 -->
                    <div class="ineedall">
                        <h5 class="h5">全部课程</h5>
                        <!--左边 开始 -->
                        <div style="float: left">
                            <iframe name="iframe_center" scrolling="no" src="http://website.s.hooyes.com/CourseCenter/getAllCourses2" width="550px" height="1100px" frameborder="0"></iframe>
                        </div>
                        <!--左边 结束 -->
                        <div class="ineedall_right">
                            <!-- 最受欢迎课程开始 -->
                            <h5 class="h5" style="height: 20px; line-height: 20px;">最受欢迎<!--  <img src="http://web.static.online.nai.edu.cn/public/images/new.gif" alt=""  class="e7"/><a class="e1"  href="#">MORE</a> --></h5>
                            <ul class="e8">
                                <li>
                                    <img src="http://web.static.online.nai.edu.cn/public/images/litter1.gif" alt=""><a href="http://www.e-nai.cn/index.php/CourseCenter/courseDetail?code=GK128" target="_blank">最新税收政策解读</a></li>
                                <li>
                                    <img src="http://web.static.online.nai.edu.cn/public/images/litter2.gif" alt=""><a href="http://www.e-nai.cn/index.php/CourseCenter/courseDetail?code=GK232" target="_blank">企业会计准则解释第1-6号</a></li>
                                <li>
                                    <img src="http://web.static.online.nai.edu.cn/public/images/litter3.gif" alt=""><a href="http://www.e-nai.cn/index.php/CourseCenter/courseDetail?code=GK191" target="_blank">信息系统审计理论与实务</a></li>
                                <li>
                                    <img src="http://web.static.online.nai.edu.cn/public/images/litter4.gif" alt=""><a href="http://www.e-nai.cn/index.php/CourseCenter/courseDetail?code=GK171" target="_blank">初级财务会计</a></li>
                                <li>
                                    <img src="http://web.static.online.nai.edu.cn/public/images/litter5.gif" alt=""><a href="http://www.e-nai.cn/index.php/CourseCenter/courseDetail?code=GK194" target="_blank">政府审计</a></li>
                                <li>
                                    <img src="http://web.static.online.nai.edu.cn/public/images/litter6.gif" alt=""><a href="http://www.e-nai.cn/index.php/CourseCenter/courseDetail?code=GK003" target="_blank">所得税会计准则与实务...</a></li>
                                <li>
                                    <img src="http://web.static.online.nai.edu.cn/public/images/litter7.gif" alt=""><a href="http://www.e-nai.cn/index.php/CourseCenter/courseDetail?code=588" target="_blank">“营改增”税制改革及...</a></li>
                                <li>
                                    <img src="http://web.static.online.nai.edu.cn/public/images/litter8.gif" alt=""><a href="http://www.e-nai.cn/index.php/CourseCenter/courseDetail?code=GK192" target="_blank">信息系统审计实务——...</a></li>
                                <li>
                                    <img src="http://web.static.online.nai.edu.cn/public/images/litter9.gif" alt=""><a href="http://www.e-nai.cn/index.php/CourseCenter/courseDetail?code=GK234" target="_blank">企业产品成本核算制度</a></li>
                                <li>
                                    <img src="http://web.static.online.nai.edu.cn/public/images/litter10.gif" alt=""><a href="http://www.e-nai.cn/index.php/CourseCenter/courseDetail?code=GK004" target="_blank">职工薪酬、财务报表列...</a></li>
                            </ul>
                            <!-- 最受欢迎课程结束 -->
                            <!-- 推荐课程开始 -->
                            <h5 class="h5" style="height: 20px; line-height: 20px;">推荐课程<!-- <img src="http://web.static.online.nai.edu.cn/public/images/new.gif" alt=""  class="e7"/><a class="e1"  href="http://www.e-nai.cn/index.php/CourseCenter/index">MORE</a> --></h5>
                            <ul class="e9">
                                <li>
                                    <dl>
                                        <dt><a target="_blank" href="http://www.e-nai.cn/index.php/CourseCenter/courseDetail?code=GK017">
                                            <img width="146" height="85" src="http://web.static.online.nai.edu.cn/courses/uploadfile/GK017.jpg" alt="会计准则重点问题讲解"></a></dt>
                                        <dd style="height: 30px; line-height: 15px;"><a target="_blank" href="http://www.e-nai.cn/index.php/CourseCenter/courseDetail?code=GK017">会计准则重点问题讲解</a></dd>
                                        <dd class="e10">
                                            <p>讲师：王鹏</p>
                                        </dd>
                                    </dl>
                                </li>
                                <li>
                                    <dl>
                                        <dt><a target="_blank" href="http://www.e-nai.cn/index.php/CourseCenter/courseDetail?code=GK011">
                                            <img width="146" height="85" src="http://web.static.online.nai.edu.cn/courses/uploadfile/GK011.png" alt="国际金融市场及其对我国经济的影响"></a></dt>
                                        <dd style="height: 30px; line-height: 15px;"><a target="_blank" href="http://www.e-nai.cn/index.php/CourseCenter/courseDetail?code=GK011">国际金融市场及其对我国经济的影响</a></dd>
                                        <dd class="e10">
                                            <p>讲师：付鹏</p>
                                        </dd>
                                    </dl>
                                </li>
                                <li>
                                    <dl>
                                        <dt><a target="_blank" href="http://www.e-nai.cn/index.php/CourseCenter/courseDetail?code=GK008">
                                            <img width="146" height="85" src="http://web.static.online.nai.edu.cn/courses/uploadfile/GK008.png" alt="事务所扩张策略与效果"></a></dt>
                                        <dd style="height: 30px; line-height: 15px;"><a target="_blank" href="http://www.e-nai.cn/index.php/CourseCenter/courseDetail?code=GK008">事务所扩张策略与效果</a></dd>
                                        <dd class="e10">
                                            <p>讲师：刘启亮</p>
                                        </dd>
                                    </dl>
                                </li>
                            </ul>
                            <!-- 推荐课程结束 -->
                        </div>
                    </div>
                    <div class="clear"></div>
                </div>
            </div>

            <!-- RRRRR -->
            <!-- content 结束-->
        </div>
    </div>


    <!-- foot 开始-->
    <div class="clear"></div>
    <div id="foot">
        <div class="foot_content">
            <!--<h2>北京国家会计学院</h2>-->
            <div class="hotline" style="margin: 0 auto; width: 100%; height: 30px; text-align: center;">
                <p>
                    <ul class="yqlj">
                        <li><a href="http://www.cicpa.org.cn/">中国注册会计师协会</a>|</li>
                        <li><a href="http://www.taxexpert.com.cn/">中国注册税务师协会</a>|</li>
                        <li><a href="http://www.cas.org.cn/">中国资产评估协会</a>|</li>
                        <li><a href="http://www.mof.gov.cn/index.htm">财政部</a>|</li>
                        <li><a href="http://www.moe.edu.cn/">教育部</a>|</li>
                        <li><a href="http://www.mofcom.gov.cn/">商务部</a>|</li>
                        <li><a href="http://www.audit.gov.cn/n1992130/index.html">审计署</a>|</li>
                        <li><a href="http://www.chinatax.gov.cn/">国家税务总局</a></li>
                    </ul>
                    <ul class="gy">
                        <li><a href="#">关于我们</a></li>
                        <li><a href="#">帮助中心</a></li>
                        <li><a href="#">网站地图</a></li>
                        <li><a href="#">联系我们</a></li>
                        <li><a href="#">版权说明</a></li>
                        <li><a href="#">网站合作</a></li>
                        <li>
                            <p>北京国家会计学院 京公网安备11011302000955号  京ICP备05004616号-2</p>
                        </li>
                    </ul>
                </p>
            </div>
        </div>
    </div>
    <!--foot开始-->
    <!--up开始-->
    <div class="up">UP</div>
    <!--up结束-->

</body>
</html>

