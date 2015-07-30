<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="Signup" class="signup-div">
        <div class="signup-tip">
        </div>
        <div id="signup_div">
            <form id="signup_form">
                <input type="hidden" value="10653" name="RegionCode" />
                <table class="commontb signup-tb">
                    <tr>
                        <td class="t">身份证号码 (登录名)</td>
                        <td>
                            <input id="Text_IDCard" name="IDCard" type="text" class="s-text required IDCard" maxlength="18" />
                        </td>
                    </tr>
                    <tr>
                        <td class="t">会计师证号</td>
                        <td>
                            <input id="Text2" name="IDCert" type="text" class="s-text required" maxlength="20" /></td>
                    </tr>
                    <tr>
                        <td class="t">密码</td>
                        <td>
                            <input id="Password1" name="Password" type="Password" class="s-text required" maxlength="20" /></td>
                    </tr>
                    <tr>
                        <td class="t">确认密码</td>
                        <td>
                            <input id="Password2" type="Password" class="s-text required ConfirmPWD" maxlength="20" /></td>
                    </tr>
                    <tr>
                        <td class="t">姓名</td>
                        <td>
                            <input id="Text_Name" name="Name" type="text" class="s-text required SName" maxlength="20" /></td>
                    </tr>
                    <tr>
                        <td class="t">手机号码</td>
                        <td>
                            <input id="Text3" name="Phone" type="text" class="s-text required Phone" maxlength="11" /></td>
                    </tr>
                    <tr>
                        <td class="t">工作单位</td>
                        <td>
                            <input id="Text1" name="Company" type="text" class="s-text required" maxlength="30" /></td>
                    </tr>

                    <tr>
                        <td class="t">Email</td>
                        <td>
                            <input id="Text_Email" name="Email" type="text" class="s-text required email" maxlength="30" /></td>
                    </tr>

                  <%--  <tr>
                        <td class="t">城市</td>
                        <td>
                            <input id="Text4" name="City" type="text" class="s-text " maxlength="50" /></td>
                    </tr>

                    <tr>
                        <td class="t">详细地址</td>
                        <td>
                            <input id="Text5" name="Address" type="text" class="s-text " maxlength="250" /></td>
                    </tr>--%>



                    <tr style="display: none">
                        <td class="t">会计从业资格证书检查登记地</td>
                        <td>
                            <select id="Select1" name="RegionCode" class="s-select ">
                                <option value="">请选择</option>

                            </select>
                        </td>
                    </tr>
                    <tr class="tr-term">
                        <td class="t-term" colspan="2">
                            <p class="t-p">
                                注：以上信息我方将报送财政厅，您所填信息将成为结业证书以及年检的依据。
                                <br />
                                请如实填写，如填写有误，责任自负。
                            </p>
                        </td>
                    </tr>
                    <tr class="tr-btn">
                        <td class="t-btn" colspan="2">
                            <button class="s-btn" id="signup_btn" type="button">提交注册</button>
                            <a class="signup-link" href="/">已注册过？直接登录</a>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <div id="signup_finish" class="none">
            <table class="commontb signup-tb">
                <tr class="tr-btn">
                    <td class="t-btn" colspan="2">
                        <p class="singup-success-tip">
                            注册成功！请您使用身份证号和密码登录系统。
                           <br />
                            <a class="signup-link" href="/">转到登录</a>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="t">身份证号</td>
                    <td>
                        <label class="signup-l-a" id="l_IDCard"></label>
                    </td>
                </tr>
                <tr style="display: none">
                    <td class="t">姓名</td>
                    <td>
                        <label class="signup-l-b" id="l_Name"></label>
                    </td>
                </tr>

            </table>
        </div>
    </div>
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/signup.js?t=20131209" type="text/javascript"></script>
</asp:Content>
