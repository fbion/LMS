<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="Signup" class="signup-div">
        <div class="signup-tip">
        </div>
        <div id="signup_div">
            <form id="signup_form">
                <table class="commontb signup-tb">
                    <tr>
                        <td class="t">第二代身份证号码</td>
                        <td>
                            <input id="Text_IDCard" name="IDCard" type="text" class="s-text required IDCard" maxlength="18" /></td>
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
                        <td class="t">会计证所在地</td>
                        <td>
                            <select id="Select1" name="RegionCode" class="s-select required">
                                <option value="095000">安徽省省直</option>
                                <option value="095100">银川市</option>
                                <option value="095200">石嘴山市</option>
                                <option value="095300">吴忠市</option>
                                <option value="095400">固原市</option>
                                <option value="095500">中卫市</option>
                            </select>
                        </td>
                    </tr>
                    <tr class="tr-term">
                        <td class="t-term" colspan="2">
                            <p class="t-p">
                                注：以上信息我方将报送安徽省财政厅，您所填信息将成为结业证书以及年检的依据。
                                <br />请如实填写，如填写有误，责任自负。
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
                            注册成功！请您使用身份证号和姓名登录系统。
                           <br />
                            <a class="signup-link" href="/">转到登录</a>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td class="t">身份证号</td>
                    <td><label class="signup-l-a" id="l_IDCard"></label></td>
                </tr>
                <tr>
                    <td class="t">姓名</td>
                    <td><label class="signup-l-b" id="l_Name"></label></td>
                </tr>
                
            </table>
        </div>
    </div>
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/jquery.validate.min.js" type="text/javascript"></script>
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/signup.js?t=20131209" type="text/javascript"></script>
</asp:Content>
