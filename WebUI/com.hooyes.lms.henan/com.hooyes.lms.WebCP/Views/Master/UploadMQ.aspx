<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

  <h2>
        信息 <a href="../Content/Template/T2_Message.xlsx">下载模板</a></h2>
    <div id="Container">
        <div id="tip" class="style16">
            注意，必需按照模板格式上传
        </div>
        <div id="uploader" class="style17">
            <span></span>
            <form action="../file/saveMQ" method="post" enctype="multipart/form-data" onsubmit="return uConfirm()">
            <input type="file" id="file" name="filename" />
            MsgID:<input type="text" id="MsgID" name="MsgID" value="0" />
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
