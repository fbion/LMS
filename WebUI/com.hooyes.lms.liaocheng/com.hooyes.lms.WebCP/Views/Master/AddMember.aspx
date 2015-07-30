<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <h2>添加学员</h2>
    <form id="form1" action="" method="post">
        <input id="Text_Login" name="Login" type="hidden" class="required" value="" />
        <input id="Text_Password" name="Password" type="hidden" class="required" value="" />
        <table id="Table2" class="commontb">
            <tr>
                <td style="width: 20%;">姓名
                </td>
                <td>
                    <input id="Text_Name" name="Name" type="text" maxlength="15" class="required" />
                </td>
            </tr>
            <tr>
                <td>身份证号
                </td>
                <td>
                    <input id="Text_IDCard" name="IDCard" type="text" maxlength="20" class="required" />
                </td>
            </tr>
            <tr>
                <td>区划代码
                </td>
                <td>
                    <input id="Text3" name="RegionCode" type="text" maxlength="10" class="required number" />
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <button class="flatbtn" id="edit_btn_3" type="button">提交</button>
                </td>

            </tr>
        </table>
    </form>
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            var cnmsg = {
                required: "必填",
                number: "请输入数字"
            };
            $.extend($.validator.messages, cnmsg);
            $("#form1").validate();

            $("#edit_btn_3").click(function () {
                $("#Text_Login").val($("#Text_IDCard").val());
                $("#Text_Password").val($("#Text_Name").val());
                if ($("#form1").valid()) {
                    ApplyUpdateMember();
                }
            });
        });

        var MasterController = AppRoot + "Master/";
        function ApplyUpdateMember() {
            $.ajax({
                url: MasterController + "UpdateMember",
                type: "POST",
                data: $("#form1").serialize(),
                dataType: "json",
                success: function (data) {
                    if (data.Code == 0) {
                        alert("添加成功");
                        window.location.href = MasterController + "ViewMember?MID=" + data.Value + "&add" + new Date().valueOf();
                    } else {
                        alert("提交错误，请重试");
                    }
                },
                error: function () {

                }
            });
        }
    </script>
</asp:Content>
