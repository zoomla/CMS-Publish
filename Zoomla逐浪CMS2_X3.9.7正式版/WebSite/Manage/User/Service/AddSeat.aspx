<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSeat.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Service.AddSeat"  MasterPageFile="~/Manage/I/Index.master" %>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <link type="text/css" href="/dist/css/bootstrap-switch.min.css"  rel="stylesheet"/>
    <script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
    <title>客服信息</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("","后台管理"),
        new Bread("","客服通"),
        new Bread("ServiceSeat.aspx","客服列表"),
        new Bread() {url="", text="客服管理",addon="" }}
		)
    %>
  <div class="container-fluid pr-0">
  <div class="row sysRow list_choice table-responsive-md">
    <table class="table table-striped table-bordered table-hover sys_table">
      <tr>
        <th scope="col" class="w12rem_lg">客服名称</th>
        <td scope="col"><asp:TextBox ID="SeatName_T"  runat="server" class="form-control max20rem"></asp:TextBox>
			<small class="text-muted">显示给用户的名称</small>
            <asp:RequiredFieldValidator runat="server" ID="R3" ControlToValidate="SeatName_T" ForeColor="Red" ErrorMessage="客服名称不能为空" Display="Dynamic" />
        </td>
      </tr>
      <tr>
        <th>用户名</th>
        <td>
            <asp:TextBox ID="User_T" runat="server" CssClass="form-control max20rem"></asp:TextBox> 
			<small class="text-muted">如用户不存在,则会自动新建,新客服密码默认123456</small>
            <asp:RequiredFieldValidator runat="server" ID="R1" ControlToValidate="User_T" ForeColor="Red" ErrorMessage="用户名不能为空" Display="Dynamic" />
        </td>
      </tr>
        <tr>
            <th>客服头像</th>
            <td><ZL:SFileUp runat="server" id="SFileUp" /></td>
        </tr>
       <tr>
        <th>默认客服</th>
        <td><input runat="server" type="checkbox" id="RadioButtonList1" class="switchChk"/></td>
      </tr>
      <tr>
        <th>显示位置</th>
        <td><asp:DropDownList ID="ddlIndex" runat="server" class="btn btn-default dropdown-toggle"> </asp:DropDownList></td>
      </tr>
      <tr class="tdbg">
        <td></td>
        <td><asp:Button ID="Button1" class="btn btn-info" runat="server" Text="提 交" OnClick="Button1_Click" />
            <a href="ServiceSeat.aspx" class="btn btn-outline-info">返回</a></td>
      </tr>
    </table>
  </div>
  </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>