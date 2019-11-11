<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddTlpClass.aspx.cs" Inherits="ZoomLaCMS.Manage.Design.AddTlpClass" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>模板分类管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("Default.aspx","动力模块"),
        new Bread("TlpClass.aspx","模板分类"),
        new Bread() {url="", text="分类管理",addon="" }}
		)
    %>
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice">
<table class="table table-bordered table-striped sys_tabel">
<tr style="display:none;"><th class="w12rem_lg">所属分类</th><td><asp:TextBox runat="server" ID="PName_T" CssClass="form-control max20rem" disabled="disabled"></asp:TextBox></td></tr>
<tr><th class="w12rem_lg">名称</th><td><ZL:TextBox runat="server" ID="Name_T" CssClass="form-control max20rem" AllowEmpty="false" /></td></tr>
<tr><th>备注</th><td><ZL:TextBox runat="server" ID="Remind_T" CssClass="form-control m50rem_50" TextMode="MultiLine" ></ZL:TextBox></td></tr>
<tr><th>创建时间</th><td><asp:Label runat="server" ID="CDate_L"></asp:Label></td></tr>
<tr><td></td><td>
    <asp:Button runat="server" ID="Save_Btn" Text="保存信息" OnClick="Save_Btn_Click" CssClass="btn btn-info" />
    <a href="TlpClass.aspx" class="btn btn-outline-info">返回列表</a>
 </td></tr>
</table>
</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>