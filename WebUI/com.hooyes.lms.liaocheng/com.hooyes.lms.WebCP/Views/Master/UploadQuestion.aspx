<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>导入试题 <a href="../Content/Template/T18.xls">下载模板</a></h2>
    <div id="Container">
        <div id="tip" class="style16">
            注意，必需按照模板格式上传 ,Sheet 的名称为 Final
        </div>
        <div id="uploader" class="style17">
            <span></span>
            <form action="../file/CommonFileSave" method="post" enctype="multipart/form-data" onsubmit="return uConfirm()">
                <ul class="c-ul">
                    <li>
                        File:<input type="file" id="file" name="filename" /></li>
                    <li style="display:none">
                        Tag:<input type="text" name="tag" value="Q" /></li>
                    <li style="display:none">Next:<input type="text" name="nextAction" value="UploadQuestionPreview" /></li>
                    <li>
                        <button type="submit">下一步 -->预览</button></li>
                </ul>
            </form>
        </div>
    </div>
    <script type="text/javascript">
        function uConfirm() {
            var val = $("#file").val();
            if (val == "" || val == null) {
                alert("请选择文件");
                return false;
            } else {
                return true;
            }
        }
    </script>
</asp:Content>
