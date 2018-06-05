<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Example.aspx.cs" Inherits="ZoomLaCMS.Tools.Example" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<asp:GridView runat="server" ID="EGV" AutoGenerateColumns="true"></asp:GridView>
<select multiple="multiple" id="test_dp" style="width:150px;">
    <option value="t1">t1</option>
    <option value="t2">t2</option>
    <option value="t3">t3</option>
</select>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Script">
    <script src="zico.min.js"></script>
</asp:Content>