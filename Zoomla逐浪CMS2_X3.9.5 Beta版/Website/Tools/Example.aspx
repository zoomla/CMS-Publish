<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Example.aspx.cs" Inherits="ZoomLaCMS.Tools.Example" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
 <asp:GridView runat="server" ID="EGV" AutoGenerateColumns="true">

 </asp:GridView>
    <asp:TextBox runat="server" ID="ClientDate_T" CssClass="form-control"></asp:TextBox>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
    <script>
        $("#ClientDate_T").attr("placeholder", "tes");
    </script>
</asp:Content>
