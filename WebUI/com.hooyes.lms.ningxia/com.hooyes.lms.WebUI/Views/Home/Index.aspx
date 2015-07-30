<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<com.hooyes.lms.Client>" %>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="main">
        <div id="left">
            <div class="login">
                <% Html.RenderPartial("LogOnUserControl"); %>
            </div>
            <div class="expl">
                <h3>网络培训相关说明</h3>
                <div class="con">
                   <%-- <p style="margin:5px 0 5px 0;font-weight:bold">
                        学员可以使用本网站网上银行支付学习费用，也可以购买学习卡。<br />
                        宁夏学习卡购买地址，<a style="color:blue" href="/static/buy-card-addr.doc" target="_blank"> 点击这里。 </a>
                    </p>--%>
                    <p>
                        根据《中华人民共和国会计法》、《会计人员继续教育规定》的要求， 宁夏会计人员继续教育采取网上学习，请登录网校系统进行学习。
                    </p>
                    <p>
                        1、根据宁夏财政厅的相关规定，持有宁夏各级会计管理机构颁发的会计从业资格证书的会计人员，参加了网上继续教育并考试合格后，均可凭"宁夏会计人员网上继续教育合格证书"到发证机关办理继续教育登记。
                    </p>
                    <p>2、由于计算机浏览器、Flash等软件的版本差异，在学习完后如点击视频课件中的“退出”按钮无法正常退出，可以直接关闭该视频页面，此操作将不会影响您的学习时长累计。</p>
                    <p>
                        3、本系统的计时状态可能不会实时更新，但不影响系统后台的计时。

                    </p>

                    <div class="line">
                    </div>

                </div>
            </div>
        </div>
        <div id="right">
            <div class="board">
                <p>
                    <span style="color: red; font-weight: bold; font-size: 12px;">通知：宁夏会计人员2015年网上继续教育已开通，欢迎会计人员报名学习。
                       <br /> 如以往年度已经注册过，请勿再行注册，直接使用身份证号码和姓名登录开始新年度的学习即可。
                    </span>
                </p>
                <p>
                    经宁夏会计人员继续教育主管部门审查同意，宁夏会计人员远程继续教育由北京国家会计学院承办。
                </p>
                <p>
                    宁夏学员请先注册，填写个人信息，填写完毕后使用身份证号码（第二代身份证18位制号码）和姓名登录学习。 请学员如实填写个人信息，由于填写错误导致无法通过年检，责任自负。
                </p>
                <p>
                    依据中华人民共和国财政部《会计人员继续教育规定》以及宁夏财政厅的相关规定，会计人员每年须参加继续教育时长24学时，合计1080分钟。 课程任选，学满1080分钟即可参加考试，考试次数不限，通过为止。
