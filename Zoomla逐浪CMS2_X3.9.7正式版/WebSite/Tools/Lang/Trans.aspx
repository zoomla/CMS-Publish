<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="Trans.aspx.cs" Inherits="ZoomLaCMS.Tools.Lang.Trans" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>自动转译填充</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="container">
        <asp:Button runat="server" ID="ToFr" Text="填充法文" OnClick="ToFr_Click" OnClientClick="return confirm('确定要进行该操作吗');" />
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">

</asp:Content>