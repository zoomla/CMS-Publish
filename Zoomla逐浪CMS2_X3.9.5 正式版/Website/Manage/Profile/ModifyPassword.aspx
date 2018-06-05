<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModifyPassword.aspx.cs" Inherits="ZoomLaCMS.Manage.Profile.ModifyPassword" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title><%=Resources.L.修改密码 %></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("../User/UserManage.aspx","用户管理"),
        new Bread() {url="", text="修改密码",addon="" }}
		)
    %>
  <div class="container-fluid pr-0">
  <div class="row sysRow list_choice">
    <table class="table table-bordered table-hover sys_table">
        <tr>
            <th class="w12rem_lg"><%=Resources.L.当前管理员 %></th>
            <td>
                <asp:Label ID="AdminName_L" runat="server"></asp:Label>
            </td>
        </tr>
      <tr>
        <th><%=Resources.L.输入旧密码 %></th>
        <td><asp:TextBox ID="TxtOldPassword" class="form-control max20rem"  runat="server" autofocus="autofocus" TextMode="Password" onkeydown="return GetEnterCode('focus','TxtPassword');"/>
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="TxtOldPassword" runat="server" ErrorMessage="<%$Resources:L,原密码不能为空 %>" Display="Dynamic" /></td>
      </tr>
      <tr>
        <th><%=Resources.L.输入新密码 %></th>
        <td><asp:TextBox ID="TxtPassword" class="form-control max20rem" runat="server" TextMode="Password" onkeydown="return GetEnterCode('focus','TxtPassword2');"/>
          <asp:RequiredFieldValidator ID="ValrUserPassword" ControlToValidate="TxtPassword"
                    runat="server" ErrorMessage="<%$Resources:L,新密码不能为空 %>" Display="Dynamic" />
          <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TxtPassword" ErrorMessage="<%$Resources:L,管理员密码字符数要在6到18之间 %>" ValidationExpression="\S{6,18}" SetFocusOnError="True" Display="None"></asp:RegularExpressionValidator>
          <asp:CompareValidator ID="VNotEquel" runat="server" Operator="NotEqual" ControlToValidate="TxtPassword" ControlToCompare="TxtOldPassword" ErrorMessage="<%$Resources:L,新密码不能与旧密码一致 %>"></asp:CompareValidator>
      </tr>
      <tr>
        <th><%=Resources.L.重复新密码 %></th>
        <td><asp:TextBox ID="TxtPassword2" class="form-control max20rem" runat="server" TextMode="Password" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="TxtPassword2"
                    runat="server" ErrorMessage="<%$Resources:L,确认密码不能为空 %>" Display="Dynamic" />
          <asp:CompareValidator ID="CompareValidator1" ControlToValidate="TxtPassword2" ControlToCompare="TxtPassword" ErrorMessage="<%$Resources:L,新密码和确认密码不一致 %>" runat="server" /></td>
      </tr>
      <tr>
        <td></td><td><asp:Button ID="BtnSubmit" runat="server" class="btn btn-info" Text="<%$Resources:L,修改 %>" OnClick="BtnSubmit_Click" />
            <input type="reset" value="<%:Resources.L.重写 %>" class="btn btn-outline-info" />
          <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" /></td>
      </tr>
    </table>
  </div>
  </div>
</asp:Content>
