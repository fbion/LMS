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
                        根据《中华人民共和国会计法》、《会计人员继续教育规定》的要求， 2015年度我省会计人员继续教育采取网上学习，培训内容分为：
                    </p>
                    <div class="line">
                    </div>
                    <h4>（一）必学内容 （12学分）</h4>
                    <h5>1、企业单位会计人员</h5>
                    <p>
                        （1）企业会计信息化工作规范
                    </p>
                    <p>
                        （2）管理会计
                    </p>
                   
                    <h5 style="margin-top: 5px;">2、行政事业单位会计人员</h5>
                    <p>
                        （1）新预算法
                    </p>
                    <p>
                        （2）管理会计
                    </p>

                    <div class="line">
                    </div>
                    <h4>（二）选学内容 （12学分）</h4>
                    <p>
                        会计人员在完成上述必学内容后，可根据需要从网校提供的其他相关课程中选学，每个参加继续教育学习的会计人员，当年所学的必学内容与选学内容须达到24个学时（含考试时间）。
                    </p>
                    <p style="font-weight: bold">
                        学员需完成12学分必学内容，再任选完成 12学分选学内容后，最后考试合格（60分），才能确定完成2015年度教育学习任务。
                    </p>
                    <p>
                        继续教育学习周期为每年1月1日至12月31日，凡在当年学习周期内没有完成规定学时学习的，须在下一年度进行补课，补课内容为网校提供的相应年度必学及选学课程。
                    </p>
                </div>
            </div>
        </div>
        <div id="right">
            <div class="board">
                <p>
                    会计人员参加网上学习，系统自动记录学习时间，正式开课后每10分钟网校与学员互动，弹出回答问题窗口，不回答的即停止计时，原计时有效，可以在一个年度内累计。请牢记报名序号及学习网址，二次及以后学习请直接登录本网站进行学习。网上考试合格、学完24学时，稍后可登陆河南省会计信息管理系统查询教育情况，会计从业资格证书上不再签章，如果查询结果不符请与本网校联系。
                </p>
                <p style="color: #020086">
                   <%--  <strong>根据河南省财政厅规定，特通知如下： </strong>
                   <br />
                    1、每年度继续教育学习周期为每年1月1日至12月31日，凡在当年学习周期内没有完成规定学时学习的，须在下一年度进行 补课，补课内容为网校提供的相应补课年度课程及选学课程。
                    <br />
                    2、凡当年度已缴费未完成学时的人员，学习时间延长至下个年度2月底。 下一年度3月1日起，需重新缴费听课。
                    <br />--%>
                    <span><a style="color:blue;font-weight:bold;" target="_blank" href="/html/notice-1.html">关于开展2015年度会计人员继续教育的通知</a></span><br />
                </p>
               <p>
                    <span class="beta">如果学员已缴费还无法正常学习请点击 <a class="t_online_help" href="javascript:void(0)">“在线帮助”</a>，并填写真实信息，客服会尽快给您回复。</span>

               </p>
               <p>
                   <a style="color:blue" href="/Survey" target="_blank">会计人员继续教育培训效果调查</a> <sup style="color:red">New</sup>
               </p>
            </div>
            <div class="flow">
                <h3>学习流程</h3>
                <img src="<% = com.hooyes.lms.C.CDN %>/Img/call.jpg" class="call">
                <img src="<% = com.hooyes.lms.C.CDN %>/Img/registration.jpg"><img src="<% = com.hooyes.lms.C.CDN %>/Img/dao2.gif"
                    class="dao2">
                <img src="<% = com.hooyes.lms.C.CDN %>/Img/learning.jpg"><img src="<% = com.hooyes.lms.C.CDN %>/Img/dao2.gif"
                    class="dao2">
                <img src="<% = com.hooyes.lms.C.CDN %>/Img/Exam.jpg"><img src="<% = com.hooyes.lms.C.CDN %>/Img/dao2.gif"
                    class="dao2">
                <img src="<% = com.hooyes.lms.C.CDN %>/Img/Learning finish.jpg"><img src="<% = com.hooyes.lms.C.CDN %>/Img/dao2.gif"
                    class="dao2">
                <img src="<% = com.hooyes.lms.C.CDN %>/Img/Complete.jpg">
            </div>
            <div class="lesson">
                <div class="lesson2015">
                    <h3>
                        2015 继续教育课表</h3>
                    <table>
                        <tbody><tr>
                            <th colspan="2">
                                类别
                            </th>
                            <th>
                                课程名称
                            </th>
                             <th>
                                课程介绍
                            </th>
                            <th>
                                主讲老师
                            </th>
                            <th>
                                课时
                            </th>
                        </tr>
                        <!-- 行政 -->
                        
                        <tr>
                            
                            <td rowspan="14" class="font_w">
                                行政事业类
                            </td>
                            
                            <td rowspan="2">
                                必修
                            </td>
                            
                            <td class="t_a_l">
                                《财政部关于全面推进管理会计体系建设的指导意见》解读
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                
                            </td>
                            <td>
                                3.5
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                新预算法
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                
                            </td>
                            <td>
                                7.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td rowspan="12">
                                选修
                            </td>
                            
                            <td class="t_a_l">
                                科学事业单位会计制度讲解
                            </td>
                            <td>&nbsp;</td>
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
                            <td>&nbsp;</td>
                            <td>
                                聂兴凯
                            </td>
                            <td>
                                6.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                行政事业单位运行经费管理与控制
                            </td>
                            <td>&nbsp;</td>
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
                            <td>&nbsp;</td>
                            <td>
                                马洪范
                            </td>
                            <td>
                                4.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                政府与社会资本合作提供公共产品（PPP）研究
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                王朝才
                            </td>
                            <td>
                                3.5
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                行政事业单位内部控制建设
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                张庆龙 马雯
                            </td>
                            <td>
                                7.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                行政事业单位国有资产管理
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                陈少强
                            </td>
                            <td>
                                4.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                行政事业单位审计概括与实践
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                张庆龙
                            </td>
                            <td>
                                4.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                医院成本核算与财务分析
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                程薇
                            </td>
                            <td>
                                5.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                Excel在财务中的应用
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                潘晓波
                            </td>
                            <td>
                                4.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                2014年宏观经济讲解
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                范剑平
                            </td>
                            <td>
                                5.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                语言表达艺术
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                王煜
                            </td>
                            <td>
                                3.5
                            </td>
                        </tr>
                        
                        <!-- 企业 -->
                        
                        <tr>
                            
                            <td rowspan="14" class="font_w">
                                企业类
                            </td>
                            
                            <td rowspan="2">
                                必修
                            </td>
                            
                            <td class="t_a_l">
                                《财政部关于全面推进管理会计体系建设的指导意见》解读
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                
                            </td>
                            <td>
                                3.5
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                企业会计信息化工作规范
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                
                            </td>
                            <td>
                                3.5
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td rowspan="12">
                                选修
                            </td>
                            
                            <td class="t_a_l">
                                租赁会计
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                栾甫贵
                            </td>
                            <td>
                                4.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                企业会计准则2号——长期股权投资
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                高志谦
                            </td>
                            <td>
                                4.5
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                企业会计准则9号——职工薪酬
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                赵小鹿
                            </td>
                            <td>
                                2.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                企业会计准则30号——财务报表列报
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                于长春
                            </td>
                            <td>
                                2.4
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                企业会计准则第39号--公允价值计量
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                赵小鹿
                            </td>
                            <td>
                                3.5
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                企业会计准则40号——合营安排
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                赵欣
                            </td>
                            <td>
                                2.5
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                税收政策与纳税实务
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                高允斌
                            </td>
                            <td>
                                7.5
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                企业内部控制流程梳理与风险识别
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                张依林
                            </td>
                            <td>
                                7.5
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                企业集团资金管理
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                吕洪涵
                            </td>
                            <td>
                                3.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                上市前私募股权融资
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                姜军
                            </td>
                            <td>
                                8.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                语言表达艺术
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                王煜
                            </td>
                            <td>
                                3.5
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                2014年宏观经济讲解
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                范剑平
                            </td>
                            <td>
                                5.0
                            </td>
                        </tr>
                        
                    </tbody></table>
                </div>
                <div class="lesson2014">
                    <h3>
                        2014 继续教育课表</h3>
                    <table>
                        <tbody><tr>
                            <th colspan="2">
                                类别
                            </th>
                            <th>
                                课程名称
                            </th>
                            <th>
                                主讲老师
                            </th>
                            <th>
                                课时
                            </th>
                        </tr>
                        <!-- 行政 -->
                        
                        <tr>
                            
                            <td rowspan="16" class="font_w">
                                行政事业类
                            </td>
                            
                            <td rowspan="4">
                                必修
                            </td>
                            
                            <td class="t_a_l">
                                行政事业单位内部控制设计
                            </td>
                            <td>
                                许国艺
                            </td>
                            <td>
                                3.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                行政事业单位内部控制规范（试行）解读
                            </td>
                            <td>
                                余黎峰
                            </td>
                            <td>
                                3.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                事业单位会计制度讲解（2012版）
                            </td>
                            <td>
                                常丽
                            </td>
                            <td>
                                6.5
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                预算的编制及执行
                            </td>
                            <td>
                                李大雨
                            </td>
                            <td>
                                3.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td rowspan="12">
                                选修
                            </td>
                            
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
                                预算会计
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
                                住房公积金会计核算办法
                            </td>
                            <td>
                                张超
                            </td>
                            <td>
                                4.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                农村集体经济组织财务会计制度
                            </td>
                            <td>
                                师高康
                            </td>
                            <td>
                                4.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                农民专业合作社财务会计制度（试行）
                            </td>
                            <td>
                                师高康
                            </td>
                            <td>
                                3.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                会计基础工作规范
                            </td>
                            <td>
                                张岩
                            </td>
                            <td>
                                3.5
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                《中华人民共和国会计法》最新政策解读
                            </td>
                            <td>
                                杨辉
                            </td>
                            <td>
                                4.0
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
                                中国宏观经济运行与宏观调控政策体系
                            </td>
                            <td>
                                范剑平
                            </td>
                            <td>
                                8.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                excel在财务中的应用
                            </td>
                            <td>
                                潘晓波
                            </td>
                            <td>
                                4.0
                            </td>
                        </tr>
                        
                        <!-- 企业 -->
                        
                        <tr>
                            
                            <td rowspan="14" class="font_w">
                                企业类
                            </td>
                            
                            <td rowspan="3">
                                必修
                            </td>
                            
                            <td class="t_a_l">
                                企业内部控制操作实务
                            </td>
                            <td>
                                李春瑜
                            </td>
                            <td>
                                5.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                最新税收政策解读
                            </td>
                            <td>
                                李旭红
                            </td>
                            <td>
                                8.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                《企业产品成本核算制度（试行）》讲解
                            </td>
                            <td>
                                王华
                            </td>
                            <td>
                                4.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td rowspan="11">
                                选修
                            </td>
                            
                            <td class="t_a_l">
                                会计实操
                            </td>
                            <td>
                                陈梅兰
                            </td>
                            <td>
                                14.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                出纳实操
                            </td>
                            <td>
                                陈梅兰
                            </td>
                            <td>
                                13.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                企业纳税筹划方法与实务
                            </td>
                            <td>
                                 王震
                            </td>
                            <td>
                                9.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                财务报表阅读－外部审计角度舞弊分析
                            </td>
                            <td>
                                邱连强
                            </td>
                            <td>
                                4.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                会计信息化管理
                            </td>
                            <td>
                                冷冰
                            </td>
                            <td>
                                3.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                会计基础工作规范
                            </td>
                            <td>
                                张岩
                            </td>
                            <td>
                                3.5
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                《中华人民共和国会计法》最新政策解读
                            </td>
                            <td>
                                杨辉
                            </td>
                            <td>
                                4.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                合同法政策解读
                            </td>
                            <td>
                                陈志武
                            </td>
                            <td>
                                5.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                中国宏观经济运行与宏观调控政策体系
                            </td>
                            <td>
                                范剑平
                            </td>
                            <td>
                                8.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                excel在财务中的应用
                            </td>
                            <td>
                                潘晓波
                            </td>
                            <td>
                                4.0
                            </td>
                        </tr>
                        
                        <tr>
                            
                            <td class="t_a_l">
                                企业财务管理经验谈
                            </td>
                            <td>
                                邹志英
                            </td>
                            <td>
                                4.0
                            </td>
                        </tr>
                        
                    </tbody></table>
                </div>
                <div class="lesson2013">
                    <h3>2013 继续教育课表</h3>
                    <table>
                        <tr>
                            <th colspan="2">类别
                            </th>
                            <th colspan="2">课程名称
                            </th>
                            <th>课程介绍
                            </th>
                            <th>主讲老师
                            </th>
                            <th>课时
                            </th>
                        </tr>
                        <!-- 行政 -->
                        <tr>
                            <td rowspan="17" class="font_w">行政事业类
                            </td>
                            <td rowspan="3" style="width: 80px">部分事业单位必学
                            </td>
                            <td class="t_a_l" style="width: 150px">事业单位会计准则
                            </td>
                            <td class="t_a_l" rowspan="3" style="width: 160px">注：参照公务员法管理和纳入 企业财务管理体系的事业单位 会计人员不需要学习此课程
                            </td>
                            <td>&nbsp;
                            </td>
                            <td style="">常丽
                            </td>
                            <td>4.0
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l">公务卡改革政策与实务
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>冯源
                            </td>
                            <td>4.0
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l">国库集中支付制度
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>张洋
                            </td>
                            <td>4.0
                            </td>
                        </tr>
                        <!-- -->
                        <tr>
                            <td rowspan="2" style="width: 80px">行政及其他事业单位必学
                            </td>
                            <td class="t_a_l" colspan="2">公务卡改革政策与实务
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>冯源&nbsp;
                            </td>
                            <td>4.0
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">国库集中支付制度
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>张洋&nbsp;
                            </td>
                            <td>4.0
                            </td>
                        </tr>
                        <tr>
                            <td rowspan="12">选修
                            </td>
                            <td class="t_a_l" colspan="2">高校会计制度详解与实务
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>杨松令</td>
                            <td>7.0
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">医院财务管理实务
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>周瑞
                            </td>
                            <td>4.0
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">新型农村合作医疗基金财务制度
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>应亚珍
                            </td>
                            <td>3.0
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">工会会计制度
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>会院
                            </td>
                            <td>3.0
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">民间非营利组织会计制度
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>会院
                            </td>
                            <td>3.0
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">农村集体经济组织财务会计制度
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>师高康
                            </td>
                            <td>4.0
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">基层医疗卫生机构财务制度
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>应亚珍
                            </td>
                            <td>4.0
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">全民中医养生教育
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>尹志超
                            </td>
                            <td>3.5
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">会计基础工作规范
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>张岩
                            </td>
                            <td>4.0
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">基建财务会计讲座
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>杨建军
                            </td>
                            <td>4.0
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">事业单位会计制度详解
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>会院
                            </td>
                            <td>2.5
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">行政单位会计制度
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>会院
                            </td>
                            <td>3.0
                            </td>
                        </tr>
                        <!-- 企业 -->
                        <tr>
                            <td rowspan="22" class="font_w">企业类
                            </td>
                            <td rowspan="2">必修
                            </td>
                            <td class="t_a_l" colspan="2">最新税收及会计政策解读
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>李旭红
                            </td>
                            <td>4.0
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">企业内部控制操作实务
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>李春瑜
                            </td>
                            <td>4.0
                            </td>
                        </tr>
                        <tr>
                            <td rowspan="20">选修
                            </td>
                            <td class="t_a_l" colspan="2">小企业会计准则的意义、制定过程、主要内容和执行要求
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>杨敏
                            </td>
                            <td>2.0
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">第一讲 总则和附则
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>王鹏
                            </td>
                            <td>1.0
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">第二讲 资产
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>王鹏
                            </td>
                            <td>5.5
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">第三讲 负 债
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>王虹
                            </td>
                            <td>1.0
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">第四讲 所有者权益
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>王虹
                            </td>
                            <td>0.5
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">第五讲 收入
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>刘丽华
                            </td>
                            <td>2.0
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">第六讲 费用
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>刘丽华
                            </td>
                            <td>0.5
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">第七讲 利润及利润分配
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>刘丽华
                            </td>
                            <td>1.0
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">第八讲 外币业务
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>王虹
                            </td>
                            <td>0.5
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">第九讲 财务报表
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>刘丽华
                            </td>
                            <td>1.5
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">第十讲 纳税调整
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>刘丽华
                            </td>
                            <td>0.5
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">投融资决策与风险管理
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>郜卓
                            </td>
                            <td>6.0
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">《企业会计准则通用分类标准》讲解
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>杨辉
                            </td>
                            <td>3.5
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">合同法讲解
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>陈志武
                            </td>
                            <td>5.0
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">新准则下所得税会计
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>于长春
                            </td>
                            <td>6.5
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">出纳实操
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>陈老师
                            </td>
                            <td>13.0
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">会计实操
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>陈老师
                            </td>
                            <td>14.0
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">企业战略与财务策略
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>贺颖奇
                            </td>
                            <td>7.0
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">全民中医养生教育
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>尹志超
                            </td>
                            <td>3.5
                            </td>
                        </tr>
                        <tr>
                            <td class="t_a_l" colspan="2">会计基础工作规范
                            </td>
                            <td>&nbsp;
                            </td>
                            <td>张岩
                            </td>
                            <td>4.0
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="lesson2012">
                    <h3>2012 继续教育课表</h3>
                    <table>
                        <tbody>
                            <tr>
                                <th colspan="2">类别
                                </th>
                                <th>课程名称
                                </th>
                                <th>课程介绍
                                </th>
                                <th>主讲老师
                                </th>
                                <th>课时
                                </th>
                            </tr>
                            <!-- 行政 -->
                            <tr>
                                <td rowspan="21" class="font_w">行政事业类
                                </td>
                                <td rowspan="2">必修
                                </td>
                                <td class="t_a_l">小金库治理的政策与实务讲解
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/jianjie/k1201001.htm" target="_blank">课程介绍</a>
                                </td>
                                <td>田振刚
                                </td>
                                <td>4.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">会计基础工作规范
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/jianjie/k1201002.htm" target="_blank">课程介绍</a>
                                </td>
                                <td>张岩
                                </td>
                                <td>4.0
                                </td>
                            </tr>
                            <tr>
                                <td rowspan="19">选修
                                </td>
                                <td class="t_a_l">行政事业单位内部控制：从合规走向风险管理
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/jianjie/k1201003.htm" target="_blank">课程介绍</a>
                                </td>
                                <td>张庆龙
                                </td>
                                <td>4.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">我国公共预算约束与透明度
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/jianjie/k1201004.htm" target="_blank">课程介绍</a>
                                </td>
                                <td>马洪范
                                </td>
                                <td>3.5
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">行政单位会计制度
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/jianjie/k1201005.htm" target="_blank">课程介绍</a>
                                </td>
                                <td>张琦
                                </td>
                                <td>3.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">事业单位会计制度详解
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/jianjie/k1201006.htm" target="_blank">课程介绍</a>
                                </td>
                                <td>张琦
                                </td>
                                <td>2.5
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">小企业会计准则的意义、制定过程、主要内容和执行要求
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/demo2/index.html" target="_blank">课程介绍</a>
                                </td>
                                <td>杨敏
                                </td>
                                <td>2.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">第一讲 总则和附则
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/demo2/index.html" target="_blank">课程介绍</a>
                                </td>
                                <td>王鹏
                                </td>
                                <td>1.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">第二讲 资产
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/demo2/index.html" target="_blank">课程介绍</a>
                                </td>
                                <td>王鹏
                                </td>
                                <td>5.5
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">第三讲 负 债
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/demo2/index.html" target="_blank">课程介绍</a>
                                </td>
                                <td>王虹
                                </td>
                                <td>1.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">第四讲 所有者权益
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/demo2/index.html" target="_blank">课程介绍</a>
                                </td>
                                <td>王虹
                                </td>
                                <td>0.5
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">第五讲 收入
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/demo2/index.html" target="_blank">课程介绍</a>
                                </td>
                                <td>刘丽华
                                </td>
                                <td>2.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">第六讲 费用
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/demo2/index.html" target="_blank">课程介绍</a>
                                </td>
                                <td>刘丽华
                                </td>
                                <td>0.5
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">第七讲 利润及利润分配
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/demo2/index.html" target="_blank">课程介绍</a>
                                </td>
                                <td>刘丽华
                                </td>
                                <td>1.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">第八讲 外币业务
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/demo2/index.html" target="_blank">课程介绍</a>
                                </td>
                                <td>王虹
                                </td>
                                <td>0.5
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">第九讲 财务报表
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/demo2/index.html" target="_blank">课程介绍</a>
                                </td>
                                <td>刘丽华
                                </td>
                                <td>1.5
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">第十讲 纳税调整
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/demo2/index.html" target="_blank">课程介绍</a>
                                </td>
                                <td>刘丽华
                                </td>
                                <td>0.5
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">医院财务与经济管理实务
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/jianjie/k1201008.htm" target="_blank">课程介绍</a>
                                </td>
                                <td>周瑞
                                </td>
                                <td>5.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">农村集体经济组织财务会计制度
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/jianjie/k1201009.htm" target="_blank">课程介绍</a>
                                </td>
                                <td>师高康
                                </td>
                                <td>4.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">农民专业合作社财务会计制度（试行）
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/jianjie/k1201010.htm" target="_blank">课程介绍</a>
                                </td>
                                <td>师高康
                                </td>
                                <td>3.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">专业领导综合素质提高
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/jianjie/k1201011.htm" target="_blank">课程介绍</a>
                                </td>
                                <td>郭莹
                                </td>
                                <td>7.0
                                </td>
                            </tr>
                            <!-- 企业 -->
                            <tr>
                                <td rowspan="19" class="font_w">企业类
                                </td>
                                <td rowspan="2">必修
                                </td>
                                <td class="t_a_l">小金库治理的政策与实务讲解
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/jianjie/k1201001.htm" target="_blank">课程介绍</a>
                                </td>
                                <td>田振刚
                                </td>
                                <td>4.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">基于战略的全面预算管理设计与实施
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/jianjie/k1201012.htm" target="_blank">课程介绍</a>
                                </td>
                                <td>王志成
                                </td>
                                <td>4.0
                                </td>
                            </tr>
                            <tr>
                                <td rowspan="17">选修
                                </td>
                                <td class="t_a_l">中央企业经济增加值（EVA）考核体系及其应用
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/jianjie/k1201013.htm" target="_blank">课程介绍</a>
                                </td>
                                <td>白万纲
                                </td>
                                <td>4.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">企业内部控制体系的实施与评价
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/jianjie/k1201014.htm" target="_blank">课程介绍</a>
                                </td>
                                <td>王志成
                                </td>
                                <td>7.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">透过报表分析企业经营行为
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/jianjie/k1201015.htm" target="_blank">课程介绍</a>
                                </td>
                                <td>鲁桂华
                                </td>
                                <td>7.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">可扩展商业语言（XBRL）在财务报告中的使用
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/jianjie/k1201016.htm" target="_blank">课程介绍</a>
                                </td>
                                <td>张玉琳
                                </td>
                                <td>3.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">投融资决策与风险管理
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/jianjie/k1201017.htm" target="_blank">课程介绍</a>
                                </td>
                                <td>郜卓
                                </td>
                                <td>6.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">增值税转型及企业的应对策略
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/jianjie/k1201018.htm" target="_blank">课程介绍</a>
                                </td>
                                <td>高允斌
                                </td>
                                <td>6.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">小企业会计准则的意义、制定过程、主要内容和执行要求
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/demo2/index.html" target="_blank">课程介绍</a>
                                </td>
                                <td>杨敏
                                </td>
                                <td>2.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">第一讲 总则和附则
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/demo2/index.html" target="_blank">课程介绍</a>
                                </td>
                                <td>王鹏
                                </td>
                                <td>1.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">第二讲 资产
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/demo2/index.html" target="_blank">课程介绍</a>
                                </td>
                                <td>王鹏
                                </td>
                                <td>5.5
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">第三讲 负 债
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/demo2/index.html" target="_blank">课程介绍</a>
                                </td>
                                <td>王虹
                                </td>
                                <td>1.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">第四讲 所有者权益
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/demo2/index.html" target="_blank">课程介绍</a>
                                </td>
                                <td>王虹
                                </td>
                                <td>0.5
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">第五讲 收入
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/demo2/index.html" target="_blank">课程介绍</a>
                                </td>
                                <td>刘丽华
                                </td>
                                <td>2.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">第六讲 费用
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/demo2/index.html" target="_blank">课程介绍</a>
                                </td>
                                <td>刘丽华
                                </td>
                                <td>0.5
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">第七讲 利润及利润分配
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/demo2/index.html" target="_blank">课程介绍</a>
                                </td>
                                <td>刘丽华
                                </td>
                                <td>1.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">第八讲 外币业务
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/demo2/index.html" target="_blank">课程介绍</a>
                                </td>
                                <td>王虹
                                </td>
                                <td>0.5
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">第九讲 财务报表
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/demo2/index.html" target="_blank">课程介绍</a>
                                </td>
                                <td>刘丽华
                                </td>
                                <td>1.5
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">第十讲 纳税调整
                                </td>
                                <td>
                                    <a href="http://henan.nai.edu.cn/demo/demo2/index.html" target="_blank">课程介绍</a>
                                </td>
                                <td>刘丽华
                                </td>
                                <td>0.5
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="lesson2011">
                    <h3>2011河南继续教育课表</h3>
                    <table>
                        <tbody>
                            <tr>
                                <th>类别
                                </th>
                                <th>课程名称
                                </th>
                                <th>主讲老师
                                </th>
                                <th>课时
                                </th>
                            </tr>
                            <!-- 行政 -->
                            <tr>
                                <td rowspan="6" class="font_w">行政事业类
                                </td>
                                <td class="t_a_l">行政事业单位会计有关问题
                                </td>
                                <td>冯卫东
                                </td>
                                <td>4.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">企业内部控制标准体系
                                </td>
                                <td>文宗瑜
                                </td>
                                <td>4.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">企业内部控制规范体系之综述
                                </td>
                                <td>刘玉廷
                                </td>
                                <td>4.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">现金流管理
                                </td>
                                <td>孙娜
                                </td>
                                <td>6.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">营业税转型及应对策略
                                </td>
                                <td>高允斌
                                </td>
                                <td>1.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">公允价值运用及其案例分析
                                </td>
                                <td>余海宗
                                </td>
                                <td>5.0
                                </td>
                            </tr>
                            <!-- 企业 -->
                            <tr>
                                <td rowspan="4" class="font_w">企业类
                                </td>
                                <td class="t_a_l">企业所得税法讲解
                                </td>
                                <td>丁芸
                                </td>
                                <td>6.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">企业内部控制规范体系之应用指引第7、8、9、12号及审计指引
                                </td>
                                <td>王宏
                                </td>
                                <td>6.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">企业内部控制规范体系之应用指引第14、15、16、17号
                                </td>
                                <td>陆建桥
                                </td>
                                <td>6.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">企业内部控制规范体系之评价指引及应用指引第1、2、3、4、5、13号
                                </td>
                                <td>朱海林
                                </td>
                                <td>6.0
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="lesson2010">
                    <h3>2010河南继续教育课表</h3>
                    <table>
                        <tbody>
                            <tr>
                                <th style="width: 70%">课程名称
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
                                <td>11.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">企业内部控制规范体系之应用指引第10、11、18号
                                </td>
                                <td>刘光忠
                                </td>
                                <td>4.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">上市公司并购重组业务讲解及案例分析
                                </td>
                                <td>张剑文
                                </td>
                                <td>6.0
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
                                <td class="t_a_l">所得税准则与会计准则的差异及其处理
                                </td>
                                <td>马永义
                                </td>
                                <td>1.5
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="lesson2009">
                    <h3>2009河南继续教育课表</h3>
                    <table>
                        <tbody>
                            <tr>
                                <th style="width: 70%">课程名称
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
                                <td>7.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">会计准则重点问题讲解
                                </td>
                                <td>王鹏
                                </td>
                                <td>6.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">新税法下的企业日常经营的纳税筹划
                                </td>
                                <td>张美中
                                </td>
                                <td>7.0
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
                        </tbody>
                    </table>
                </div>
                <div class="lesson2008">
                    <h3>2008河南继续教育课表</h3>
                    <table>
                        <tbody>
                            <tr>
                                <th style="width: 70%">课程名称
                                </th>
                                <th>主讲老师
                                </th>
                                <th>课时
                                </th>
                            </tr>
                            <!-- All -->
                            <tr>
                                <td class="t_a_l">政府采购与国库集中支付制度
                                </td>
                                <td>张琦
                                </td>
                                <td>1.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">基建财务会计
                                </td>
                                <td>杨进军
                                </td>
                                <td>4.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">中小企业改制上市流程
                                </td>
                                <td>何君光
                                </td>
                                <td>3.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">会计准则与所得税差异协调及相关纳税调整
                                </td>
                                <td>于长春
                                </td>
                                <td>8.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">新企业财务通则
                                </td>
                                <td>赖永添
                                </td>
                                <td>8.0
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="lesson2007">
                    <h3>2007河南继续教育课表</h3>
                    <table>
                        <tbody>
                            <tr>
                                <th style="width: 70%">课程名称
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
                                <td>7.5
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">企业合并及合并报表理论与实务
                                </td>
                                <td>焦晓宁
                                </td>
                                <td>7.5
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">如何阅读财务报告获取有用决策信息
                                </td>
                                <td>马永义
                                </td>
                                <td>6.5
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">财务资源的运用效率和风险
                                </td>
                                <td>汤谷良
                                </td>
                                <td>3.5
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="lesson2006">
                    <h3>2006河南继续教育课表</h3>
                    <table>
                        <tbody>
                            <tr>
                                <th style="width: 70%">课程名称
                                </th>
                                <th>主讲老师
                                </th>
                                <th>课时
                                </th>
                            </tr>
                            <!-- All -->
                            <tr>
                                <td class="t_a_l">《内部控制规范》解读
                                </td>
                                <td>朱海林
                                </td>
                                <td>3.0
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
                                <td class="t_a_l">企业内部控制规范体系之应用指引第6号
                                </td>
                                <td>周守华
                                </td>
                                <td>3.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">风险管理内部控制的理论与实践
                                </td>
                                <td>李春瑜
                                </td>
                                <td>4.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">现值计量、金融工具、债务重组、资产减值、借款费用执行中的重点、难点问题
                                </td>
                                <td>陆建桥
                                </td>
                                <td>4.0
                                </td>
                            </tr>
                            <tr>
                                <td class="t_a_l">职工薪酬、财务报表列表、合并财务报表执行中的重点、难点问题
                                </td>
                                <td>王鹏
                                </td>
                                <td>4.0
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="clear">
        </div>
    </div>

</asp:Content>
