<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        string CDN_Private = ConfigurationManager.AppSettings.Get("CDN_Private");
        string CDN_Public = ConfigurationManager.AppSettings.Get("CDN_Public");
    %>
    <%
        var lt = (List<com.hooyes.lms.Model.Question>)ViewData["lt"];
        var DisplayYear = (int)ViewData["DisplayYear"];
        var Product = (com.hooyes.lms.Model.Products)ViewData["Product"];
    %>
    <div id="main">
        <div id="right" style="width: 100%">
            <div class="board board2" style="text-align: center; font-weight: bold">
                 <%=Product.Name %> 考试
            </div>
            <div id="paperdiv" style="background-color:#FFF">
                <form id="paperform" action="" method="post">
                    <table id="papertb" style="width: 100%">
                        <%
                            var i = 0;
                            var Cate = 0;
                            foreach (var q in lt)
                            {
                                i++;
                        %>
                        <% if (q.Cate == 1 && Cate != q.Cate)
                           { %>
                        <tr>
                            <td class="title">一、单项选择题
                            </td>
                        </tr>
                        <% } %>
                        <% if (q.Cate == 2 && Cate != q.Cate)
                           {
                               i = 1;
                        %>
                        <tr>
                            <td class="title">二、多项选择题
                            </td>
                        </tr>
                        <% } %>
                        <% if (q.Cate == 3 && Cate != q.Cate)
                           {
                               i = 1;
                        %>
                        <tr>
                            <td class="title">三、判断题
                            </td>
                        </tr>
                        <% } %>
                        <tr>
                            <td>
                                <%= i %>、<%= q.Subject %>
                                <br />
                                <% if (q.Cate == 1)
                                   { %>
                                <input type="radio" name="<%=q.QID %>" value="A" class="required" /><%= q.A%><br />
                                <input type="radio" name="<%=q.QID %>" value="B" class="required" /><%= q.B%><br />
                                <input type="radio" name="<%=q.QID %>" value="C" class="required" /><%= q.C%><br />
                                <input type="radio" name="<%=q.QID %>" value="D" class="required" /><%= q.D%><br />
                                <% }
                                   if (q.Cate == 2)
                                   { %>
                                <input type="checkbox" name="<%=q.QID %>" value="A" class="required" /><%= q.A%><br />
                                <input type="checkbox" name="<%=q.QID %>" value="B" class="required" /><%= q.B%><br />
                                <input type="checkbox" name="<%=q.QID %>" value="C" class="required" /><%= q.C%><br />
                                <input type="checkbox" name="<%=q.QID %>" value="D" class="required" /><%= q.D%><br />
                                <% }
                               if (q.Cate == 3)
                               { %>
                                <input type="radio" name="<%=q.QID %>" value="√" class="required" /><%= q.A%><br />
                                <input type="radio" name="<%=q.QID %>" value="×" class="required" /><%= q.B%><br />
                                <% } %>
                            </td>
                        </tr>
                        <%
                               Cate = q.Cate;
                        }
                        %>
                        <tr>
                            <td style="text-align: center">
                                <input type="submit" value="提交" />
                            </td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
    </div>
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
