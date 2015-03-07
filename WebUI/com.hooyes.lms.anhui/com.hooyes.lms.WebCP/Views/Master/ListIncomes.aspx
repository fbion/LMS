<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Admin.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        string Filter = (string)ViewData["Filter"];
        string JsonStr = (string)ViewData["JsonStr"];
        string QueryString = Request.QueryString.ToString();
        int PageSize = 30;
        int CurrentPage = Convert.ToInt32(Request.QueryString.Get("Page"));
        int TotalRecords = 0;

        CurrentPage = CurrentPage < 1 ? 1 : CurrentPage;
        var ListM2 = com.hooyes.lms.DAL.M.Get.Incomes(PageSize, CurrentPage, Filter, out TotalRecords);
        var IncomesSum = com.hooyes.lms.DAL.M.Get.Incomes(Filter);
        var TotalAmount = IncomesSum.DecimalValue;
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
    <h2>收入统计 </h2>
    <%
        if (com.hooyes.lms.Client.CheckTag(13))
        {
    %>
    <div id="SearchDiv">
        <form action="" method="get">
            <input type="hidden" name="QueryFlag" value="1" />
            <table class="commontb">
                <tr>
                    <td colspan="2">
                        按条件查询
                    </td>
                    <td rowspan="3">
                        <input id="Button1" type="submit" class="btn1" value="查询" />
                        <br />
                        <a href="javascript:void(0);" onclick="ResetSearchForm()">清空查询条件</a>
                    </td>
                </tr>

                <tr>
                    <td style="width: 100px;">统计区间</td>
                    <td style="width: 420px;">
                        <input type="text" name="MinDate" id="MinDate" class="Wdate" maxlength="20" onclick="WdatePicker()" />
                        ~
                        <input type="text" name="MaxDate" id="MaxDate" class="Wdate" maxlength="20" onclick="WdatePicker()" />
                    </td>

                </tr>
                <tr>
                    <td>金额</td>
                    <td>
                        <input type="text" name="MinAmount" id="MinAmount" value="0" maxlength="5" class="shortinput" />
                        ~
                        <input type="text" name="MaxAmount" id="MaxAmount" value="0" maxlength="5" class="shortinput" />
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <% } %>
    <div id="Pager1" class="Pager">
        <div class="total">统计：<%= TotalRecords%>天，共 <%= Math.Round( TotalAmount,0)%> 元
        </div>
        <a href="../Export/Incomes?PageSize=<%= TotalRecords%>&CurrentPage=0&<%=QueryString %>">[导出全部]</a>
        <a href="../Export/Incomes?PageSize=<%=PageSize %>&CurrentPage=<%= CurrentPage%>&<%=QueryString %>">[导出本页]</a>
        每页 <%= PageSize%> 当前
        <% = CurrentPage%>/<%=MaxPage%> 页
        <a href="javascript:void(0)" onclick="GoPage(<%=PrePage %>)">上一页</a>
        <a href="javascript:void(0)" onclick="GoPage(<%=NexPage %>)">下一页</a>
        <a href="javascript:void(0)" onclick="JumpShow('#PagerJump1','#tPage')">跳转
        </a>
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
        <tr style="font-weight: bold">
           <td>日期</td>
            <td>金额
            </td>
            <td>订单数量
            </td>
            <td>平均
            </td>
        </tr>
        <% int odd = 0;
           var oddClass = "";
           foreach (var m in ListM2)
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
             <td><%= m.Date %></td>
             <td><%= Math.Round( m.Amount,0) %></td>
             <td><%= m.Count %></td>
             <td><%= Math.Round(m.Avg,2) %></td>
        </tr>
      
        <% }%>
    </table>
    <div id="Pager2" class="Pager">
        <% = CurrentPage%>/<%=MaxPage%> 页 
        <a href="javascript:void(0)" onclick="GoPage(<%=PrePage %>)">上一页</a>
        <a href="javascript:void(0)" onclick="GoPage(<%=NexPage %>)">下一页</a>
        <a href="javascript:void(0)" onclick="JumpShow('#PagerJump2','#tPage2')">跳转
        </a>
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
        var JsonStr = <% =JsonStr%>
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
        function showTipper(ID) {
            $(ID).show();
        }
        $(".tipper").mouseout(function () {
            $(this).hide();
        });

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
            //var data = { "Years": null, "MinAmount": 60, "MaxAmount": 80, "MinDate": "\/Date(-62135596800000)\/", "MaxDate": "\/Date(-62135596800000)\/", "QueryFlag": 1 };
            if (data.QueryFlag == 1) {


                $("#MinAmount").val(data.MinAmount);
                $("#MaxAmount").val(data.MaxAmount);

                //if (data.Years != null && data.Years != "") {
                //    $("#Years").val(data.Years.split(","));
                //} else {
                //    $("#Years").val(-1);
                //}

                $("#MinDate").val(data.MinDate.toCustomDate());
                $("#MaxDate").val(data.MaxDate.toCustomDate());

            }

        };
        function ResetSearchForm() {
            var data = { "Years": null, "MinAmount": 0, "MaxAmount": 0, "MinDate": "\/Date(-62135596800000)\/", "MaxDate": "\/Date(-62135596800000)\/", "QueryFlag": 1 };
            InitData(data);
        }
        $(function () {
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