<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Permissionadd.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Permissionadd"  MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>角色管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/I/Main.aspx","工作台"),
	new Bread("/{manage}/User/UserManage.aspx","用户管理"),
    new Bread("PermissionInfo.aspx","角色列表"),
	new Bread() {url="", text="角色管理"}}
	)
%>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
  <table class="table table-striped table-bordered sys_table">
    <tr>
      <th class="w12rem_lg">角色名称</th>
      <td><asp:TextBox class="form-control max20rem" ID="txtRoleName" runat="server" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRoleName" ErrorMessage="角色名不能为空!"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
      <th>优先级别</th>
      <td><asp:TextBox class="form-control max20rem" ID="txtPrecedence" runat="server">0</asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPrecedence" Display="Dynamic" ErrorMessage="格式不正确!" ValidationExpression="^-?\d+$"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPrecedence" Display="Dynamic" ErrorMessage="不能为空!"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
      <th>角色说明</th>
      <td><asp:TextBox class="form-control m50rem_50" ID="txtInfo" runat="server"  TextMode="MultiLine" /></td>
    </tr>
    <tr>
      <th>是否启用</th>
      <td><asp:RadioButtonList ID="txtIsTrue" runat="server" RepeatDirection="Horizontal">
          <asp:ListItem Selected="True" Value="1">启用</asp:ListItem>
          <asp:ListItem Value="0">停用</asp:ListItem>
        </asp:RadioButtonList></td>
    </tr>
      <tr>
          <td></td>
          <td>
              <asp:Button ID="Button1" runat="server" Text="添加角色" OnClick="Button1_Click" class="btn btn-outline-info" />
              <a href="PermissionInfo.aspx" class="btn btn-outline-info">返回列表</a>
          </td>
      </tr>
  </table>
  </div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
