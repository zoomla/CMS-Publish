<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InviteCodeAdd.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Promo.InviteCodeAdd" MasterPageFile="~/Manage/I/Index.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>邀请码列表</title>
<%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/I/Main.aspx","工作台"),
		new Bread("/{manage}/user/UserManage.aspx","用户管理"),
        new Bread("InviteCodeList.aspx","邀请码列表"),
        new Bread() {url="", text="添加邀请码",addon= "" }}
        )
    %>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
<table class="table table-bordered sys_table">
    <tr><th class="w12rem_lg">邀请码格式</th><td><ZL:TextBox runat="server" ID="Format_T" Text="{00000000AAA}" class="form-control max20rem" AllowEmpty="false"/></td></tr>
    <tr><th>所属用户</th><td>

		<div class="input-group">
		  <ZL:TextBox runat="server" ID="User_T" class="form-control max20rem" AllowEmpty="false" disabled="disabled" />
        <asp:HiddenField runat="server" ID="User_Hid" />
			<div class="input-group-append">
			<input type="button" value="选择用户" onclick="user.sel('User', 'user', '');" class="btn btn-info zeroclipboard-is-hover"/>
		  </div>
	  </div>
    </td></tr>
    <tr><th>会员组</th><td>
        <asp:RadioButtonList runat="server" ID="Group_Rad" DataTextField="GroupName" DataValueField="GroupID" RepeatDirection="Horizontal"></asp:RadioButtonList>
                    </td></tr>
    <tr><th>生成数量</th><td><ZL:TextBox runat="server" ID="Count_T" class="form-control max20rem" Text="10" AllowEmpty="false"  ValidType="IntPostive"/></td></tr>
    <tr><td></td><td><asp:Button runat="server" ID="Create_Btn" OnClick="Create_Btn_Click"  Text="生成邀请码" class="btn btn-outline-info"/></td></tr>
</table>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
    user.hook["User"] = function (list,select) {
        var uinfo = list[0];
        $("#" + select + "_T").val(uinfo.UserName);
        $("#" + select + "_Hid").val(uinfo.UserID);
        CloseComDiag();
    }
</script>
</asp:Content>