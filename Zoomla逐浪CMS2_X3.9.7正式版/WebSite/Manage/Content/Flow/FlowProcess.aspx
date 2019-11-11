<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FlowProcess.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Flow.FlowProcess" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>步骤管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/I/Main.aspx","工作台"),
		new Bread("/{manage}/Config/SiteOption.aspx","系统设置"),
        new Bread("FlowManager.aspx","流程管理"),
        new Bread() {url="", text="添加步骤",addon="" }}
		)
    %>
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice">
    <table class="table table-striped table-bordered table-hover sys_table">
        <tr>
            <th colspan="2" class="text-center">流程步骤</th>
        </tr>
        <tr>
            <th  scope="col"class="w12rem_lg">所属流程</th>
            <td scope="col">
                <label id="lblFlow" runat="server"></label>
            </td>
        </tr>
        <tr>
            <th>步骤名称 <label class="text-danger">*</label></th>
            <td>
                <asp:TextBox ID="txtPName" class="form-control max20rem" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red"
                    ControlToValidate="txtPName" ErrorMessage="流程步骤名称不能为空"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th>步骤描述</th>
            <td>
                <textarea  id="PDepcit" runat="server" class="form-control m50rem_50" cols="6"></textarea>
            </td>
        </tr>
<%--        <tr>
            <th>可以执行本步骤的角色</th>
            <td>
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataTextField="RoleName" DataValueField="RoleID" RepeatColumns="4" RepeatLayout="Flow" TabIndex="2"></asp:CheckBoxList>
            </td>
        </tr>--%>
        <tr>
            <th>步骤序列</th>
            <td>
                <input id="txtPCode" class="form-control w12rem_lg" disabled="disabled" runat="server" /></td>
        </tr>
        <tr>
            <th>可执行本步骤的状态码</th>
            <td>
                <asp:TextBox ID="needCode_Text" class="form-control max20rem" runat="server" />
                <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="只能输入数字" Type="Integer"
                    ControlToValidate="needCode_Text" MaximumValue="900000000" MinimumValue="0"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <th>审核通过操作名 <label class="text-danger">*</label></th>
            <td>
                <asp:TextBox ID="txtPPassName" class="form-control max20rem" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPName"  ForeColor="Red" ErrorMessage="审核通过的操作名不能为空 "></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th>审核通过的状态码</th>
            <td>
                <asp:DropDownList ID="ddlPassCode" runat="server" DataSourceID="odsPassState" CssClass="form-control max20rem" DataTextField="StateName" DataValueField="StateCode"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <th>未通过审核的操作名 <label class="text-danger">*</label></th>
            <td>
                <asp:TextBox ID="txtPNoPassName" class="form-control" runat="server" CssClass="form-control max20rem"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red"
                    ControlToValidate="txtPNoPassName" ErrorMessage="未通过审核的操作名不能为空 "></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <th>未通过审核的状态码</th>
            <td>
                <asp:DropDownList ID="ddlNoPassCode" CssClass="form-control max20rem" runat="server" DataSourceID="odsNoPassState"
                    DataTextField="StateName" DataValueField="StateCode">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="btnSave" class="btn btn-info" runat="server" Text="保存步骤" OnClick="btnSave_Click" />
 <a href="FlowProcessManager.aspx?id=<%:FlowID %>" class="btn btn-outline-info">返回列表</a>
                           </td>
        </tr>
    </table>
	</div></div>
    <asp:ObjectDataSource ID="odsAuditingState" runat="server" SelectMethod="GetExecutableState" TypeName="ZoomLa.BLL.B_AuditingState"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsPassState" runat="server" SelectMethod="GetPassState" TypeName="ZoomLa.BLL.B_AuditingState"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsNoPassState" runat="server" SelectMethod="GetNoPassState" TypeName="ZoomLa.BLL.B_AuditingState"></asp:ObjectDataSource>
</asp:Content>
