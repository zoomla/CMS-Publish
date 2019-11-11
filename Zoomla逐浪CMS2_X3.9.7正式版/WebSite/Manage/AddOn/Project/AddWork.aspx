<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddWork.aspx.cs" Inherits="ZoomLaCMS.Manage.AddOn.Project.AddWork" MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content ContentPlaceHolderID="head" runat="Server"><title>添加流程</title></asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("Projects.aspx","项目管理"),
        new Bread() {url="", text="编辑流程",addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
<table class="table table-striped table-bordered sys_table">
	<tr>
		<th class="w12rem_lg">流程名称</th>
		<td>
			<asp:TextBox ID="TxtWorkName" runat="server" class="form-control max20rem"></asp:TextBox>
			<asp:RequiredFieldValidator ID="ValrKeywordText" ControlToValidate="TxtWorkName" runat="server" ErrorMessage="流程名称不能为空！" Display="Dynamic"></asp:RequiredFieldValidator>
		</td>
	</tr>
	<tr>
		<th>流程简述</th>
		<td>
			<asp:TextBox ID="TxtWorkIntro" runat="server" TextMode="MultiLine" Rows="8" Columns="50" class="form-control max20rem"></asp:TextBox>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtWorkIntro" runat="server" ErrorMessage="项目简述不能为空！" Display="Dynamic"></asp:RequiredFieldValidator>
		</td>
	</tr>
	<tr>
        <td></td>
		<td>
			<asp:Button ID="EBtnSubmit" Text="保存信息" OnClick="EBtnSubmit_Click" runat="server" class="btn btn-info" />
			<input name="Cancel" type="button" id="Cancel" value="取消修改" onclick="javascript: history.go(-1)" class="btn btn-outline-info" />
		</td>
	</tr>
</table>
</div></div>
<asp:HiddenField ID="HFWid" runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
	var ie = navigator.appName == "Microsoft Internet Explorer" ? true : false;
	function $(objID) {
		return document.getElementById(objID);
	}
</script>
</asp:Content>
