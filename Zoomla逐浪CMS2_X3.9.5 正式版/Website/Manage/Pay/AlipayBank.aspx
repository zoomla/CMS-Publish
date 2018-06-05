<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AlipayBank.aspx.cs" Inherits="ZoomLaCMS.Manage.Pay.AlipayBank"MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>支付宝单网银</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/Config/SiteInfo.aspx","系统设置"),		
        new Bread("PayPlatManage.aspx","在线支付平台"),		
        new Bread() {url="", text="支付宝单网银",addon="" }},
		Call.GetHelp(57)
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
<table width="100%" border="0" cellpadding="2" cellspacing="1" class="table table-striped table-bordered table-hover sys_table">
                <tr align="center">
                    <th scope="col" class="spacingtitle text-center" colspan="2">
                        <asp:Label ID="LblTitle" runat="server" Text="支付宝单网银" />
                    </th>
                </tr>
                <tr>
                    <th scope="col" class="w12rem_lg">支付名称<small class="text-danger">* 必填</small></th>
                    <td scope="col">
                        <asp:TextBox ID="DDLPayName" runat="server" class="form-control max20rem pull-left"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>商户ID<small class="text-danger">* 必填</small></th>
                    <td>
                        <asp:TextBox ID="TxtAccountID" runat="server" class="form-control max20rem pull-left" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="商户ID不能为空！" CssClass="tips" ControlToValidate="TxtAccountID" Display="Dynamic" SetFocusOnError="True" />
                    </td>
                </tr>
                <tr id="trMD5Key" runat="server" >
                    <th>安全校验码<small class="text-danger">* 必填</small></th>
                    <td>
                        <asp:TextBox ID="TxtMD5Key" runat="server" class="form-control max20rem pull-left" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="安全校验码不能为空!" CssClass="tips" ControlToValidate="TxtMd5Key" Display="Dynamic" SetFocusOnError="true">  </asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <th>卖家Email<small class="text-danger">* 必填:如支付宝接口必须填写卖家Email,否则会出错</small></th>
                    <td>
                        <asp:TextBox ID="TxtSellerEmail" runat="server" class="form-control max20rem pull-left" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TxtSellerEmail" Display="Dynamic" ErrorMessage="*" CssClass="tips" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">邮箱格式不正确</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <th>分成 <small class="text-danger">*此项如设置为10%，则商户得到90%</small></th>
                    <td>
						<div class="input-group">
						<asp:TextBox ID="TxtRate" runat="server" Text="0" class="form-control max20rem pull-left" />
						  <div class="input-group-append">
							<span class="input-group-text tips">%</span>
						  </div>
						</div>
                        <asp:RegularExpressionValidator runat="server" ID="Rev_1" ValidationExpression="^[0-9]\d*|0$" CssClass="tips" ControlToValidate="TxtRate" Display="Dynamic" ErrorMessage="只能输入整数"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr >
                    <th>支持银行</th>
                    <td class="style3">
                        <asp:CheckBoxList ID="bankList" runat="server"  RepeatColumns="6">
                            <asp:ListItem Value='ICBCB2C' Selected="True">中国工商银行 </asp:ListItem>
                            <asp:ListItem Value='CMB' Selected="True">招商银行 </asp:ListItem>
                            <asp:ListItem Value='CCB' Selected="True">中国建设银行 </asp:ListItem>
                            <asp:ListItem Value='ABC' Selected="True">中国农业银行 </asp:ListItem>
                            <asp:ListItem Value='CIB' Selected="True">兴业银行 </asp:ListItem>
                            <asp:ListItem Value='COMM' Selected="True">交通银行 </asp:ListItem>
                            <asp:ListItem Value='CEBBANK' Selected="True">光大银行 </asp:ListItem>
                            <asp:ListItem Value='BOCB2C' Selected="True">中国银行 </asp:ListItem>
                            <asp:ListItem Value='CITIC' Selected="True">中信银行 </asp:ListItem>
                            <asp:ListItem Value='PSBC-DEBIT' Selected="True">中国邮政储蓄银行</asp:ListItem>
                            <asp:ListItem Value='CMBC' Selected="True">中国民生银行</asp:ListItem>
                            <asp:ListItem Value='BJBANK' Selected="True">北京银行</asp:ListItem>
                        </asp:CheckBoxList>
						<small class="text-muted">选择支持哪些银行交易</small>
					</td>
                </tr>
    <tr>
        <td></td>
        <td>
            <asp:Button ID="EBtnSubmit" Text="保存信息" OnClick="EBtnSubmit_Click" runat="server" class="btn btn-info" />
            <a href="PayPlatManage.aspx" class="btn btn-outline-info">返回列表</a>
        </td>
    </tr>
    </table>
	</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/Common.js"></script>
</asp:Content>
