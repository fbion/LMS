<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Login.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        string cbUrl = (string)ViewData["cbUrl"];
    %>
    <div id="loginForm" class="m-login-form">
        <form action="" method="post" onsubmit="return ValidateForm()">
            <input type="hidden" value="<%=cbUrl %>" name="cbUrl" />
            <table class="commontb m-loing-tb">
                <tr>
                    <td style="width: 40px; text-align: right;">用户名
                    </td>
                    <td>
                        <input id="Text1" name="uid" type="text" class="m-input" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 40px; text-align: right;">密&nbsp;&nbsp;码
                    </td>
                    <td>
                        <input id="Text2" name="pwd" type="password" class="m-input" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input id="Submit1" type="submit" value="登录" class="m-loginBtn" />
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <% 
        int ErrorCode = Convert.ToInt32(Request.QueryString.Get("Code"));
        if (ErrorCode == 201 || ErrorCode == 200)
        {
    %>
    <script type="text/javascript">
        alert("用户名或密码错误");
    </script>
    <%
        }
    %>

    <script type="text/javascript">
        function ValidateForm() {
            var v1 = document.getElementById("Text1").value;
            var v2 = document.getElementById("Text2").value;
            if (v1 == "") {
                alert("请输入用户名");
                return false;
            }
            if (v2 == "") {
                alert("请输入密码");
                return false;
            }
            return true;
        }
    </script>

</asp:Content>
