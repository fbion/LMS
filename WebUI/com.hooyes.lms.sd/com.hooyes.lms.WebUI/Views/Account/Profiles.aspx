<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
                            <td class="t">手机号码</td>
                            <td>
                                <%=member.Phone %></td>
                        </tr>
                        <tr>
                            <td class="t">工作单位</td>
                            <td>
                                <%=member.Company %></td>
                        </tr>
                        <tr>
                            <td class="t">会计从业资格证书档案号</td>
                            <td>
                                <%=member.IDCert %></td>
                        </tr>
                        <tr>
                            <td class="t">会计从业资格证书检查登记地</td>
                            <td>
                                <%=member.RegionName %>
                            </td>
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

</asp:Content>
