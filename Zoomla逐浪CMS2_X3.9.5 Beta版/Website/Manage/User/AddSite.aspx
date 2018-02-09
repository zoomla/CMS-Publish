<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSite.aspx.cs" Inherits="Manage_User_AddSite" MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>编辑站点</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered">
            <tr>
                <td class="text-right td_m">站点名:</td>
                <td><asp:TextBox ID="Name_T" CssClass="form-control text_md" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="NameVaid" ControlToValidate="Name_T" runat="server" ErrorMessage="站点名不能为空!" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="text-right">域名:</td>
                <td><asp:TextBox ID="Demon_T" runat="server" CssClass="form-control text_md"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="Demon_T" runat="server" ErrorMessage="域名不能为空!" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="text-right">IP:</td>
                <td><asp:TextBox ID="IP_T" runat="server" CssClass="form-control text_md"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="IP_T" runat="server" ErrorMessage="IP不能为空!" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="text-center">
                    <asp:Button ID="Save_B" runat="server" Text="保存" OnClick="Save_B_Click" CssClass="btn btn-primary" />
                    <a href="SiteManage.aspx" class="btn btn-primary">取消</a>
                </td>
            </tr>
        </table>
</asp:Content>
