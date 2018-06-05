<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MultiDropList.aspx.cs" Inherits="ZoomLaCMS.Common.MultiDropList" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>多级选项</title>
	<link href="/App_Themes/V4User.css?version=0ff34de20180408" rel="stylesheet"/>
    <asp:Literal runat="server" ID="CSS_L"></asp:Literal>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
   <div class="d-flex flex-wrap">
        <asp:DropDownList ID="DDLGrade1" CssClass="form-control map_w" runat="server" Visible="false" AutoPostBack="true" OnSelectedIndexChanged="DDL_Grade1ChangeIndex">
    </asp:DropDownList>
    <asp:DropDownList ID="DDLGrade2" CssClass="form-control map_w" runat="server" Visible="false" AutoPostBack="true" OnSelectedIndexChanged="DDL_Grade2ChangeIndex">
    </asp:DropDownList>
    <asp:DropDownList ID="DDLGrade3" CssClass="form-control map_w" runat="server" Visible="false" AutoPostBack="true" OnSelectedIndexChanged="DDLGrade3_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:DropDownList ID="DDLGrade4" CssClass="form-control map_w" runat="server" Visible="false" AutoPostBack="true" OnSelectedIndexChanged="DDLGrade4_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:DropDownList ID="DDLGrade5" CssClass="form-control map_w" runat="server" Visible="false" AutoPostBack="true" OnSelectedIndexChanged="DDLGrade5_SelectedIndexChanged">
    </asp:DropDownList>
    <asp:DropDownList ID="DDLGrade6" CssClass="form-control map_w" runat="server" Visible="false" AutoPostBack="true" OnSelectedIndexChanged="DDLGrade6_SelectedIndexChanged">
    </asp:DropDownList>
   </div>
   <style>
   body{background: none;}#three_div{padding: 0!important;}
   @media (max-width:768px){}
   </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
</asp:Content>