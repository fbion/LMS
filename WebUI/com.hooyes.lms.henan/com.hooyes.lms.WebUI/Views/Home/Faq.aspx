<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="main">
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
            <div class="board board2 faq-board">
                常见问题
            </div>
            <div class="faq-content">
                <ul class="faq-ul">
                    <li class="t">1、报名序号身份证号都输入，登陆不上提示说报名序号或者身份证号码有误。</li>
                    <li class="text">请确认您的报名序号从第5位开始是“8695”，如果是诸如“4942”之类的，那您是报的另外两家网校，请去另两家试一下。
                        <br />再请确认一下您的身份证号是否填写正确，特别是其中有X的，是一定要大写的。
                        <br />另有部分学员因数据传递问题可能出现此问题，这样的情况我们要上报财厅进行手动处理，这个过程可能要经历几个工作时，请过几天再试。
                    </li>
                    <li class="t">2、验证码为什么不能正常接收</li>
                    <li class="text">请再申请一下或换一个手机号码，如果还不能收到，请给我们客服打电话。
                    </li>
                    <li class="t">3、请问要学习多少课时？</li>
                    <li class="text">一共要学习24课时，总计1080分钟。
                    </li>
                    <li class="t">4、无法正常打开视频课程</li>
                    <li class="text">请用IE浏览器，并在IE的工具栏点“工具”》“Internet选项”》在常规项中“删除临时文件”进行操作一下。
                    </li>
                    <li class="t">5、请问选修课时长是多少</li>
                    <li class="text">一般必修课为8课时，360分钟，选修课为16课时，720分钟，总计1080分钟。
                    </li>
                    <li class="t">6、你好，我想问听多少课时，才能进考试入口</li>
                    <li class="text">一般必修课为8课时，360分钟，学满必修课后就能考试。
                    </li>
                    <li class="t">7、怎样知道学习是否完毕，我已经学了1100分钟了</li>
                    <li class="text">您已经学满1080分钟了，请退出系统，然后重新登陆一下系统，您的结业信息就会传会河南省会计信息管理网，您就可以在那里查到你已完成年度学习。
                    </li>
                    <li class="t">8、每次答题完毕，提示点击左侧目录继续学习，可左侧什么也没有，怎么继续学习呢？</li>
                    <li class="text">浏览器问题，请用IE浏览器。另请以课程章节目录为主。
                    </li>
                    <li class="t">9、你好！我如果考试结束了,申请发票谁支付？</li>
                    <li class="text">我们负责支付。
                    </li>
                    <li class="t">10、我想更改发票单位名称怎么办？</li>
                    <li class="text">我们发的都是定额发票，不影响。 
                    </li>
                </ul>
            </div>
            <div class="clear">
            </div>
        </div>
    </div>
</asp:Content>
