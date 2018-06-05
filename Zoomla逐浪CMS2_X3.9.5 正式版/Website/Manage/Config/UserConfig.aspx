<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserConfig.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.UserConfig" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>用户参数</title>
<%=Call.SetBread(new Bread[] {
        new Bread("/Admin/Main.aspx","工作台"),
        new Bread("/{manage}/User/AdminManage.aspx","用户管理"),
        new Bread() {url="", text="会员参数配置",addon= "" }}
        )
    %>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container-fluid pr-0 table-responsive">
<div class="row sysRow">
    <ul class="nav nav-tabs list_choice">
        <li class="nav-item"><a class="nav-link active show" href="#Tabs0" data-toggle="tab">基本参数</a></li>
        <li class="nav-item"><a class="nav-link" href="#Tabs1" data-toggle="tab">积分设置</a></li>
        <li class="nav-item"><a class="nav-link" href="#Tabs2" data-toggle="tab">积分兑换</a></li>
        <li class="nav-item"><a class="nav-link" href="#Tabs3" data-toggle="tab">点券设置</a></li>
        <li class="nav-item"><a class="nav-link" href="#Tabs4" data-toggle="tab">会员菜单</a></li>
        <li class="nav-item"><a class="nav-link" href="#Tabs5" data-toggle="tab">邀请码配置</a></li>
        <li class="nav-item"><a class="nav-link" href="#Tabs6" data-toggle="tab">提现配置</a></li>
    </ul>
