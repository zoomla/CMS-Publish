<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDay.aspx.cs" Inherits="ZoomLaCMS.Manage.User.UserDay" MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title><%=Resources.L.节日提醒 %></title>
	<%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/User/AdminManage.aspx","用户管理"),
		new Bread("/{manage}/User/UserManage.aspx","会员管理"),
        new Bread() {url="", text="手机节日提醒",addon= "" }}
        )
    %>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container-fluid pr-0 mt_3rem">
<div class="row sysRow">
  <table class="table table-striped table-bordered table-hover">
    <tr class="tdbg">
      <td align="center" class="spacingtitle" colspan="2"><%=Resources.L.信息统计 %> </td>
    </tr>
    <tr>
      <td class="w12rem_lg"><%=Resources.L.短信余额 %></td>
      <td><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr class="tdbg">
      <td><%=Resources.L.发送次数 %> </td>
      <td><asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
    </tr>
  </table>
    <table class="table table-striped table-bordered table-hover">
      <tr class="tdbg">
        <td align="center" class="spacingtitle" colspan="2"><%=Resources.L.节日提醒 %> </td>
      </tr>
      <tr>
        <td class="w12rem_lg"> <%=Resources.L.选择日期 %> </td>
        <td>

            <asp:TextBox ID="SendDate" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd' })" runat="server" class="form-control" style="max-width:200px;"></asp:TextBox>
        </td>
      </tr>
      <tr class="tdbg">
        <td><%=Resources.L.发送条件 %></td>
        <td><asp:CheckBoxList ID="SendDay" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="0" Text="<%$Resources:L,今天 %>" Selected="True"></asp:ListItem>
            <asp:ListItem Value="1" Text="<%$Resources:L,明天 %>" Selected="True"></asp:ListItem>
          </asp:CheckBoxList></td>
      </tr>
      <tr class="tdbg">
        <td><%=Resources.L.发送目标 %></td>
        <td><asp:CheckBoxList ID="Sendto" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="0" Text="<%$Resources:L,邮箱 %>" Selected="True"></asp:ListItem>
            <asp:ListItem Value="1" Text="<%$Resources:L,手机短信 %>" Selected="True"></asp:ListItem>
          </asp:CheckBoxList></td>
      </tr>
      <tr class="tdbg">
        <td colspan="2" align="center"><asp:Button ID="Button1" runat="server" Text="<%$Resources:L,发送 %>" class="btn btn-outline-info"  onclick="Button1_Click" />
          <asp:Button ID="Button2" runat="server" Text="<%$Resources:L,取消 %>" class="btn btn-outline-info" /></td>
      </tr>
</table>
</div>
</div> 
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/Drag.js"></script>
    <script type="text/javascript" src="/js/Dialog.js"></script>
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
</asp:Content>
