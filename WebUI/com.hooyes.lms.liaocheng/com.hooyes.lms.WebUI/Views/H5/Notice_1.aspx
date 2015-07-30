<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MobileSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="Container">
        <div class="head-nav">
            <div onclick="GoPre(1)" class="head-nav-ar"></div>
            <div class="head-nav-t">通知内容</div>
        </div>
        <div class="law-content">
            <p>根据《中华人民共和国会计法》、《会计人员继续教育规定》的要求， 2015年度我省会计人员继续教育采取网上学习，培训内容分为：</p>
            <p>（一）必学内容（12学分）</p>
            <p>1、企业单位会计人员</p>
            <p>（1）企业会计信息化工作规范</p>
            <p>（2）管理会计</p>
            <p>2、行政事业单位会计人员</p>
            <p>（1）新预算法</p>
            <p>（2）管理会计</p>
            <p>（二）选学内容（12学分）</p>
            <p>
                会计人员完成上述必学内容后，可根据需要从网校提供的其他相关课程中选学，每个参加继续教育学习的会计人员，当年所学的必学内容与选学内容须达到24个学分。 学员需完成12学分必学内容，再任选完成 12学分选学内容后，最后考试合格（60分），才能确定完成2015年度教育学习任务。
继续教育学习周期为每年1月1日至12月31日，凡在当年学习周期内没有完成规定学分的，须在下一年度进行补课，补课内容为网校提供的相应年度必学及选学课程。
            </p>

        </div>
    </div>
    <script type="text/javascript" src="http://static.nai.hooyes.com/scripts/jsb/jsb.js"></script>
    <script>
        function GoLink(id, title) {
            jsb.require('nextPage', { 'CID': id, 'Title': title }, function (response) {

            });
        }
        function GoPre(id) {
            jsb.require('prePage', { 'text': id }, function (response) {

            });
        }
    </script>
</asp:Content>
