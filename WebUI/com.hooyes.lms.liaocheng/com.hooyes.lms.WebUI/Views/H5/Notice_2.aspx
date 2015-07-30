<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/MobileSite.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="Container">
        <div class="head-nav">
            <div onclick="GoPre(1)" class="head-nav-ar"></div>
            <div class="head-nav-t">通知内容</div>
        </div>
        <div class="law-content">
            <p>1、学员登陆成都会计网报名我院网校后，使用身份证号码和姓名直接登录我院网校缴费学习。 缴费成功后，可自主选择本人需学习的课程，网校课件自动记录学习的时间，每门课程学习完毕并考试成功后获得该课程的学分，学满24学分后结业，学员信息将自动传往成都会计网。</p>
            <p>2、相关继续教育信息自动登记到从业资格档案中。学员可登陆成都市会计人员继续教育系统查询教育登记的情况，如果查询结果不符，请与网校联系。</p>
            <p>3、学员需先登陆成都市会计人员网络继续教育系统，网上报名成功后，方可登陆学习。</p>

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
