<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderRepairAudit.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.OrderRepairAudit"MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content ContentPlaceHolderID="head" runat="Server"><title>售后管理</title>
<%=Call.SetBread( new Bread[] {
	new Bread("ProductManage.aspx","商城管理"),
	new Bread("OrderList.aspx","订单管理"),
	new Bread(){url="OrderRepairAudit.aspx", text="返修单审核"}
}) %>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ul class="nav nav-tabs list_choice">
        <li class="nav-item"  id="nav_-100"><a class="nav-link"  href="OrderRepairAudit.aspx">全部</a></li>
        <li class="nav-item" id="nav_0"><a class="nav-link" href="OrderRepairAudit.aspx?status=0">未审核</a></li>
        <li class="nav-item" id="nav_99"><a class="nav-link" href="OrderRepairAudit.aspx?status=99">已审核</a></li>
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
            <asp:BoundField HeaderText="退货数" DataField="Pronum" ItemStyle-CssClass="w12rem_lg" />
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
                    <a href="RepairDeailt.aspx?id=<%#Eval("ID") %>"><i class="zi zi_eye"></i>查看详情</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	<div class="alert alert-light">
    <asp:Button ID="Audit_Btn" CssClass="btn btn-outline-info" runat="server" Text="<%$Resources:L,批量审核 %>" OnClick="Audit_Btn_Click" />
    <asp:Button ID="UnAudit_Btn" CssClass="btn btn-outline-info" runat="server" Text="<%$Resources:L,解除审核 %>" OnClick="UnAudit_Btn_Click" />
    <asp:Button ID="Del_Btn" CssClass="btn btn-outline-danger" runat="server" Text="<%$Resources:L,批量删除 %>" OnClick="Del_Btn_Click" />
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
$(function () {
    $("#nav_<%:Status%>").find("a").addClass("active");
})
</script>
</asp:Content>




