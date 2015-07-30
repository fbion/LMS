<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%
        var Balance = (com.hooyes.lms.Model.Balance)ViewData["Balance"];
        var MyCards = (List<com.hooyes.lms.Model.MyCards>)ViewData["MyCards"];
        var Transactions = (List<com.hooyes.lms.Model.Transactions>)ViewData["Transactions"];
    %>
    <div id="main" class="event-cl">
        <div id="left">
            <div class="login">
                <% Html.RenderPartial("LogOnUserControl"); %>
            </div>
            <div class="expl">
                <div class="hotline">
                </div>
            </div>
        </div>
        <div id="right">
            <div class="blance-sum">
                <ul>
                    <li><strong>可用余额</strong></li>
                    <li>￥<span id="orderamout" class="amount"><%=Math.Round(Balance.Amount, 2)%></span></li>
                    <li class="topup-li"><a href="Topup" class="topup-link"><strong>充值</strong></a></li>
                </ul>
            </div>
            <div class="blance-detail">
                <div class="t">充值卡</div>
                <div class="l">
                    <table id="MyCardsTB" class="commontb paymenttb paymenttb" style="width: 100%">
                        <tr>
                            <td>卡号</td>
                            <td>面值 （元）</td>
                            <td>余额 （元）</td>
                            <td>有效期</td>
                        </tr>
                        <%foreach (var card in MyCards)
                          { %>
                        <tr>
                            <td><%=card.SN %></td>
                            <td><%=Math.Round(card.Amount,2) %> </td>
                            <td><%=Math.Round(card.Surplus,2) %></td>
                            <td><%=card.ExpDate.ToString("yyyy年MM月dd日") %></td>
                        </tr>
                        <%} %>
                    </table>
                </div>
            </div>
            <div class="blance-detail">
                <div class="t">交易明细</div>
                <div class="l">
                    <table id="Table1" class="commontb paymenttb paymenttb" style="width: 100%">
                        <tr>
                            <td>交易金额</td>
                            <td>类型</td>
                            <td>时间</td>
                        </tr>
                        <%foreach (var data in Transactions)
                          {
                              var CateString = "其它";
                              switch (data.Cate)
                              {
                                  case 1:
                                      CateString = "充值卡充值";
                                      break;
                                  case 101:
                                      CateString = "消费";
                                      break;
                                  default:
                                      break;
                              }
                          %>
                        <tr>
                            <td><%=Math.Round(data.Amount,2) %> </td>
                            <td><%=CateString %></td>
                            <td><%=data.CreateDate.ToString("yyyy年MM月dd日 HH:mm") %></td>
                        </tr>
                        <%} %>
                    </table>
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>

</asp:Content>
