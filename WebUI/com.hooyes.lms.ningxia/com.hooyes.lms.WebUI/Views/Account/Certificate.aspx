﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%
    var MyReport = (List<com.hooyes.lms.Model.Report>)ViewData["report"];
    var Cert = (com.hooyes.lms.Model.Certificate)ViewData["cert"];
    var Member = (com.hooyes.lms.Model.Member)ViewData["member"];
    var Now = DateTime.Now.ToString("yyyy年MM月dd日");
    var BeginDate = Cert.BeginDate.ToString("yyyy年MM月dd日");
    var EndDate = Cert.EndDate.ToString("yyyy年MM月dd日");
    
%>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <title>合格证书 - Certificate</title>
    <link href="<% = com.hooyes.lms.C.CDN %>/Css/Certificate.css?t=2" rel="stylesheet" />
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/jquery.min.js"></script>
</head>
<body>
    <div id="Container" class="Container">
        <div id="printbtn" class="PrintDiv">
            <button onclick="Sprint()" id="PrintBtn" class="PrintBtn"></button>
        </div>
        <div id="Certificate" class="Certificate">
            <div class="title">宁夏会计人员远程继续教育合格证书</div>
            <div class="content">
                <span class="nick"><%=com.hooyes.lms.Client.Name %></span> (<%=com.hooyes.lms.Client.IDCard %>) 于 <%=BeginDate %>至 <%=EndDate %>参加北京国家会计学院组织的宁夏会计人员远程继续教育培训，已修完规定学时并且考试通过，予以结业，特发此证。
                <%--<p>
                    （注：继续教育合格后，如需办理调转的，请在1个月后前往发证机关办理。办理会计从业资格登记的，请按规定在登记年份的第4季度前往发证机关办理。）
                </p>--%>
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
                <div class="SerialNo">证书编号：0<%=Cert.ID %></div>
                <div class="SerialNo">会计从业资格证书档案号：<%=Member.IDCert %></div>
                <div class="SerialNo">会计从业资格证书检查登记地：<%=Member.RegionName %></div>
            </div>
            <div class="foot">
                <div class="signature">
                    <div class="signature-stamp">
                        <img src="<%=com.hooyes.lms.C.CDN %>/Img/stamp.png" />
                    </div>
                    <div class="signature-text">
                        <p>北京国家会计学院</p>
                        <p>宁夏财政厅</p>
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