</p><p>         
<br />学员可以使用本网站网上银行支付学习费用，也可以购买学习卡。学习卡购买地址：
<br />1、银川市：宁夏华新科技培训中心（宁夏银川市上海东路52号（民族运动员村南门对面，宁夏血液中心向西200米））。24小时咨询热线：0951-5020166，18995020166。 
<br />2、吴忠市：吴忠市开元大道239号（国税局对面）。24小时咨询热线：0953-2056667，13289535888，13289535999。 
<br />3、大武口区：大武口区裕民南路37-4号（市政广场对面，地税局侧面）。24小时咨询热线：0952-3936664，13895361906，13099560991。
<br /> 注：其它地市请在当地会计主管部门购买。
                </p>
            </div>
            <div class="flow">
                <h3>学习流程</h3>
                <div class="step step-1">
                    <div class="text">注册登录缴费</div>
                </div>
                <div class="arrow"></div>
                <div class="step step-2">
                    <div class="text">网上学习</div>
                </div>
                <div class="arrow"></div>
                <div class="step step-3">
                    <div class="text">网上考试</div>
                </div>
                <div class="arrow"></div>
                <div class="step step-4">
                    <div class="text">打印证书</div>
                </div>
                <div class="arrow"></div>
                <div class="step step-5">
                    <div class="text">持证办理</div>
                </div>
                <div class="step call">
                </div>
            </div>
            <!-- 历年课表 Begin-->
            <div class="lesson">
                <div class="lesson2015">
                    <h3>2015继续教育课表</h3>
                    <table>
                        <tbody><tr>

                            <th>课程名称
                            </th>
                            <th>主讲老师
                            </th>
                            <th>课时
                            </th>
                        </tr>
                        <!-- All -->
                        
                        <tr>

                            <td class="t_a_l">
                                管理会计系列讲座第一讲
                            </td>
                            <td>
                                楼继伟
                            </td>
                            <td>
                                2.0
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                大数据、云计算对审计的挑战与对策
                            </td>
                            <td>
                                秦荣生
                            </td>
                            <td>
                                3.0
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                现代内部审计的新思维与新发展
                            </td>
                            <td>
                                秦荣生
                            </td>
                            <td>
                                4.5
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                企业内部控制流程梳理与风险识别
                            </td>
                            <td>
                                张依林
                            </td>
                            <td>
                                7.5
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                信息化环境下审计方式的创新与实践
                            </td>
                            <td>
                                刘汝焯
                            </td>
                            <td>
                                4.0
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                税收政策与纳税实务
                            </td>
                            <td>
                                高允斌
                            </td>
                            <td>
                                7.5
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                会计准则30号、37号变化讲解
                            </td>
                            <td>
                                王志成
                            </td>
                            <td>
                                3.0
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                企业激励机制设计与实践
                            </td>
                            <td>
                                刘兵
                            </td>
                            <td>
                                4.0
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                战略绩效管理工具：平衡计分卡
                            </td>
                            <td>
                                贺颖奇
                            </td>
                            <td>
                                7.5
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                事业单位会计处理实务
                            </td>
                            <td>
                                王芳
                            </td>
                            <td>
                                3.0
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                政府采购法
                            </td>
                            <td>
                                陈少强
                            </td>
                            <td>
                                4.5
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                预算法
                            </td>
                            <td>
                                马蔡琛
                            </td>
                            <td>
                                4.5
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                行政单位会计处理实务
                            </td>
                            <td>
                                王芳
                            </td>
                            <td>
                                2.5
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                企业会计准则解释1-6号
                            </td>
                            <td>
                                林芳
                            </td>
                            <td>
                                8.0
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                预算会计之新事业单位会计制度相关问题
                            </td>
                            <td>
                                赵欣
                            </td>
                            <td>
                                4.0
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                住房公积金会计核算办法
                            </td>
                            <td>
                                张超
                            </td>
                            <td>
                                2.0
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                营改增的背景内容及影响对策
                            </td>
                            <td>
                                王冬生
                            </td>
                            <td>
                                3.5
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                企业集团资金管理
                            </td>
                            <td>
                                吕洪涵
                            </td>
                            <td>
                                3.0
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                行政事业单位层面内部控制建设
                            </td>
                            <td>
                                方周文
                            </td>
                            <td>
                                3.5
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                行政事业单位内部控制评价
                            </td>
                            <td>
                                唐庆艳
                            </td>
                            <td>
                                2.5
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                审计准则问题解答1-6号
                            </td>
                            <td>
                                李晓慧
                            </td>
                            <td>
                                5.5
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                报表分析：价值和信用视角
                            </td>
                            <td>
                                鲁桂华
                            </td>
                            <td>
                                7.5
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                企业改制重组及上市辅导培训
                            </td>
                            <td>
                                殷世江
                            </td>
                            <td>
                                6.5
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                IPO审计的特殊考虑
                            </td>
                            <td>
                                肖菲
                            </td>
                            <td>
                                11.0
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                科学事业单位会计制度讲解
                            </td>
                            <td>
                                杨辉
                            </td>
                            <td>
                                3.5
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                中小学会计制度讲解
                            </td>
                            <td>
                                聂兴凯
                            </td>
                            <td>
                                6.0
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                政府与社会资本合作提供公共产品（PPP）研究
                            </td>
                            <td>
                                王朝才
                            </td>
                            <td>
                                3.5
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                语言表达艺术
                            </td>
                            <td>
                                王煜
                            </td>
                            <td>
                                3.5
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                建筑业营改增前期安排
                            </td>
                            <td>
                                陈志坚
                            </td>
                            <td>
                                4.0
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                企业会计准则33号——合并财务报表
                            </td>
                            <td>
                                高志谦
                            </td>
                            <td>
                                6.5
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                IPO否决原因与审核要点 
                            </td>
                            <td>
                                殷世江
                            </td>
                            <td>
                                6.5
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                行政事业单位运行经费管理与控制
                            </td>
                            <td>
                                马洪范
                            </td>
                            <td>
                                4.0
                            </td>
                        </tr>
                        
                        <tr>

                            <td class="t_a_l">
                                行政事业单位资金使用的绩效与评价
                            </td>
                            <td>
                                马洪范
                            </td>
                            <td>
                                4.0
                            </td>
                        </tr>
                        
                    </tbody></table>
                </div>
                <div class="lesson2014">
                    <h3>2014继续教育课表</h3>
                    <table>
                        <tbody>
                            <tr>

                                <th>课程名称
                                </th>
                                <th>主讲老师
                                </th>
                                <th>课时
                                </th>
                            </tr>
                            <!-- All -->

                            <tr>

                                <td class="t_a_l">会计实务操作
                                </td>
                                <td>陈梅兰
                                </td>
                                <td>16.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">出纳实务操作
                                </td>
                                <td>陈梅兰
                                </td>
                                <td>11.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">政府采购法
                                </td>
                                <td>陈少强
                                </td>
                                <td>4.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">合同法政策解读
                                </td>
                                <td>陈志武
                                </td>
                                <td>5.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">中国宏观经济运行与宏观调控政策体系
                                </td>
                                <td>范剑平
                                </td>
                                <td>6.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">公务卡制度改革与实务
                                </td>
                                <td>冯源
                                </td>
                                <td>3.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">企业内部控制操作实务
                                </td>
                                <td>李春瑜
                                </td>
                                <td>5.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">衍生工具基础产品与产品案例
                                </td>
                                <td>李杰
                                </td>
                                <td>4.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">企业内部控制审计
                                </td>
                                <td>李杰
                                </td>
                                <td>4.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">十八大报告解读讲座
                                </td>
                                <td>李民
                                </td>
                                <td>3.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">会计秘书服务的业务拓展及其风险控制
                                </td>
                                <td>李晓慧
                                </td>
                                <td>4.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">最新税收政策解读
                                </td>
                                <td>李旭红
                                </td>
                                <td>8.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">企业会计准则解释1-6号
                                </td>
                                <td>林芳
                                </td>
                                <td>8.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">解读《财政支出绩效评价管理暂行办法》
                                </td>
                                <td>刘文军
                                </td>
                                <td>4.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">预算法
                                </td>
                                <td>马蔡琛
                                </td>
                                <td>4.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">会计从业资格管理办法
                                </td>
                                <td>马雯
                                </td>
                                <td>4.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">衍生金融工具的会计处理
                                </td>
                                <td>孟祥军
                                </td>
                                <td>4.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">excel在财务中的应用
                                </td>
                                <td>潘晓波
                                </td>
                                <td>4.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">行政单位会计处理实务
                                </td>
                                <td>王芳
                                </td>
                                <td>2.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">事业单位会计处理实务
                                </td>
                                <td>王芳
                                </td>
                                <td>3.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">《企业产品成本核算制度（试行）》课程
                                </td>
                                <td>王华
                                </td>
                                <td>5.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">企业重组与尽职调查
                                </td>
                                <td>王景江
                                </td>
                                <td>8.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">财务会计人员职业技能框架及职业发展规划
                                </td>
                                <td>谢志华
                                </td>
                                <td>6.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">所得税会计准则与实务
                                </td>
                                <td>于长春
                                </td>
                                <td>6.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">住房公积金会计核算办法
                                </td>
                                <td>张超
                                </td>
                                <td>2.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">工会会计制度
                                </td>
                                <td>张琦
                                </td>
                                <td>3.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">民间非营利组织会计制度
                                </td>
                                <td>张琦
                                </td>
                                <td>3.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">国际内部审计实务标杆案例
                                </td>
                                <td>张庆龙
                                </td>
                                <td>3.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">国库集中支付制度
                                </td>
                                <td>张洋
                                </td>
                                <td>3.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">企业财务管理经验谈
                                </td>
                                <td>邹志英
                                </td>
                                <td>4.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">小企业会计准则的新变化及其与税法的趋同
                                </td>
                                <td>陈敏
                                </td>
                                <td>4.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">提升企业领导力
                                </td>
                                <td>郭莹
                                </td>
                                <td>7.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">儒释道与企业管理
                                </td>
                                <td>李海彬
                                </td>
                                <td>5.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">全民中医养生教育
                                </td>
                                <td>尹志超
                                </td>
                                <td>3.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">《小企业会计准则》课程包
                                </td>
                                <td>财政部小企业会计制度授课组
                                </td>
                                <td>18.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">医院成本核算与财务分析
                                </td>
                                <td>程薇
                                </td>
                                <td>5.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">《医院会计制度》实务讲解与新旧会计制度衔接
                                </td>
                                <td>樊俊芝 刘辉
                                </td>
                                <td>7.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">基层医疗卫生机构财务制度要点与难点
                                </td>
                                <td>应亚珍
                                </td>
                                <td>4.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">新型农村合作医疗基金会计制度新解
                                </td>
                                <td>应亚珍
                                </td>
                                <td>2.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">新型农村合作医疗基金财务制度新解
                                </td>
                                <td>应亚珍
                                </td>
                                <td>3.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">最新事业单位会计准则讲解（2012版）
                                </td>
                                <td>常丽
                                </td>
                                <td>4.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">事业单位会计制度讲解（2012版）
                                </td>
                                <td>常丽
                                </td>
                                <td>6.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">基层医疗卫生机构财务制度要点与难点
                                </td>
                                <td>应亚珍
                                </td>
                                <td>4.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">《行政事业单位内部控制基本规范》的出台背景
                                </td>
                                <td>张庆龙 马雯
                                </td>
                                <td>2.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">行政事业单位内部控制风险评估与控制方法
                                </td>
                                <td>张庆龙 马雯
                                </td>
                                <td>6.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">事业单位财务规则讲解(2012版）
                                </td>
                                <td>张新
                                </td>
                                <td>4.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">上市公司年报披露情况及财务信息监管
                                </td>
                                <td>焦晓宁
                                </td>
                                <td>8.0
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>
                <div class="lesson2013">
                    <h3>2013继续教育课表</h3>
                    <table>
                        <tbody>
                            <tr>

                                <th>课程名称
                                </th>
                                <th>主讲老师
                                </th>
                                <th>课时
                                </th>
                            </tr>
                            <!-- All -->

                            <tr>

                                <td class="t_a_l">政府债务危机对我国经济的影响
                                </td>
                                <td>陈少强
                                </td>
                                <td>3.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">宏观经济形式分析暨“十二五”经济规划
                                </td>
                                <td>张鸿翔
                                </td>
                                <td>8.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">国际金融市场及其对我国经济的影响
                                </td>
                                <td>付鹏
                                </td>
                                <td>7.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">我国财政货币政策解读及其发展趋势
                                </td>
                                <td>白景明
                                </td>
                                <td>8.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">会计信息化管理
                                </td>
                                <td>冷冰
                                </td>
                                <td>3.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">会计基础工作规范
                                </td>
                                <td>张岩
                                </td>
                                <td>3.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">预防会计职务犯罪讲解
                                </td>
                                <td>孙娜
                                </td>
                                <td>3.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">事业单位财务规则讲解
                                </td>
                                <td>张新
                                </td>
                                <td>4.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">最新事业单位会计准则讲解（2012版）
                                </td>
                                <td>常丽
                                </td>
                                <td>4.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">事业单位会计制度讲解（2012版）
                                </td>
                                <td>常丽
                                </td>
                                <td>6.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">《行政事业单位内部控制基本规范》的出台背景
                                </td>
                                <td>张庆龙，马雯
                                </td>
                                <td>2.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">行政事业单位内部控制建设
                                </td>
                                <td>张庆龙，马雯
                                </td>
                                <td>7.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">行政事业单位内部控制风险评估与控制方法
                                </td>
                                <td>张庆龙，马雯
                                </td>
                                <td>6.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">小金库治理的政策与实务讲解
                                </td>
                                <td>田振刚
                                </td>
                                <td>5.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">预算的编制及执行
                                </td>
                                <td>李大雨
                                </td>
                                <td>3.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">公共资金的使用绩效及其评价
                                </td>
                                <td>马蔡琛
                                </td>
                                <td>6.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">《医院会计制度》实务讲解与新旧会计制度衔接
                                </td>
                                <td>樊俊芝
