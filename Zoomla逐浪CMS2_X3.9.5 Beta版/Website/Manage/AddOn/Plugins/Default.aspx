<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Manage.AddOn.Plugins.Default" MasterPageFile="~/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>插件管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-bordered table-striped">
<tr>
    <td class="td_s"></td>
    <td class="td_l">名称</td>
    <td class="td_m">标识</td>
    <td>访问路径</td>
    <td>功能</td>
    <td class="td_m">状态</td>
    <td class="td_l">操作</td>
</tr>
<asp:Repeater runat="server" ID="RPT" OnItemCommand="RPT_ItemCommand">
    <ItemTemplate>
        <tr>
            <td><%#Container.ItemIndex+1 %></td>
            <td><%#Eval("name") %></td>
            <td><%#Eval("symbol") %></td>
            <td><a href="<%#Eval("url") %>" target="_blank">浏览</a></td>
            <td><%#Eval("desc") %></td>
            <td><%#GetState() %></td>
            <td>
                <asp:LinkButton runat="server" CommandName="start" CommandArgument='<%#Eval("symbol") %>' Visible='<%#!Eval("state","").Equals("Active") %>' class="option_style btn btn-xs btn-info">
                    <i class="fa fa-cog"></i>启动</asp:LinkButton>
                <asp:LinkButton runat="server" CommandName="stop" CommandArgument='<%#Eval("symbol") %>' Visible='<%#Eval("state","").Equals("Active") %>' class="option_style btn btn-xs btn-warning">
                    <i class="fa fa-ban"></i>停用</asp:LinkButton>
            </td>
        </tr>
    </ItemTemplate>
</asp:Repeater>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>