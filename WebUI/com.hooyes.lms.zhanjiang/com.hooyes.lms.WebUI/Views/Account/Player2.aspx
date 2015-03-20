<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%
    //var cid = Convert.ToInt32(ViewData["CID"]);
    //var ccid = Convert.ToInt32(ViewData["CCID"]);
    //var Contents = (com.hooyes.lms.Model.Contents)ViewData["Contents"];
    //var Courses = (com.hooyes.lms.Model.Courses)ViewData["Courses"];
    //var StartUrl = com.hooyes.lms.C.CDN + "/Content/" + Courses.CName + "/" + Contents.Url;
    var StartUrl = com.hooyes.lms.C.CDN + "/Content/13001/mp4/02.mp4";
    //var StartUrl = com.hooyes.lms.C.CDN + "/Img/01.mp4";
%>
<!DOCTYPE html>
<html>
<head>
    <title>
        <%--<%= Courses.Name%>--%>
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
    <link href="<% = com.hooyes.lms.C.CDN %>/Scripts/video-js/video-js.css" rel="stylesheet" />
    <script>
        videojs.options.flash.swf = "<% = com.hooyes.lms.C.CDN %>/Scripts/video-js/video-js.swf";
   </script>
</head>
<body style="height: 800px; width: 100%">

    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/jquery.extend.js" type="text/javascript"></script>
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/config.js" type="text/javascript"></script>
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/video-js/video.js"></script>

    <video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="100%" height="100%"
        poster="http://s.cn.bing.net/az/hprichbg/rb/BlueJaySnow_ZH-CN9039497953_1920x1080.jpg"
        data-setup="{}">

        <source src="<% = StartUrl %>" type='video/mp4' />
       <%-- <source src="<% = StartUrl %>" type='video/x-flv' />--%>
        <%--<track kind="captions" src="demo.captions.vtt" srclang="en" label="English"></track>--%>
        <!-- Tracks need an ending tag thanks to IE9 -->
        <p class="vjs-no-js">To view this video please enable JavaScript, and consider upgrading to a web browser that <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a></p>
    </video>

    <script>
        videojs("example_video_1").ready(function () {
            var myPlayer = this;
            
            myPlayer.play();
            setTimeout(function () {
                myPlayer.currentTime(120);
            }, 1000);
           


            //setInterval(function () {
            //    document.title = myPlayer.duration();
            //}, 2000);

        });
    </script>

</body>
</html>
