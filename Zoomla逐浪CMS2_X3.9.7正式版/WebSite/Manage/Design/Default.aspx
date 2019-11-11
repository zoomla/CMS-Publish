<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Manage.Design.Default" MasterPageFile="~/Manage/I/index.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head"><title>动力中心</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content"></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/I/Main.aspx","工作台"),
		new Bread("Default.aspx","动力模块"),
        new Bread() {url="", text="动力中心",addon="" }}
		)
    %>
	<div class="list_choice"></div>
</asp:Content>
