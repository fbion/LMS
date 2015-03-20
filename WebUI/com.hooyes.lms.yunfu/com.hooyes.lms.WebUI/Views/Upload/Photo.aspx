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
                上传照片
            </div>
            <div id="invoicediv" class="uploader-div">
                <div id="uploader" class="style17">
                    <span></span>
                    <form action="../file/CommonFileSave" method="post" enctype="multipart/form-data" onsubmit="return uConfirm()">
                        <input type="file" id="file" name="filename" />
                        <input type="hidden" name="tag" value="Q" />
                        <input type="hidden" name="nextAction" value="PhotoSave" />
                        <button type="submit">
                            上传</button>
                    </form>
                </div>
                <div class="uploader-tip">
                    <p>提示：照片只能上传 jpg 或 png 格式，大小不能超过2M。</p>
                    <p>此照片用于生成结业证书，请上传真实个人照片。</p>
                </div>
                <div class="current-photo">
                    <img src="/Photos/T_Q_<%=com.hooyes.lms.Client.MID %>.jpg" alt="" class="head-photo" />
                </div>
            </div>

        </div>
    </div>
    <script type="text/javascript">
        function uConfirm() {

            var val = $("#file").val();
            if (val == "" || val == null) {
                alert("请选择您的照片");
                return false;
            } else {
                var filepath = val;
                var extStart = filepath.lastIndexOf(".");
                var ext = filepath.substring(extStart, filepath.length).toUpperCase();
                if (ext == ".JPG" || ext == ".PNG") {
                    return true;
                } else {
                    alert("提示：照片只能上传 jpg 或 png 格式，大小不能超过2M。");
                    return false;
                }
            }
        }
    </script>
</asp:Content>
