<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataListView.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.DataListView" MasterPageFile="~/Manage/I/Safe.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>数据管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<asp:GridView runat="server" ID="EGV" EnableViewState="false" AutoGenerateColumns="true"></asp:GridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>