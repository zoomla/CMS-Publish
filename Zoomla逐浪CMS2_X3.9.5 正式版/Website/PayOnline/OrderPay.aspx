<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderPay.aspx.cs" Inherits="ZoomLaCMS.PayOnline.Orderpay" EnableViewStateMac="false" MasterPageFile="~/Cart/order.master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<title>选择支付平台_<%Call.Label("{$SiteName/}"); %></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="progress carpro">
<div class="progress-bar w-75" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"><h1>选择支付平台</h1></div>
</div>
<div class="container cartbody">
<div class="pay_select card">
	<div class="pay_head card-header">
	<%--    <div><strong>订单提交成功，请您尽快付款！</strong></div>--%>
		<div><span class="list_sp">订单号:</span><asp:Label ID="OrderNo_L" runat="server" ForeColor="Green"></asp:Label></div>
		<div>
			<span class="list_sp">应付金额：</span>
			<span class="totalmoney"><i class="zi zi_yensign"></i><asp:Label ID="TotalMoney_L" CssClass="" runat="server"></asp:Label></span>
			<span class="totinfo" title="点击查看详情"> <i class="zi zi_caretsquaredown"></i></span>
		</div>
		<div class="totinfo_div">
			<span class="list_sp">金额详情：</span>
			<asp:Label ID="TotalMoneyInfo_T" runat="server" />
		</div>
	</div>
	<div class="PayPlat_s card-body">
		<div class="divline paytitle">在线支付(请选择平台)：</div>
		<ul class="list-unstyled">
			<asp:Repeater runat="server" ID="PayPlat_RPT">
				<ItemTemplate>
					<li class="payplat_li plat_item col-lg-3 col-md-4 col-sm-6 col-xs-12 text-left" title="<%#Eval("PayPlatName") %>">
						<input type="radio" class="payplat_rad" name="payplat_rad" value="<%#Eval("PayPlatID") %>" />
						<img src="<%#GetPlatImg()%>" class="plat_item_img" />
					</li>
				</ItemTemplate>
			</asp:Repeater>
			<li class="clearfix"></li>
		</ul>
		<div runat="server" id="virtual_ul">
			<div class="divline paytitle">虚拟钱包：</div>
			<ul class="dashpay_ul margin_t5">
				<li runat="server" id="purseli" title="用户余额支付" visible="false">
					<input type="radio" name="payplat_rad" value="Purse" />
					<div class='pay_btn'><i class="zi zi_creditCard">余额支付</i></div>
				</li>
				<li runat="server" id="siconli" title="用户银币支付" visible="false">
					<input type="radio" name="payplat_rad" value="SilverCoin" />
					<div class='pay_btn'><i class="zi zi_wallet">银币支付</i></div>
				</li>
				<li runat="server" id="pointli" title="用户积分支付" visible="false">
					<input type="radio" name="payplat_rad" value="Score" />
					<div class='pay_btn'><i class="zi zi_clipboardcheck">积分支付</i></div>
				</li>
			</ul>
		</div>
		<asp:Button CssClass="btn btn-danger btn-lg ml-2 NextStep_btn" runat="server" id="cartpay_btn" OnClick="BtnSubmit_Click" Text="确定支付方式" />
		<div class="clear"></div>
	</div>
</div>
</div>

<section class="fixed-bottom fixed_Set">
<input type="button" id="pubspay" onClick="$('#cartpay_btn').click();" value="确定支付" class="Settlement_btn">
</section>
	
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
$(function () {
	$(".plat_item_img").click(function () { $(this).siblings(":radio")[0].checked = true; });
	$(".dashpay_ul li").click(function () {
		$(".dashpay_ul .active").removeClass('active');
		$(this).find('input')[0].checked = true;
		$(this).addClass('active');
	});
	if ($(".payplat_rad").length > 0) { $(".payplat_rad:first")[0].checked = true; }
	$(".totinfo").click(function () {
	    var $info = $(".totinfo_div");
	    if ($info.css("display") == "none") {
	        $info.slideDown(200);
	    } else {
	        $info.slideUp(100);
	    }
	});
})
//搜索
function skey()
{
var key = $("#skey_t").val();
window.open("/Search/SearchList?node=0&keyword="+key);
}
</script>
</asp:Content>