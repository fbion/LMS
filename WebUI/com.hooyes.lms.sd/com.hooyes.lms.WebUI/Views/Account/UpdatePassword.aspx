<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="main">
        <div id="left">
            <div class="login">
                <% Html.RenderPartial("LogOnUserControl"); %>
            </div>
            <div class="expl">
                <div class="hotline">
                </div>
            </div>
        </div>
        <div id="right">
            <div class="board board2">
                修改密码
            </div>
            <ul class="mod-sub-nav">
                <li id="mod-sub-list1" class="mod-sub-list1 list1-active">安全验证</li>
                <li id="mod-sub-list2" class="mod-sub-list2 ">输入新密码</li>
                <li id="mod-sub-list3" class="mod-sub-list3">修改成功</li>
            </ul>
            <div id="div1" class="panel">

                <form id="f1">
                    <table class="commontb" style="width: 695px">
                        <tr>
                            <td>当前密码：</td>
                            <td>
                                <input type="password" name="CurrentPassword" id="CurrentPassword" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="button" value="下一步" id="p_btn1" /></td>
                        </tr>
                    </table>
                </form>
            </div>
            <div id="div2" class="panel none">
                <form id="f2">
                    <table class="commontb" style="width: 695px">
                        <tr>
                            <td>新密码： </td>
                            <td>
                                <input type="password" name="NewPassword" id="NewPassword" /></td>
                        </tr>
                        <tr>
                            <td>确认密码： </td>
                            <td>
                                <input type="password" name="ConfirmPassword" id="ConfirmPassword" /></td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input type="button" value="提交修改" id="p_btn2" /></td>
                        </tr>

                    </table>
                </form>
            </div>
            <div id="div3" class="panel none">

                <table class="commontb" style="width: 695px">
                    <tr>
                        <td colspan="2">密码修改成功！</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        //var AccountController = AppRoot + "Master/";
        function VerifyPassword() {
            var v1 = $("#CurrentPassword").val();
            if (v1 == "") {
                alert("请输入当前密码");
                return false;
            }
            $.ajax({
                url: AccountController + "VerifyPassword",
                type: "POST",
                data: $("#f1").serialize(),
                dataType: "json",
                success: function (data) {
                    if (data.Code == 0) {
                        // alert("提交成功");
                        $("#mod-sub-list1").removeClass("list1-active");
                        $("#mod-sub-list2").addClass("list2-active");
                        $("#div1").hide();
                        $("#div2").show();
                    } else {
                        alert("当前密码错误");
                    }
                },
                error: function () {

                }
            });
        }

        function UpdatePassword() {
            var v1 = $("#NewPassword").val();
            var v2 = $("#ConfirmPassword").val();
            if (v1 == "") {
                alert("请输入新密码");
                return false;
            }
            if (v1 != v2) {
                alert("两次输入的密码不一致，请重新输入");
                return false;
            }
            $.ajax({
                url: AccountController + "UpdatePassword",
                type: "POST",
                data: $("#f2").serialize(),
                dataType: "json",
                success: function (data) {
                    if (data.Code == 0) {
                        //alert("提交成功");
                        $("#mod-sub-list2").removeClass("list2-active");
                        $("#mod-sub-list3").addClass("list3-active");
                        $("#div2").hide();
                        $("#div3").show();
                    } else {
                        alert("提交错误，请重试");
                    }
                },
                error: function () {

                }
            });
        }


        $(function () {

            $("#p_btn1").click(function () {
                VerifyPassword();
            });

            $("#p_btn2").click(function () {
                UpdatePassword();
            });
        });

    </script>
</asp:Content>
