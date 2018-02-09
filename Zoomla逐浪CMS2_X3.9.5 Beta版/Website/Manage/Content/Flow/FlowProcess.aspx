<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FlowProcess.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Flow.FlowProcess" MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>步骤管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <th colspan="2" class="text-center">
                <strong>流程步骤</strong>
            </th>
        </tr>
        <tr>
            <td class="td_l">
                <strong>所属流程：</strong>
            </td>
            <td>
                <label id="lblFlow" runat="server"></label>
            </td>
        </tr>
        <tr>
            <td>
                <strong>步骤名称：</strong>
            </td>
            <td>
                <asp:TextBox ID="txtPName" class="form-control text_300" runat="server"></asp:TextBox><label style="color: Red">*</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red"
                    ControlToValidate="txtPName" ErrorMessage="流程步骤名称不能为空"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <strong>步骤描述：</strong>
            </td>
            <td>
                <textarea style="width: 500px; height: 120px;" id="PDepcit" runat="server" class="form-control" cols="6"></textarea>
            </td>
        </tr>
<%--        <tr>
            <td>
                <strong>可以执行本步骤的角色：</strong>
            </td>
            <td>
                <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataTextField="RoleName" DataValueField="RoleID" RepeatColumns="4" RepeatLayout="Flow" TabIndex="2"></asp:CheckBoxList>
            </td>
        </tr>--%>
        <tr>
            <td><strong>步骤序列：</strong></td>
            <td>
                <input id="txtPCode" class="form-control text_xs" disabled="disabled" runat="server" /></td>
        </tr>
        <tr>
            <td>
                <strong>可执行本步骤的状态码：</strong>
            </td>
            <td>
                <asp:TextBox ID="needCode_Text" class="form-control text_300" runat="server" />
                <asp:RangeValidator ID="RangeValidator2" runat="server" ErrorMessage="只能输入数字" Type="Integer"
                    ControlToValidate="needCode_Text" MaximumValue="900000000" MinimumValue="0"></asp:RangeValidator>
            </td>
        </tr>
        <tr>
            <td><strong>审核通过操作名：</strong></td>
            <td>
                <asp:TextBox ID="txtPPassName" class="form-control text_300" runat="server"></asp:TextBox><label style="color: Red">*</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPName"  ForeColor="Red" ErrorMessage="审核通过的操作名不能为空 "></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <strong>审核通过的状态码：</strong>
            </td>
            <td>
                <asp:DropDownList ID="ddlPassCode" runat="server" DataSourceID="odsPassState" CssClass="form-control text_300" DataTextField="StateName" DataValueField="StateCode"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style2">
                <strong>未通过审核的操作名：</strong>
            </td>
            <td class="style3">
                <asp:TextBox ID="txtPNoPassName" class="form-control" runat="server" CssClass="form-control text_300"></asp:TextBox><label style="color: Red">*</label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ForeColor="Red"
                    ControlToValidate="txtPNoPassName" ErrorMessage="未通过审核的操作名不能为空 "></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <strong>未通过审核的状态码：</strong>
            </td>
            <td>
                <asp:DropDownList ID="ddlNoPassCode" CssClass="form-control text_300" runat="server" DataSourceID="odsNoPassState"
                    DataTextField="StateName" DataValueField="StateCode">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="btnSave" class="btn btn btn-primary" runat="server" Text="保存步骤" OnClick="btnSave_Click" />
 <a href="FlowProcessManager.aspx?id=<%:FlowID %>" class="btn btn-default">返回列表</a>
                           </td>
        </tr>
    </table>
    <asp:ObjectDataSource ID="odsAuditingState" runat="server" SelectMethod="GetExecutableState" TypeName="ZoomLa.BLL.B_AuditingState"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsPassState" runat="server" SelectMethod="GetPassState" TypeName="ZoomLa.BLL.B_AuditingState"></asp:ObjectDataSource>
    <asp:ObjectDataSource ID="odsNoPassState" runat="server" SelectMethod="GetNoPassState" TypeName="ZoomLa.BLL.B_AuditingState"></asp:ObjectDataSource>
</asp:Content>
