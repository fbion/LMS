<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
    var cid = Convert.ToInt32(ViewData["CID"]);
    %>
    <div id="main">
        <div id="right" style="width: 100%">
            <div class="board board2">
                首次进入课程，请验证手机
            </div>
            <div id="settingdiv">
                <form id="settingform" action="" onsubmit="return ApplySubmit()" method="post">
                <input id="phone" name="phone" type="hidden" value="<% =com.hooyes.lms.Client.Phone %>" />
                <input id="cid" name="cid" type="hidden" value="<% =cid %>" />
                <table id="invoicetb" style="width: 100%">
                    <tr>
                        <td style="width: 20%">
                            您的手机号码：
                        </td>
                        <td>
                            <% =com.hooyes.lms.Client.Phone %> [<a href="UpdatePhone">修改</a>]
                        </td>
                    </tr>
                    <tr>
                        <td>
                            请输入验证码：
                        </td>
                        <td>
                            <input id="phonecode" name="phonecode" type="text" class="required" maxlength="6" />
                            <input id="Button3" type="button" value="点击获取验证码" onclick="ReSendCode(this)" />
                            <%--请在10分钟内填写完成，如果未收到，请点 
                            <input id="Button2" type="button" value="重新获取" onclick="ReSendCode()" />--%>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <input id="Button1" type="submit" value="进入课程" />
                        </td>
                    </tr>
                </table>
                </form>
            </div>
        </div>
    </div>
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ApplySetting() {
            $.ajax({
                url: AccountController + "ValidatePhone",
                type: "POST",
                data: $("#settingform").serialize(),
                dataType: "json",
                success: function (data) {
                    switch (data.Code) {
                        case 0:
                            alert("成功");
                            window.location = AccountController + "Contents?cid=<%= cid %>";
                            break;
                        case 109:
                            alert("手机码证码错误");
                            break;
                        default:
                            alert("请重试");
                            break;
                    }
                },
                error: function () {

                }
            });
        }
        function ReSendCode(t) {
            $.ajax({
                url: AccountController + "ReSendPhoneCode",
                type: "POST",
                data: $("#settingform").serialize(),
                dataType: "json",
                success: function (data) {
                    switch (data.Code) {
                        case 0:
                            alert("验证码已发送到您的手机，请注意查收");
                            BtnWaiting(t)
                            break;
                        default:
                            alert("请重试");
                            break;
                    }
                },
                error: function () {

                }
            });
        }
        var cnmsg = {
            required: "请填写"
        };
        $.extend($.validator.messages, cnmsg);
        $("#settingform").validate();


        function ApplySubmit() {
            if ($("#settingform").valid()) {
                ApplySetting();
            }
            return false;
        }
        function BtnWaiting(t) {
            $(t).attr("disabled", "disabled");
            setTimeout(function () {
                $(t).removeAttr("disabled");
            }, 30000);
        }
    </script>
</asp:Content>
