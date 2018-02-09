<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductList.aspx.cs" Inherits="ZoomLaCMS.Common.Comp.ProductList" EnableViewState="false" EnableViewStateMac="false" %>
<asp:Repeater runat="server" ID="UPRONode_RPT" OnItemDataBound="UPRONode_RPT_ItemDataBound">
<ItemTemplate>
<div>
<div class="up_nodeitem"><%#Eval("NodeName") %></div>
<asp:Repeater runat="server" ID="UPro_RPT">
<ItemTemplate>
<div class="btn btn-default up_proitem">
    <div class="proname"><%#Eval("Proname") %></div>
    <a href="javascript:;" style="z-index: 10;" class="pull-right" onclick="upro.del(this,'<%#Eval("ID") %>');"><i class="fa fa-trash-o"></i></a>
</div>
</ItemTemplate>
</asp:Repeater>
</div>
</ItemTemplate>
</asp:Repeater>
<div class="alert alert-info" style="margin-top:5px;" runat="server" visible="false" id="empty_sp">未指定商品</div>