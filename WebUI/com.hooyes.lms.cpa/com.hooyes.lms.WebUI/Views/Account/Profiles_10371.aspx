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
                            <td><%=member.Name %></td>
                        </tr>
                        <tr>
                            <td class="t">注册会计师证号</td>
                            <td>
                                <%=member.IDCert %></td>
                        </tr>
                        <tr>
                            <td class="t">性别</td>
                            <td>
                                <%=member.Gender %></td>
                        </tr>
                        <tr>
                            <td class="t">身份证号</td>
                            <td>
                                <%=member.IDCard %></td>
                        </tr>
                        <tr>
                            <td class="t">所在地区</td>
                            <td>
                                <%=member.City %></td>
                        </tr>
                        <tr>
                            <td class="t">出生日期</td>
                            <td>
                                <%=member.Birthday.ToString("yyyy-MM-dd") %></td>
                        </tr>
                        <tr>
                            <td class="t">民族</td>
                            <td>
                                <%=member.Race %></td>
                        </tr>
                        <tr>
                            <td class="t">通讯地址</td>
                            <td>
                                <%=member.Address %>
                            </td>
                        </tr>
                        <tr>
                            <td class="t">邮编</td>
                            <td>
                                <%=member.Zip %>
                            </td>
                        </tr>
                        <tr>
                            <td class="t">手机号码</td>
                            <td>
                                <%=member.Phone %></td>
                        </tr>
                        <tr>
                            <td class="t">电子邮箱</td>
                            <td>
                                <%=member.Email %>
                            </td>
                        </tr>
                        <tr>
                            <td class="t">职称等级</td>
                            <td>
                                <%=member.Job %></td>
                        </tr>
                        <tr>
                            <td class="t">学历</td>
                            <td>
                                <%=member.Education %></td>
                        </tr>
                        <tr>
                            <td class="t">学位</td>
                            <td>
                                <%=member.Degree %></td>
                        </tr>
                        <tr>
                            <td class="t">所学专业</td>
                            <td>
                                <%=member.Major %></td>
                        </tr>

                        <tr>
                            <td class="t">工作单位</td>
                            <td>
                                <%=member.Company %></td>
                        </tr>

                        <tr>
                            <td colspan="2">
                                <input id="profile_btn" type="button" onclick="EditProfile()" value="修改" />
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function EditProfile() {
            var url = AccountController + "ProfilesEdit";
            location.href = url;
        }
    </script>

    <!-- Profiles_10371 -->
</asp:Content>
