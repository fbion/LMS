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
        var ListM = com.hooyes.lms.DAL.M.Get.M1(PageSize, CurrentPage, Filter, out TotalRecords);

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
    <h2>已缴费学员列表
    </h2>
    <%
        if (com.hooyes.lms.Client.CheckTag(5))
        {
    %>
    <div id="SearchDiv">
        <form action="" method="get">
            <input type="hidden" name="QueryFlag" value="1" />
            <input type="hidden" name="Status" value="-1" />
            <table class="commontb">
                <tr>
                    <td colspan="3">按条件查询</td>
                    <td rowspan="8">
                        <input id="Button1" type="submit" class="btn1" value="查询" />
                        <br />
                        <a href="javascript:void(0);" onclick="ResetSearchForm()">清空查询条件</a>
                    </td>
                </tr>
                <tr>
                    <td style="width: 80px">年份
                    </td>
                    <td>
                        <select id="Years" name="years" multiple="multiple" class="selectyears">
                            <option value="-1">不限</option>
                            <% 
            int StartYear = 2005;
            int CurrentYear = DateTime.Now.Year;
            for (int i = CurrentYear; i >= StartYear; i--)
            {
                            %>
                            <option value="<%=i %>"><%=i %></option>
                            <% }%>
                        </select>
                        按住 Ctrl 键 可多选
                    </td>

                </tr>
                <tr>
                    <td>学习分钟
                    </td>
                    <td>
                        <input type="text" name="MinMinutes" id="MinMinutes" class="shortinput" maxlength="5" value="0" />
                        ~
                        <input type="text" name="MaxMinutes" id="MaxMinutes" class="shortinput" maxlength="5" value="0" />
                    </td>
                </tr>

                <%-- <tr>
                    <td>注册时间</td>
                    <td>
                        <input type="text" name="RegMinDate" id="RegMinDate" class="Wdate" maxlength="20" onclick="WdatePicker()" />
                        ~
                        <input type="text" name="RegMaxDate" id="RegMaxDate" class="Wdate" maxlength="20" onclick="WdatePicker()" />
                    </td>
                </tr>--%>
                <tr>
                    <td>结业时间</td>
                    <td>
                        <input type="text" name="GrMinDate" id="GrMinDate" class="Wdate" maxlength="20" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', qsEnabled:false })" />
                        ~
                        <input type="text" name="GrMaxDate" id="GrMaxDate" class="Wdate" maxlength="20" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss', qsEnabled: false })" />
                    </td>
                </tr>
                <tr>
                    <td>考试分数
                    </td>
                    <td>
                        <input type="text" name="MinScore" id="MinScore" class="shortinput" maxlength="5" value="0" />
                        ~
                        <input type="text" name="MaxScore" id="MaxScore" class="shortinput" maxlength="5" value="0" />
                    </td>
                </tr>
                <%--<tr>
                    <td>结业状态
                    </td>
                    <td>
                        <select id="Status" name="status">
                            <option value="-1">不限</option>
                            <option value="1">已结业</option>
                            <option value="0">未结业</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>发票
                    </td>
                    <td>
                        <select id="IID" name="IID">
                            <option value="-1">不限</option>
                            <option value="1">已填</option>
                            <option value="0">未填</option>
                        </select>
                    </td>
                </tr>--%>
                 <tr>
                    <td>区域
                    </td>
                    <td>
                        <select id="RegionCodes" name="RegionCodes" multiple="multiple" class="selectyears">
                            <option value="-1">不限</option>
                            <option value="3600">省直</option>
                            <option value="3601">南昌市</option>
                            <option value="3602">景德镇</option>
                            <option value="3603">萍乡</option>
                            <option value="3604">九江</option>
                            <option value="3605">新余</option>
                            <option value="3606">鹰潭</option>
                            <option value="3607">赣州</option>
                            <option value="3608">吉安</option>
                            <option value="3609">宜春</option>
                            <option value="3610">抚州</option>
                            <option value="3611">上饶</option>
                        </select>
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
            <%
                if (com.hooyes.lms.Client.CheckTag(9))
                {
            %>
            <a href="../Export/MemberV2?PageSize=<%=TotalRecords %>&CurrentPage=0&<%=QueryString %>">[导出全部]</a>
            <%
                }
            %>
            <a href="../Export/MemberV2?PageSize=<%=PageSize %>&CurrentPage=<%= CurrentPage%>&<%=QueryString %>">[导出本页]</a>
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
            <td>姓名
            </td>
            <%-- <td>报名序号
            </td>--%>
            <td>身份证号
            </td>
            <%-- <td>类型
            </td>--%>
            <td>年份
            </td>
            <td>课时
            </td>
            <td>考试成绩
            </td>
           <td>区域代码</td>
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
                <%= m.ID%>
            </td>
            <td>
                <a href="ViewMember?MID=<%= m.MID%>" target="_blank"><%= m.Name%></a>
            </td>
            <%--<td>
                <%= m.IDSN%>
            </td>--%>
            <td>
                <%= m.IDCard%>
            </td>
            <%-- <td>
                <% = tystring%>
            </td>--%>
            <td>
                <%= m.Year%>
            </td>
            <td>
                <a href="ViewCourses?MID=<%= m.MID%>&year=<% = m.Year %>&type=<% = m.Type %>" target="_blank">
                    <%= m.Minutes.ToString("0.#") %>
                    分钟 </a>
            </td>
            <td>
                <%= m.Score %>
            </td>
            <td><%=m.RegionCode %></td>
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
            //var d = new Date();
            if (d.getFullYear() > 1000) {
                month = d.getMonth() + 1;
                r = d.getFullYear() + "-" + month + "-" + d.getDate();
            }
            return r;
        }
        // 2013-10-19 11:56:54
        String.prototype.toCustomTime = function () {
            var r;
            var d = eval("new " + this.replace(/\//g, ""));
            //var d = new Date();
            if (d.getFullYear() > 1000) {
                month = d.getMonth() + 1;
                r = d.getFullYear() + "-" + month + "-" + d.getDate() + " " + d.getHours() + ":" + d.getMinutes() + ":" + d.getSeconds();
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
            //  data = { "Type": -1, "Years": null, "MaxMinutes": 0, "MinMinutes": 0, "Score": -1, "Status": -1, "IID": -1, "RegMinDate": "\/Date(1371398400000)\/", "RegMaxDate": "\/Date(1371398400000)\/", "GrMinDate": "\/Date(-62135596800000)\/", "GrMaxDate": "\/Date(-62135596800000)\/", "QueryFlag": 1 };
            if (data.QueryFlag == 1) {
                $("#Type").val(data.Type);

                $("#Minutes").val(data.Minutes);

                $("#Status").val(data.Status);
                $("#IID").val(data.IID);
                $("#IID").val(data.IID);

                $("#MaxMinutes").val(data.MaxMinutes);
                $("#MinMinutes").val(data.MinMinutes);

                if (data.Years != null && data.Years != "") {
                    $("#Years").val(data.Years.split(","));
                } else {
                    $("#Years").val(-1);
                }


                if (data.RegionCodes != null && data.RegionCodes != "") {
                    $("#RegionCodes").val(data.RegionCodes.split(","));
                } else {
                    $("#RegionCodes").val(-1);
                }


                $("#RegMinDate").val(data.RegMinDate.toCustomDate());
                $("#RegMaxDate").val(data.RegMaxDate.toCustomDate());
                
                $("#GrMinDate").val(data.GrMinDate.toCustomTime());
                $("#GrMaxDate").val(data.GrMaxDate.toCustomTime());


                $("#MinScore").val(data.MinScore);
                $("#MaxScore").val(data.MaxScore);

            }

        };

        function ResetSearchForm() {
            var data = { "Type": -1, "Years": null, RegionCodes: null, "MaxMinutes": 0, "MinMinutes": 0, "MinScore": 0, "MaxScore": 0, "Status": -1, "IID": -1, "RegMinDate": "\/Date(-62135596800000)\/", "RegMaxDate": "\/Date(-62135596800000)\/", "GrMinDate": "\/Date(-62135596800000)\/", "GrMaxDate": "\/Date(-62135596800000)\/", "QueryFlag": 1 };
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
