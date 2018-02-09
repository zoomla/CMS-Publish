<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderRepairAudit.aspx.cs" Inherits="ZoomLaCMS.BU.Order.OrderRepairAudit"MasterPageFile="~/Common/Master/User.Master" %>
<asp:Content ContentPlaceHolderID="head" runat="Server"><title>售后管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <link href="/App_Themes/V3.css" rel="stylesheet" />
<div id="pageflag" data-nav="shop" data-ban="store"></div>
   <div class="container">
    <div class="margin_t5">
        <ol class="breadcrumb">
            <li><a title="会员中心" href="/User/">会员中心</a></li>
            <li><a href="/User/UserShop/OrderList">店铺订单</a></li>
            <li class="active">返修退货</li>
            <div class="clearfix"></div>
        </ol>
    </div>
        <ul class="nav nav-tabs">
        <li id="nav_-100"><a href="OrderRepairAudit.aspx">全部</a></li>
        <li id="nav_0"><a href="OrderRepairAudit.aspx?status=0">未审核</a></li>
        <li id="nav_99"><a href="OrderRepairAudit.aspx?status=99">已审核</a></li>
    </ul>
    <ZL:ExGridView ID="EGV" runat="server" AllowPaging="True" AllowSorting="True"
        AutoGenerateColumns="False" OnPageIndexChanging="EGV_PageIndexChanging"
        class="table table-striped table-bordered table-hover" PageSize="10" EmptyDataText="<%$Resources:L,没有相关数据 %>">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input type="checkbox" value="<%#Eval("ID") %>" name="idchk" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,商品信息 %>">
                <ItemTemplate>
                    <img src="<%#ZoomLa.Common.function.GetImgUrl(Eval("Thumbnails") )%>" class="img_50" />
                    <%#Eval("Proname") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="退货数" DataField="Pronum" ItemStyle-CssClass="td_s" />
            <asp:TemplateField HeaderText="售后">
                <ItemTemplate>
                    <%#GetServieType() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,申请凭据 %>">
                <ItemTemplate>
                    <%#GetCret() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="UserName" HeaderText="<%$Resources:L,客户姓名 %>" />
            <asp:BoundField DataField="Phone" HeaderText="<%$Resources:L,联系方式 %>" />
            <asp:BoundField DataField="TakeTime" HeaderText="<%$Resources:L,取件时间 %>" />
            <asp:TemplateField HeaderText="<%$Resources:L,审核状态 %>">
                <ItemTemplate>
                    <%#GetStatus() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CDate" HeaderText="<%$Resources:L,创建时间 %>" />
            <asp:TemplateField HeaderText="<%$Resources:L,操作 %>">
                <ItemTemplate>
                    <a href="RepairDeailt.aspx?id=<%#Eval("ID") %>" class="option_style"><i class="fa fa-eye"></i>查看详情</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
   </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
$(function () {
    $("#nav_<%:Status%>").addClass("active");
})
</script>
</asp:Content>




