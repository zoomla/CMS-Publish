<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProOrderInfo.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Addon.ProOrder.ProOrderInfo" MasterPageFile="~/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>订单信息</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="BreadDiv" class="container-fluid mysite">
        <div class="row">
            <ol id="BreadNav" class="breadcrumb navbar-fixed-top">
                <li><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
                <li><a href='<%=CustomerPageAction.customPath2+"Shop/ProductManage.aspx" %>'>商品管理</a></li>
                <li><a href='Default.aspx'>申购单列表</a></li>
                <li class="active"><a href="<%=Request.RawUrl %>">订单信息</a></li>
            </ol>
        </div>
    </div>
<table class="table table-bordered table-striped">
<thead><tr><td colspan="3" class="text-center">订单信息</td></tr></thead>
<tr>
    <td>订单号：<asp:Label runat="server" ID="OrderNo_L"></asp:Label></td>
    <td>门店：<asp:Label runat="server" ID="StoreName_L"></asp:Label></td>
    <td>下单时间：<asp:Label runat="server" ID="AddTime_L"></asp:Label></td>
</tr>
<tr>
    <td>订单状态：<asp:Label runat="server" ID="OrderStatus_L"></asp:Label></td>
    <td>付款状态：<asp:Label runat="server" ID="PayStatus_L"></asp:Label></td>
    <td>物流状态：<asp:Label runat="server" ID="ExpStatus_L"></asp:Label></td>
</tr>
<tr><td>订单金额：<asp:Label runat="server" ID="OrdersAmount_L"></asp:Label></td>
<td>下单人：<asp:Label runat="server" ID="UserName_L"></asp:Label></td>
<td></td>
</tr>
<tr><td colspan="3">订单备注：<asp:Label runat="server" ID="OrderMessage_L"></asp:Label></td></tr>
</table>
<div class="panel panel-info margin_t10">
    <div class="panel-heading"><i class="fa fa fa-product-hunt"></i> 商品信息</div>
    <div class="panel-body">
        <table class="table table-bordered table-striped">
            <thead><tr><td class="td_s">ID</td><td>商品名</td><td>数量</td><td>金额</td></tr></thead>
            <asp:Repeater runat="server" ID="Product_RPT" EnableViewState="false">
                <ItemTemplate>
                    <tr>
                        <td><%#Eval("ProID") %></td>
                        <td><%#Eval("Proname") %></td>
                        <td><%#Eval("Pronum") %></td>
                        <td><%#Eval("AllMoney","{0:F2}") %></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>
