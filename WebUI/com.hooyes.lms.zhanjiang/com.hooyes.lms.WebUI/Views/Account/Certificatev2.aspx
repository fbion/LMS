<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%
    string CDN_Private = ConfigurationManager.AppSettings.Get("CDN_Private");
    string CDN_Public = ConfigurationManager.AppSettings.Get("CDN_Public");
%>

<%
    var MyReport = (List<com.hooyes.lms.Model.Report>)ViewData["report"];
    var Cert = (com.hooyes.lms.Model.Certificate)ViewData["cert"];
    var Now = DateTime.Now.ToString("yyyy年MM月dd日");
    var BeginDate = Cert.BeginDate.ToString("yyyy年MM月dd日");
    var EndDate = Cert.EndDate.ToString("yyyy年MM月dd日");
    
%>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <title>合格证书 - Certificate</title>
    <link href="<% = CDN_Private %>/Css/Certificatev2.css?t=2" rel="stylesheet" />
    <script src="<% = CDN_Public %>/jquery/1.7.1/jquery.min.js"></script>
</head>
<body>
    <div id="Container" class="Container">
        <div id="printbtn" class="PrintDiv">
            <button onclick="Sprint()" id="PrintBtn" class="PrintBtn"></button>
        </div>
        <div class="cert-photo"><img src="/Photos/T_Q_<%=com.hooyes.lms.Client.MID %>.jpg" alt="" class="head-photo" /></div>
        <div class="cert-name"><%=com.hooyes.lms.Client.Name %></div>
        <div class="cert-id"><%=Cert.CertID %></div>
        <div class="cert-time"><%=EndDate %></div>
        <div id="Certificate" class="Certificate">
            <img src="<% = CDN_Private %>/img/certv2.jpg" />
        </div>

    </div>
    <script type="text/javascript">
        function Sprint() {
            $("#PrintBtn").hide();
            window.print();
        }
        function PrintFlash() {
            $("#PrintBtn").animate({
                opacity: 0.5
            }, 800).animate({
                opacity: 1
            }, 800)
          .animate({
              opacity: 0.5
          }, 800)
          .animate({
              opacity: 1
          }, 800)
        }

        setTimeout(function () {
            PrintFlash();
        }, 800);

        $("body").hover(function () {
            $("#PrintBtn").show();
        }, function () {
            $("#PrintBtn").hide();
        });

    </script>
</body>
</html>
