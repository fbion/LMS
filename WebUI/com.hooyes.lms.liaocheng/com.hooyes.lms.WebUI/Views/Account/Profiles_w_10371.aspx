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
        <div id="right" style="width: 100%" class="signup-div">
            <div class="board board2">
                请您更新个人信息
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
                                <input id="Text2" name="IDCert" type="text" class="s-text required" maxlength="18" value="<%=member.IDCert %>" readonly="readonly"/></td>
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
                            <td class="t">身份证号</td>
                            <td>
                                <input id="Text4" name="IDCard" type="text" class="s-text required IDCard" maxlength="18" value="" /></td>
                        </tr>
                        <tr>
                            <td class="t">所在地区</td>
                            <td>
                                <input id="Text9" name="City" type="text" class="s-text required" maxlength="15" value="<%=member.City %>" /></td>
                        </tr>
                        <tr>
                            <td class="t">出生日期</td>
                            <td>
                              <%--  <select id="s_year" class="required">
                                    <option value="">请选择</option>
                                    <% 
                                        int StartYear = DateTime.Now.Year - 80;
                                        int CurrentYear = DateTime.Now.Year - 18;
                                        for (int i = CurrentYear; i >= StartYear; i--)
                                        {
                                    %>
                                    <option value="<%=i %>"><%=i %></option>
                                    <% }%>
                                </select>年
                                <select id="s_month" class="required">
                                    <option value="">请选择</option>
                                    <%
                                    for (int i = 1; i<=12; i++)
                                        {
                                    %>
                                    <option value="<%=i %>"><%=i %></option>
                                    <% }%>
                                </select>月
                                 <select id="s_day" class="required">
                                     <option value="">请选择</option>
                                    <%
                                    for (int i = 1; i<=31; i++)
                                        {
                                    %>
                                    <option value="<%=i %>"><%=i %></option>
                                    <% }%>
                                </select>月--%>
                                <input id="Text10" name="Birthday" type="text" class="Wdate s-text required date" maxlength="30" value="" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd', qsEnabled: false, minDate:'<%=DateTime.Now.AddYears(-80)%>        ',maxDate:'<%=DateTime.Now%>        ' })" /></td>
                        </tr>
                        <tr>
                            <td class="t">民族</td>
                            <td>
                                <input id="Text11" name="Race" type="text" class="s-text required" maxlength="15" value="<%=member.Race %>" /></td>
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
                            <td class="t">手机号码</td>
                            <td>
                                <input id="Text3" name="Phone" type="text" class="s-text required Phone" maxlength="11" value="<%=member.Phone %>" /></td>
                        </tr>
                        <tr>
                            <td class="t">电子邮箱</td>
                            <td>
                                <input id="Text8" name="Email" type="text" class="s-text required email" maxlength="30" value="<%=member.Email %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="t">职称等级</td>
                            <td>
                                <input id="Text5" name="Job" type="text" class="s-text" maxlength="15" value="<%=member.Job %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="t">学历</td>
                            <td>
                                <input id="Text12" name="Education" type="text" class="s-text required" maxlength="10" value="<%=member.Education %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="t">学位</td>
                            <td>
                                <input id="Text13" name="Degree" type="text" class="s-text" maxlength="10" value="<%=member.Degree %>" />
                            </td>
                        </tr>
                        <tr>
                            <td class="t">所学专业</td>
                            <td>
                                <input id="Text14" name="Major" type="text" class="s-text required" maxlength="25" value="<%=member.Major %>" />
                            </td>
                        </tr>

                        <tr>
                            <td class="t">工作单位</td>
                            <td>
                                <input id="Text1" name="Company" type="text" class="s-text required" maxlength="30" value="<%=member.Company %>" /></td>
                        </tr>

                        <tr class="tr-term">
                            <td class="t-term" colspan="2">
                                <p class="t-p" style="width: 100%; border: none">
                                    请如实填写
                                </p>
                            </td>
                        </tr>
                        <tr class="tr-btn">
                            <td class="t-btn" colspan="2">
                                <input id="profile_btn" type="button" value="更新信息，进入系统" class="s-btn" style="width: 200px" />
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function initData() {
            $("#Gender").val("<%=member.Gender%>");
        }
        initData();
        var PFLAG = 1;
    </script>
    <script src="<% = CDN_Public %>/jquery-validate/1.9.0/jquery.validate.min.js" type="text/javascript"></script>
    <script src="<% = CDN_Private %>/Scripts/profiles.js" type="text/javascript"></script>
    <script src="<% = CDN_Private %>/Scripts/My97DatePicker/WdatePicker.js"></script>
</asp:Content>
