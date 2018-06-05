<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetPageHtml.aspx.cs" Inherits="ZoomLaCMS.Manage.Template.GetPageHtml" ValidateRequest="false" MasterPageFile="~/Manage/I/Index.master"  %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>源码查看器</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("","工作台"),
        new Bread("","系统设置"),						
        new Bread("","模板风格"),						
        new Bread() {url="", text="源码探测速",addon="" }}
		)
    %>
	<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
    <span class="float-left ml-2">目标网址：</span>
	<div class="float-left">
	<div class="input-group mb-3">
	  <asp:TextBox ID="UrlText" CssClass="form-control max20rem" runat="server">https://v.z01.com</asp:TextBox>
	  <div class="input-group-append">
		<asp:Button runat="server" ID="GetHtml_Btn" class="btn btn-info" OnClick="GetHtml_Btn_Click" Text="获取源码"/>
	  </div>
	</div>
	</div>
    <br>
    <asp:TextBox ID="ContentHtml" runat="server" TextMode="MultiLine" CssClass="form-control GetPageHtml_con" Style=""> </asp:TextBox>
	</div>
	</div>
</asp:Content>
