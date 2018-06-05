<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserDayManage.aspx.cs" Inherits="ZoomLaCMS.Manage.User.UserDayManage" MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title><%=Resources.L.用户节日管理 %></title>
	<%=Call.SetBread(new Bread[] {
        new Bread("/Admin/Main.aspx","工作台"),
        new Bread("/{manage}/User/AdminManage.aspx","用户管理"),
		new Bread("/{manage}/User/UserManage.aspx","会员管理"),
        new Bread() {url="", text="用户节日管理",addon= "" }}
        )
    %>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
  <table class="table table-striped table-bordered table-hover">
    <tr class="tdbgleft d-flex flex-row-reverse">
      <td> <%=Resources.L.选择日期 %>：
        

        <asp:TextBox ID="txtdate" runat="server" class="form-control search_input" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd' });"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="<%$Resources:L,搜索 %>" class="btn btn-outline-secondary"  onclick="Button1_Click"/></td>
    </tr>
  </table>
  <div class="container-fluid pr-0">
  <div class="row sysRow">
  <table class="table table-striped table-bordered table-hover">
    <tr class="tdbg">
      <th align="center" class="spacingtitle text-center" colspan="7"> <%=Resources.L.用户节日管理 %> </th>
    </tr>
    <tr class="tdbgleft table_tr">
      <th scope="col">ID</th>
      <th scope="col"><%=Resources.L.时间 %></th>
      <th scope="col"><%=Resources.L.节日标题 %></th>
      <th scope="col"><%=Resources.L.用户 %></th>
      <th scope="col"><%=Resources.L.邮件发送状态 %></th>
      <th scope="col"><%=Resources.L.短信发送状态 %></th>
      <th scope="col"><%=Resources.L.操作 %></th>
    </tr>
    <ZL:ExRepeater ID="RPT" runat="server" PagePre="<tr><td colspan='7' class='text-center'><input type='checkbox' id='CheckAll' />" PageEnd="</td></tr>">
      <ItemTemplate>
        <tr class="tdbg" onmouseover="this.className='tdbgmouseover'" onmouseout="this.className='tdbg'"
                style="text-align: center;" height="23px">
          <td width="200px"><%#Eval("id") %></td>
          <td><%#Eval("D_date","{0:d}")%></td>
          <td><%#Eval("D_name")%></td>
          <td><%#Getusername(Eval("d_userid","{0}")) %></td>
          <td><%#Eval("D_mail","已发送 {0} 次")%></td>
          <td><%#Eval("D_mobile", "已发送 {0} 次")%></td>
          <td><a href="?menu=delete&id=<%#Eval("id") %>" onclick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');"class="option_style"><i class="zi zi_trashalt" title="<%=Resources.L.删除 %>"></i><%=Resources.L.删除 %></a></td>
        </tr>
      </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </ZL:ExRepeater>
  </table>
  </div>
  </div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
</asp:Content>
