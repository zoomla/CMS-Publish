<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WxCodePay.aspx.cs" Inherits="ZoomLaCMS.PayOnline.WxCodePay" MasterPageFile="~/Cart/order.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"><title>微信支付</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="progress carpro">
<div class="progress-bar w-100" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100">
<h1><i class="zi zi_yensign"></i> 微信支付</h1>
</div>
</div>
<section class="container cartbody text-center">
<h3>微信支付</h3>
<div class="codepay_panel">
<div class="codeimg_panel">
<div class="codepay"><div id="code_img"><canvas width="400" height="400"></canvas></div></div>
<div class="text-center"> 请使用微信扫描二维码支付 </div>
<strong class="d-block">订单号：<%=PayNo %>请及时付款，以便订单尽快处理！<br/><small> 请您在提交订单后24小时内完成支付，否则订单会自动取消。</small></strong> </div>
</div>
<div id="success_div" class="text-center" style="display: none;">
    <i class="zi zi_checkcircle" style="color: green; font-size: 50px;"></i>
    <h3>支付成功!即将跳转到订单详情!<a href="/Class_2/Default.aspx">手动跳转</a></h3>
</div>
</section>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<img src="/favicon.ico" style="display:none;" id="logo"/>
<script src="/Plugins/Third/qrcode/qrcode.js"></script>
<script src="/Plugins/Third/qrcode/jqueryqr.js"></script>
<script>
    $().ready(function () {
        $('#code_img').erweima({
            mode: 4, mSize: 20, image: $("#logo")[0],
            text: "<%=Request.QueryString["wxcode"]%>"
        });
		setInterval(function () {
			$.ajax({
				type: 'POST',
				data: { action: 'getpay', payno: '<%=PayNo %>' },
				success: function (data) {
					if (data != "0") {
						$("#success_div").show();
						$(".codepay_panel").hide();
						$("#success_div a").attr('href', data)
						setTimeout(function () { window.location.href = data; }, 3000);
					}
				}
			});
		},2000)
	});
</script> 
</asp:Content>
