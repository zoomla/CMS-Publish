<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddRole.aspx.cs" Inherits="ZoomLaCMS.Manage.User.AddRole" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>角色管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread( new Bread[] {
new Bread("/{manage}/I/Main.aspx","工作台"),
new Bread("/{manage}/User/AdminManage.aspx","管理员管理"),
new Bread("RoleManage.aspx","角色管理"),
new Bread(){url="", text="添加角色"}
}
) %>
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice table-responsive-md">
	
  <table class="table table-striped table-bordered">
    <tr>
      <th class="text-center" colspan="2">角色管理</th>
    </tr>
    <tr>
      <th class="text-right w12rem_lg"> 角色名</th>
      <td><asp:TextBox ID="txbRoleName" runat="server" class="form-control max20rem" MaxLength="20"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RQ1" runat="server" ControlToValidate="txbRoleName"
                    Display="Dynamic" ErrorMessage="角色名不能为空">*</asp:RequiredFieldValidator>

      </td>
    </tr>
    <tr >
      <th class="text-right">角色描述</th>
      <td><asp:TextBox ID="tbRoleInfo" class="form-control" runat="server" TextMode="MultiLine" Rows="5"></asp:TextBox></td>
    </tr>
      <tr>
          <td></td>
          <td>
              <asp:Button ID="btnSave" runat="server" Text="保存角色" OnClick="btnSave_Click" class="btn btn-info" />
              <a href="RoleManage.aspx" class="btn btn-outline-info">返回角色管理</a>
          </td>
      </tr>
  </table>
</div>
</div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>

