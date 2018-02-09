<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddFlow.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Flow.AddFlow" MasterPageFile="~/Manage/I/Default.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>流程管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table  class="table table-striped table-bordered table-hover">
	<tr>
		<td colspan="2" align="center" >
			<b>流程管理</b>
		</td>
	</tr>
	<tr>
		<td class="tdleft td_m">
			<strong>流程名称：</strong>
		</td>
		<td>
			<input id="txtName" runat="server"  class="form-control m715-50" size="50" /><label style="color:Red">*</label>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="流程名称不能为空" ControlToValidate="txtName" ></asp:RequiredFieldValidator>
		</td>
	</tr>
	<tr>
		<td class="tdleft"><strong>流程描述：</strong></td>
		<td>
			<textarea id="txtFlowDepict" class="form-control m715-50"  style="height:120px;"  runat="server"></textarea>
		</td>
	</tr>
	<tr><td></td>
        <td>
            <asp:Button ID="btnSave" runat="server" Text="保存信息" class="btn btn-primary" OnClick="btnSave_Click" />
            <a href="FlowManager.aspx" class="btn btn-default">返回列表</a>
        </td>
    </tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>