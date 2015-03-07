<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        string Filter = (string)ViewData["Filter"];
        string JsonStr = (string)ViewData["JsonStr"];
        string QueryString = Request.QueryString.ToString();
        int PageSize = 100;
        int CurrentPage = Convert.ToInt32(Request.QueryString.Get("Page"));
        int TotalRecords = 0;

        CurrentPage = CurrentPage < 1 ? 1 : CurrentPage;
        var ListM = com.hooyes.lms.DAL.M.Get.Survey(PageSize, CurrentPage, Filter, out TotalRecords);

        int MaxPage = 0;
        int Remainder = 0;
        MaxPage = TotalRecords / PageSize;
        Remainder = TotalRecords % PageSize;
        MaxPage = Remainder > 0 ? MaxPage + 1 : MaxPage;
        //string Url = "";
        CurrentPage = CurrentPage > MaxPage ? MaxPage : CurrentPage;
        int NexPage = CurrentPage + 1;
        int PrePage = CurrentPage - 1;
        NexPage = NexPage > MaxPage ? MaxPage : NexPage;
        PrePage = PrePage > 0 ? PrePage : 1;

        
    %>
    <h2>学员提问列表
    </h2>
    <%
        if (com.hooyes.lms.Client.CheckTag(15))
        {
    %>
    <div id="SearchDiv">
        <form action="" method="get">
            <input type="hidden" name="QueryFlag" value="1" />
            <table class="commontb">

                <tr>
                    <td style="width: 80px">类型
                    </td>
                    <td>
                        <select id="Cate" name="Cate">
                            <option value="-1">不限</option>
                            <option value="1">1)付款成功，但是没有报名序号</option>
                            <option value="2">2)付款成功，但是报名序号提示无效</option>
                            <option value="3">3)学习完毕，但是省网站上查不到记录</option>
                            <option value="4">4)其他问题</option>
                        </select>
                    </td>
                    <td rowspan="2">
                        <input id="Button1" type="submit" class="btn1" value="查询" />
                        <br />
                        <a href="javascript:void(0);" onclick="ResetSearchForm()">清空查询条件</a>
                    </td>
                </tr>
                <tr>
                    <td>时间</td>
                    <td>
                        <input type="text" name="MinDate" id="MinDate" class="Wdate" maxlength="20" onclick="WdatePicker()" />
                        ~
                        <input type="text" name="MaxDate" id="MaxDate" class="Wdate" maxlength="20" onclick="WdatePicker()" />
                    </td>

                </tr>

            </table>
        </form>
    </div>
    <%
        } %>
    <div id="Pager1" class="Pager">
        <div class="total">总人数  <%= TotalRecords%></div>
        <span class="export">
            
            <a href="../Export/Survey?PageSize=<%=TotalRecords %>&CurrentPage=0&<%=QueryString %>">[导出全部]</a>
            <a href="../Export/Survey?PageSize=<%=PageSize %>&CurrentPage=<%= CurrentPage%>&<%=QueryString %>">[导出本页]</a>
        </span>
        每页
            <%= PageSize%>
        当前 <% = CurrentPage%>/<%=MaxPage%> 页 
       
        <a href="javascript:void(0)" onclick="GoPage(<%=PrePage %>)">上一页</a>
        <a href="javascript:void(0)" onclick="GoPage(<%=NexPage %>)">下一页</a>
        <a href="javascript:void(0)" onclick="JumpShow('#PagerJump1','#tPage')">跳转 </a>
    </div>
    <div id="PositionHolder1" class="PositionHolder">
        <div id="PagerJump1" class="PagerJump">
            跳转到第
            <input type="text" size="4" id="tPage" maxlength="4" />
            页
            <input type="button" value="确定" onclick="JumpPage('#tPage')" />
        </div>
    </div>
    <table id="Table2" class="commontb">
        <tr>
            <td>序号
            </td>
            <td>类型</td>
            <td style="min-width:80px">姓名
            </td>
            <td>电话</td>
            <td>报名序号
            </td>
            <td>身份证号
            </td>
            <td>会计证号
            </td>
            <td>其它问题</td>
            <td style="min-width:80px">日期</td>
        </tr>
        <% 
            int odd = 0;
            var oddClass = "";

            foreach (var m in ListM)
            {

                if (odd == 1)
                {
                    oddClass = "odd";
                    odd = 0;
                }
                else
                {
                    odd = 1;
                    oddClass = "";
                }
        %>
        <tr class="<%=oddClass %>">
            <td>
                <%= m.Id%>
            </td>
            <td><%=m.Cate %></td>
            <td>
                <%= m.Name%>
            </td>
            <td>
                <%= m.Phone%>
            </td>
            <td>
                <%= m.IDSN%>
            </td>
            <td>
                <%= m.IDCard%>
            </td>
            <td>
                <%= m.IDCert%>
            </td>
            <td><%= m.Comment%></td>
            <td><%=m.CreateDate.ToString("yyyy-MM-dd") %></td>
        </tr>
        <%
            }
        %>
    </table>
    <div id="Pager2" class="Pager">
        <% = CurrentPage%>/<%=MaxPage%>
        页 
        <a href="javascript:void(0)" onclick="GoPage(<%=PrePage %>)">上一页</a>
        <a href="javascript:void(0)" onclick="GoPage(<%=NexPage %>)">下一页</a>
        <a href="javascript:void(0)" onclick="JumpShow('#PagerJump2','#tPage2')">跳转 </a>
    </div>
    <div id="PositionHolder2" class="PositionHolder">
        <div id="PagerJump2" class="PagerJump">
            跳转到第
            <input type="text" size="4" id="tPage2" maxlength="4" />
            页
            <input type="button" value="确定" onclick="JumpPage('#tPage2')" />
        </div>
    </div>

    <script type="text/javascript">
        //日期格式化 
        String.prototype.toCustomDate = function () {
            var r;
            var d = eval("new " + this.replace(/\//g, ""));

            if (d.getFullYear() > 1000) {
                month = d.getMonth() + 1;
                r = d.getFullYear() + "-" + month + "-" + d.getDate();
            }
            return r;
        }

        function JumpShow(id, id2) {
            $(id).slideToggle('fast');
            $(id2).focus();
        }
        function JumpPage(id) {
            var tPage = $(id).val();
            if (tPage == "" || tPage == null) {
                alert("请输入页数");
                return false;
            }
            tPage = isNaN(tPage) ? 1 : tPage;
            //window.location = "?Page=" + tPage;
            GoPage(tPage);
        }
        function UpdateParams(url, name, value) {
            var r = url;
            if (r != null && r != 'undefined' && r != "") {
                value = encodeURIComponent(value);
                var reg = new RegExp("(^|)" + name + "=([^&]*)(|$)");
                var tmp = name + "=" + value;
                if (url.match(reg) != null) {
                    r = url.replace(eval(reg), tmp);
                }
                else {
                    if (url.match("[\?]")) {
                        r = url + "&" + tmp;
                    }
                    else {
                        r = url + "?" + tmp;
                    }
                }
            }
            return r;
        }
        function GoPage(page) {
            var url = window.location.href;
            url = UpdateParams(url, "Page", page);
            window.location = url;
        }

        function InitData(data) {
            if (data.QueryFlag == 1) {
                $("#Cate").val(data.Cate);
                $("#MaxDate").val(data.MaxDate.toCustomDate());
                $("#MinDate").val(data.MinDate.toCustomDate());
            }
        };

        function ResetSearchForm() {
            var data = { "Cate": -1, "Years": null, "MaxMinutes": 0, "MinMinutes": 0, "MinScore": 0, "MaxScore": 0, "Status": -1, "IID": -1, "RegMinDate": "\/Date(-62135596800000)\/", "RegMaxDate": "\/Date(-62135596800000)\/", "MinDate": "\/Date(-62135596800000)\/", "MaxDate": "\/Date(-62135596800000)\/", "QueryFlag": 1 };
            InitData(data);
        }

        $(function () {
            var JsonStr = <% =JsonStr%>
                    InitData(JsonStr);
        });

    </script>
    <script src="<% = com.hooyes.lms.C.CDN %>/Scripts/My97DatePicker/WdatePicker.js"></script>
    <div class="debug">
        Filter: <%=Filter %>
        <br />
        JsonStr:<%=JsonStr %>
        <br />
        QueryString:<%=QueryString %>
    </div>
</asp:Content>
