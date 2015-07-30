<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        string CDN_Private = ConfigurationManager.AppSettings.Get("CDN_Private");
        string CDN_Public = ConfigurationManager.AppSettings.Get("CDN_Public");
    %>
    <%
        var member = (com.hooyes.lms.Model.Member)ViewData["member"];
    %>
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
                个人信息
            </div>
            <div id="settingdiv">
                <form id="profile_form">
                    <table id="invoicetb" style="width: 100%" class="commontb signup-tb">
                        <tr>
                            <td style="width: 30%" class="t">姓名</td>
                            <td><%=com.hooyes.lms.Client.Name %></td>
                        </tr>
                        <tr>
                            <td class="t">性别</td>
                            <td>
                                <%--<input id="Text4" name="Gender" type="text" class="s-text required" maxlength="2" value="<%=member.Gender %>" />--%>
                                <select name="Gender" id="Gender" class="s-text">
                                    <option value="男">男</option>
                                    <option value="女">女</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="t">注册会计师证号</td>
                            <td>
                                <input id="Text2" name="IDCert" type="text" class="s-text required" maxlength="30" value="<%=member.IDCert %>" /></td>
                        </tr>
                        <tr>
                            <td class="t">职务</td>
                            <td>
                                <input id="Text5" name="Job" type="text" class="s-text required" maxlength="30" value="<%=member.Job %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="t">手机号码</td>
                            <td>
                                <input id="Text3" name="Phone" type="text" class="s-text required Phone" maxlength="11" value="<%=member.Phone %>" /></td>
                        </tr>
                        <tr>
                            <td class="t">单位名称</td>
                            <td>
                                <input id="Text1" name="Company" type="text" class="s-text required" maxlength="30" value="<%=member.Company %>" /></td>
                        </tr>
                        <tr>
                            <td class="t">通讯地址</td>
                            <td>
                                <input id="Text6" name="Address" type="text" class="s-text required" maxlength="80" value="<%=member.Address %>" />

                            </td>
                        </tr>
                        <tr>
                            <td class="t">邮编</td>
                            <td>
                                <input id="Text7" name="Zip" type="text" class="s-text required" maxlength="10" value="<%=member.Zip %>" />
                            </td>
                        </tr>
                          <tr>
                            <td class="t">Email</td>
                            <td>
                                 <input id="Text8" name="Email" type="text" class="s-text required email" maxlength="30" value="<%=member.Email %>" />
                            </td>
                        </tr>
                        <tr class="tr-term">
                            <td class="t-term" colspan="2">
                                <p class="t-p" style="width: 100%; border: none">
                                    请如实填写
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input id="Button1" type="button" onclick="EditCancel()" value="取消" />
                                <input id="profile_btn" type="button" value="提交" />
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function EditCancel() {
            var url = AccountController + "Profiles";
            location.href = url;
        }

        function initData() {
            $("#Gender").val("<%=member.Gender%>");
        }

        initData();
        var PFLAG = 2;
    </script>
    <script src="<% = CDN_Public %>/jquery-validate/1.9.0/jquery.validate.min.js" type="text/javascript"></script>
    <script src="<% = CDN_Private %>/Scripts/profiles.js" type="text/javascript"></script>

</asp:Content>
