<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InputUser.aspx.cs" Inherits="ZoomLaCMS.Manage.User.InputUser" MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>导入用户</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/I/Main.aspx","工作台"),
	new Bread("","后台管理"),
	new Bread("","用户管理"),
	new Bread("","会员管理"),
	new Bread() {url="InputUser.aspx", text="导入用户",addon="" }}
	)
%>
<asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>
  <div class="container-fluid pr-0">
  <div class="border row sysRow list_choice table-responsive-md">
    <table class="table table-striped table-bordered table-hover sys_table">
      <tr>
        <th colspan="4" class="spacingtitle text-center">会员导入 </th>
      </tr>
      <tr class="tdbg">
        <th class="w12rem_lg"> 选择文件 </th>
        <td align="left" class="style3" colspan="3">
            <ZL:FileUpload  ID="FileUpload1" runat="server"/>
            <%--<asp:FileUpload ID="FileUpload1" runat="server" Width="250px" />--%></td>
      </tr>
      <tr class="tdbg">
        <th> 初始密码</th>
        <td align="left" class="style3" colspan="3"><asp:TextBox ID="userpwd" TextMode="Password" class="form-control max20rem" runat="server"></asp:TextBox>
          <small class="text-muted">*用于定义导入会员的初始密码，如为空则生成默认admin888密码。</small> </td>
		  
      </tr>
    </table>
    <table class="table table-striped table-bordered table-hover">
      <tr class="tdbg">
        <td  colspan="4" align="center"><asp:LinkButton ID="DownFile_L" CssClass="btn btn-outline-info" OnClick="DownFile_L_Click" runat="server">下载模板</asp:LinkButton> <asp:Button ID="Button1" runat="server" Text="导入用户" class="btn btn-outline-info" onclick="Button1_Click" />
          <asp:Button ID="btnCancel" class="btn btn-outline-info" runat="server" Text="返回" Width="70px" OnClientClick="parent.CloseDiaog();return false;" TabIndex="13" /></td>
      </tr>
    </table>
  </div>
  </div>
  <div class="m-2">
  状态： <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
  </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
</asp:Content>