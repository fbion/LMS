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
        var ListM2 = com.hooyes.lms.DAL.M.Get.M2(PageSize, CurrentPage, Filter, out TotalRecords);

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
    <h2>发票列表 </h2>
    <%
        if (com.hooyes.lms.Client.CheckTag(6))
        {
    %>
    <div id="SearchDiv">
        <form action="" method="get">
            <input type="hidden" name="QueryFlag" value="1" />
            <table class="commontb">


                <tr>
                    <td style="width: 80px">年份
                    </td>
                    <td>
                        <select id="Years" name="years" multiple="multiple" class="selectyears">
                            <option value="-1">不限</option>
                            <% 
                                int StartYear = 2006;
                                int CurrentYear = DateTime.Now.Year;
                                for (int i = CurrentYear; i >= StartYear; i--)
                                {
                            %>
                            <option value="<%=i %>"><%=i %></option>
                            <% }%>
                        </select>
                        按住 Ctrl 键 可多选
                    </td>
                    <td rowspan="3">
                        <input id="Button1" type="submit" class="btn1" value="查询" />
                        <br />
                        <a href="javascript:void(0);" onclick="ResetSearchForm()">清空查询条件</a>
                    </td>
                </tr>
                <tr>
                    <td>申请时间</td>
                    <td>
                        <input type="text" name="CrMinDate" id="CrMinDate" class="Wdate" maxlength="20" onclick="WdatePicker()" />
                        ~
                        <input type="text" name="CrMaxDate" id="CrMaxDate" class="Wdate" maxlength="20" onclick="WdatePicker()" />
                    </td>

                </tr>
                <tr>
                    <td>金额</td>
                    <td>
                        <input type="text" name="MinAmount" id="MinAmount" value="60" maxlength="5" class="shortinput" />
                        ~
                        <input type="text" name="MaxAmount" id="MaxAmount" value="80" maxlength="5" class="shortinput" />
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <% } %>
    <div id="Pager1" class="Pager">
        <div class="total">总人数  <%= TotalRecords%></div>
        <a href="../Export/invoiceV2?PageSize=<%= TotalRecords%>&CurrentPage=0&<%=QueryString %>">[导出全部]</a>
        <a href="../Export/invoiceV2?PageSize=<%=PageSize %>&CurrentPage=<%= CurrentPage%>&<%=QueryString %>">[导出本页]</a>
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
            <td>序号</td>
            <td>学员
            </td>
            <%--<td>报名序号
            </td>--%>
            <%--  <td>
                身份证号
            </td>--%>
            <%-- <td>
                类型
            </td>--%>
            <td>年份
            </td>
            <td>金额
            </td>
            <td>发票抬头
            </td>
            <td>收件人
            </td>
            <td>电话
            </td>
            <td>城市
            </td>
            <td>地址</td>
            <td>邮编
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
               var tystring = "未定";
               if (m.Type == 0)
               {
                   tystring = "行政";
               }
               if (m.Type == 1)
               {
                   tystring = "企业";
               }
               
        %>
        <tr class="<%=oddClass %>">
            <td><%= m.ID %></td>
            <td rowspan="">
                <a href="ViewInvoice?MID=<%=m.MID %>&year=<% = m.Year %>&type=<%=m.Type %>" target="_blank"><% = m.Name %> </a>
            </td>
            <%--<td>
                <% = m.IDSN %>
            </td>--%>
            <%-- <td>
                <% = m.IDCARD %>
            </td>--%>
            <%-- <td>
                <%= tystring%>
            </td>--%>
            <td>
                <% = m.Year %>
            </td>
            <td>
                <% = m.Amount %>
            </td>
            <td>
                <div class="tipper" id="<%=m.IID %>_1"><%=m.Title %></div>
                <% 
               if (m.Title.Length > 4)
               {
                   string sTitle = "<a class='anone' onmouseover=\"showTipper('#{0}_1')\">{1}...</a>";
                   sTitle = string.Format(sTitle, m.IID, m.Title.Substring(0, 3));
                   Response.Write(sTitle);
               }
               else
               {
                   Response.Write(m.Title);
               }
                %>
            
            </td>
            <td>
               
                 <div class="tipper" id="<%=m.IID %>_3"><%=m.NameContact%></div>
                  <% 
               if (m.NameContact.Length > 4)
               {
                   string NameContact = "<a class='anone' onmouseover=\"showTipper('#{0}_3')\">{1}...</a>";
                   NameContact = string.Format(NameContact, m.IID, m.NameContact.Substring(0, 3));
                   Response.Write(NameContact);
               }
               else
               {
                   Response.Write(m.NameContact);
               }
                %>
            </td>
            <td>
                <% = m.Tel %>
            </td>
            <td>
                <% = m.City %>
            </td>
            <td>
                <div class="tipper" id="<%=m.IID %>_2"><%=m.Address%></div>
                <% 
               if (m.Address.Length > 4)
               {
                   string sAddress = "<a class='anone' onmouseover=\"showTipper('#{0}_2')\">{1}...</a>";
                   sAddress = string.Format(sAddress, m.IID, m.Address.Substring(0, 3));
                   Response.Write(sAddress);
               }
               else
               {
                   Response.Write(m.Address);
               }
                %>
            </td>
            <td>
                <% = m.Zip %>
            </td>
        </tr>
        <%--        <tr class="<%=oddClass %>">
            <td colspan="7">
                <% = m.Address %>
            </td>
        </tr>--%>
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
            //var data = { "Years": null, "MinAmount": 60, "MaxAmount": 80, "CrMinDate": "\/Date(-62135596800000)\/", "CrMaxDate": "\/Date(-62135596800000)\/", "QueryFlag": 1 };
            if (data.QueryFlag == 1) {


                $("#MinAmount").val(data.MinAmount);
                $("#MaxAmount").val(data.MaxAmount);

                if (data.Years != null && data.Years != "") {
                    $("#Years").val(data.Years.split(","));
                } else {
                    $("#Years").val(-1);
                }

                $("#CrMinDate").val(data.CrMinDate.toCustomDate());
                $("#CrMaxDate").val(data.CrMaxDate.toCustomDate());

            }

        };
        function ResetSearchForm() {
            var data = { "Years": null, "MinAmount": 60, "MaxAmount": 80, "CrMinDate": "\/Date(-62135596800000)\/", "CrMaxDate": "\/Date(-62135596800000)\/", "QueryFlag": 1 };
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
