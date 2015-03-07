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
    var EndDate = DateTime.Now.ToString("yyyy年MM月dd日");
    
%>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <title>合格证书 - Certificate</title>
    <link href="<% = CDN_Private %>/Css/Certificate.css?t=2" rel="stylesheet" />
    <script src="<% = CDN_Public %>/jquery/1.7.1/jquery.min.js"></script>
</head>
<body>
    <div id="Container" class="Container">
        <div id="printbtn" class="PrintDiv">
            <button onclick="Sprint()" id="PrintBtn" class="PrintBtn"></button>
        </div>
        <div id="Certificate" class="Certificate">
            <div class="title"><%=ConfigurationManager.AppSettings.Get("web_title") %>合格证书</div>
            <div class="content">
                <span class="nick"><%=com.hooyes.lms.Client.Name %></span> (<%=com.hooyes.lms.Client.IDCard %>) 于 <%=BeginDate %>至 <%=EndDate %>参加北京国家会计学院组织的<%=ConfigurationManager.AppSettings.Get("web_title") %>培训，已修完规定学时并且考试通过，予以结业，特发此证。
                <p>
                    （注：继续教育合格后，如需办理调转的，请在1个月后前往发证机关办理。办理会计从业资格登记的，请按规定在登记年份的第4季度前往发证机关办理。）
                </p>
                <table class="tb">
                    <tr>
                        <td colspan="2">课程名称：</td>
                    </tr>
                    <%
                        var CountX = 0;
                        foreach (var r in MyReport)
                        {
                            CountX = CountX + 24;
                    %>
                    <tr>
                        <td style="text-indent: 2em;"><%= r.Year %>年度 会计人员继续教育</td>
                        <td>24课时</td>
                    </tr>
                    <%} %>
                    <tr>
                        <td colspan="2">总课时：<%=CountX %> 课时</td>
                    </tr>

                </table>
                <div class="SerialNo">证书编号：<%=Cert.ID %></div>
            </div>
            <div class="foot">
                <div class="signature">
                    <div class="signature-stamp">
                        <img src="<%=com.hooyes.lms.C.CDN %>/Img/stamp.png" />
                    </div>
                    <div class="signature-text">
                        <p>北京国家会计学院</p>
                        <p><%=ConfigurationManager.AppSettings.Get("web_province") %>财政厅</p>
                        <p><%=Now %></p>
                    </div>
                </div>
            </div>
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
