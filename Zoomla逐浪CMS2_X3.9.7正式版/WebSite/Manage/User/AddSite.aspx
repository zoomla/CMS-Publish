<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSite.aspx.cs" Inherits="Manage_User_AddSite" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>编辑站点</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/I/Main.aspx","工作台"),
		new Bread("/{manage}/user/UserManage.aspx","用户管理"),
		new Bread("SiteManage.aspx","子站点管理"),
        new Bread() {url="", text="编辑站点",addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
    <table class="table table-striped table-bordered sys_table">
            <tr>
                <th scope="col" class="w12rem_lg">站点名</th>
                <td scope="col"><asp:TextBox ID="Name_T" CssClass="form-control max20rem" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="NameVaid" ControlToValidate="Name_T" runat="server" ErrorMessage="站点名不能为空!" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th scope="col">域名</th>
                <td scope="col"><asp:TextBox ID="Demon_T" runat="server" CssClass="form-control max20rem"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="Demon_T" runat="server" ErrorMessage="域名不能为空!" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th scope="col">IP</th>
                <td scope="col"><asp:TextBox ID="IP_T" runat="server" CssClass="form-control max20rem"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="IP_T" runat="server" ErrorMessage="IP不能为空!" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
				<td></td>
                <td colspan="2">
                    <asp:Button ID="Save_B" runat="server" Text="保存" OnClick="Save_B_Click" CssClass="btn btn-info" />
                    <a href="SiteManage.aspx" class="btn btn-outline-info">取消</a>
                </td>
            </tr>
        </table>
</div></div>
</asp:Content>
