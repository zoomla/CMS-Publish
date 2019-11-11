<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddFlow.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Flow.AddFlow" MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>流程管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/Main.aspx","工作台"),
	new Bread("/{manage}/Config/SiteInfo.aspx","系统设置"),
	new Bread("FlowManager.aspx","流程列表"),
	new Bread() {url="", text="流程管理",addon="" }}
	)
%>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
<table  class="table table-striped table-bordered table-hover sys_table">
	<tr>
		<td colspan="2" align="center" >
			<b>流程管理</b>
		</td>
	</tr>
	<tr>
		<th scope="col" class="w12rem_lg">流程名称<label class="text-danger">*</label></th>
		<td scope="col">
			<input id="txtName" runat="server"  class="form-control max20rem" size="50" />
			<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="流程名称不能为空" ControlToValidate="txtName" ></asp:RequiredFieldValidator>
		</td>
	</tr>
	<tr>
		<th>流程描述</th>
		<td>
			<textarea id="txtFlowDepict" class="form-control m50rem_50" runat="server"></textarea>
		</td>
	</tr>
	<tr><td></td>
        <td>
            <asp:Button ID="btnSave" runat="server" Text="保存信息" class="btn btn-info" OnClick="btnSave_Click" />
            <a href="FlowManager.aspx" class="btn btn-outline-info">返回列表</a>
        </td>
    </tr>
</table>
</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>