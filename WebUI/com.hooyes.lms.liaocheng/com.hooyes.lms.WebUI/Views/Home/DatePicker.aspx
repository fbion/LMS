<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%
    string CDN_Private = ConfigurationManager.AppSettings.Get("CDN_Private");
    //string CDN_Public = ConfigurationManager.AppSettings.Get("CDN_Public");
%>
<html>
<head>
    <meta http-equiv="content-type" content="text/xml; charset=utf-8" />
    <title>My97DatePicker</title>
    <script type="text/javascript" src="<%=CDN_Private %>/Scripts/My97DatePicker/config.js"></script>
    <script>
        if (parent == window)
            location.href = 'http://www.hooyes.net/';
        var $d, $dp, $pdp = parent.$dp, $dt, $tdt, $sdt, $IE = $pdp.ie, $FF = $pdp.ff, $OPERA = $pdp.opera, $ny, $cMark = false;
        if ($pdp.eCont) {
            $dp = {};
            for (var p in $pdp) {
                $dp[p] = $pdp[p];
            }
        }
        else
            $dp = $pdp;

        $dp.getLangIndex = function (name) {
            var arr = langList;
            for (var i = 0; i < arr.length; i++) {
                if (arr[i].name == name) {
                    return i;
                }
            }
            return -1;
        }

        $dp.getLang = function (name) {
            var index = $dp.getLangIndex(name);
            if (index == -1) {
                index = 0;
            }
            return langList[index];
        }

        $dp.realLang = $dp.getLang($dp.lang);
        document.write("<script src='<%=CDN_Private %>/Scripts/My97DatePicker/lang/" + $dp.realLang.name + ".js' charset='" + $dp.realLang.charset + "'><\/script>");

        for (var i = 0; i < skinList.length; i++) {
            document.write('<link rel="stylesheet" type="text/css" href="<%=CDN_Private %>/Scripts/My97DatePicker/skin/' + skinList[i].name + '/datepicker.css" title="' + skinList[i].name + '" charset="' + skinList[i].charset + '" disabled="true"/>');
        }
    </script>

    <script type="text/javascript" src="<%=CDN_Private %>/Scripts/My97DatePicker/calendar.js"></script>
</head>
<body leftmargin="0" topmargin="0" onload="$c.autoSize()">
</body>
</html>
<script>new My97DP();</script>
