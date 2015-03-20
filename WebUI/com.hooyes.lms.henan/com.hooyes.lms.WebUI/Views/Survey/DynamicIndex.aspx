<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        string CDN_Private = ConfigurationManager.AppSettings.Get("CDN_Private");
        string CDN_Public = ConfigurationManager.AppSettings.Get("CDN_Public");
    %>
    <%
        var listData = (List<com.hooyes.lms.Model.SurveyItem>)ViewData["data"];
    %>
    <form id="surveyform" action="/Survey/Collect" method="post">
        <div id="SurveyContainer" class="survey-container">
            <div class="survey-subject">培训效果调查表</div>
            <div class="survey-tip">
                <ul>
                    <li>1.本问卷受河南省财政厅委托，请受训学员详实填写。</li>
                    <li>2.请你给予率直的反应及批评，这样可帮助我们对培训课程及培训有所改进。</li>
                </ul>
            </div>
            <div class="survey-item">

                <table id="surveytb" style="width: 100%" class="commontb">
                    <%foreach (var data in listData)
                      { %>
                    <tr>
                        <td class="survey-item-s"><%=data.ItemName %></td>
                        <td>
                            <input type="radio" name="<%=data.ItemID %>" value="5" class="required" /></td>
                        <td>
                            <input type="radio" name="<%=data.ItemID %>" value="4" class="required" /></td>
                        <td>
                            <input type="radio" name="<%=data.ItemID %>" value="3" class="required" /></td>
                        <td>
                            <input type="radio" name="<%=data.ItemID %>" value="2" class="required" /></td>
                        <td>
                            <input type="radio" name="<%=data.ItemID %>" value="1" class="required" /></td>
                    </tr>
                    <%} %>
                </table>

            </div>
            <div class="survey-btn-div">
                <button class="survey-btn" type="submit">提交</button>
            </div>
        </div>
    </form>
    <script src="<% = CDN_Public %>/jquery-validate/1.9.0/jquery.validate.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var cnmsg = {
            required: "请选择"
        };
        $.extend($.validator.messages, cnmsg);
        $("#surveyform").validate({
            errorPlacement: function (error, element) {
                hooyes = element;
                error.appendTo(element.parent("td").siblings(".survey-item-s"));
            }
        });
    </script>
</asp:Content>
