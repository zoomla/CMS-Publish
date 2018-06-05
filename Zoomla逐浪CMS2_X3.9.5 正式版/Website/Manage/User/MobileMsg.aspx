<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MobileMsg.aspx.cs" Inherits="ZoomLaCMS.Manage.User.MobileMsg"  MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>发送手机短信</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/I/Main.aspx","工作台"),
	new Bread("UserManage.aspx","用户管理"),
	new Bread() {url="", text="手机短信 [<a href='MobileMsgLog.aspx'>查看发送记录</a>]",addon= "" }},
	Call.GetHelp(109)
	)
%>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
<table class="table table-bordered sys_table">
	<tr>
	<th scope="row"  class="w12rem_lg">短信余额</th>
	<td scope="col"><asp:Label ID="LblMobile" runat="server"></asp:Label></td>
	</tr>
	<tr>
		<th scope="col" scope="row">短信内容</th>
		<td scope="col">
			<asp:TextBox ID="Content_T" runat="server" Rows="5" TextMode="MultiLine" class="form-control"></asp:TextBox>
			<small class="text-muted">70个字符(一个汉字=2字符)</small>
	</tr>
    <tr><th>CRM客户类别</th><td>
        <asp:Repeater runat="server" ID="CRM_RPT">
            <ItemTemplate>
                <label><input type="checkbox" name="crm_chk" value="<%#Eval("value") %>"/><%#Eval("value") %></label>
            </ItemTemplate>
        </asp:Repeater>
        </td></tr>
    <tr>
        <th>会员组</th>
        <td>
            <asp:Repeater runat="server" ID="Group_RPT">
                <ItemTemplate>
                    <label>
                        <input type="checkbox" name="group_chk" value="<%#Eval("GroupID") %>" /><%#Eval("GroupName") %></label>
                </ItemTemplate>
            </asp:Repeater>
        </td>
    </tr>
	<tr>
	<th scope="row">会员列表</th>
		<td>
			<div class="mb-2">
				<input type="button" class="btn btn-info btn-sm" value="+选择用户" onclick="user.sel('InceptUser', 'user', '')" />
			</div>
			<asp:TextBox runat="server" ID="InceptUser_T" TextMode="MultiLine" class="form-control" Rows="5" disabled="disabled"/>
			<asp:HiddenField ID="InceptUser_Hid" runat="server" />
		</td>
	</tr>
    <tr>
        <th scope="row">手机号码</th>
        <td>
            <asp:TextBox runat="server" ID="Mobiles_T" TextMode="MultiLine" class="form-control" Rows="5" placeholder="请输入手机号码使用英文半角,号分隔" />
        </td>
    </tr>
	<tr>
		<td></td>
		<td>
			<asp:Button ID="BtnSend" runat="server" Text="发送短信" OnClick="BtnSend_Click" OnClientClick="return subCheck();" class="btn btn-info" />
		</td>
	</tr>
</table>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script>
function SelectUser() {
    var url = "/Office/Mail/SelGroup.aspx?Type=AllInfo#ReferUser";
    comdiag.maxbtn = false;
    ShowComDiag(url, "选择用户");
}

user.hook["InceptUser"] = userdeal;
function userdeal(list, select) {
    var names = "", ids = "";
    for (var i = 0; i < list.length; i++) {
        names += list[i].UserName + ",";
        ids += list[i].UserID + ",";
    }
    $("#" + select + "_T").val(names);
    $("#" + select + "_Hid").val(ids);
    if (comdiag != null) { CloseComDiag(); }
}
function subCheck() {
    var content = $("#Content_T").val();
    if (ZL_Regex.isEmpty(content)) { alert("短信内容不能为空"); return false; }
    if (content.length > 70) { alert("短信内容超过70字"); return false; }
    return true;
}
</script>
</asp:Content>