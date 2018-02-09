<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lockin.aspx.cs" Inherits="ZoomLaCMS.Manage.Lockin" MasterPageFile="~/Common/Common.master" EnableViewStateMac="false" ClientIDMode="Static" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>解锁-当前后台已经被锁定!</title>
<script type="text/javascript">
//设置Cookies
function setCookie(obj) {
if (!navigator.cookieEnabled) {
alert('不允许设置Cookie项!');
} else {
var date = new Date();
date.setTime(date.getTime() + 60000 * 10);
document.cookie = 'SetLock=' + escape(obj) + ';expires=' + date.toGMTString() + ';path=/' + ';domaim=zgdsc.cn' + ':secure';
}
}
function keydown() {
if (event.keyCode == 13) {
event.returnValue = false;
event.cancel = true;
document.getElementById("btn").click();
}
}
</script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="lock">
<div class="loFont">
	<div class="pass_div">
	<span class="fa fa-warning" style="font-size:16px;"></span> 当前界面被管理员锁定
		<i class="fa fa-lock"></i>
		<asp:TextBox ID="TxtPassword" TextMode="Password"  runat="server" placeholder="请输入密码按回车解锁" CssClass="form-control" MaxLength="15" TabIndex="2" onkeydown="keydown()"></asp:TextBox>
	<div id="tips" runat='server' style="color: Red"></div>  
	<asp:Button ID="btn" runat="server" Text="提交" OnClick="btn_Click1" hidden />
	</div>
</div>
</div>
</asp:Content>