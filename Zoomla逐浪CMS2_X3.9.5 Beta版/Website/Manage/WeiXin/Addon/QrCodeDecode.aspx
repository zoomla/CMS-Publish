<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QrCodeDecode.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.QrCodeDecode" MasterPageFile="~/Manage/I/Default.master" %>

<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagName="SFile" TagPrefix="ZL" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>二维解码</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="panel">
        <ZL:SFile FType="Img" ID="QrCode_SF" runat="server" />
        <asp:Button ID="Decode_B" runat="server" CssClass="btn btn-info" Text="解码" Style="margin: 5px 0;" OnClick="Decode_B_Click" />
        <div>
            <asp:TextBox ID="EncodeData_T" runat="server" TextMode="MultiLine" CssClass="form-control" Width="500" Height="180" ReadOnly="true"></asp:TextBox>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
