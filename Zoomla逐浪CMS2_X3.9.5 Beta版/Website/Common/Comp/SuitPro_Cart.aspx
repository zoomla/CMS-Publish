<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SuitPro_Cart.aspx.cs" Inherits="ZoomLaCMS.Common.Comp.SuitPro_Cart" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>购物车记录</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-bordered table-striped">
<tr><td class="td_s">ID</td><td>商品图</td><td>商品名</td><td class="td_s">数量</td><td class="td_s">价格</td></tr>
<asp:Repeater runat="server" ID="RPT">
    <ItemTemplate>
        <tr>
            <td><%#Eval("ProID") %></td>
            <td><img src="<%#ZoomLa.Common.function.GetImgUrl(Eval("Thumbnails")) %>" class="img50" /></td>
            <td><%#Eval("Proname") %></td>
            <td><%#Eval("Pronum") %></td>
            <td><%#Eval("LinPrice") %></td>
        </tr>
    </ItemTemplate>
</asp:Repeater>
</table>
<div class="alert alert-info">数据为购买时的缓存数据</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">

</asp:Content>
