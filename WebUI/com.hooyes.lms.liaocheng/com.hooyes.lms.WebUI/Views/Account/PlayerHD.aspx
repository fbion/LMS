<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%
    string CDN_Private = ConfigurationManager.AppSettings.Get("CDN_Private");
    string CDN_Public = ConfigurationManager.AppSettings.Get("CDN_Public");

    var cid = Convert.ToInt32(ViewData["CID"]);
    var ccid = Convert.ToInt32(ViewData["CCID"]);
    var Contents = (com.hooyes.lms.Model.Contents)ViewData["Contents"];
    var Courses = (com.hooyes.lms.Model.Courses)ViewData["Courses"];

    string ContentServer = ConfigurationManager.AppSettings.Get("ContentServer");
    ContentServer = string.IsNullOrEmpty(ContentServer) ? string.Format("{0}://{1}", Request.Url.Scheme, Request.Url.Host) : ContentServer;
    var StartUrl = ContentServer + "/Content/x/" + Courses.CName + "/" + Contents.Url;
%>
<!DOCTYPE html>
<html>
<head>
    <title><%= Courses.Name%>- 课程学习 </title>
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

</head>
<body style="height: 600px; width: 100%" onunload="goodbye()" oncontextmenu="return false">
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
    <script src="<% = CDN_Public %>/jquery/1.7.1/jquery.min.js"></script>
    <script src="<% = CDN_Private %>/Scripts/jquery.extend.js" type="text/javascript"></script>
    <script src="<% = CDN_Private %>/Scripts/config.js" type="text/javascript"></script>
    <script src="<% = CDN_Private %>/Scripts/player.js?t=20120220" type="text/javascript"></script>
    <script src="<% = CDN_Private %>/Scripts/s-player/player/sewise.player.min.js"></script>
    <script type="text/javascript">
        SewisePlayer.setup({
            server: "vod",
            type: "mp4",
            videourl: "<% = StartUrl %>",
            skin: "vodFlowPlayer",
            topbardisplay: "disable",
            fallbackurls: {
                
            }
        });
    </script>
    <script>
       
        var myPlayer;
        var PrePasused = false;
        $(function () {
            $("body").css("height", $(window).height()+"px");
            myPlayer = SewisePlayer;

            var currentTime = parseInt($.cookie(CookieKey));
           
           
            if(currentTime>0){

                setTimeout(function () {
                    myPlayer.doSeek(currentTime);

                    $("#tip").show();

                    setTimeout(function(){
                        $("#tip").fadeOut('slow');
                    },5000);

                }, 1000);

            }
           
            API.LMSInitialize();

            SewisePlayer.onStop(function(name){
                API.LMSSetValue("cmi.core.suspend_data","suspend");
                PrePasused = true;
            });

            SewisePlayer.onPause(function(name){
                API.LMSSetValue("cmi.core.suspend_data","suspend");
                PrePasused = true;
            });

            SewisePlayer.onStart(function(id){
                API.LMSSetValue("cmi.core.suspend_data","continue");
                PrePasused = false;
            });

            setTimeout(function(){
                API.LMSSetValue("cmi.core.lesson_location","");
            },1100);

            setInterval(function () {
               
                if(!PrePasused){
                    API.LMSSetValue("cmi.core.lesson_location","");
                    recordMe();
                }

            }, 61000);

            setTimeout(function(){
                //console.log("API Say Hello");
                API.LMSSetValue("cmi.core.lesson_location","");
            },1400);

        });

        function goodbye(){
            recordMe();
            API.LMSSetValue("cmi.core.lesson_location","");
        }

        function recordMe(){
            var whereYouAt = myPlayer.playTime();
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
