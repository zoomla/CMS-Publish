<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Client.aspx.cs" Inherits="ZoomLaCMS.Plugins.TCPIP.Client" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title></title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<asp:Button runat="server" ID="ConnectToServer_Btn" Text="连结服务端" OnClick="ConnectToServer_Btn_Click" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script"></asp:Content>