<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="ZoomLaCMS.Tools.Cache.UserList" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>用户列表</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="input-group">
    <asp:TextBox runat="server" ID="UserID_T" class="form-control" placeholder="UserID"></asp:TextBox>
    <asp:TextBox runat="server" ID="UserName_T" class="form-control" placeholder="UserName"></asp:TextBox>
    <asp:TextBox runat="server" ID="Honey_T" class="form-control" placeholder="Honey"></asp:TextBox>
    <span class="input-group-btn">
        <asp:Button runat="server" ID="Search_Btn" class="btn btn-info" Text="筛选"/>
    </span>
</div>
<table class="table table-bordered" style="margin-top:5px;">
    <thead><tr>
        <th>用户ID</th><th>用户名</th><th>昵称</th>
        <th>资金</th><th>等级</th>
        <th>添加时间</th><th>更新时间</th><th>操作</th></tr></thead>
    <asp:Repeater runat="server" ID="RPT" EnableViewState="false">
        <ItemTemplate>
            <tr>
                <td><%#Eval("UserID") %></td>
                <td><%#Eval("UserName") %></td>
                <td><%#Eval("HoneyName") %></td>
                <td><%#Eval("Purse","{0:f2}") %></td>
                <td><%#Eval("VIP") %></td>
                <td><%#Eval("AddTime") %></td>
                <td><%#Eval("LastUpdateTime") %></td>
                <td></td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">

</asp:Content>