<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WxPayConfig.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.WxPayConfig" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>支付配置</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("WxAppManage.aspx","公众号管理"),		
        new Bread() {url="", text="欢迎语 [公众号:fwe]",addon="" }}
		)
    %>
	<div class="container-fluid pr-0">
    <div class="row sysRow list_choice">
        <table class="table table-striped table-bordered table-hover sys_table">
            <tr>
                <th class="w12rem_lg">支付APPID</th>
                <td>
                    <ZL:TextBox ID="APPID_T" runat="server" CssClass="form-control max20rem" Enabled="false"/>
					<small class="text-muted">同于公众号APPID</small>
				</td>
            </tr>
            <tr>
                <th>商户编号</th>
                <td>
                    <ZL:TextBox ID="AccountID_T" runat="server" CssClass="form-control max20rem" AllowEmpty="false" /></td>
            </tr>
            <tr>
                <th>商户密钥</th>
                <td>
                    <ZL:TextBox ID="Key_T" runat="server" CssClass="form-control max20rem" AllowEmpty="false" /></td>
            </tr>
            <tr><th>商户证书</th>
                <td><asp:TextBox runat="server" ID="SSLPath_T" class="form-control max20rem"/>
				<small class="text-muted">证书颁发名称(红包,退款等出账操作需使用证书)</small>
				<span> [运行mmc--证书,查看颁发名称]</span></td>
            </tr>
            <tr><th>证书密码</th><td><asp:TextBox runat="server" ID="SSLPassword_T" class="form-control max20rem" />
			<small class="text-muted">默认为商户号</small>
			</td></tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="Save_B" runat="server" OnClick="Save_B_Click" CssClass="btn btn-info" Text="保存" />
                    <a href="WxAppManage.aspx" class="btn btn-outline-info">返回</a>
                </td>
            </tr>
        </table>
    </div>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
