<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddAuditingState.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Flow.AddAuditingState" MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>审核状态</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/Main.aspx","工作台"),
	new Bread("/{manage}/Config/SiteInfo.aspx","系统设置"),
	new Bread("AuditingState.aspx","状态码管理"),
	new Bread() {url="", text="添加状态码",addon="" }}
	)
%>
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice">
    <table class="table table-striped table-bordered table-hover sys_table">
		<tr>
			<td colspan="2">
				添加审核状态码
			</td>
		</tr>
		<tr>
			<th class="w12rem_lg">录入状态码</th>
			<td align="left">
				<asp:DropDownList ID="ddlStateCode" CssClass="form-control w12rem_lg"  runat="server" DataSourceID="odsStateCode"></asp:DropDownList>
				<asp:ObjectDataSource ID="odsStateCode" runat="server" SelectMethod="GetStateCode" TypeName="ZoomLa.BLL.B_AuditingState"></asp:ObjectDataSource>
			</td>
		</tr>
		<tr>
			<th>入录状态名称</th>
			<td  align="left">
				<input id="stateName" runat="server"  size="50"  class="form-control max20rem"/>
				<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="stateName" ErrorMessage="状态名称不能为空"></asp:RequiredFieldValidator>
			</td>
		</tr>
		<tr><td colspan="2" align="center"><asp:Button ID="btnSave" runat="server" Text="保存状态码" onclick="btnSave_Click" class="btn btn-outline-info"  /></td></tr>
</table>
</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>
