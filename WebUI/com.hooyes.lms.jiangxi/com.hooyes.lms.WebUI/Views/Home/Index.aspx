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
                    <p>
                        2、由于计算机浏览器、Flash等软件的版本差异，在学习完后如点击视频课件中的“退出”按钮无法正常退出，可以直接关闭该视频页面，此操作将不会影响您的学习时长累计。</p>
                    <p>
                        3、本系统的计时状态可能不会实时更新，但不影响系统后台的计时。

                    </p>
                    <p>
                        4、教材的递送需要学员拨打400免费客服电话确定您的邮寄地址。
                    </p>
                    <p>
                        5、如学员在登录过程中出现“身份证号码和姓名不匹配”或“验证失败”等提示，请拨打400-063-0318。
                    </p>

                    <div class="line">
                    </div>

                </div>
            </div>
        </div>
        <div id="right">
            <div class="board">
                <p>
                    <span style="color: red; font-weight: bold; font-size: 12px;">通知：北京国家会计学院2014年度江西省会计人员远程继续教育已正式开通，欢迎会计人员报名学习。
                    </span>
                </p>
                <p>
                    经江西省会计人员继续教育主管部门审查同意，江西省会计人员远程继续教育由北京国家会计学院承办。江西学员可通过身份证号码（第二代身份证18位制号码）和姓名直接登录学习。
                </p>
                <p>
                    依据中华人民共和国财政部《会计人员继续教育规定》以及江西省财政厅的相关规定，会计人员每年须参加继续教育时长24学时，合计1080分钟。课程任选，学满1080分钟即可参加考试，考试次数不限，通过为止。按照江西省财政厅的规定，北京国家会计学院在每月的15日和30日（非工作日顺延）将结业数据传给江西，在1-2个工作日内，学员就可在江西各级会计人员管理机构查询到参加继续教育的相关信息。

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

                                <td class="t_a_l">中国宏观经济形势分析
                                </td>
                                <td>范剑平
                                </td>
                                <td>5.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">企业会计准则第30号——财务报表列报
                                </td>
                                <td>于长春
                                </td>
                                <td>2.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">企业会计准则第39号——公充价值计量
                                </td>
                                <td>赵小鹿
                                </td>
                                <td>3.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">企业会计准则第9号——职工薪酬
                                </td>
                                <td>赵小鹿
                                </td>
                                <td>2.0
                                </td>
                            </tr>



                            <tr>

                                <td class="t_a_l">企业会计准则第33号---合并财务报表
                                </td>
                                <td>-
                                </td>
                                <td>-
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">企业会计准则第40号---合营安排
                                </td>
                                <td>赵欣
                                </td>
                                <td>2.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">企业会计准则第41号---在其他主体中权益的披露
                                </td>
                                <td>赵欣
                                </td>
                                <td>2.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">企业会计准则第2号---长期股权投资
                                </td>
                                <td>高志谦
                                </td>
                                <td>4.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">企业所得税政策解读
                                </td>
                                <td>于长春
                                </td>
                                <td>6.5
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

                                <td class="t_a_l">科学事业单位会计制度讲解
                                </td>
                                <td>杨辉
                                </td>
                                <td>3.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">中小学校会计制度讲解
                                </td>
                                <td>聂兴凯
                                </td>
                                <td>4.0
                                </td>
                            </tr>


                            <tr>

                                <td class="t_a_l">高等学校会计制度讲解
                                </td>
                                <td>杨松令
                                </td>
                                <td>6.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">医院财务制度讲解
                                </td>
                                <td>葛旻书
                                </td>
                                <td>4.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">医院会计制度讲解
                                </td>
                                <td>樊俊芝,刘辉
                                </td>
                                <td>7.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">《企业产品成本核算制度（试行）》解读
                                </td>
                                <td>王华
                                </td>
                                <td>5.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">会计人员继续教育相关规定
                                </td>
                                <td>马雯
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

                                <td class="t_a_l">政府采购法
                                </td>
                                <td>陈少强
                                </td>
                                <td>4.5
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

                                <td class="t_a_l">Excel在财务中的应用
                                </td>
                                <td>潘晓波
                                </td>
                                <td>4.0
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">预算会计
                                </td>
                                <td>赵欣
                                </td>
                                <td>4.0
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

                                <td class="t_a_l">营改增的背景、内容、影响、对策
                                </td>
                                <td>王冬生
                                </td>
                                <td>3.5
                                </td>
                            </tr>

                            <tr>

                                <td class="t_a_l">租赁会计
                                </td>
                                <td>栾甫贵
                                </td>
                                <td>4.0
                                </td>
                            </tr>

                        </tbody>
                    </table>
                </div>

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

                            <td class="t_a_l">事业单位会计制度讲解（2012版）
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
