<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Server.aspx.cs" Inherits="ZoomLaCMS.Plugins.TCPIP.Server" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>服务端监听</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<asp:Button runat="server" ID="Begin_Btn" Text="开始监听" OnClick="Begin_Btn_Click" />
<asp:Button runat="server" ID="SendMsgToClient_Btn" Text="发送信息给客户端" OnClick="SendMsgToClient_Btn_Click" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script"></asp:Content>