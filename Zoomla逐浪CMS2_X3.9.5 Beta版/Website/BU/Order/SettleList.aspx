<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SettleList.aspx.cs" Inherits="ZoomLaCMS.BU.Order.SettleList" MasterPageFile="~/Common/Master/User.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">结清单列表</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="store"></div> 
<div class="container">
<ol class="breadcrumb">
    <li><a title="会员中心" href="/User/Default">会员中心</a></li>
    <li><a href="/User/UserShop/ProductList">我的店铺</a></li>
    <li class="active">结算列表</li>
</ol>
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
    CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
    <Columns>
        <asp:TemplateField ItemStyle-CssClass="td_xs">
            <ItemTemplate>
                <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="td_s" />
        <asp:TemplateField HeaderText="订单ID" ItemStyle-CssClass="td_m">
            <ItemTemplate><a href="<%#CustomerPageAction.customPath2+"/Shop/OrderListInfo.aspx?ID="+Eval("OrderID") %>"><%#Eval("OrderID") %></a></ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="支付单号" DataField="PaymentNo" ItemStyle-CssClass="td_m" />
        <asp:BoundField HeaderText="预付金额" DataField="AmountPre" DataFormatString="{0:F2}" ItemStyle-CssClass="td_m" />
        <asp:BoundField HeaderText="结算金额" DataField="AmountSettle" DataFormatString="{0:F2}" ItemStyle-CssClass="td_m" />
        <asp:BoundField DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="创建时间" ItemStyle-CssClass="td_l"/>
        <asp:BoundField DataField="Remind" HeaderText="备注" />
        <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="td_l">
            <ItemTemplate>
              <a href="OrderListInfo.aspx?ID=<%# Eval("OrderID") %>" class="option_style"><i class="fa fa-paper-plane"></i>订单</a>
              <a href="SettleDetail.aspx?sid=<%#Eval("ID") %>&ID=<%#Eval("OrderID") %>" class="option_style"><i class="fa fa-eye"></i>详情</a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>