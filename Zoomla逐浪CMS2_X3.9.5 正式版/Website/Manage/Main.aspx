<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="ZoomLaCMS.Manage.Main" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>快速导航</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<link rel="stylesheet" href="/dist/css/animate.min.css"/>
<div class="row main_nav animated" runat="server" id="navDiv">
<asp:Literal runat="server" ID="model_Lit" EnableViewState="false"></asp:Literal>
</div>
<asp:Literal runat="server" ID="page_Lit" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style>
body {  height: 100%; background: rgba(0, 114, 188, 0.02);}
</style>
</asp:Content>