<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="keywords" content="会计硕士,会计远程教育,会计高端培训,会计学院,北京会计,高级财会人才,注册会计师" />
    <meta name="description" content="安徽省会计人员网络继续教育学习系统使用指导手册，北京国家会计学院是国务院于1998年7月20日批准成立的国务院事业单位，由财政部代管，教学管理依托清华大学。培训会计人才的后续教育培训基地。" />
    <title>安徽省会计人员继续教育 -- 指导手册 -- 国家会计学院</title>
    <link href="<% = com.hooyes.lms.C.CDN %>/Css/Common.css" rel="stylesheet" type="text/css" />
    <link href="<% = com.hooyes.lms.C.CDN %>/Css/Help.css" rel="stylesheet" type="text/css" />
    <link href="<% = com.hooyes.lms.C.CDN %>/favicon.ico" rel="Bookmark" />
    <link href="<% = com.hooyes.lms.C.CDN %>/favicon.ico" rel="Shortcut Icon" />
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/config.js" type="text/javascript"></script>
</head>
<body>
    <div id="wrapper">
        <%--  <div class="header">
        </div>--%>
        <div class="help">
            <h2 class="title">安徽省会计人员网络继续教育学习系统使用指导手册</h2>
            <div>
                <h3>一、	报名缴费</h3>
                <p class="text">
                    1、进入北京国家会计学院远程教育网安徽省会计人员继续教育学习专区（网址：<a class="link" target="_blank" href="http://ningxia.nai.edu.cn">ningxia.nai.edu.cn</a>）。点击登录框下方蓝色的注册按钮开始报名。
                </p>
                <p class="img">
                    <img src="../img/help/1.jpg" />
                </p>
                <p class="text">
                    2、进入注册页面，请在信息采集栏目中填写真实的个人信息。由于姓名、身份证号码会在结业证书和会计人员信息系统中体现，请在各栏目请填写真实信息。填写注册信息后点击“提交注册”按钮完成报名。
                </p>
                <p class="img">
                    <img src="../img/help/2.jpg" />
                </p>
                <p class="text">
                    3、注册成功后，系统会显示采集到的身份证号码和姓名，请核对是否有误。如发现问题请及时拨打4000630318客服电话更正。
                </p>
                <p class="img">
                    <img src="../img/help/3.jpg" />
                </p>

                <p class="text">
                    4、返回到安徽省学习专区首页，填写身份证号码、姓名进行登录。登录后选择购买内容，系统生成购买订单。
                </p>
                <p class="img">
                    <img src="../img/help/4.jpg" />
                </p>
                <p class="text">
                    5、确认购买的学习内容后，点击“提交确认支付”按钮，系统会自动跳转到网银页面。网银充值成功后，点击页面左侧登录信息下方的“课程列表”按钮，选择对需要购买课程进行支付，完成缴费。
                </p>
            </div>
            <div>
                <h3>二、	申请发票</h3>
                <p class="text">
                    网银充值成功后，点击页面左侧登录信息下方的“申请发票”按钮可以按实际支付金额申请发票。北京国家会计学院统一开具定额发票。发票用挂号信寄出，为了您能及时收到发票，请填写详细、准确的邮寄地址。
                </p>
                <p class="img">
                    <img src="../img/help/5.jpg" />
                </p>
            </div>
            <div>
                <h3>三、	选课学习</h3>
                <p class="text">
                    点击页面左侧登录信息下方的“课程列表”按钮进入选课列表，在感兴趣的课程状态一栏点击耳机符号可以开始听课。“已学时长”表示该门课的听课时间。已学时长的合计数达到1080分钟时，可以参加结业考试。
                </p>
                <p class="img">
                    <img src="../img/help/6.jpg" />
                </p>
            </div>
            <div>
                <h3>四、	考试结业</h3>
                <p class="text">
                    已学时长的合计数达到1080分钟时，在课程列表的最下方会出现“进入考试”的按钮，点击后系统会自动生成试卷。
                </p>
                <p class="img">
                    <img src="../img/help/7.jpg" />
                </p>
                <p class="img">
                    <img src="../img/help/8.jpg" />
                </p>
            </div>
            <div>
                <h3>五、	证书打印和年检</h3>
                <p class="text">
                    课程列表的最下方显示学员的学习状态。当“本年度总学时长”大于1080分钟，考试成绩大于60分时，本年度结业状态显示“已结业”。
                </p>
                <p class="img">
                    <img src="../img/help/9.jpg" />
                </p>
                <p class="text">
                    此时可以点击页面左侧登录信息下方的“查看证书”按钮，可以查看并打印证书。需要办理会计证年检的学员，可持打印的结业证书到所属会计管理机构办理年检手续。会计管理机构可以通过管理员账号登陆网校后台，核实学员结业情况。
                </p>
                <p class="img">
                    <img src="../img/help/10.jpg" />
                </p>
            </div>
        </div>
        <div class="footer">
            <span>安徽省财政厅</span><span> 技术支持：<a href="http://www.nai.edu.cn" target="_blank">北京国家会计学院</a>
            </span>
            <p style="margin-top: 8px;">
                京公网安备11011302000821号  &nbsp;京ICP备05004616号-1
            </p>
        </div>
    </div>
    <!-- hooyes 2013-12-05 -->

    <div style="display: none">
        <script type="text/javascript" src="http://js.users.51.la/16613134.js"></script>
    </div>
</body>
</html>
