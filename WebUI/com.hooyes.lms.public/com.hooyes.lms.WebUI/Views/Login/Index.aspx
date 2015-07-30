<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
    <title>北京国家会计学院远程教育网 - 登录</title>
    <link rel="stylesheet" href="http://web.static.online.nai.edu.cn/public/css/register.css">
    <script type="text/javascript" src="http://cdn.staticfile.org/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="http://web.static.online.nai.edu.cn/public/default/jquery.artDialog.js?skin=default"></script>
    <script type="text/javascript" src="http://web.static.online.nai.edu.cn/public/default/plugins/iframeTools.js"></script>
     <script src="http://static.s11.hooyes.com/Scripts/config.js" type="text/javascript"></script>    <script src="http://static.s11.hooyes.com/Scripts/account.public.js?t=20150506"></script>
    <style>
        .btn-temp {
            background-image:url(http://web.static.online.nai.edu.cn/public/images/register_register.gif);
            background-repeat:no-repeat;
            width:255px;
            height:34px;
            border:none;
        }
    </style>
</head>
<body>
    <div class="register_header">
        <div class="register_header_content">
            <a href="/">
                <h1>北京国家会计学院</h1>
            </a>




        </div>
    </div>

    <div class="register_main">
        <div class="register_main_content1">
            <div class="ipod">
                <div class="computer"></div>
            </div>
            <div class="sheng"></div>
            <form id="login_form" action="" onsubmit="return Login('/Account/landing')" method="post">
                <p>
                    <strong>登录名:</strong><br />
                    <br />
                    <input type="text" value="" placeholder="登录账号" class="td1" id="ID" name="ID"  tabindex="1" />
                </p>
                <p>
                    <strong>登录密码:</strong><%--<a target='blank' href="/index.php/Reg/getbackpassword" class="td2">忘记密码登录？</a>--%><br />
                    <br />
                    <input type="password" class="td1" id="PWD" name="PWD" tabindex="1" />
                </p>
                <br />
                <a id="login">
                    <%--<img src="http://web.static.online.nai.edu.cn/public/images/register_register.gif" style="cursor: pointer">--%></a>
                    <button class="btn-temp" type="submit"></button>
                    <br />
                    <br />
                    <a href="/signup">注册账号</a>
            </form>
        </div>
    </div>

    <div class="dltx">
        <%-- <p class="pPic">
            <a href="http://henan.nai.edu.cn/">
                <img src="../../public/images/henan.png"></a><a href="http://jiangxi.nai.edu.cn/"><img src="../../public/images/jiangxi.png"></a><a href="http://ningxia.nai.edu.cn/"><img src="../../public/images/ningxia.png"></a><div class="clr"></div>
        </p>--%>
        <%--<p class="pTxt" style="float: right;"><span style="display: block; float: left; text-align: left; margin-left: 10px; line-height: 20px;">*</span><span style="display: block; float: left; text-align: left; margin-left: 10px; width: 240px; line-height: 20px;">河南、江西、宁夏的继续教育学员，请直接点击图标进入登录入口</span></p>--%>
    </div>





    <div class="clear"></div>
    <div class="register_footer" style="height: 150px;">
        <p>下载安装最新版本的Flash player,<a target="_blank" href="http://get.adobe.com/cn/flashplayer/">点此安装>></a></p>
        <ul class="register_footer_ul1">
            <li><a href="#">中华人民共和国财政部</a>|</li>
            <li><a href="#">清华大学</a>|</li>
            <li><a href="#">上海国家会计学院</a>|</li>
            <li><a href="#">厦门国家会计学院</a>|</li>
            <li><a href="#">中国注册会计师协会</a>|</li>
            <li><a href="#">中国资产评估协会</a>|</li>
            <li><a href="#">中国注册税务师协会</a></li>
        </ul>
        <div class="clear"></div>
        <ul class="register_footer_ul2">
            <li><a href="#">关于国会</a></li>
            <li><a href="#">帮助中心</a></li>
            <li><a href="#">网站地图 </a></li>
            <li><a href="#">诚聘英才</a></li>
            <li><a href="#">联系我们 </a></li>
            <li><a href="#">网站合作</a></li>
            <li><a href="#">版权说明</a></li>
            <li class="now"><a href="#">北京东方创远教育科技有限公司技术支持 京公网安备11011302000821号  京ICP备05004616号</a></li>
        </ul>
    </div>
</body>
</html>
