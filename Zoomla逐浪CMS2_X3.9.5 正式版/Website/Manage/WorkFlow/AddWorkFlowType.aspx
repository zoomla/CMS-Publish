<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddWorkFlowType.aspx.cs" Inherits="ZoomLaCMS.Manage.WorkFlow.AddWorkFlowType"  MasterPageFile="~/Manage/I/Index.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加类型</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/Config/SiteInfo.aspx","系统设置"),
		new Bread("FlowTypeList.aspx","类型管理"),
        new Bread() {url="", text="添加步骤",addon="" }}
		)
    %>
    <div id="AddType" runat="server" class="container-fluid pr-0">
	<div class="row sysRow list_choice table-responsive-md">
        <table class="table table-striped table-bordered table-hover sys_table">
            <tr>
                <th class="w12rem_lg">类型名称 <span class="text-danger">*</span></th>
                <td>
                    <asp:TextBox ID="TypeName" CssClass="form-control max20rem"  runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TypeName" runat="server" ErrorMessage="类型名称不能为空" ForeColor="red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th>类型描述</th>
                <td>
                    <asp:TextBox ID="TypeDesc" CssClass="form-control max20rem"   TextMode="MultiLine" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="tdbg">
                <th>操作</th>
                <td>
                    <asp:Button ID="SavBtn" CssClass="btn btn-info" OnClick="SavBtn_Click" runat="server" Text="添加" />
                    <button type="button" class="btn btn-outline-info" onclick="window.location.href='FlowTypeList.aspx'">返回列表</button>
                </td>
            </tr>
        </table>
	</div>	
    </div>
    <div id="TypeList" runat="server"></div>
</asp:Content>
