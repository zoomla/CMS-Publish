<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Permissionadd.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Permissionadd"  MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>角色管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
  <table class="table table-striped table-bordered">
    <tr>
      <td class="td_m"><strong>角色名称：</strong></td>
      <td><asp:TextBox class="form-control text_300" ID="txtRoleName" runat="server" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRoleName" ErrorMessage="角色名不能为空!"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
      <td><strong>优先级别：</strong></td>
      <td><asp:TextBox class="form-control text_300" ID="txtPrecedence" runat="server">0</asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtPrecedence" Display="Dynamic" ErrorMessage="格式不正确!" ValidationExpression="^-?\d+$"></asp:RegularExpressionValidator>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPrecedence" Display="Dynamic" ErrorMessage="不能为空!"></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
      <td><strong>角色说明：</strong></td>
      <td><asp:TextBox class="form-control m715-50" ID="txtInfo" runat="server" style="height:100px;" TextMode="MultiLine" /></td>
    </tr>
    <tr>
      <td><strong>是否启用：</strong></td>
      <td><asp:RadioButtonList ID="txtIsTrue" runat="server" RepeatDirection="Horizontal">
          <asp:ListItem Selected="True" Value="1">启用</asp:ListItem>
          <asp:ListItem Value="0">停用</asp:ListItem>
        </asp:RadioButtonList></td>
    </tr>
      <tr>
          <td></td>
          <td>
              <asp:Button ID="Button1" runat="server" Text="添加角色" OnClick="Button1_Click" class="btn btn-primary" />
              <a href="PermissionInfo.aspx" class="btn btn-primary">返回列表</a>
          </td>
      </tr>
  </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
