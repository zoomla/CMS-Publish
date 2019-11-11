<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MonitorAdd.aspx.cs" Inherits="ZoomLaCMS.Manage.Device.Monitor.MonitorAdd" MasterPageFile="~/Manage/I/Index.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>设备管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("Default.aspx","设备列表"),
        new Bread() {url="/{manage}/Device/Monitor/MonitorAdd.aspx", text="设备管理",addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
<table class="table table-bordered table-striped sys_table">
    <tr><th class="w12rem_lg">设备别名</th><td>
        <ZL:TextBox runat="server" ID="Alias_T" AllowEmpty="false" class="form-control max20rem"/>
                                  </td></tr>
    <tr><th>域名或IP</th><td><ZL:TextBox runat="server" ID="Domain_T" AllowEmpty="false" class="form-control max20rem"/></td></tr>
    <tr><th>端口</th><td><ZL:TextBox runat="server" ID="M_Port_T" AllowEmpty="false" class="form-control max20rem" ValidType="IntPostive"/></td></tr>
    <tr><th>用户名</th><td><ZL:TextBox runat="server" ID="M_User_T" AllowEmpty="false" class="form-control max20rem"/></td></tr>
    <tr><th>密码</th><td><ZL:TextBox runat="server" ID="M_Pwd_T" AllowEmpty="false" class="form-control max20rem"/></td></tr>
    <tr><th>通道号</th><td><ZL:TextBox runat="server" ID="M_Channel_T" AllowEmpty="false" ValidType="IntPostive" class="form-control max20rem"/></td></tr>
    <tr><td></td><td>
        <asp:Button runat="server" ID="Save_Btn" Text="保存信息" OnClick="Save_Btn_Click" class="btn btn-info"/>
        <a href="Default.aspx" class="btn btn-outline-info">返回列表</a>
                 </td></tr>
</table>
</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>