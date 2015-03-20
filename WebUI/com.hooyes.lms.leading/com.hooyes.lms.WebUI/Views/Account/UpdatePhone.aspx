<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        string CDN_Private = ConfigurationManager.AppSettings.Get("CDN_Private");
        string CDN_Public = ConfigurationManager.AppSettings.Get("CDN_Public");
    %>
    <div id="main">
        <div id="right" style="width: 100%">
            <div class="board board2">
                修改手机号码
            </div>
            <div id="settingdiv">
                <form id="settingform" action="" onsubmit="return ApplySubmit()" method="post">
                    <table id="invoicetb" style="width: 100%">
                        <tr>
                            <td>学员姓名
                            </td>
                            <td>
                                <%=com.hooyes.lms.Client.Name %>
                            </td>
                        </tr>
                        <tr>
                            <td>当前手机号
                            </td>
                            <td>
                                <%=com.hooyes.lms.Client.Phone %>
                            </td>
                        </tr>
                        <tr>
                            <td>新手机号
                            </td>
                            <td>
                                <input id="Phone" name="Phone" type="text" maxlength="11" class="required" />
                            </td>
                        </tr>
                        <tr style="display: none">
                            <td>手机验证码
                            </td>
                            <td>
                                <input id="PhoneCode" name="PhoneCode" type="text" maxlength="11" class="" />
                                <input id="Button3" type="button" value="点击获取验证码" onclick="ReSendCode(this)" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input id="setting_btn" type="submit" value="提交修改" />
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
    <script src="<% = CDN_Public %>/jquery-validate/1.9.0/jquery.validate.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var cnmsg = {
            required: "请填写"
        };
        $.extend($.validator.messages, cnmsg);
        var opts2 = {
            errorPlacement: function (error, element) {
                if (element.attr("name") == "Type")
                    error.insertAfter("#Label2");
                else
                    error.insertAfter(element);
            },
            messages: {
                Type: { required: "请选择" }
            }
        };
        $("#settingform").validate($.extend(opts2));

        function ApplySetting() {
            $.ajax({
                url: AccountController + "UpdatePhone2",
                type: "POST",
                data: $("#settingform").serialize(),
                dataType: "json",
                success: function (data) {
                    switch (data.Code) {
                        case 0:
                            alert("成功");
                            window.location = AccountController + "Learning";
                            break;
                        case 109:
                            alert("手机码证码错误");
                            break;
                        case 300:
                            alert("请先获取手机验证码");
                            break;
                        case 205:
                            alert("每个手机号码只允许一个学员认证,您输入手机号已被占用,请更换一个手机号。");
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

        function ApplySubmit() {
            if ($("#settingform").valid()) {
                ApplySetting();
            }
            return false;
        }

        function ReSendCode(t) {
            if (!$("#Phone").valid()) {
                return false;
            }
            CheckPhone(function () {
                $.ajax({
                    url: AccountController + "SendPhoneCode",
                    type: "POST",
                    data: $("#settingform").serialize(),
                    dataType: "json",
                    success: function (data) {
                        switch (data.Code) {
                            case 0:
                                alert("验证码已发送到您的手机，请注意查收");
                                BtnWaiting(t);
                                break;
                            default:
                                alert("请重试");
                                break;
                        }
                    },
                    error: function () {

                    }
                });
            });
        }

        function CheckPhone(fn) {

            $.ajax({
                url: AccountController + "CheckPhone",
                type: "POST",
                data: $("#settingform").serialize(),
                dataType: "json",
                success: function (data) {
                    switch (data.Code) {
                        case 0:
                            fn();
                            break;
                        case 205:
                            alert("每个手机号码只允许一个学员认证,您输入手机号已被占用,请更换一个手机号。");
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

        function BtnWaiting(t) {
            $(t).attr("disabled", "disabled");
            setTimeout(function () {
                $(t).removeAttr("disabled");
            }, 30000);
        }
    </script>
</asp:Content>
