<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayWeiXinAPP.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.PayWeiXinAPP"  MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>微信APP支付配置</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/WeiXin/Home.aspx","移动微信"),				
        new Bread() {url="", text="APP微信支付",addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
<table class="table table-bordered table-striped sys_table">
    <tr><th class="w12rem_lg">APPID</th><td><ZL:TextBox runat="server" ID="APPID_T" CssClass="form-control max20rem" AllowEmpty="false" /></td></tr>
    <tr><th>APPSecret</th><td><ZL:TextBox runat="server" ID="APPSecret_T" CssClass="form-control max20rem" AllowEmpty="false" /></td></tr>
    <tr><th>商户号</th><td><ZL:TextBox runat="server" ID="MCHID_T" CssClass="form-control max20rem" AllowEmpty="false" /></td></tr>
    <tr><th>商户Key</th><td><ZL:TextBox runat="server" ID="Key_T" CssClass="form-control max20rem" AllowEmpty="false" /></td></tr>
    <tr><th></th><td><asp:Button runat="server" ID="Save_Btn" Text="保存信息" OnClick="Save_Btn_Click" CssClass="btn btn-info" /></td></tr>
</table>
</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>