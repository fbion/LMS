<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<com.hooyes.lms.Client>" %>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="main">
        <div id="left">
            <div class="login">
                <% Html.RenderPartial("LogOnUserControl"); %>
            </div>
            <div class="expl">
                <div class="icons icons-info">
                </div>
                <h3>网络培训相关说明</h3>
                <div class="con">
                    <p>
                        根据《中华人民共和国会计法》、《会计人员继续教育规定》的要求， 安徽省会计人员继续教育采取网上学习，请登录网校系统进行学习。
                    </p>
                    <p>
                        1、根据安徽省财政厅的相关规定，持有安徽省各级会计管理机构颁发的会计从业资格证书的会计人员，参加了网上继续教育并考试合格15个工作日后，均可凭"安徽省会计人员网上继续教育合格证书"到发证机关办理继续教育登记。
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
                    经安徽省会计人员继续教育主管部门审查同意，安徽省会计人员远程继续教育由北京国家会计学院承办。
                </p>
                <p>
                    依据中华人民共和国财政部《会计人员继续教育规定》以及安徽省财政厅的相关规定，会计人员每年须参加继续教育时长24学时，合计1080分钟。 
                </p>
                <p>
                    学员登录网校缴费后，可自主选择本人需要学习的课程，网校课件自动记录学习时间，按规定至少累计学满24学时。
                    <br />
                    考试合格，相关继续教育信息自动登记到从业资格档案中。学员可登陆安徽省会计人员继续教育系统查询教育登记情况，如果查询结果不符，请与网校联系。
                </p>
                <p>
                    学员需先登录安徽省会计人员网络继续教育系统，网上报名成功后，方可登录学习。 
                    <br />
                    <a href="http://218.22.1.72/ahkj/portal/self_center/webEduLog/" target="_blank">进入安徽省会计人员网络继续教育报名系统</a>
                </p>

            </div>
            <div class="flow">
                <h3>学习流程</h3>
                <div class="step step-1">
                    <div class="text">登录缴费</div>
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
                    <div class="text">学满课时</div>
                </div>
                <div class="arrow"></div>
                <div class="step step-5">
                    <div class="text">学习确认</div>
                </div>
                <div class="step call">
                </div>
            </div>
            <!-- 历年课表 Begin-->
            <div class="lesson">
                 <div class="lesson2013">
                    <div class="icons icons-star">
                    </div>
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
                            </tbody>
                        </table>
                     </div>

                <div class="lesson2013">
                    <div class="icons icons-star">
                    </div>
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
                                </td>
                                <td>29.0
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>

            </div>
            <!-- 历年课表 End-->
            <div class="clear">
            </div>
        </div>
</asp:Content>
