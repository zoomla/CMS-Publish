<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderRepairAudit.aspx.cs" Inherits="ZoomLaCMS.BU.Order.OrderRepairAudit"MasterPageFile="~/Common/Master/User.Master" %>
<asp:Content ContentPlaceHolderID="head" runat="Server"><title>售后管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<!--    <link href="/App_Themes/V4.css" rel="stylesheet" />-->
<div id="pageflag" data-nav="shop" data-ban="store"></div>
   <div class="container">
    <nav aria-label="breadcrumb" role="navigation">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a title="会员中心" href="/User/">会员中心</a></li>
            <li class="breadcrumb-item"><a href="/User/UserShop/OrderList">店铺订单</a></li>
            <li class="breadcrumb-item">返修退货</li>
            <div class="clearfix"></div>
        </ol>
    </nav>
	<ul class="nav nav-tabs list_choice" id="shopExamine" role="tablist">
		<li class="nav-item" id="nav_-100"><a class="nav-link" aria-selected="true"  href="OrderRepairAudit.aspx">全部</a></li>
		<li class="nav-item" id="nav_0"><a class="nav-link" aria-selected="false" href="OrderRepairAudit.aspx?status=0">未审核</a></li>
		<li class="nav-item" id="nav_99"><a class="nav-link" aria-selected="false" href="OrderRepairAudit.aspx?status=99">已审核</a></li>
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
                    <a href="RepairDeailt.aspx?id=<%#Eval("ID") %>" class="option_style"><i class="zi zi_eye"></i>查看详情</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
   </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
$(function () {
    //$("#nav_<%:Status%>")find("a").addClass("active");
	
	var status = '<%:Status%>';
	console.log(status);
	if(status){
	$("#nav_"+status).find("a").addClass("active");
	}else{
	$("#shopExamine li").eq(0).addClass("active");
	}
	
//导航处理
	$("#usernav1 ul li").removeClass("active").siblings().eq(2).addClass("active");
})
$("#mimenu_btn").click(function (e) {
	if ($(".u_menu_left").width() > 0) {
		$(".u_menu_left ul").fadeOut(100);
		$(".u_menu_left").animate({ width: 0 }, 200);
	}
	else {
		$(".u_menu_left").animate({ width: 150 }, 300);
		$(".u_menu_left ul").fadeIn();
	}
	});

</script>
</asp:Content>




