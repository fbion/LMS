<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

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

        #tip {
            position: absolute;
            width: 100%;
            height: 50px;
            padding: 0px;
            z-index: 9999;
            display: none;
        }

            #tip .msg {
                background-color: #FFF;
                height: 45px;
                width: 270px;
                margin: 0 auto;
                margin-top: 5px;
                line-height: 45px;
                padding: 3px;
                text-align: center;
            }
    </style>
    <link href="<% = com.hooyes.lms.C.CDN %>/Scripts/video-js/video-js.css" rel="stylesheet" />
    <script>
        videojs.options.flash.swf = "<% = com.hooyes.lms.C.CDN %>/Scripts/video-js/video-js.swf";
   </script>
</head>
<body style="height: 600px; width: 100%" onunload="goodbye()">
    <div class="tip" id="tip">
        <div class="msg" id="msg">系统已自动跳转到您上次播放的位置</div>
    </div>
    <ul id="log">
    </ul>
    <script type="text/javascript">
        var CID = <%= cid %>;
        var CCID = <%= ccid %>;
        var CATE = <% = Courses.Cate %>;
        var CookieKey = "C-<%= cid %>-<%= ccid %>";
    </script>
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/jquery.extend.js" type="text/javascript"></script>
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/config.js" type="text/javascript"></script>
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/player.js?t=20120220" type="text/javascript"></script>
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/video-js/video.js"></script>

    <video autoplay="autoplay" id="hooyes_video_1" class="video-js vjs-default-skin" controls preload="none" width="100%" height="100%"
        poster="<% = com.hooyes.lms.C.CDN %>/img/nai-1.jpg"
        data-setup="{}">
        <source src="<% = StartUrl %>" type='<%= Contents.MIME %>' />
        <p class="vjs-no-js">
           如您正在使用360浏览器，请您切换到 “极速模式” 播放本课程。<br />
           <img src="<% = com.hooyes.lms.C.CDN %>/img/360tip1.png" />
        </p>
    </video>
    <script>
        $(function(){
            $("body").css("height", $(window).height()+"px");
        });
        var myPlayer;
        var PrePasused = false;
        videojs("hooyes_video_1").ready(function () {
            myPlayer = this;
            //myPlayer.play();

            var currentTime = parseInt($.cookie(CookieKey));

            
           
           
            if(currentTime>0){

                setTimeout(function () {
                    myPlayer.currentTime(currentTime);

                    $("#tip").show();

                    setTimeout(function(){
                        $("#tip").fadeOut('slow');
                    },5000);

                }, 1000);

            }
           
            API.LMSInitialize();
           
           
            setInterval(function () {
                var isPaused = myPlayer.paused();
                if(isPaused && !PrePasused){
                    //Stop
                    API.LMSSetValue("cmi.core.suspend_data","suspend");
                    PrePasused = true;
                }

                if(!isPaused && PrePasused){
                    //Continue
                    API.LMSSetValue("cmi.core.suspend_data","continue");
                    PrePasused = false;
                }

            }, 1000);

            setTimeout(function(){
                API.LMSSetValue("cmi.core.lesson_location","");
            },1100);

            setInterval(function () {
                var isPaused = myPlayer.paused();
                if(!isPaused){
                    API.LMSSetValue("cmi.core.lesson_location","");
                }

                recordMe();

            }, 62000);

        });

        function goodbye(){
            recordMe();
            API.LMSSetValue("cmi.core.lesson_location","");
        }

        function recordMe(){
            var whereYouAt = myPlayer.currentTime();
            var lengthOfVideo = myPlayer.duration();
            if(whereYouAt>=lengthOfVideo && lengthOfVideo > 0){
                whereYouAt =0;
            }
            $.cookie(CookieKey,whereYouAt,{expires:30});
        }


        window.onresize = function(){  
            $("body").css("height", $(window).height()+"px");
        }  

        
    </script>
</body>
</html>
