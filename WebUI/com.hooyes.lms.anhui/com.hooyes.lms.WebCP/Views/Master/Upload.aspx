<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        批量处理 <a href="../Content/Template/T1.xls">下载模板</a></h2>
    <div id="Container">
        <div id="tip" class="style16">
            注意，必需按照模板格式上传
        </div>
        <div id="uploader" class="style17">
            <span></span>
            <form action="../file/save" method="post" enctype="multipart/form-data" onsubmit="return uConfirm()">
            <input type="file" id="file" name="filename" />
            <button type="submit">
                提交处理</button>
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