<div class="tab-content col-12 table_box">
        <div class="tab-pane  col-12 table_box active table-responsive-md" id="Tabs0">
            <table class="table table-striped table-bordered sys_table">
                <tbody>
                    <tr><td colspan="2" class="text-center">注册参数↓</td></tr>
                    <tr>
                        <th class="w12rem_lg"><strong>是否开启会员注册</strong></th>
                        <td>
                            <input type="checkbox" runat="server" id="RadioButtonList1" class="switchChk" />
                        </td>
                    </tr>
                    <tr>
                        <th><strong>最大会员数</strong></th>
                        <td>
						<div class="input-group">
						<ZL:TextBox ID="MaxUsers_T" runat="server" class="form-control max20rem" ValidType="IntZeroPostive" />
						  <div class="input-group-append">
							<span class="input-group-text">人</span>
						  </div>
						</div>
						<small class="text-muted">为0则不限制用户总数</small>
                    </tr>
                    <tr>
                        <th><strong>新会员注册时用户名最少字符数</strong></th>
                        <td>
						<div class="input-group">
						<asp:TextBox ID="TextBox6" runat="server" class="form-control max20rem"></asp:TextBox>
						  <div class="input-group-append">
							<span class="input-group-text">个字符</span>
						  </div>
						</div>
				        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="最少字符数不能为空"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="TextBox6" ErrorMessage="最少字符数必须大于等于2" Operator="GreaterThanEqual" Type="Integer" ValueToCompare="2" Display="Dynamic" SetFocusOnError="true"></asp:CompareValidator></td>
                    </tr>
                    <tr>
                        <th><strong>新会员注册时用户名最多字符数</strong></th>
                        <td>
							<div class="input-group">
							<asp:TextBox ID="TextBox7" runat="server" class="form-control max20rem"></asp:TextBox>
							  <div class="input-group-append">
								<span class="input-group-text">个字符</span>
							  </div>
							</div>
				        <asp:RequiredFieldValidator ID="ReqTxtUserNameMax" runat="server" Display="Dynamic" ErrorMessage="最多字符数不能为空" ControlToValidate="TextBox7" />
                            <asp:CompareValidator ID="CValTxtUserNameMax" runat="server" ControlToValidate="TextBox7" ControlToCompare="TextBox6" Type="Integer" Operator="GreaterThanEqual" ErrorMessage="最多字符数必须大于等于最小字符数" Display="Dynamic" SetFocusOnError="true" /></td>
                    </tr>
                    <tr>
                        <th><strong>禁止注册的用户名<br />
                        </strong>每个用户名请用“|”符号分隔 </th>
                        <td>
                            <asp:TextBox ID="TextBox8" runat="server" TextMode="MultiLine" class="form-control m50rem_50" style="height:100px;"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <th><strong>会员注册协议</strong></th>
                        <td>
                            <asp:RadioButtonList ID="Agreement" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="4">云办公模式</asp:ListItem>
                                <asp:ListItem Value="3" Selected="True">倒计时式</asp:ListItem>
                                <asp:ListItem Value="2">选择勾选</asp:ListItem>
                                <asp:ListItem Value="1">常规注册</asp:ListItem>
                                <asp:ListItem Value="0">不显示</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <th><strong>会员注册默认状态</strong></th>
                        <td>
                            <asp:RadioButtonList ID="UserValidateType_Rad" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0">验证</asp:ListItem>
                                <asp:ListItem Value="1">未验证</asp:ListItem>
                            </asp:RadioButtonList></td>
                    </tr>
                    <tr>
                        <th><strong>允许用户名注册规则</strong></th>
                        <td>
                            <asp:CheckBoxList ID="RegRule" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1">不允许纯数字</asp:ListItem>
                                <asp:ListItem Value="2">不允许纯英文</asp:ListItem>
                                <asp:ListItem Value="3">不允许带有中文</asp:ListItem>
                            </asp:CheckBoxList>
                        </td>
                    </tr>
                    <tr>
                        <th><strong>是否开启用户注册管理员验证</strong></th>
                        <td>
                            <input type="checkbox" runat="server" id="RadioButtonList3" class="switchChk" />
                        </td>
                    </tr>
                    <tr><th><strong>问答是否必填</strong></th><td>
                        <input type="checkbox" runat="server" id="Reg_AnswerMust" class="switchChk" />
                   </td></tr>
                    <tr><th><strong>注册可选会员组</strong></th><td>
                        <input type="checkbox" runat="server" id="Reg_SelGroup" class="switchChk" />
                    </td></tr>
                    <tr>
                        <th><strong>注册时是否启用验证码功能<br />
                        </strong>可一定程度上防暴力营销软件或注册机自动注册。 </th>
                        <td>
                            <input type="checkbox" runat="server" id="RadioButtonList5" class="switchChk" />
                        </td>
                    </tr>
                    <tr>
                        <th><strong>是否开启用户ID登录</strong></th>
                        <td>
                            <input type="checkbox" runat="server" id="radioUserID" class="switchChk" />
                    </tr>
                    <tr>
                        <th><strong>登录是否启用验证码功能<br />
                        </strong>可一定程度上防止会员密码被暴力破解 </th>
                        <td>
                              <label><input name="EnableCheckCodeOfLogin_rad" type="radio" value="0" checked="checked" />失败三次后开启</label>
                              <label><input name="EnableCheckCodeOfLogin_rad" type="radio" value="1" />开启验证码</label>
                              <label><input name="EnableCheckCodeOfLogin_rad" type="radio" value="2" />不开启</label>
                        </td>
                    </tr>
                    <tr><td colspan="2" class="text-center">手机邮箱↓</td></tr>
                    <tr>
                        <th><strong>手机校验码注册</strong></th>
                        <td>
                            <input type="checkbox" runat="server" id="radioMobile" class="switchChk" /></td>
                    </tr>
                    <tr>
                        <th><strong>手机校验码位数</strong></th>
                        <td>
						<div class="input-group">
						 <asp:TextBox runat="server" ID="MobileCodeNum_T" CssClass="form-control text_s int max20rem" MaxLength="2" />
						  <div class="input-group-append">
							<span class="input-group-text">个字符</span>
						  </div>
						</div>
						<small class="text-muted">最少必须4位</small>
                    </tr>
                    <tr>
                        <th><strong>手机校验码规则</strong></th>
                        <td>
                            <label><input type="radio" value="2" name="mobilecode_rad" />纯数字</label>
                            <label><input type="radio" value="3" name="mobilecode_rad" />纯字母</label>
                            <label><input type="radio" value="0" name="mobilecode_rad" checked="checked" />混合式</label>
                        </td>
                    </tr>
                    <tr>
                        <th><strong>是否开启注册Email验证</strong></th>
                        <td>
                            <input type="checkbox" runat="server" id="rdoEmailCheck" class="switchChk" />
                        </td>
                    </tr>
                    <tr>
                        <th><strong>是否开启Email注册登录</strong></th>
                        <td>
                            <input type="checkbox" runat="server" id="RadioButtonList2" class="switchChk" />
                        </td>
                    </tr>
                    <tr>
                        <th><strong>是否开启注册成功邮件提醒</strong></th>
                        <td>
                            <input type="checkbox" runat="server" id="radioEmail" class="switchChk" />
                        </td>
                    </tr>
                    <tr><th><strong>Email是否必填</strong></th><td>
                        <input type="checkbox" runat="server" id="Reg_EmailMust" class="switchChk" />
                    </td></tr>
                    <tr><td colspan="2" class="text-center">扩展参数↓</td></tr>
                    <tr>
                        <th><strong>注册时的必填、选填项目：</strong><br />
                            可根据需要设定注册的必填项、选填项。<br />
                            将“可用项”中内容添加到“必填项”或者“选填项”的列表中即可。<br />
                            用户名、密码、确认密码、问题、问题答案等为必填项<br />
                            <span style="color: Blue">注：若修改此项，前台正在注册的表单页面将失效</span></th>
                        <td>
                            <table>
                                <tr>
                                    <td>
                                        <asp:HiddenField ID="HdnRegFields_MustFill" runat="server" />
                                        <asp:HiddenField ID="HdnRegFields_SelectFill" runat="server" />
                                        可用项：<br />
                                        <asp:ListBox ID="LitRegFields" SelectionMode="Multiple" Width="130" Height="285" runat="server" class="form-control" /></td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td>
                                                    <input id="Button4" value=" >> " onclick="AddFields_MustFill()" title="添加所选项" type="button" />
                                                    <br />
                                                    <input id="Button2" value=" << " onclick="RemoveFields_MustFill()" title="移除所选项"
                                                        type="button" /></td>
                                                <td>必填项：<br />
                                                    <asp:ListBox ID="LitRegFields_MustFill" SelectionMode="Multiple" Width="130" Height="130" runat="server" class="form-control" /></td>
                                                <td>
                                                    <input id="Button5" value=" ︽ " onclick="UpFields_MustFill()" title="上移" type="button" />
                                                    <br />
                                                    <input id="Button6" value=" ︾ " onclick="DownFields_MustFill()" title="下移" type="button" />
                                                    <br />
                                                    <br />
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input id="Button3" value=" >> " onclick="AddFields_SelectFill()" title="添加所选项" type="button" />
                                                    <br />
                                                    <input id="Button7" value=" << " onclick="RemoveFields_SelectFill()" title="移除所选项"
                                                        type="button" /></td>
                                                <td>选填项：<br />
                                                    <asp:ListBox ID="LitRegFields_SelectFill" SelectionMode="Multiple" Width="130" Height="130"
                                                        class="form-control" runat="server" /></td>
                                                <td>
                                                    <input id="Button8" value=" ︽ " onclick="UpFields_SelectFill()" title="上移" type="button" />
                                                    <br />
                                                    <input id="Button9" value=" ︾ " onclick="DownFields_SelectFill()" title="下移" type="button" />
                                                    <br />
                                                    <br />
                                                    <br />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <th><strong>新会员注册时发送的手机验证短信内容：<br />
                        </strong>短信内容中可用标签如下(内容不超过70个字)：<br />
                            <span>{$CheckNum}</span>：会员名称<br />
                            <span>{$SiteName}</span>：网站名称<br />
                            <span>{$SiteUrl}</span>：网站地址</th>
                        <td>
                            <asp:TextBox ID="txtMobileRegInfo" runat="server" Rows="6" TextMode="MultiLine" class="form-control m50rem_50"></asp:TextBox></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="tab-pane table-responsive-md" id="Tabs1">
            <table class="table table-striped table-bordered myform-control sys_table">
                    <tr runat="server" id="PresentExpPerLogin">
                        <th class="w12rem_lg"><strong>会员每登录一次奖励的积分</strong><br>
						<small class="text-muted">一天只计算一次 </small>
						</th>
                        <td>
							<div class="input-group">
							<asp:TextBox ID="TxtPresentExpPerLogin" Text="0" runat="server" Columns="5" class="form-control max20rem" />
							  <div class="input-group-append">
								<span class="input-group-text">积分 </span>
							  </div>
							</div>
						</td>
                    </tr>
                    <tr>
                        <th>每次签到奖励</th>
                        <td>
						<div class="input-group">
						<asp:TextBox runat="server" CssClass="form-control max20rem" ID="SignPurse_T" Text="0"></asp:TextBox>
						  <div class="input-group-append">
							<span class="input-group-text">资金</span>
						  </div>
						</div>
                        </td>
                    </tr>
                    <tr
                        runat="server" id="Tr1">
                        <th><strong>发布一条新内容奖励积分</strong></th>
                        <td>
						<div class="input-group">
						<asp:TextBox runat="server" ID="tb_InformationRule" class="form-control max20rem"></asp:TextBox>
						  <div class="input-group-append">
							<span class="input-group-text">积分</span>
						  </div>
						</div>
						
				  <asp:RegularExpressionValidator runat="server" ID="rev_2" ValidationExpression="^[1-9]\d*|0$"
					  ControlToValidate="tb_InformationRule" ErrorMessage="只能输入非0整数"></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr
                        runat="server" id="Tr2">
                        <th><strong>发布一条评论奖励积分</strong></th>
                        <td>
						<div class="input-group">
						<asp:TextBox runat="server" ID="tb_CommentRule" class="form-control max20rem"></asp:TextBox>
						  <div class="input-group-append">
							<span class="input-group-text">积分</span>
						  </div>
						</div>
				  <asp:RegularExpressionValidator runat="server" ID="Rev_1" ValidationExpression="^[1-9]\d*|0$"
					  ControlToValidate="tb_CommentRule" ErrorMessage="只能输入非0整数"></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr
                        runat="server" id="Tr3">
                        <th><strong>发布的内容被推荐奖励积分</strong></th>
                        <td>
						<div class="input-group">
						<asp:TextBox runat="server" ID="tb_RecommandRule" class="form-control max20rem"></asp:TextBox>
						  <div class="input-group-append">
							<span class="input-group-text">积分</span>
						  </div>
						</div>
				  <asp:RegularExpressionValidator runat="server" ID="rev_3" ValidationExpression="^[1-9]\d*|0$"
					  ControlToValidate="tb_RecommandRule" ErrorMessage="只能输入非0整数"></asp:RegularExpressionValidator></td>
                    </tr>
                    <tr
                        runat="server" id="PresentExp">
                        <th><strong>新会员注册时赠送的积分</strong></th>
                        <td>
						<div class="input-group">
						<asp:TextBox ID="TxtPresentExp" Text="0" runat="server" Columns="7" MaxLength="7" class="form-control max20rem" />
						  <div class="input-group-append">
							<span class="input-group-text">积分</span>
						  </div>
						</div>
				  <asp:RegularExpressionValidator ID="ValgPresentExp" runat="server" ControlToValidate="TxtPresentExp"
					  ErrorMessage="只能输入正整数" ValidationExpression="^([0-9])(\d{0,})(\d{0,})$" Display="Dynamic" /></td>
                    </tr>
                    <tr runat="server" id="PresentMoney">
                        <th><strong>新会员注册时赠送的金钱</strong></th>
                        <td>
						<div class="input-group">
						<asp:TextBox ID="TxtPresentMoney" Text="0" runat="server" Columns="7" MaxLength="7" class="form-control max20rem" />
						  <div class="input-group-append">
							<span class="input-group-text">元</span>
						  </div>
						</div>
				  <asp:RegularExpressionValidator ID="ValgTxtPresentMoney" runat="server" ControlToValidate="TxtPresentMoney"
					  ErrorMessage="只能输入货币字符，并且不能为负数" ValidationExpression="^[0-9]+(\.?[0-9]{1,4})?" Display="Dynamic" /></td>
                    </tr>
                    <tr runat="server" id="PresentValidNum">
                        <th><strong>新会员注册时赠送的有效期</strong></th>
                        <td>
                            
							
						<div class="input-group">

						<asp:TextBox ID="TxtPresentValidNum" Text="0" runat="server" Columns="5" class="form-control max20rem" />
						  <div class="input-group-append">
							 <asp:DropDownList
                                ID="DropPresentValidUnit" runat="server" class="form-control">
                                <asp:ListItem Value="1">天</asp:ListItem>
                                <asp:ListItem Value="2">月</asp:ListItem>
                                <asp:ListItem Value="3">年</asp:ListItem>
                            </asp:DropDownList>
						  </div>
						</div>
						<small class="text-muted">（－1表示无限期）</small>
						</td>
                    </tr>
                    <tr>
                        <th><strong>创建群组所需要的积分</strong></th>
                        <td>
                            
						<div class="input-group">
						<asp:TextBox ID="Txtintegral" Text="0" runat="server" Columns="5" class="form-control max20rem" />
						  <div class="input-group-append">
							<span class="input-group-text">积分</span>
						  </div>
						</div>
						</td>
                    </tr>
                    <tr>
                        <th><strong>佣金占赠送积分百分比</strong></th>
                        <td>
						<div class="input-group">
						<asp:TextBox ID="TxtIntegralPercentage" Text="0" runat="server" Columns="5" class="form-control max20rem" />
						  <div class="input-group-append">
							<span class="input-group-text">%</span>
						  </div>
						</div>
						</td>
                    </tr>
            </table>
        </div>
        <div class="tab-pane table-responsive-md" id="Tabs2">
            <table class="table table-striped table-bordered myform-control sys_table">
                    <tr runat="server" id="MoneyExchangePoint">
                        <th class="w12rem_lg"><strong>资金与点券的兑换比率</strong></th>
                        <td>
							<div class="input-group">
							  <div class="input-group-prepend">
								<span class="input-group-text">每</span>
							  </div>
							  <asp:TextBox ID="TxtMoneyExchangePoint" Text="0" runat="server" Columns="7" MaxLength="7" class="form-control max20rem" />
							   <div class="input-group-prepend">
								<span class="input-group-text">元钱可兑换</span>
							  </div>
							  <asp:TextBox ID="TxtCMoneyExchangePoint" Text="1" runat="server" Columns="7" MaxLength="7" class="form-control max20rem" />
							  <div class="input-group-append">
								<span class="input-group-text ">点券</span>
							  </div>
							</div>
						  <asp:RegularExpressionValidator ID="ValeMoneyExchangePoint" runat="server" ControlToValidate="TxtMoneyExchangePoint"
							  ErrorMessage="只能输入货币字符，并且不能为负数" ValidationExpression="^[0-9]+(\.?[0-9]{1,4})?"
							  Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="ValeCMoneyExchangePoint" runat="server" ControlToValidate="TxtCMoneyExchangePoint"
                                ErrorMessage="只能输入货币字符，并且不能为负数" ValidationExpression="^[0-9]+(\.?[0-9]{1,4})?"
                                Display="Dynamic" />
								</td>
                    </tr>
                    <tr
                        runat="server" id="MoneyExchangeValidDay">
                        <th><strong>资金与有效期的兑换比率</strong></th>
                        <td>
							<div class="input-group">
							  <div class="input-group-prepend">
								<span class="input-group-text">每</span>
							  </div>
							  <asp:TextBox ID="TxtMoneyExchangeValidDay" Text="0" runat="server" Columns="7" MaxLength="7" class="form-control max20rem" />
							   <div class="input-group-prepend">
								<span class="input-group-text">元钱可兑换</span>
							  </div>
							  <asp:TextBox ID="TxtCMoneyExchangeValidDay" Text="1" runat="server" Columns="7" MaxLength="7" class="form-control max20rem" />
							  <div class="input-group-append">
								<span class="input-group-text ">天有效期</span>
							  </div>
							</div>
					  <asp:RegularExpressionValidator ID="ValeMoneyExchangeValidDay" runat="server" ControlToValidate="TxtMoneyExchangeValidDay"
						  ErrorMessage="只能输入货币字符，并且不能为负数" ValidationExpression="^[0-9]+(\.?[0-9]{1,4})?"
						  Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="ValeCMoneyExchangeValidDay" runat="server" ControlToValidate="TxtCMoneyExchangeValidDay"
                                ErrorMessage="只能输入货币字符，并且不能为负数" ValidationExpression="^[0-9]+(\.?[0-9]{1,4})?"
                                Display="Dynamic" /></td>
                    </tr>
                    <tr runat="server">
                        <th><strong>资金与虚拟币的兑换比率</strong></th>
                        <td>
							<div class="input-group">
							  <div class="input-group-prepend">
								<span class="input-group-text">每</span>
							  </div>
							  <asp:TextBox ID="txtMoneyExchangeDummyPurse" Text="0" runat="server" Columns="7" MaxLength="7" class="form-control max20rem" />
							   <div class="input-group-prepend">
								<span class="input-group-text">元钱可兑换</span>
							  </div>
							  <asp:TextBox ID="txtCMoneyExchangeDummyPurse" Text="1" runat="server" Columns="7" MaxLength="7" class="form-control max20rem" />
							  <div class="input-group-append">
								<span class="input-group-text ">元虚拟币</span>
							  </div>
							</div>
						  <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtMoneyExchangeDummyPurse"
							  ErrorMessage="只能输入货币字符，并且不能为负数" ValidationExpression="^[0-9]+(\.?[0-9]{1,4})?"
							  Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtCMoneyExchangeDummyPurse"
                                ErrorMessage="只能输入货币字符，并且不能为负数" ValidationExpression="^[0-9]+(\.?[0-9]{1,4})?"
                                Display="Dynamic" /></td>
                    </tr>
                    <tr runat="server" id="UserExpExchangePoint">
                        <th><strong>积分与点券的兑换比率</strong></th>
                        <td>
							<div class="input-group">
							  <div class="input-group-prepend">
								<span class="input-group-text">每</span>
							  </div>
							  <asp:TextBox ID="TxtUserExpExchangePoint" Text="0" runat="server" Columns="7" MaxLength="7" class="form-control max20rem" />
							   <div class="input-group-prepend">
								<span class="input-group-text">分积分可兑换</span>
							  </div>
							  <asp:TextBox ID="TxtCUserExpExchangePoint" Text="1" runat="server" Columns="7" MaxLength="7" class="form-control max20rem" />
							  <div class="input-group-append">
								<span class="input-group-text ">点券</span>
							  </div>
							</div>
							  <asp:RegularExpressionValidator ID="ValgUserExpExchangePoint" runat="server" ControlToValidate="TxtUserExpExchangePoint"
								  ErrorMessage="只能输入正整数" ValidationExpression="^([0-9])(\d{0,})(\d{0,})$" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="ValgCUserExpExchangePoint" runat="server" ControlToValidate="TxtCUserExpExchangePoint"
                                ErrorMessage="只能输入正整数" ValidationExpression="^([0-9])(\d{0,})(\d{0,})$" Display="Dynamic" /></td>
                    </tr>
                    <tr runat="server" id="UserExpExchangeValidDay">
                        <th><strong>积分与有效期的兑换比率</strong></th>
                        <td>
							<div class="input-group">
							  <div class="input-group-prepend">
								<span class="input-group-text">每</span>
							  </div>
							  <asp:TextBox ID="TxtUserExpExchangeValidDay" Text="0" runat="server" Columns="7" MaxLength="7" class="form-control max20rem" />
							   <div class="input-group-prepend">
								<span class="input-group-text">分积分可兑换</span>
							  </div>
							  <asp:TextBox ID="TxtCUserExpExchangeValidDay" Text="1" runat="server" Columns="7" MaxLength="7" class="form-control max20rem" />
							  <div class="input-group-append">
								<span class="input-group-text ">天有效期</span>
							  </div>
							</div>
						  <asp:RegularExpressionValidator ID="ValgUserExpExchangeValidDay" runat="server" ControlToValidate="TxtUserExpExchangeValidDay"
							  ErrorMessage="只能输入正整数" ValidationExpression="^([0-9])(\d{0,})(\d{0,})$" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="ValgCUserExpExchangeValidDay" runat="server"
                                ControlToValidate="TxtCUserExpExchangeValidDay" ErrorMessage="只能输入正整数" ValidationExpression="^([0-9])(\d{0,})(\d{0,})$"
                                Display="Dynamic" /></td>
                    </tr>
                    <tr runat="server" id="Tr4">
                        <th><strong>积分与资金的兑换比率</strong></th>
                        <td>
							<div class="input-group">
							  <div class="input-group-prepend">
								<span class="input-group-text">每</span>
							  </div>
							  <asp:TextBox ID="TxtCUserExpExchangePoints" Text="0" runat="server" Columns="7" MaxLength="7" class="form-control max20rem" />
							   <div class="input-group-prepend">
								<span class="input-group-text">分积分可兑换</span>
							  </div>
							  <asp:TextBox ID="TxtCUserExpExchangeMoney" Text="0" runat="server" Columns="7" MaxLength="7" class="form-control max20rem" />
							  <div class="input-group-append">
								<span class="input-group-text ">元钱</span>
							  </div>
							</div>
						  <asp:RegularExpressionValidator ID="REV1" runat="server" ControlToValidate="TxtCUserExpExchangePoints"
							  ErrorMessage="只能输入正整数" ValidationExpression="^([0-9])(\d{0,})(\d{0,})$" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="REV2" runat="server" ControlToValidate="TxtCUserExpExchangeMoney"
                                ErrorMessage="只能输入正整数" ValidationExpression="^([0-9])(\d{0,})(\d{0,})$" Display="Dynamic" />

                        </td>
                    </tr>
                    <tr runat="server" id="Tr8">
                        <th><strong>积分与银币的兑换比率</strong></th>
                        <td>
							<div class="input-group">
							  <div class="input-group-prepend">
								<span class="input-group-text">每</span>
							  </div>
							  <asp:TextBox ID="TxtCUserExpExchangeExp" Text="0" runat="server" Columns="7" MaxLength="7" class="form-control max20rem" />
							   <div class="input-group-prepend">
								<span class="input-group-text">分积分可兑换</span>
							  </div>
							  <asp:TextBox ID="TxtCUserExpExchangeSilverCoin" Text="0" runat="server" Columns="7" MaxLength="7" class="form-control max20rem" />
							  <div class="input-group-append">
								<span class="input-group-text ">个银币</span>
							  </div>
							</div>	
					  <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="TxtCUserExpExchangeExp"
						  ErrorMessage="只能输入正整数" ValidationExpression="^([0-9])(\d{0,})(\d{0,})$" Display="Dynamic" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator7" runat="server" ControlToValidate="TxtCUserExpExchangeSilverCoin"
                                ErrorMessage="只能输入正整数" ValidationExpression="^([0-9])(\d{0,})(\d{0,})$" Display="Dynamic" /></td>
                    </tr>
                    <tr>
                        <th><strong>打卡领取奖励</strong></th>
                        <td>
                            <select id="selPunch" runat="server" onchange="PunchCha()" class="form-control" style="width:200px;">
                                <option value="0">不奖励</option>
                                <option value="1">现金</option>
                                <option value="2">虚拟币</option>
                                <option value="3">积分</option>
                                <option value="4">点劵</option>
                                <option value="5">信誉值</option>
                            </select></td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" style="display: none"
                        onmouseout="this.className='tdbg'" id="Tr7">
                        <th><strong>打卡奖励数值</strong></th>
                        <td>
                            <asp:TextBox ID="txtPunch" Text="" runat="server" Columns="5" MaxLength="5" class="form-control" /></td>
                    </tr>
                    <tr>
                        <th><strong>推广奖励类型</strong></th>
                        <td>
                            <asp:RadioButtonList ID="RadioButtonList10" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0" Selected="True">不奖励</asp:ListItem>
                                <asp:ListItem Value="1">现金</asp:ListItem>
                                <asp:ListItem Value="2">银币</asp:ListItem>
                                <asp:ListItem Value="3">积分</asp:ListItem>
                                <asp:ListItem Value="4">虚拟币</asp:ListItem>
                            </asp:RadioButtonList></td>
                    </tr>
                    <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" visible="false" onmouseout="this.className='tdbg'"
                        runat="server" id="Tr6">
                        <th><strong>推广奖励数值</strong></th>
                        <td>
                            <asp:TextBox ID="txtPromotion" Text="" runat="server" Columns="5" MaxLength="5" class="form-control" /></td>
                    </tr>
            </table>
        </div>
        <div class="tab-pane table-responsive-md" id="Tabs3">
            <table class="table table-striped table-bordered myform-control sys_table">
                <tbody>
                    <tr runat="server" id="PointName">
                        <th class="w12rem_lg"><strong>点券的名称</strong><br />
							<small class="text-muted">例如：点券、金币、拍点</small>
						</th>
                        <td>
                            <asp:TextBox ID="TxtPointName" Text="点券" runat="server" Columns="5" MaxLength="5"
                                class="form-control max20rem" /></td>
                    </tr>
                    <tr runat="server" id="PointUnit">
                        <th><strong>点券的单位</strong><br />
							<small class="text-muted">例如：点、个 </small>
						</th>
                        <td>
                            <asp:TextBox ID="TxtPointUnit" Text="点" runat="server" Columns="5" MaxLength="5"
                                class="form-control max20rem" /></td>
                    </tr>
                    <tr runat="server" id="PresentPoint">
                        <th><strong>注册成功赠送点券</strong></th>
                        <td>
						<div class="input-group">
						<asp:TextBox ID="TxtPresentPoint" Text="0" runat="server" Columns="7" MaxLength="7" class="form-control max20rem" />
						  <div class="input-group-append">
							<span class="input-group-text">点券</span>
						  </div>
						</div>
					  <asp:RegularExpressionValidator ID="ValgPresentPoint" runat="server" ControlToValidate="TxtPresentPoint"
						  ErrorMessage="只能输入正整数" ValidationExpression="^([0-9])(\d{0,})(\d{0,})$" Display="Dynamic" /></td>
                    </tr>
                    <tr>
                        <th>资料填写完整赠送点券</th>
                        <td>
                            <asp:TextBox ID="txtzi" runat="server" Columns="7" MaxLength="7" class="form-control max20rem"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ControlToValidate="txtzi"
                                ErrorMessage="只能输入正整数" ValidationExpression="^([0-9])(\d{0,})(\d{0,})$" Display="Dynamic" /></td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="tab-pane table-responsive-md" id="Tabs4">
            <table class="table table-striped table-bordered myform-control sys_table">
                    <tr><th class="text-right w12rem_lg"><strong>会员中心主菜单</strong></th><td>
                        <label><input type="checkbox" name="UserNavBan" value="index"/>首页</label>
                        <label><input type="checkbox" name="UserNavBan" value="content"/>内容</label>
                        <label><input type="checkbox" name="UserNavBan" value="shop"/>商城</label>
                        <label><input type="checkbox" name="UserNavBan" value="exam"/>教育</label>
                        <label><input type="checkbox" name="UserNavBan" value="bbs"/>社区</label>
                        <label><input type="checkbox" name="UserNavBan" value="page"/>黄页</label>
                        <label><input type="checkbox" name="UserNavBan" value="cloud"/>云盘</label>
                        <label><input type="checkbox" name="UserNavBan" value="site"/>建站</label>
                        <label><input type="checkbox" name="UserNavBan" value="office"/>办公</label>
                        <label><input type="checkbox" name="UserNavBan" value="plat"/>能力</label><br>
						<small class="text-muted">*勾选的导航会禁止显示</small>
                    </td></tr>
            </table>
        </div>
        <div class="tab-pane table-responsive-md" id="Tabs5">
            <table class="table table-bordered table-striped sys_table">
                <tr>
                    <th class="w12rem_lg">会员生成邀请码的最大数值</th>
                    <td>
                        <asp:TextBox ID="InviteCode_T" runat="server" class="form-control max20rem"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="InviteCode_T" Display="Dynamic" ErrorMessage="最少字符数不能为空"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="InviteCode_T" ErrorMessage="最少字符数必须大于等于1" Operator="GreaterThanEqual" Type="Integer" ValueToCompare="1" Display="Dynamic" SetFocusOnError="true"></asp:CompareValidator>
						<small class="text-muted">为0则不允许生成</small>
                    </td>
                </tr>
                <tr>
                    <th>会员邀请码格式</th>
                    <td>
                        <ZL:TextBox runat="server" ID="InviteFormat_T" CssClass="form-control max20rem" MaxLength="20" />
						<small class="text-muted">示例:{000000AA},0表示数字占位符,A表示字母占位符</small>
					</td>
                </tr>
                <tr><th>邀请入会员组</td><th>
                    <asp:DropDownList runat="server" ID="InviteJoinGroup_DP" class="form-control max20rem" DataTextField="GroupName" DataValueField="GroupID"></asp:DropDownList>
                </td></tr>
            </table>
        </div>
        <div class="tab-pane table-responsive-md" id="Tabs6">
            <table class="table table-bordered table-striped sys_table">
                <tr><th class="w12rem_lg text-right">最小提现金额</th><td>
                    <ZL:TextBox runat="server" ID="WD_Min_T" class="form-control max20rem" ValidType="IntPostive"/>
					<small class="text-muted">单笔提现最小金额,最小值为1</small>
                                                            </td></tr>
                <tr><th class="text-right">最大提现金额</th><td>
                    <ZL:TextBox runat="server" ID="WD_Max_T" class="form-control max20rem" ValidType="IntZeroPostive"/>
					<small class="text-muted">单笔提现最大金额,0为不限制</small>
                                                       </td></tr>
                <tr>
                    <th class="text-right">提现倍数</th>
                    <td>
                        <ZL:TextBox runat="server" ID="WD_Multi_T" class="form-control max20rem" ValidType="IntZeroPostive"/>
						<small class="text-muted">提现金额必须是该值的倍数,0为即不限制</small>
                    </td>
                </tr>
                <tr><th class="text-right">提现手续费率</th><td>
					<div class="input-group">
					<asp:TextBox runat="server" ID="WD_FeePercent_T" class="form-control max20rem" />
					  <div class="input-group-append">
						<span class="input-group-text">%</span>
					  </div>
					</div>
			   </td></tr>
            </table>
        </div>
    </div>
	<div class="sysBtline">
        <asp:Button runat="server" Text="保存设置" OnClick="Save_Click" class="btn btn-info" /></div>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/SelectCheckBox.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script src="/dist/js/bootstrap-switch.js"></script>
