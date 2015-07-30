<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<com.hooyes.lms.Client>" %>

<%
    var cid = Convert.ToInt32(ViewData["CID"]);
    var Contents = (List<com.hooyes.lms.Model.MyConents>)ViewData["MyContents"];
    var MyCourses = (com.hooyes.lms.Model.MyCourses)ViewData["MyCourses"];
    MyCourses.Minutes = (MyCourses.Minutes > MyCourses.Length * 45) ? MyCourses.Length * 45 : MyCourses.Minutes;
    MyCourses.Minutes = (MyCourses.Status == 1) ? MyCourses.Length * 45 : MyCourses.Minutes;
%>

<%
    string CDN_Private = ConfigurationManager.AppSettings.Get("CDN_Private");
    string CDN_Public = ConfigurationManager.AppSettings.Get("CDN_Public");
%>
<!DOCTYPE html>
<html>
<head>
    <title><%= MyCourses.Name%>  - 课程目录 </title>
    <link href="<% = CDN_Private %>/Css/Courseware.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div id="wrapper">
        <div class="right">
            <div class="rightcontent2">
                <dl class="infobar">
                    <dt>
                        <%= MyCourses.Name%></dt>
                </dl>
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="listtab2">

                    <tr class="head">
                        <td width="70%">课件内容
                        </td>
                        <td>状态
                        </td>
                        <td>在线听课
                        </td>
                    </tr>
                    <%
                        for (int i = 0; i < Contents.Count; i++)
                        {
                    %>
                    <tr>
                        <td nowrap="nowrap">
                            <%= Contents[i].Name %>
                        </td>
                        <td nowrap="nowrap">
                            <%
                            var status = (Contents[i].Second > 0) ? "学习中" : "未听";
                            //status = (Contents[i].Status == 1) ? "已完成" : status;
                            %>
                            <%= status %>
                        </td>
                        <td nowrap="nowrap">
                             <span class="flashlink blue-txt"><a class='media-b mr-10' href="javascript:ViewCourse(<%= Contents[i].CID %>,<%= Contents[i].CCID %>,'<%= Contents[i].MIME %>');">播放</a> </span>
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    <tr>
                        <td colspan="4" align="right">本课程我已听累计：<%= MyCourses.Minutes.ToString("0.#")%>分钟
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function ViewCourse(cid, ccid, MIME) {
            var url = "<% = com.hooyes.lms.C.APP %>/Account/Player?cid=" + cid + "&ccid=" + ccid;
                    if (MIME == "video/mp4") {
                        url = "<% = com.hooyes.lms.C.APP %>/Account/PlayerHD?cid=" + cid + "&ccid=" + ccid;
            }
            var w = window.open(url, "CourseWindow");
            w.focus();
        }
    </script>

</body>
</html>
