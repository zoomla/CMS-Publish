<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MonitorAdd.aspx.cs" Inherits="ZoomLaCMS.Manage.Device.Monitor.MonitorAdd" MasterPageFile="~/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>设备管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="BreadDiv" class="container-fluid mysite">
        <div class="row">
            <ol id="BreadNav" class="breadcrumb navbar-fixed-top">
                <li><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
                <li><a href='Default.aspx'>设备列表</a></li>
                <li class="active"><a href='<%=ZoomLa.BLL.SafeSC.RawUrl %>'>设备管理</a></li>
            </ol>
        </div>
    </div>
<table class="table table-bordered table-striped">
    <tr><td class="td_m">设备别名</td><td>
        <ZL:TextBox runat="server" ID="Alias_T" AllowEmpty="false" class="form-control text_300"/>
                                  </td></tr>
    <tr><td>域名或IP</td><td><ZL:TextBox runat="server" ID="Domain_T" AllowEmpty="false" class="form-control text_300"/></td></tr>
    <tr><td>端口</td><td><ZL:TextBox runat="server" ID="M_Port_T" AllowEmpty="false" class="form-control text_300" ValidType="IntPostive"/></td></tr>
    <tr><td>用户名</td><td><ZL:TextBox runat="server" ID="M_User_T" AllowEmpty="false" class="form-control text_300"/></td></tr>
    <tr><td>密码</td><td><ZL:TextBox runat="server" ID="M_Pwd_T" AllowEmpty="false" class="form-control text_300"/></td></tr>
    <tr><td>通道号</td><td><ZL:TextBox runat="server" ID="M_Channel_T" AllowEmpty="false" ValidType="IntPostive" class="form-control text_300"/></td></tr>
    <tr><td></td><td>
        <asp:Button runat="server" ID="Save_Btn" Text="保存信息" OnClick="Save_Btn_Click" class="btn btn-info"/>
        <a href="Default.aspx" class="btn btn-default">返回列表</a>
                 </td></tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>