<link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
<script type="text/javascript">
    $(function () {
        ZL_Regex.B_Num(".int");
    })

    function checkIP() {
        var ip1 = document.getElementById("txtBeginIP").value;
        var ip2 = document.getElementById("txtEndIP").value;
        if (ip1 != "" || ip2 != "") {
            var re = /^((\d)|(([1-9])\d)|(1\d\d)|(2(([0-4]\d)|5([0-5]))))\.((\d)|(([1-9])\d)|(1\d\d)|(2(([0-4]\d)|5([0-5]))))\.((\d)|(([1-9])\d)|(1\d\d)|(2(([0-4]\d)|5([0-5]))))\.((\d)|(([1-9])\d)|(1\d\d)|(2(([0-4]\d)|5([0-5]))))$/;
            var message = document.getElementById("lblMessage");
            if (!re.test(ip1) || !re.test(ip2)) {
                alert("输入IP地址格式不正确，请从新输入！")
                return;
            }
        }
    }
    window.onload = function PunchCha() {
        var obj = document.getElementById("selPunch").value;
        if (obj == "0") {
            document.getElementById("Tr7").style.display = "none";
        } else {
            document.getElementById("Tr7").style.display = "";
        }
        InitCountFiled();
    }
    var LitRegFieldsClientID = "<%=LitRegFields.ClientID %>";
    var HdnRegFields_MustFillClientID = "<%=HdnRegFields_MustFill.ClientID %>";
    var LitRegFields_MustFillClientID = "<%=LitRegFields_MustFill.ClientID %>";
    var HdnRegFields_SelectFillClientID = "<%=HdnRegFields_SelectFill.ClientID %>";
    var LitRegFields_SelectFillClientID = "<%=LitRegFields_SelectFill.ClientID %>";
    //初始化需要统计的用户字段
    function InitCountFiled() {
        //var hids = $("#CountFields_Hid").val();
        //if (hids != "") {
        //    var harr = hids.split(',');
        //    for (var i = 0; i < harr.length; i++) {
        //        $("#UserFields_list option[value='" + harr[i] + "']")[0].selected = true;
        //    }
        //    addItem($("#UserFields_list")[0], $("#CountFields_list")[0]);
        //}
    }
    function AddFields_CountFill() {
        //addItem($("#UserFields_list")[0], $("#CountFields_list")[0]);
        //SetHdn($("#CountFields_list")[0], $("#CountFields_Hid")[0]);
    }
    function RemoveFields_CountFill() {
        addItem($("#CountFields_list")[0], $("#UserFields_list")[0]);
        SetHdn($("#CountFields_list")[0], $("#CountFields_Hid")[0]);
    }
    function AddFields_MustFill() {
        var itemList = document.getElementById(LitRegFieldsClientID);
        var target = document.getElementById(LitRegFields_MustFillClientID);
        addItem(itemList, target);
        SetHdn(target, document.getElementById(HdnRegFields_MustFillClientID));
    }

    function RemoveFields_MustFill() {
        var itemList = document.getElementById(LitRegFieldsClientID);
        var target = document.getElementById(LitRegFields_MustFillClientID);
        addItem(target, itemList);
        SetHdn(target, document.getElementById(HdnRegFields_MustFillClientID));
    }

    function AddFields_SelectFill() {
        var itemList = document.getElementById(LitRegFieldsClientID);
        var target = document.getElementById(LitRegFields_SelectFillClientID);
        addItem(itemList, target);
        SetHdn(target, document.getElementById(HdnRegFields_SelectFillClientID));
    }

    function RemoveFields_SelectFill() {
        var itemList = document.getElementById(LitRegFieldsClientID);
        var target = document.getElementById(LitRegFields_SelectFillClientID);
        addItem(target, itemList);
        SetHdn(target, document.getElementById(HdnRegFields_SelectFillClientID));
    }

    function UpFields_MustFill() {
        var target = document.getElementById(LitRegFields_MustFillClientID);
        UpOption(target);
        SetHdn(target, document.getElementById(HdnRegFields_MustFillClientID));
    }

    function DownFields_MustFill() {
        var target = document.getElementById(LitRegFields_MustFillClientID);
        DownOption(target);
        SetHdn(target, document.getElementById(HdnRegFields_MustFillClientID));
    }

    function UpFields_SelectFill() {
        var target = document.getElementById(LitRegFields_SelectFillClientID);
        UpOption(target);
        SetHdn(target, document.getElementById(HdnRegFields_SelectFillClientID));
    }

    function DownFields_SelectFill() {
        var target = document.getElementById(LitRegFields_SelectFillClientID);
        DownOption(target);
        SetHdn(target, document.getElementById(HdnRegFields_SelectFillClientID));
    }

    function UpOption(obj) {
        for (var i = 0; i < obj.length; i++) {
            var opt = obj.options[i];
            if (opt.selected) {
                if (i >= 1) {
                    var temp = obj.options[i - 1];
                    obj.options[i] = new Option(temp.text, temp.value, 0, 0);
                    obj.options[i - 1] = new Option(opt.text, opt.value, 0, 1);
                }
            }
        }
    }

    function DownOption(obj) {
        for (var i = obj.length - 1; i >= 0; i--) {
            var opt = obj.options[i];
            if (opt.selected) {
                if (i <= obj.length - 2) {
                    var temp = obj.options[i + 1];
                    obj.options[i] = new Option(temp.text, temp.value, 0, 0);
                    obj.options[i + 1] = new Option(opt.text, opt.value, 0, 1);
                }
            }
        }
    }

    function addItem(ItemList, Target) {
        for (var i = 0; i < ItemList.length; i++) {
            var opt = ItemList.options[i];
            if (opt.selected) {
                flag = true;
                for (var y = 0; y < Target.length; y++) {
                    var myopt = Target.options[y];
                    if (myopt.value == opt.value) {
                        flag = false;
                    }
                }
                if (flag) {
                    Target.options[Target.options.length] = new Option(opt.text, opt.value, 0, 0);
                }
            }
        }

        for (var y = 0; y < Target.length; y++) {
            var myopt = Target.options[y];
            for (var i = 0; i < ItemList.length; i++) {
                if (ItemList.options[i].value == myopt.value) {
                    ItemList.options[i] = null;
                }
            }
        }
    }

    function SetHdn(ItemList, HdnObj) {
        var adminId = "";
        for (var i = 0; i < ItemList.length; i++) {
            if (adminId == "") {
                adminId = ItemList.options[i].value;
            }
            else {
                adminId += "," + ItemList.options[i].value;
            }
        }
        HdnObj.value = adminId;
    }
</script>
<script type="text/javascript" src="/js/Common.js"></script>
</asp:Content>
