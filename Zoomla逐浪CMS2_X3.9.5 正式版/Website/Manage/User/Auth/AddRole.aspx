<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddRole.aspx.cs" Inherits="ZoomLaCMS.Manage.User.AddRole" MasterPageFile="~/Manage/I/Index.master" %>
<%@ Register TagPrefix="ZL" TagName="UserGuide" Src="~/Manage/I/ASCX/UserGuide.ascx" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加角色</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread( new Bread[] {
new Bread("/{manage}/I/Main.aspx","工作台"),
new Bread("/{manage}/User/UserManage.aspx","用户管理"),
new Bread("/{manage}/User/AdminManage.aspx","管理员管理"),
new Bread("RoleManage.aspx","角色管理"),
new Bread(){url="", text="添加角色"}
}
) %>
    <!--<div id="nodeNav" class="col-lg-2 col-md-2 col-sm-2 col-xs-12 divBorder" style="padding:0 0 0 0;">
    <ZL:UserGuide runat="server" />
    </div>-->
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice table-responsive-md">
        <asp:HiddenField runat="server" ID="Literal1_Hid" Value="添加角色" />
	
  <table class="table table-striped table-bordered table-hover sys_table" align="center">
    <tr>
      <th class="spacingtitle text-center" colspan="2"><asp:Literal ID="LblTitle" Text="添加角色"  runat="Server"></asp:Literal></th>
    </tr>
    <tr class="tdbg">
      <th class="text-right w12rem_lg"> 角色名</th>
      <td><asp:TextBox ID="txbRoleName" runat="server" onchange="CheckRoleName()" class="form-control max20rem"></asp:TextBox> <span id="rolename_span" class="text-danger"></span>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txbRoleName"
                    Display="Dynamic" ErrorMessage="角色名不能为空">*</asp:RequiredFieldValidator>
        <asp:CustomValidator ID="cvRole" runat="server" ControlToValidate="txbRoleName" Display="Dynamic" ErrorMessage="角色名已经存在" OnServerValidate="CustomValidator1_ServerValidate"  Visible="False">*</asp:CustomValidator></td>
    </tr>
    <tr class="tdbg">
      <th class="text-right">角色描述</th>
      <td><asp:TextBox ID="tbRoleInfo" class="form-control max20rem" runat="server" TextMode="MultiLine"></asp:TextBox></td>
    </tr>
  </table>
</div>
<div class="sysBtline"> 
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    <asp:Button ID="btnSave" runat="server" Text="保存角色"  OnClick="Button2_Click" class="btn btn-info" />
    <asp:Button ID="btnBack" class="btn btn-outline-info"  runat="server" Text="返回角色管理"  OnClientClick="location.href='RoleManage.aspx';return false;" />
    <asp:HiddenField ID="EditRoleName_Hid" runat="server" />
</div>
</div>
<script>
    function CheckRoleName() {
        if ($("#EditRoleName_Hid").val() != "" && $("#txbRoleName").val() == $("#EditRoleName_Hid").val())
        { return; }
        $.post('AddRole.aspx', { action: 'checkname', name: $("#txbRoleName").val() }, function (data) {
            if (data == "-1") {
                $("#rolename_span").text('角色名不能重复!');
                $("#btnSave").attr('disabled', 'disabled');
            } else {
                $("#rolename_span").text('');
                $("#btnSave").removeAttr('disabled');
            }
        });
    }
</script>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>

