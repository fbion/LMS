<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%
    string CDN_Private = ConfigurationManager.AppSettings.Get("CDN_Private");
    string CDN_Public = ConfigurationManager.AppSettings.Get("CDN_Public");
%>

<%
    var PID = (int)ViewData["PID"];
    var report = (com.hooyes.lms.Model.Report)ViewData["report"];
    var Cert = (com.hooyes.lms.Model.Certificate)ViewData["cert"];
    var CertConfig = (com.hooyes.lms.Model.CertConfig)ViewData["certConfig"];
    var Now = DateTime.Now.ToString("yyyy年MM月dd日");
    var BeginDate = report.CreateDate.ToString("yyyy年MM月dd日");
    var EndDate = report.CommitDate.ToString("yyyy年MM月dd日");
    var CL = (List<com.hooyes.lms.Model.MyCourses>)ViewData["MyCourses_1"];
    decimal Total_length = (decimal)ViewData["Total_length"]; ;
%>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <title>合格证书 - Certificate</title>
    <link href="<% = CDN_Private %>/Css/Certificatev2.css?t=2" rel="stylesheet" />
    <link href="<% = CDN_Private %>/Css/c/chengdu-<%=com.hooyes.lms.Client.RegionCode %>.css?t=1" rel="stylesheet" type="text/css" />
    <script src="<% = CDN_Public %>/jquery/1.7.1/jquery.min.js"></script>
</head>
<body>
    <div id="Container" class="Container">
        <div id="printbtn" class="PrintDiv">
            <button onclick="Sprint()" id="PrintBtn" class="PrintBtn"></button>
        </div>
        <div class="cert-title"><%=CertConfig.title %></div>
        <div class="cert-photo">
            <img src="/Photos/T_Q_<%=com.hooyes.lms.Client.MID %>.jpg" alt="" class="head-photo" />
        </div>
        <div class="cert-text">
            <%=string.Format(CertConfig.text,"<span class='cert-text-name'>"+com.hooyes.lms.Client.Name +"</span>",BeginDate,EndDate) %>
        </div>
        <div class="cert-courses">
            <ul class="cert-courses-ul">
                <%   foreach (var c in CL)
                     {
                         //Total_length = Total_length + c.Length;
                %>
                <li>
                    <div class="a"><%=c.Name %></div>
                    <div class="b">
                        <%if (c.CID > 0)
                          { %>
                        <%=c.Length %> 学时
                        <%} %>
                    </div>
                </li>
                <%} %>
            </ul>
        </div>
        <div class="cert-info">
            <div class="cert-count">总学时：<%= Math.Round( Total_length,0) %> 学时</div>
            <div class="cert-score">成绩：<%= report.Score %> 分</div>
            <div class="cert-id">证书编号：<%=string.Format(CertConfig.certid,Cert.CertID) %></div>
            <div class="cert-time">结业时间：<%=EndDate %></div>
        </div>
        <div class="signature">
            <div class="signature-stamp">
                <img src="<%=CDN_Private %>/Img/stamp.png" />
            </div>
            <div class="signature-text">
                <p>北京国家会计学院</p>
                <p><%=CertConfig.sign %></p>

            </div>
        </div>
        <div id="Certificate" class="Certificate">
            <img src="<% = CDN_Private %>/img/cert-icpa-2014.jpg" />
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
