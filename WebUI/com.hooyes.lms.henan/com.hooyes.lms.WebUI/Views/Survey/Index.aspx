<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        string CDN_Private = ConfigurationManager.AppSettings.Get("CDN_Private");
        string CDN_Public = ConfigurationManager.AppSettings.Get("CDN_Public");
    %>

    <form id="surveyform" action="/Survey/Collect" method="post">
        <div id="SurveyContainer" class="survey-container">
            <div class="survey-subject">培训效果调查表</div>
            <div class="survey-tip">
                <ul>
                    <li>本问卷受河南省财政厅委托，请受训学员详实填写。</li>
                    <li>请你给予率直的反应及批评,这样可帮助我们对培训课程及培训有所改进.</li>
                </ul>
            </div>
            <div class="survey-item">

                <table id="surveytb" style="width: 100%" class="commontb survey-table">

                    <tbody>
                        <tr class="survey-item-t">
                            <td>一、课程方面：
                            </td>
                            <td>非常赞同</td>
                            <td>赞同</td>
                            <td>一般</td>
                            <td>不太赞同</td>
                            <td>强烈反对</td>
                        </tr>
                        <tr>
                            <td class="survey-item-s">1、课程涵盖了我想要了解的内容与信息</td>
                            <td>
                                <input type="radio" name="1" value="5" class="required"></td>
                            <td>
                                <input type="radio" name="1" value="4" class="required"></td>
                            <td>
                                <input type="radio" name="1" value="3" class="required"></td>
                            <td>
                                <input type="radio" name="1" value="2" class="required"></td>
                            <td>
                                <input type="radio" name="1" value="1" class="required"></td>
                        </tr>

                        <tr>
                            <td class="survey-item-s">2、课程具有实践性，内容对实际工作有指导意义和参考借鉴，能为我的实际工作提供帮助</td>
                            <td>
                                <input type="radio" name="2" value="5" class="required"></td>
                            <td>
                                <input type="radio" name="2" value="4" class="required"></td>
                            <td>
                                <input type="radio" name="2" value="3" class="required"></td>
                            <td>
                                <input type="radio" name="2" value="2" class="required"></td>
                            <td>
                                <input type="radio" name="2" value="1" class="required"></td>
                        </tr>

                        <tr>
                            <td class="survey-item-s">3、课程具有一定前沿性，理论或实践属于前沿论题</td>
                            <td>
                                <input type="radio" name="3" value="5" class="required"></td>
                            <td>
                                <input type="radio" name="3" value="4" class="required"></td>
                            <td>
                                <input type="radio" name="3" value="3" class="required"></td>
                            <td>
                                <input type="radio" name="3" value="2" class="required"></td>
                            <td>
                                <input type="radio" name="3" value="1" class="required"></td>
                        </tr>

                        <tr>
                            <td class="survey-item-s">4、课程资料有助于我在课堂上理解课程内容</td>
                            <td>
                                <input type="radio" name="4" value="5" class="required"></td>
                            <td>
                                <input type="radio" name="4" value="4" class="required"></td>
                            <td>
                                <input type="radio" name="4" value="3" class="required"></td>
                            <td>
                                <input type="radio" name="4" value="2" class="required"></td>
                            <td>
                                <input type="radio" name="4" value="1" class="required"></td>
                        </tr>
                        <tr class="survey-item-t">
                            <td>二、讲师方面：
                            </td>
                            <td>非常赞同</td>
                            <td>赞同</td>
                            <td>一般</td>
                            <td>不太赞同</td>
                            <td>强烈反对</td>
                        </tr>
                        <tr>
                            <td class="survey-item-s">1、讲师的讲解技巧非常好，深入浅出,举例生动贴切</td>
                            <td>
                                <input type="radio" name="5" value="5" class="required"></td>
                            <td>
                                <input type="radio" name="5" value="4" class="required"></td>
                            <td>
                                <input type="radio" name="5" value="3" class="required"></td>
                            <td>
                                <input type="radio" name="5" value="2" class="required"></td>
                            <td>
                                <input type="radio" name="5" value="1" class="required"></td>
                        </tr>

                        <tr>
                            <td class="survey-item-s">2、讲师的专业能力非常棒，能够解决实际问题</td>
                            <td>
                                <input type="radio" name="6" value="5" class="required"></td>
                            <td>
                                <input type="radio" name="6" value="4" class="required"></td>
                            <td>
                                <input type="radio" name="6" value="3" class="required"></td>
                            <td>
                                <input type="radio" name="6" value="2" class="required"></td>
                            <td>
                                <input type="radio" name="6" value="1" class="required"></td>
                        </tr>

                        <tr>
                            <td class="survey-item-s">3、讲师语言表达清晰，逻辑结构强。</td>
                            <td>
                                <input type="radio" name="7" value="5" class="required"></td>
                            <td>
                                <input type="radio" name="7" value="4" class="required"></td>
                            <td>
                                <input type="radio" name="7" value="3" class="required"></td>
                            <td>
                                <input type="radio" name="7" value="2" class="required"></td>
                            <td>
                                <input type="radio" name="7" value="1" class="required"></td>
                        </tr>

                        <tr>
                            <td class="survey-item-s">4、我能够清楚地明白讲师的讲解</td>
                            <td>
                                <input type="radio" name="8" value="5" class="required"></td>
                            <td>
                                <input type="radio" name="8" value="4" class="required"></td>
                            <td>
                                <input type="radio" name="8" value="3" class="required"></td>
                            <td>
                                <input type="radio" name="8" value="2" class="required"></td>
                            <td>
                                <input type="radio" name="8" value="1" class="required"></td>
                        </tr>
                        <tr class="survey-item-t">
                            <td>三、整体部分：
                            </td>
                            <td>很好</td>
                            <td>好</td>
                            <td>普通</td>
                            <td>不好</td>
                            <td>极差</td>
                        </tr>
                        <tr>
                            <td class="survey-item-s">培训形式非常好，希望继续采用该种形式</td>
                            <td>
                                <input type="radio" name="9" value="5" class="required"></td>
                            <td>
                                <input type="radio" name="9" value="4" class="required"></td>
                            <td>
                                <input type="radio" name="9" value="3" class="required"></td>
                            <td>
                                <input type="radio" name="9" value="2" class="required"></td>
                            <td>
                                <input type="radio" name="9" value="1" class="required"></td>
                        </tr>

                        <tr>
                            <td class="survey-item-s">您对此次培训的整体满意度是：</td>
                            <td>
                                <input type="radio" name="10" value="5" class="required"></td>
                            <td>
                                <input type="radio" name="10" value="4" class="required"></td>
                            <td>
                                <input type="radio" name="10" value="3" class="required"></td>
                            <td>
                                <input type="radio" name="10" value="2" class="required"></td>
                            <td>
                                <input type="radio" name="10" value="1" class="required"></td>
                        </tr>


                        <tr>
                            <td colspan="6" class="survey-item-s survey-item-s2">为了帮助我们更好地改进工作，请留下您的宝贵建议：
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" class="survey-item-s">
                                <textarea name="11" placeholder="请留下您的宝贵建议" class="survey-textarea" maxlength="500"></textarea>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="survey-btn-div">
                <button class="survey-btn" type="submit">提交</button>
            </div>
            <div class="survey-link">
                <p><a href="/">返回首页</a></p>
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
