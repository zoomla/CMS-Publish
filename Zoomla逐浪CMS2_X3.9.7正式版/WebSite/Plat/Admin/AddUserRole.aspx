<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUserRole.aspx.cs" Inherits="ZoomLaCMS.Plat.Admin.AddUserRole" MasterPageFile="~/Plat/Main.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>权限信息</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">

<div class="container platcontainer">
<div class="child_head"><span class="child_head_span1"></span> <span class="child_head_span2">角色管理</span></div>
    <table class="table table-bordered table-hover table-striped sys_table table-responsive-md">
        <tr>
          <th class="w12rem_lg">角色名称：</th>
          <td><asp:TextBox CssClass="form-control text_300" ID="RoleName_T" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
          <th>备注：</th>
          <td><asp:TextBox CssClass="form-control text_300" ID="RoleDesc_T" TextMode="MultiLine" runat="server" style="height:100px;"></asp:TextBox></td>
        </tr>
        <tr>
            <th></th>
          <td><asp:Button runat="server" Text="添加角色" ID="Save_Btn" CssClass="btn btn-outline-info" OnClick="Save_Btn_Click" /></td>
        </tr>
    </table>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>
