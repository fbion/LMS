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
                    <p>
                        根据《中华人民共和国会计法》、《会计人员继续教育规定》的要求， 江西省会计人员继续教育采取网上学习，请登录网校系统进行学习。
                    </p>
                    <p>
                        1、根据江西省财政厅的相关规定，持有江西省各级会计管理机构颁发的会计从业资格证书的会计人员，参加了网上继续教育并考试合格15个工作日后，均可凭"江西省会计人员网上继续教育合格证书"到发证机关办理继续教育登记。
                    </p>
                    <p>2、由于计算机浏览器、Flash等软件的版本差异，在学习完成后如点击视频课件中的“退出”按钮无法正常退出，可以直接关闭该视频页面，此操作将不会影响您的学习时长累计。</p>
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
                    经江西省会计人员继续教育主管部门审查同意，江西省会计人员远程继续教育由北京国家会计学院承办。江西学员可通过身份证号码（第二代身份证18位制号码）和姓名直接登录学习。
                </p>
                <p>
                    依据中华人民共和国财政部《会计人员继续教育规定》以及江西省财政厅的相关规定，会计人员每年须参加继续教育时长24学时，合计1080分钟。

                </p>
                <p>
                    从2013年9月27日起，北京国家会计学院针对江西省会计人员启用新的远程教育平台，在老平台已缴费且还未完成学习的学员请继续使用老平台学习，其它所有学员请使用本平台。
                   &nbsp;&nbsp;<a href="http://elearning.nai.edu.cn/SmartWeb/DetailG.html?20919" target="_blank">
                       <span style="color: blue">老平台入口</span>

                   </a>
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

                <div class="lesson2013">
                    <h3>2013继续教育课表</h3>
                    <table>
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

                            <td class="t_a_l">会计从业资格管理办法解读
                            </td>
                            <td>马雯
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

                            <td class="t_a_l">事业单位会计制度讲解（（2012版）
                            </td>
                            <td>常丽
                            </td>
                            <td>6.5
                            </td>
                        </tr>

                        <tr>

                            <td class="t_a_l">事业单位财务规则讲解（2012版）
                            </td>
                            <td>张新
                            </td>
                            <td>4.0
                            </td>
                        </tr>

                        <tr>

                            <td class="t_a_l">行政事业单位内部控制风险评估与控制方法
                            </td>
                            <td>张庆龙,马雯
                            </td>
                            <td>6.5
                            </td>
                        </tr>

                        <tr>

                            <td class="t_a_l">“营改增”税制改革及其影响
                            </td>
                            <td>李旭红
                            </td>
                            <td>3.0
                            </td>
                        </tr>

                        <tr>

                            <td class="t_a_l">当前宏观经济形势（2013）
                            </td>
                            <td>刘玲玲
                            </td>
                            <td>4.0
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

                            <td class="t_a_l">所得税会计准则与实务
                            </td>
                            <td>于长春
                            </td>
                            <td>6.5
                            </td>
                        </tr>

                        <tr>

                            <td class="t_a_l">从监管重点看企业上市的核心会计处理问题
                            </td>
                            <td>苏洋
                            </td>
                            <td>3.5
                            </td>
                        </tr>
                        <!--
                        <tr>

                            <td class="t_a_l">儒释道与企业管理
                            </td>
                            <td>李海彬
                            </td>
                            <td>5.0
                            </td>
                        </tr>

                        <tr>

                            <td class="t_a_l">现代企业制度与公司治理
                            </td>
                            <td>文宗瑜
                            </td>
                            <td>7.0
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

                            <td class="t_a_l">小企业会计准则的新变化及其与税法的趋同
                            </td>
                            <td>陈敏
                            </td>
                            <td>4.0
                            </td>
                        </tr>

                        <tr>

                            <td class="t_a_l">最新税收政策解读（2013）
                            </td>
                            <td>李旭红
                            </td>
                            <td>8.0
                            </td>
                        </tr>

                        <tr>

                            <td class="t_a_l">会计建账实务操作系列之一——填制和审核会计凭证
                            </td>
                            <td>陈梅兰
                            </td>
                            <td>3.0
                            </td>
                        </tr>

                        <tr>

                            <td class="t_a_l">会计建账实务操作系列之二——设置和登记账簿
                            </td>
                            <td>陈梅兰
                            </td>
                            <td>3.0
                            </td>
                        </tr>

                        <tr>

                            <td class="t_a_l">会计建账实务操作系列之三——对账与结账
                            </td>
                            <td>陈梅兰
                            </td>
                            <td>2.0
                            </td>
                        </tr>

                        <tr>

                            <td class="t_a_l">出纳实战演练之二——现金业务和银行结算业务
                            </td>
                            <td>陈梅兰
                            </td>
                            <td>5.0
                            </td>
                        </tr>

                        <tr>

                            <td class="t_a_l">出纳实战演练之一——账务处理
                            </td>
                            <td>陈梅兰
                            </td>
                            <td>6.0
                            </td>
                        </tr>

                        <tr>

                            <td class="t_a_l">会计建账实务操作系列之四——编制财务报表
                            </td>
                            <td>陈梅兰
                            </td>
                            <td>2.0
                            </td>
                        </tr>
                        -->
                    </table>
                </div>
                <div class="lesson2012">
                    <h3>2012继续教育课表</h3>
                    <table>
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

                            <td class="t_a_l">可扩展商业报告语言在财务报告中的应用
                            </td>
                            <td>张玉琳
                            </td>
                            <td>3.0
                            </td>
                        </tr>

                        <tr>

                            <td class="t_a_l">宏观调控政策解读
                            </td>
                            <td>张鸿翔
                            </td>
                            <td>7.5
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

                            <td class="t_a_l">小企业会计准则-第二讲
                            </td>
                            <td>王鹏
                            </td>
                            <td>5.5
                            </td>
                        </tr>

                        <tr>

                            <td class="t_a_l">小企业会计准则-第三讲
                            </td>
                            <td>王虹
                            </td>
                            <td>1.0
                            </td>
                        </tr>

                        <tr>

                            <td class="t_a_l">小企业会计准则-第五讲
                            </td>
                            <td>刘丽华
                            </td>
                            <td>2.0
                            </td>
                        </tr>

                        <tr>

                            <td class="t_a_l">小企业会计准则-第六讲
                            </td>
                            <td>刘丽华
                            </td>
                            <td>1.0
                            </td>
                        </tr>

                    </table>
                </div>
                <div class="lesson2011">
                    <h3>2011继续教育课表</h3>
                    <table>
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

                            <td class="t_a_l">企业内部控制标准体系
                            </td>
                            <td>文宗瑜
                            </td>
                            <td>4.0
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

                            <td class="t_a_l">企业战略与财务策略
                            </td>
                            <td>贺颖奇
                            </td>
                            <td>10.0
                            </td>
                        </tr>

                    </table>
                </div>
                <div class="lesson2010">
                    <h3>2010继续教育课表</h3>
                    <table>
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

                            <td class="t_a_l">与金融工具相关的准则热点、难点问题解读
                            </td>
                            <td>马永义
                            </td>
                            <td>20.0
                            </td>
                        </tr>

                        <tr>

                            <td class="t_a_l">所得税准则与会计准则的差异及其处理
                            </td>
                            <td>马永义
                            </td>
                            <td>4.0
                            </td>
                        </tr>

                    </table>
                </div>
                <div class="lesson2009">
                    <h3>2009继续教育课表</h3>
                    <table>
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

                            <td class="t_a_l">金融危机下企业持续经营风险
                            </td>
                            <td>鲁桂华
                            </td>
                            <td>10.0
                            </td>
                        </tr>

                        <tr>

                            <td class="t_a_l">新税法下的企业日常经营的纳税筹划
                            </td>
                            <td>张美中
                            </td>
                            <td>10.0
                            </td>
                        </tr>

                        <tr>

                            <td class="t_a_l">上市公司执行新会计准则的相关问题
                            </td>
                            <td>王昊宇
                            </td>
                            <td>4.0
                            </td>
                        </tr>

                    </table>
                </div>
                <div class="lesson2008">
                    <h3>2008继续教育课表</h3>
                    <table>
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

                            <td class="t_a_l">基建财务会计
                            </td>
                            <td>杨进军
                            </td>
                            <td>4.0
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

                    </table>
                </div>
                <div class="lesson2007">
                    <h3>2007继续教育课表</h3>
                    <table>
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

                            <td class="t_a_l">中国企业所得税改革与新税法解读
                            </td>
                            <td>张天犁
                            </td>
                            <td>10.0
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

                            <td class="t_a_l">财务资源的运用效率和风险
                            </td>
                            <td>汤谷良
                            </td>
                            <td>4.0
                            </td>
                        </tr>

                    </table>
                </div>
                <div class="lesson2006">
                    <h3>2006继续教育课表</h3>
                    <table>
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

                            <td class="t_a_l">新企业所得税法讲解
                            </td>
                            <td>丁芸
                            </td>
                            <td>7.0
                            </td>
                        </tr>

                        <tr>

                            <td class="t_a_l">金融企业财务规则解读 
                            </td>
                            <td>吴文军
                            </td>
                            <td>6.0
                            </td>
                        </tr>

                        <tr>

                            <td class="t_a_l">税法与会计的差异及调整
                            </td>
                            <td>庞金伟
                            </td>
                            <td>7.0
                            </td>
                        </tr>

                        <tr>

                            <td class="t_a_l">母子公司管控体系
                            </td>
                            <td>白万纲
                            </td>
                            <td>5.0
                            </td>
                        </tr>

                    </table>
                </div>
                <div class="lesson2005">
                    <h3>2005继续教育课表</h3>
                    <table>
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

                            <td class="t_a_l">企业财务通则解读
                            </td>
                            <td>赖永添
                            </td>
                            <td>8.0
                            </td>
                        </tr>

                        <tr>

                            <td class="t_a_l">企业会计准则疑难问题研究
                            </td>
                            <td>马永义
                            </td>
                            <td>13.0
                            </td>
                        </tr>

                        <tr>

                            <td class="t_a_l">会计准则中的重要理念及贯彻实施
                            </td>
                            <td>刘玉廷
                            </td>
                            <td>3.0
                            </td>
                        </tr>

                    </table>
                </div>
            </div>
            <!-- 历年课表 End-->
            <div class="clear">
            </div>
        </div>
</asp:Content>
