﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%
    string CDN_Private = ConfigurationManager.AppSettings.Get("CDN_Private");
    string CDN_Public = ConfigurationManager.AppSettings.Get("CDN_Public");
%>
<%
    var cid = Convert.ToInt32(ViewData["CID"]);
    var ccid = Convert.ToInt32(ViewData["CCID"]);
    var Contents = (com.hooyes.lms.Model.Contents)ViewData["Contents"];
    var Courses = (com.hooyes.lms.Model.Courses)ViewData["Courses"];
    var StartUrl = com.hooyes.lms.C.APP + "/Content/x/" + Courses.CName + "/" + Contents.Url;
%>
<!DOCTYPE html>
<html>
<head>
    <title>
        <%= Courses.Name%>
        - 课程学习 </title>
    <style type="text/css">
        body {
            margin: 0px;
            padding: 0px;
        }

        #log {
            position: fixed;
            width: 600px;
            height: 250px;
            overflow: scroll;
            background-color: #FFF;
            margin: 0px;
            padding: 0px;
            z-index: 9999;
            display: none;
        }

        #question {
            background-color: #FFFFCC;
            padding: 10px;
            cursor: auto;
        }
    </style>
</head>
<body style="height: 700px; width: 100%">
    <ul id="log">
    </ul>
    <iframe id="ifr" width="100%" height="100%" src="<% = StartUrl %>" frameborder="0"></iframe>
    <script type="text/javascript">
        var CID = <%= cid %>;
        var CCID = <%= ccid %>;
        var CATE = <% = Courses.Cate %>;
    </script>
    <script src="<% = CDN_Public %>/jquery/1.7.1/jquery.min.js"></script>
    <script src="<% = CDN_Private %>/Scripts/jquery.extend.js" type="text/javascript"></script>
    <script src="<% = CDN_Private %>/Scripts/config.js" type="text/javascript"></script>
    <script src="<% = CDN_Private %>/Scripts/player.js?t=20120220" type="text/javascript"></script>

</body>
</html>
