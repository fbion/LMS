<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>批量处理 </h2>
    <div id="Container">
        <div id="tip" class="style16">
            注意，必需按照模板格式上传 <a href="../Content/Template/T1.xlsx">下载模板</a>
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
    <h2>查询结果</h2>
    批号：
    <input type="text" value="" id="txt_sn" />
    <button type="button" onclick="goResult()">查询</button>
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
        function goResult() {
            var sn = document.getElementById("txt_sn").value;
            if (sn != null && sn != "" && !isNaN(sn)) {
                var url = "UploadComplete?SN=" + sn;
                location.href = url;
            }
        }
    </script>
</asp:Content>
