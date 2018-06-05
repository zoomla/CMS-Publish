<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WxConfig.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.WxConfig"  MasterPageFile="~/Manage/I/Index.master" %>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>微信配置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content"><%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/I/Main.aspx","工作台"),
	new Bread("WxAppManage.aspx","公众号管理"),
	new Bread() {url="", text="微信配置",addon= "" }},
	Call.GetHelp(109)
	)
%>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
<table class="table table-bordered table-hover sys_table">
<tr>
<th scope="row" scope="col" class="w12rem_lg">别名</th>
<td scope="col"><asp:TextBox runat="server" ID="Alias_T" CssClass="form-control max20rem"/>
<asp:RequiredFieldValidator ID="RV3" runat="server" ControlToValidate="Alias_T" ErrorMessage="别名不能为空" ForeColor="Red" Display="Dynamic"/></td>
</tr>
<tr>
<th scope="row">微信公众号</th>
<td><asp:TextBox runat="server" ID="WxNo_T" CssClass="form-control max20rem"/>
<asp:RequiredFieldValidator ID="RV4" runat="server" ControlToValidate="WxNo_T" ErrorMessage="公众号不能为空" ForeColor="Red" Display="Dynamic" /></td>
</tr>
<tr>
<th scope="row">原始ID</th>
<td><asp:TextBox runat="server" ID="OrginID_T" CssClass="form-control max20rem" />
<asp:RequiredFieldValidator ID="RV5" runat="server" ControlToValidate="OrginID_T" ErrorMessage="原始ID不能为空" ForeColor="Red" Display="Dynamic" /></td>
</tr>
<tr>
<th scope="row">AppID</th>
<td><asp:TextBox runat="server" ID="AppID_T" CssClass="form-control max20rem" />
<asp:RequiredFieldValidator ID="RV2" runat="server" ControlToValidate="AppID_T" ErrorMessage="AppID不能为空" ForeColor="Red" Display="Dynamic" /></td>
</tr>
<tr>
<th scope="row">Secret</th>
<td><asp:TextBox runat="server" ID="Secret_T" CssClass="form-control max20rem" />
<asp:RequiredFieldValidator ID="RV1" runat="server"   ControlToValidate="Secret_T" ErrorMessage="Secret不能为空" ForeColor="Red" Display="Dynamic"/></td>
</tr>
<tr>
<th scope="row">二维码图片</th>
<td><ZL:SFileUp runat="server" ID="QCode_UP" FType="Img" /></td>
</tr>
<tr>
<th scope="row">Token</th>
<td><asp:Label runat="server" ID="Token_L" />
<asp:Button runat="server" ID="ReToken_Btn" Text="重新获取Token" CssClass="btn btn-info btn-sm" OnClick="ReToken_Btn_Click" /></td>
</tr>
<tr>
<th scope="row">操作</th>
<td><asp:Button runat="server" ID="Save_Btn" Text="保存设置" OnClick="Save_Btn_Click"  CssClass="btn btn-info"/>
<a href="WxAppManage.aspx" class="btn btn-outline-info">返回列表</a></td>
</tr>
</table>
</div></div>
<div class="alert alert-info alert-dismissible fade show" role="alert"> <strong>注意事项:</strong>  AppID与Secret要与微信公众号下的appID与appsecret一致,公众号名可以自定义设置
<button class="close" aria-label="Close" type="button" data-dismiss="alert"> <span aria-hidden="true">×</span> </button>
</div>
<script>
</script> 
</asp:Content>