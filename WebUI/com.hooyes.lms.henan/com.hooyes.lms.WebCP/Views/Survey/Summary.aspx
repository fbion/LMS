<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var list = new List<com.hooyes.lms.Model.M.SurveySummary>();
        var Temp = new List<com.hooyes.lms.Model.M.SurveySummary>();
        int cSum = 0;
       
    %>
    <div id="SurveyContainer" class="survey-container">
        <div class="survey-subject">培训效果调查表  -- 投票结果</div>
        <%-- <div class="survey-tip">
            <ul>
                <li>本问卷受河南省财政厅委托，请受训学员详实填写。</li>
                <li>请你给予率直的反应及批评,这样可帮助我们对培训课程及培训有所改进.</li>
            </ul>
        </div>--%>
        <div class="survey-tip">
            <ul class="survey-stat-ul survey-stat-ulex">

                <li>
                    <div class="S S-A-5" style="width: 55px">
                        非常赞同
                    </div>
                </li>

                <li>
                    <div class="S S-A-4" style="width: 55px">
                        赞同
                    </div>
                </li>

                <li>
                    <div class="S S-A-3" style="width: 55px">
                        一般
                    </div>
                </li>

                <li>
                    <div class="S S-A-2" style="width: 55px">
                        不太赞同
                    </div>
                </li>

                <li>
                    <div class="S S-A-1" style="width: 55px">
                        强烈反对
                    </div>
                </li>

            </ul>
             <div class="survey-al-link">
                <a href="../Survey/Feedback">查看学员建议</a>
            </div>
        </div>
        <div class="survey-item">

            <table id="surveytb" style="width: 100%" class="commontb survey-table">

                <tbody>
                    <tr class="survey-item-t">
                        <td>一、课程方面：
                        </td>
                        <td style="width: 50%"></td>
                    </tr>
                    <tr>
                        <td class="survey-item-s">1、课程涵盖了我想要了解的内容与信息</td>

                        <td>
                            <ul class="survey-stat-ul">
                                <%   
                                    list = new List<com.hooyes.lms.Model.M.SurveySummary>();
                                    Temp = com.hooyes.lms.DAL.M.Get.SurveySummary(1, 1, 1);
                                    cSum = 0;
                                    foreach (var m in Temp)
                                    {
                                        cSum = cSum + m.ICount;
                                        list.Add(m);
                                    }
                                    for (int i = 0; i < list.Count; i++)
                                    {
                                        var m = list[i];
                                        decimal rate = (Convert.ToDecimal(m.ICount) / Convert.ToDecimal(cSum)) * 100;
                                        rate = Math.Round(rate, 2);
                                %>
                                <li>
                                    <div class="S S-A-<%=5-i %>" style="width: <%=rate %>%">
                                        <%=m.ICount %>票，  <%=rate %>%  
                                    </div>
                                </li>
                                <%} %>
                            </ul>
                        </td>
                    </tr>

                    <tr>
                        <td class="survey-item-s">2、课程具有实践性，内容对实际工作有指导意义和参考借鉴，能为我的实际工作提供帮助</td>
                        <td>
                            <ul class="survey-stat-ul">
                                <%   
                                    list = new List<com.hooyes.lms.Model.M.SurveySummary>();
                                    Temp = com.hooyes.lms.DAL.M.Get.SurveySummary(1, 1, 2);
                                    cSum = 0;
                                    foreach (var m in Temp)
                                    {
                                        cSum = cSum + m.ICount;
                                        list.Add(m);
                                    }
                                    for (int i = 0; i < list.Count; i++)
                                    {
                                        var m = list[i];
                                        decimal rate = (Convert.ToDecimal(m.ICount) / Convert.ToDecimal(cSum)) * 100;
                                        rate = Math.Round(rate, 2);
                                %>
                                <li>
                                    <div class="S S-A-<%=5-i %>" style="width: <%=rate %>%">
                                        <%=m.ICount %>票，  <%=rate %>%  
                                    </div>
                                </li>
                                <%} %>
                            </ul>

                        </td>
                    </tr>

                    <tr>
                        <td class="survey-item-s">3、课程具有一定前沿性，理论或实践属于前沿论题</td>
                        <td>
                            <ul class="survey-stat-ul">
                                <%   
                                    list = new List<com.hooyes.lms.Model.M.SurveySummary>();
                                    Temp = com.hooyes.lms.DAL.M.Get.SurveySummary(1, 1, 3);
                                    cSum = 0;
                                    foreach (var m in Temp)
                                    {
                                        cSum = cSum + m.ICount;
                                        list.Add(m);
                                    }
                                    for (int i = 0; i < list.Count; i++)
                                    {
                                        var m = list[i];
                                        decimal rate = (Convert.ToDecimal(m.ICount) / Convert.ToDecimal(cSum)) * 100;
                                        rate = Math.Round(rate, 2);
                                %>
                                <li>
                                    <div class="S S-A-<%=5-i %>" style="width: <%=rate %>%">
                                        <%=m.ICount %>票，  <%=rate %>%  
                                    </div>
                                </li>
                                <%} %>
                            </ul>

                        </td>
                    </tr>

                    <tr>
                        <td class="survey-item-s">4、课程资料有助于我在课堂上理解课程内容</td>
                        <td>
                            <ul class="survey-stat-ul">
                                <%   
                                    list = new List<com.hooyes.lms.Model.M.SurveySummary>();
                                    Temp = com.hooyes.lms.DAL.M.Get.SurveySummary(1, 1, 4);
                                    cSum = 0;
                                    foreach (var m in Temp)
                                    {
                                        cSum = cSum + m.ICount;
                                        list.Add(m);
                                    }
                                    for (int i = 0; i < list.Count; i++)
                                    {
                                        var m = list[i];
                                        decimal rate = (Convert.ToDecimal(m.ICount) / Convert.ToDecimal(cSum)) * 100;
                                        rate = Math.Round(rate, 2);
                                %>
                                <li>
                                    <div class="S S-A-<%=5-i %>" style="width: <%=rate %>%">
                                        <%=m.ICount %>票，  <%=rate %>%  
                                    </div>
                                </li>
                                <%} %>
                            </ul>

                        </td>
                    </tr>
                    <tr class="survey-item-t">
                        <td>二、讲师方面：
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="survey-item-s">1、讲师的讲解技巧非常好，深入浅出,举例生动贴切</td>
                        <td>

                            <ul class="survey-stat-ul">
                                <%   
                                    list = new List<com.hooyes.lms.Model.M.SurveySummary>();
                                    Temp = com.hooyes.lms.DAL.M.Get.SurveySummary(1, 2, 5);
                                    cSum = 0;
                                    foreach (var m in Temp)
                                    {
                                        cSum = cSum + m.ICount;
                                        list.Add(m);
                                    }
                                    for (int i = 0; i < list.Count; i++)
                                    {
                                        var m = list[i];
                                        decimal rate = (Convert.ToDecimal(m.ICount) / Convert.ToDecimal(cSum)) * 100;
                                        rate = Math.Round(rate, 2);
                                %>
                                <li>
                                    <div class="S S-A-<%=5-i %>" style="width: <%=rate %>%">
                                        <%=m.ICount %>票，  <%=rate %>%  
                                    </div>
                                </li>
                                <%} %>
                            </ul>
                        </td>
                    </tr>

                    <tr>
                        <td class="survey-item-s">2、讲师的专业能力非常棒，能够解决实际问题</td>
                        <td>
                            <ul class="survey-stat-ul">
                                <%   
                                    list = new List<com.hooyes.lms.Model.M.SurveySummary>();
                                    Temp = com.hooyes.lms.DAL.M.Get.SurveySummary(1, 2, 6);
                                    cSum = 0;
                                    foreach (var m in Temp)
                                    {
                                        cSum = cSum + m.ICount;
                                        list.Add(m);
                                    }
                                    for (int i = 0; i < list.Count; i++)
                                    {
                                        var m = list[i];
                                        decimal rate = (Convert.ToDecimal(m.ICount) / Convert.ToDecimal(cSum)) * 100;
                                        rate = Math.Round(rate, 2);
                                %>
                                <li>
                                    <div class="S S-A-<%=5-i %>" style="width: <%=rate %>%">
                                        <%=m.ICount %>票，  <%=rate %>%  
                                    </div>
                                </li>
                                <%} %>
                            </ul>
                        </td>
                    </tr>

                    <tr>
                        <td class="survey-item-s">3、讲师语言表达清晰，逻辑结构强。</td>
                        <td>
                            <ul class="survey-stat-ul">
                                <%   
                                    list = new List<com.hooyes.lms.Model.M.SurveySummary>();
                                    Temp = com.hooyes.lms.DAL.M.Get.SurveySummary(1, 2, 7);
                                    cSum = 0;
                                    foreach (var m in Temp)
                                    {
                                        cSum = cSum + m.ICount;
                                        list.Add(m);
                                    }
                                    for (int i = 0; i < list.Count; i++)
                                    {
                                        var m = list[i];
                                        decimal rate = (Convert.ToDecimal(m.ICount) / Convert.ToDecimal(cSum)) * 100;
                                        rate = Math.Round(rate, 2);
                                %>
                                <li>
                                    <div class="S S-A-<%=5-i %>" style="width: <%=rate %>%">
                                        <%=m.ICount %>票，  <%=rate %>%  
                                    </div>
                                </li>
                                <%} %>
                            </ul>
                        </td>
                    </tr>

                    <tr>
                        <td class="survey-item-s">4、我能够清楚地明白讲师的讲解</td>
                        <td>
                            <ul class="survey-stat-ul">
                                <%   
                                    list = new List<com.hooyes.lms.Model.M.SurveySummary>();
                                    Temp = com.hooyes.lms.DAL.M.Get.SurveySummary(1, 2, 8);
                                    cSum = 0;
                                    foreach (var m in Temp)
                                    {
                                        cSum = cSum + m.ICount;
                                        list.Add(m);
                                    }
                                    for (int i = 0; i < list.Count; i++)
                                    {
                                        var m = list[i];
                                        decimal rate = (Convert.ToDecimal(m.ICount) / Convert.ToDecimal(cSum)) * 100;
                                        rate = Math.Round(rate, 2);
                                %>
                                <li>
                                    <div class="S S-A-<%=5-i %>" style="width: <%=rate %>%">
                                        <%=m.ICount %>票，  <%=rate %>%  
                                    </div>
                                </li>
                                <%} %>
                            </ul>
                        </td>
                    </tr>
                    <tr class="survey-item-t">
                        <td>三、整体部分：
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <div class="survey-tip">
                                <ul class="survey-stat-ul survey-stat-ulex">

                                    <li>
                                        <div class="S S-A-5" style="width: 55px">
                                            很好
                                        </div>
                                    </li>

                                    <li>
                                        <div class="S S-A-4" style="width: 55px">
                                            好
                                        </div>
                                    </li>

                                    <li>
                                        <div class="S S-A-3" style="width: 55px">
                                            普通
                                        </div>
                                    </li>

                                    <li>
                                        <div class="S S-A-2" style="width: 55px">
                                            不好
                                        </div>
                                    </li>

                                    <li>
                                        <div class="S S-A-1" style="width: 55px">
                                            极差
                                        </div>
                                    </li>

                                </ul>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="survey-item-s">培训形式非常好，希望继续采用该种形式</td>
                        <td>
                            <ul class="survey-stat-ul">
                                <%   
                                    list = new List<com.hooyes.lms.Model.M.SurveySummary>();
                                    Temp = com.hooyes.lms.DAL.M.Get.SurveySummary(1, 3, 9);
                                    cSum = 0;
                                    foreach (var m in Temp)
                                    {
                                        cSum = cSum + m.ICount;
                                        list.Add(m);
                                    }
                                    for (int i = 0; i < list.Count; i++)
                                    {
                                        var m = list[i];
                                        decimal rate = (Convert.ToDecimal(m.ICount) / Convert.ToDecimal(cSum)) * 100;
                                        rate = Math.Round(rate, 2);
                                %>
                                <li>
                                    <div class="S S-A-<%=5-i %>" style="width: <%=rate %>%">
                                        <%=m.ICount %>票，  <%=rate %>%  
                                    </div>
                                </li>
                                <%} %>
                            </ul>
                        </td>
                    </tr>

                    <tr>
                        <td class="survey-item-s">您对此次培训的整体满意度是：</td>
                        <td>
                            <ul class="survey-stat-ul">
                                <%   
                                    list = new List<com.hooyes.lms.Model.M.SurveySummary>();
                                    Temp = com.hooyes.lms.DAL.M.Get.SurveySummary(1, 3, 10);
                                    cSum = 0;
                                    foreach (var m in Temp)
                                    {
                                        cSum = cSum + m.ICount;
                                        list.Add(m);
                                    }
                                    for (int i = 0; i < list.Count; i++)
                                    {
                                        var m = list[i];
                                        decimal rate = (Convert.ToDecimal(m.ICount) / Convert.ToDecimal(cSum)) * 100;
                                        rate = Math.Round(rate, 2);
                                %>
                                <li>
                                    <div class="S S-A-<%=5-i %>" style="width: <%=rate %>%">
                                        <%=m.ICount %>票，  <%=rate %>%  
                                    </div>
                                </li>
                                <%} %>
                            </ul>
                        </td>
                    </tr>


                    <%-- <tr>
                        <td colspan="6" class="survey-item-s survey-item-s2">为了帮助我们更好地改进工作，请留下您的宝贵建议：
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6" class="survey-item-s">
                            <textarea name="11" placeholder="请留下您的宝贵建议" class="survey-textarea" maxlength="500"></textarea>
                        </td>
                    </tr>--%>
                </tbody>
            </table>
        </div>


    </div>

</asp:Content>