刘辉
                                </td>
                                <td>7.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">医院成本核算与财务分析
                                </td>
                                <td>程薇
                                </td>
                                <td>5.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">基层医疗卫生机构财务制度要点与难点
                                </td>
                                <td>应亚珍
                                </td>
                                <td>4.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">新型农村合作医疗基金会计制度新解
                                </td>
                                <td>应亚珍
                                </td>
                                <td>2.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">新型农村合作医疗基金财务制度新解
                                </td>
                                <td>应亚珍
                                </td>
                                <td>3.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">农村集体经济组织财务会计制度
                                </td>
                                <td>师高康
                                </td>
                                <td>4.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">农民专业合作社财务会计制度（试行）
                                </td>
                                <td>师高康
                                </td>
                                <td>3.0
                                </td>
                            </tr>



                            <tr>

                                <td class="t_a_l">公允价值运用及其案例分析
                                </td>
                                <td>余海宗
                                </td>
                                <td>10.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">补充规定下长期股权投资准则热点难点解读
                                </td>
                                <td>马永义
                                </td>
                                <td>2.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">补充规定下资产减值准则热点难点解读
                                </td>
                                <td>马永义
                                </td>
                                <td>1.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">《企业合并准则》操作实务与合并报表编制要点
                                </td>
                                <td>马永义
                                </td>
                                <td>2.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">与金融工具相关的准则热点、难点问题解读
                                </td>
                                <td>马永义
                                </td>
                                <td>20.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">企业合并及合并报表理论与实务
                                </td>
                                <td>焦晓宁
                                </td>
                                <td>10.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">如何阅读财务报告获取有用决策信息
                                </td>
                                <td>马永义
                                </td>
                                <td>7.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">会计准则与所得税差异协调及相关纳税调整
                                </td>
                                <td>于长春
                                </td>
                                <td>20.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">企业税务风险控制点案例分析
                                </td>
                                <td>李旭红
                                </td>
                                <td>8.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">企业内部控制体系的实施与评价
                                </td>
                                <td>王志成
                                </td>
                                <td>7.0
                                </td>
                            </tr>
                            <tr>

                                <td class="t_a_l">《小企业会计准则》课程包
                                </td>
                                <td>财政部小企业会计准则授课组
                                </td>
                                <td>18.0
                                </td>
                            </tr>
                            <tr>

                                <td class="t_a_l">企业内部控制规范体系
                                </td>
                                <td>刘玉廷
刘光忠
王宏
陆建桥
周守华
朱海林
                                </td>
                                <td>29.0
                                </td>
                            </tr>

                            <%-- <tr>

                                <td class="t_a_l">企业会计准则体系解读课程包
                                </td>
                                <td>于长春等
                                </td>
                                <td>38.0
                                </td>
                            </tr>--%>
                        </tbody>
                    </table>
                </div>

            </div>
            <!-- 历年课表 End-->
            <div class="clear">
            </div>
        </div>
</asp:Content>
