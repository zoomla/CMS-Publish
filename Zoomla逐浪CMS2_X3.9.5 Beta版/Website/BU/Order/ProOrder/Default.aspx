<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.BU.Order.ProOrder.Default" MasterPageFile="~/Common/Master/User.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>申购单列表</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="store"></div>
<div class="container">
<div class="margin_t5">
    <ol class="breadcrumb">
        <li><a title="会员中心" href="/User/">会员中心</a></li>
        <li><a href="/User/UserShop/OrderList">店铺订单</a></li>
        <li class="active">申购单列表 <a href="ProOrderAdd.aspx">[新建订单]</a></li>
        <div class="clearfix"></div>
    </ol>
</div>
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
    CssClass="table table-striped table-bordered" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
    <Columns>
        <asp:TemplateField ItemStyle-CssClass="td_xs">
            <ItemTemplate>
                <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="td_s" />
        <asp:TemplateField HeaderText="订单编号" ItemStyle-CssClass="td_l">
            <ItemTemplate>
                <a href="ProOrderAdd.aspx?ID=<%#Eval("ID") %>"><%#Eval("OrderNo") %></a>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="订货人">
            <ItemTemplate>
                <a href="javascript:;" onclick="showuinfo('<%#Eval("UserID") %>');"><%#Eval("AddUser") %></a>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="订单金额" DataField="OrdersAmount" DataFormatString="{0:F2}"  />
        <asp:TemplateField HeaderText="订单状态">
            <ItemTemplate>
                <%#GetOrderStatus() %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="物流状态">
            <ItemTemplate>
                <%#GetExpStatus() %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="AddTime" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="创建时间" ItemStyle-CssClass="td_l"/>
        <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="td_m">
            <ItemTemplate>
                <a class="btn btn-sm btn-info" href="ProOrderAdd.aspx?id=<%#Eval("ID") %>"><i class="fa fa-pencil" title="修改"></i></a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>