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
                                <input id="Text3" name="Phone" type="text" class="s-text required Phone" maxlength="11" value="<%=member.Phone %>" /></td>
                        </tr>
                        <tr>
                            <td class="t">工作单位</td>
                            <td>
                                <input id="Text1" name="Company" type="text" class="s-text required" maxlength="30" value="<%=member.Company %>" /></td>
                        </tr>
                        <tr>
                            <td class="t">会计从业资格证书档案号</td>
                            <td>
                                <input id="Text2" name="IDCert" type="text" class="s-text required" maxlength="30" value="<%=member.IDCert %>" /></td>
                        </tr>
                        <tr>
                            <td class="t">会计从业资格证书检查登记地</td>
                            <td>
                                <select id="RegionCode_1" name="RegionCode" class="s-select required">
                                    <option value="">请选择</option>
                                    <option value="95100">银川市本级</option>
                                    <option value="95101">兴庆区</option>
                                    <option value="95102">金凤区</option>
                                    <option value="95103">西夏区</option>
                                    <option value="95104">银川经济技术开发区</option>
                                    <option value="95105">灵武市</option>
                                    <option value="95106">贺兰县</option>
                                    <option value="95107">永宁县</option>
                                    <option value="95200">石嘴山市本级</option>
                                    <option value="95201">大武口区</option>
                                    <option value="95202">惠农区</option>
                                    <option value="95203">平罗县</option>
                                    <option value="95300">吴忠市本级</option>
                                    <option value="95301">利通区</option>
                                    <option value="95302">青铜峡市</option>
                                    <option value="95303">盐池县</option>
                                    <option value="95304">同心县</option>
                                    <option value="95305">红寺堡</option>
                                    <option value="95306">太阳山移民开发区</option>
                                    <option value="95400">固原市本级</option>
                                    <option value="95401">原州区</option>
                                    <option value="95402">泾源县</option>
                                    <option value="95403">隆德县</option>
                                    <option value="95404">彭阳县</option>
                                    <option value="95405">西吉县</option>
                                    <option value="95500">中卫市本级</option>
                                    <option value="95501">沙坡头区</option>
                                    <option value="95502">中宁县</option>
                                    <option value="95503">海原县</option>
                                </select>
                            </td>
                        </tr>
                        <tr class="tr-term">
                            <td class="t-term" colspan="2">
                                <p class="t-p" style="width: 100%; border: none">
                                    注：以上信息我方将报送宁夏财政厅，您所填信息将成为结业证书以及年检的依据。
                                <br />
                                    请如实填写，如填写有误，责任自负。
                                </p>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <input id="profile_btn" type="button" value="提交" />
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function initData() {
            $("#RegionCode_1").val("<%=member.RegionCode%>");
        }

        initData();
        var PFLAG = 2;
    </script>
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/profiles.js" type="text/javascript"></script>

</asp:Content>