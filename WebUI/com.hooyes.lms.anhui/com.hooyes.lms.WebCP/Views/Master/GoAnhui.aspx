<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<%
    string CDN_Private = ConfigurationManager.AppSettings.Get("CDN_Private");
    string CDN_Public = ConfigurationManager.AppSettings.Get("CDN_Public");
%>
<!DOCTYPE html>

<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <title>GoAnhui</title>
    <script src="http://cdn.staticfile.org/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
</head>
<body>
    <div>
        <form id="f1" action="http://218.22.1.72/ahkj/portal/certificate_infos/CertificateInfoLoginAction.do" method="post">
            <input type="hidden" id="defaultHrf" value="/ahkj/portal/certificate_infos/webEduManeger/CertificateInfosManagerAction.do?method=addWebEduRegistUserInit">
            <input type="hidden" name="method" value="resultWebLogin" />
            <input type="hidden" name="refUrl" value="" />
            <input type="hidden" name="cardId" value="342701197303130248" />
            <input type="hidden" name="userName" value="胡小芬" />
            验证码：<input type="text" name="rand" value="" size="4" />
            <img src="http://218.22.1.72/ahkj/common/images/authimage.gif" alt="" />
            <input type="button" value="查询" onclick="Go()" />
        </form>
    </div>
    <script>
        function Go() {
            var data = $("#f1").serialize();
            //alert(data);
            $.ajax({
                url: "http://218.22.1.72/ahkj/portal/certificate_infos/CertificateInfoLoginAction.do",
                type: "post",
                data: data,
                success: function (data) {
                    alert(data);
                },
                error: function (data) {
                    alert("error" + data);
                }
            });

        }
    </script>
</body>
</html>
