<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TouClickAdd.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.Third.TouClickAdd" MasterPageFile="~/Manage/I/Index.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>接口配置</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/I/Main.aspx","工作台"),
		new Bread("/{manage}/Config/SiteOption.aspx","系统设置"),
        new Bread() {url="", text="接口配置",addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
<table class="table table-bordered table-striped sys_table">
    <tr><th class="w12rem_lg">平台名称</th>
	<td>
	<div class="input-group mb-3">
	  <input type="text" class="form-control max20rem disabled" value="点触验证码"/>
	  <div class="input-group-append">
		<a href="https://www.touclick.com/" target="_blank" class="btn btn-info"><i class="zi zi_random"></i> 前往申请</a>
	  </div>
	</div>
	
	</td></tr>
    <tr><th>公钥</th><td>
        <asp:TextBox runat="server" ID="PubKey_T" class="form-control max20rem" />
                                </td></tr>
    <tr><th>私钥</th><td>
        <asp:TextBox runat="server" ID="PriKey_T" class="form-control max20rem" />
                   </td></tr>
    <tr><td></td><td><asp:Button runat="server" ID="Save_Btn" class="btn btn-outline-info" Text="保存配置" OnClick="Save_Btn_Click"/></td></tr>
</table>
</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>