<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MobileSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        string CDN_Private = ConfigurationManager.AppSettings.Get("CDN_Private");
        string CDN_Public = ConfigurationManager.AppSettings.Get("CDN_Public");
    %>
    <%
        var lt = (List<com.hooyes.lms.Model.Question>)ViewData["lt"];
    %>
    <%
        var Report = (com.hooyes.lms.Model.Report)ViewData["Report"];
        var DisplayYear = (int)ViewData["DisplayYear"];
        var Product = (com.hooyes.lms.Model.Products)ViewData["Product"];
    %>
    <div class="head-nav">
        <div onclick="GoPre(1)" class="head-nav-ar"></div>
        <div class="head-nav-t">考试结果</div>
    </div>
    <div id="paperdiv" style="background-color: #FFF; margin-top: 45px">
        <div class="exam-score">你的考试成绩是：<b><%= Report.Score %></b> 分</div>
        <form id="paperform" action="" method="post">
            <ul class="exam-ul exam-result-ul">
                <%
                    var i = 0;
                    var Cate = 0;
                    foreach (var q in lt)
                    {
                        i++;
                %>


                <li class="subject"><%= i %>、<%= q.Subject %></li>
                <li class="answers">
                    <ul class="exam-sub-ul">
                        <% if (q.Cate == 1)
                           { %>
                        <li>
                            <input type="radio" name="<%=q.QID %>" id="<%=q.QID %>_A" value="A" class="required" />
                            <label for="<%=q.QID %>_A"><%= q.A%></label>
                        </li>
                        <li>
                            <input type="radio" name="<%=q.QID %>" id="<%=q.QID %>_B" value="B" class="required" />
                            <label for="<%=q.QID %>_B"><%= q.B%></label>
                        </li>
                        <li>
                            <input type="radio" name="<%=q.QID %>" id="<%=q.QID %>_C" value="C" class="required" />
                            <label for="<%=q.QID %>_C"><%= q.C%></label>
                        </li>
                        <li>
                            <input type="radio" name="<%=q.QID %>" id="<%=q.QID %>_D" value="D" class="required" />
                            <label for="<%=q.QID %>_D"><%= q.D%></label>
                        </li>
                        <li class="exam-right-answer">正确答案：<%=q.Answer %></li>
                        <% }
                           if (q.Cate == 2)
                           { %>
                        <li>
                            <input type="checkbox" name="<%=q.QID %>" id="<%=q.QID %>_A2" value="A" class="required" />
                            <label for="<%=q.QID %>_A2"><%= q.A%></label>
                        </li>
                        <li>
                            <input type="checkbox" name="<%=q.QID %>" id="<%=q.QID %>_B2" value="B" class="required" />
                            <label for="<%=q.QID %>_B2"><%= q.B%></label>
                        </li>
                        <li>
                            <input type="checkbox" name="<%=q.QID %>" id="<%=q.QID %>_C2" value="C" class="required" />
                            <label for="<%=q.QID %>_C2"><%= q.C%></label>
                        </li>
                        <li>
                            <input type="checkbox" name="<%=q.QID %>" id="<%=q.QID %>_D2" value="D" class="required" />
                            <label for="<%=q.QID %>_D2"><%= q.D%></label>
                        </li>
                        <li class="exam-right-answer">正确答案：<%=q.Answer %></li>
                        <% }
                           if (q.Cate == 3)
                           { %>
                        <li>
                            <input type="radio" name="<%=q.QID %>" id="<%=q.QID %>_A3" value="√" class="required" />
                            <label for="<%=q.QID %>_A3"><%= q.A%></label>
                        </li>
                        <li>
                            <input type="radio" name="<%=q.QID %>" id="<%=q.QID %>_B3" value="×" class="required" />
                            <label for="<%=q.QID %>_B3"><%= q.B%></label>
                        </li>
                        <li class="exam-right-answer">正确答案：<%=q.Answer %></li>
                        <% } %>
                    </ul>
                </li>
                <%
                                  
                  
                    }
                %>
            </ul>
        </form>
    </div>
    <script type="text/javascript" src="http://static.nai.hooyes.com/scripts/jsb/jsb.js"></script>
    <script>
        function GoLink(id, title) {
            jsb.require('nextPage', { 'CID': id, 'Title': title }, function (response) {
                //alert('调用messagebox回来啦\n' + JSON.stringify(response));
            });
        }
        function GoSearch() {
            var keyword = document.getElementById("search_text").value;
            jsb.require('nextSearch', { 'keyword': keyword }, function (response) {
                //alert('调用messagebox回来啦\n' + JSON.stringify(response));
            });
        }
        function GoPre(id) {
            jsb.require('prePage', { 'text': id }, function (response) {

            });
        }
    </script>
    <script src="<% = CDN_Public %>/jquery-validate/1.9.0/jquery.validate.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var cnmsg = {
            required: "请选择答案"
        };
        $.extend($.validator.messages, cnmsg);
        $("#paperform").validate({
            errorPlacement: function (error, element) {
                error.appendTo(element.parent("td"));
            }
        });
    </script>
</asp:Content>
