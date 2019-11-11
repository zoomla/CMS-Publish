<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StructDP.ascx.cs" Inherits="ZoomLaCMS.Manage.Boss.StructDP" %>
<div class="input-group w12rem_lg">
    <span class="input-group-addon"><sapn class="input-group-text">分组</sapn></span>
    <asp:DropDownList runat="server" ID="Struct_DP" CssClass="form-control text_md" DataTextField="Name" DataValueField="ID" AutoPostBack="true" OnSelectedIndexChanged="Struct_DP_SelectedIndexChanged"></asp:DropDownList>
</div>
