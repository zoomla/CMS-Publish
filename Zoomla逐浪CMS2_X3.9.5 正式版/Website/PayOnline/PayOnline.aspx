<%@ Page Language="C#" ResponseEncoding="utf-8" AutoEventWireup="true" CodeBehind="PayOnline.aspx.cs" Inherits="ZoomLaCMS.PayOnline.PayOnline" EnableViewStateMac="false"  %><!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="renderer" content="webkit" />
<title>在线支付_<%Call.Label("{$SiteName/}"); %></title>
<link rel="stylesheet" href="/dist/css/bootstrap4.min.css" />
<link href="/dist/css/zico.min.css" rel="stylesheet"/>
<link href="/App_Themes/v4User.css" rel="stylesheet" />
<script src="/JS/jquery.min.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Modal/APIResult.js"></script>
<script src="/dist/js/popper.min.js"></script> 
<script src="/dist/js/bootstrap4.min.js"></script>
</head>
<body>
<form id="form1" runat="server">
<nav class="navbar navbar-expand fixed-top cartTop"><a href="/" class="navbar-brand"><img src="<%=Call.LogoUrl %>" alt="<%=Call.SiteName %>"/><i class="zi zi_home"></i></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#cartNav" aria-controls="cartNav" aria-expanded="false" aria-label="Toggle navigation"> <span class="navbar-toggler-icon"></span> </button>
  <div class="collapse navbar-collapse" id="cartNav">
  	<div class="form-inline cart_seatch my-2 my-md-0 ml-auto">
      <div class="input-group ml-auto skey_div">
	  <div class="input-group-append">
		<button class="btn my-2 my-sm-0 cart_seatchbtn" type="submit"  onclick="skey();"><i class="z" ></i></button>
	  </div>
	  <input type="text" id="skey_t" class="form-control"   placeholder="全站检索" data-enter="0">
	  <div class="input-group-append">
		<span class="input-group-text"><i onClick="cartIsClose()" class="zi zi_times"></i></span>
	  </div>
	  </div>
    </div>
    <ul class="navbar-nav m-0" runat="server" id="logged_div" visible="false">
	  <li class="nav-item"><a class="nav-link c_secrchzbtn" href="javascript:;" onclick="cartIsSearch();"><i class="zi zi_search"></i></a></li>
      <li class="nav-item"><a href="/User/" class="nav-link" runat="server" id="logged_a" ></a></li>
      <li class="nav-item"><a href="/User/Order/OrderList" target="_blank" class="nav-link">我的订单</a></li> 
      <li class="nav-item"><a href="/User/User/Logout" class="nav-link"><i class="zi zi_signinalt cartu_out" aria-hidden="true"></i> 退出</a></li>
    </ul>
	<ul class="navbar-nav m-0" runat="server" id="nologin_div" visible="false">
	  <li class="nav-item"><a class="nav-link c_secrchzbtn" href="javascript:;" onclick="cartIsSearch();"><i class="zi zi_search"></i></a></li>
      <li class="nav-item"><a href="/User/Login" runat="server" id="login_a" class="nav-link"></a></li>
      <li class="nav-item"><a href="/User/Register?ReturnUrl=<%=Request.RawUrl %>" class="nav-link" target="_blank">注册</a></li>
    </ul>
  </div>
</nav>
<!--nav end-->

<div class="progress carpro">
<div class="progress-bar w-100" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"><h1>在线支付</h1></div>
</div>

<div class="mainpay_div container cartbody">
    <div class="paytable pb-4" runat="server" id="payinfo_div">
        <div><strong>订单提交成功，请您尽快付款!</strong></div>
        <div>订单号：<asp:Label ID="OrderNo_L" runat="server"></asp:Label></div>
        <div>应付金额：<asp:Label ID="LblPayMoney" runat="server" CssClass=""></asp:Label></div>
        <div>
            <asp:Label runat="server" ID="Fee" Text="帐户余额："></asp:Label><asp:Label ID="LblRate" CssClass="" runat="server" Text="XX元"></asp:Label></div>
        <div>
            <span>支付方式：</span>
            <asp:Label ID="VMoneyPayed_L" runat="server" CssClass="r_orange"></asp:Label>
            <a href="/PayOnline/Orderpay.aspx?PayNo=<%:PayNo %>" class="margin_l5">重新选择</a>
            <div class="mt-2" runat="server" visible="false" id="Alipay_Btn">
                <input type="button" value="确定付款" class="btn btn-danger btn-lg ml-2 confirmPay"  onclick="alipaySubmit();" />
            </div>
            <div class="mt-2">
                <div id="spwd_div" runat="server" visible="false" class="shortPwd_div">
                    <link href="/JS/Plugs/shortPwd/shortPwd.css" rel="stylesheet" />
                    <script src="/JS/Plugs/shortPwd/shortPwd.js"></script>
                    <span class="shortPwd" node-type="shortPassword">
                        <input type="password" class="shortPwd-input" node-type="shortPassword-input" autocomplete="new-password" maxlength="1" autofocus="autofocus"/>
                        <input type="password" class="shortPwd-input" node-type="shortPassword-input" autocomplete="new-password" maxlength="1" />
                        <input type="password" class="shortPwd-input" node-type="shortPassword-input" autocomplete="new-password" maxlength="1" />
                        <input type="password" class="shortPwd-input" node-type="shortPassword-input" autocomplete="new-password" maxlength="1" />
                        <input type="password" class="shortPwd-input" node-type="shortPassword-input" autocomplete="new-password" maxlength="1" />
                        <input type="password" class="shortPwd-input" node-type="shortPassword-input" autocomplete="new-password" maxlength="1" />
                        <input type="password" name="pwd_t" id="pwd_t" class="shortPwd-hidden" node-type="shortPassword-value" maxlength="6" />
                    </span>
                    <div class="" id="spwd_remind_div"></div>
                    <input type="button" id="surepay_btn" value="确定支付" class="btn btn-danger btn-lg ml-2 mt-1"  onclick="shortPwdCheck();" />
                    <asp:Button runat="server" class="d_none" ID="Confirm_VMoney_Btn" OnClick="Confirm_Click" />
                    <script>
                        shortPassword();
                        function shortPwdCheck() {
                            var spwd = $("#pwd_t").val();
                            var $remind = $("#spwd_remind_div"); $remind.text("");
                            if (spwd == "") { $remind.text("支付密码不能为空"); return; }
                            if (spwd.length != 6) { $remind.text("请将支付密码输入完整"); return; }
                            setTimeout(function () { document.getElementById("surepay_btn").disabled = true; }, 50);
                            $.post("/api/usercheck.ashx?action=spwd", { "spwd": spwd }, function (data) {
                                var model = APIResult.getModel(data);
                                if (APIResult.isok(model)) { $("#Confirm_VMoney_Btn").click(); }
                                else { $remind.text(model.retmsg); }
                                setTimeout(function () { document.getElementById("surepay_btn").disabled = false; }, 50);
                            });
                        }
                    </script>
                </div>
                <div id="nospwd_div" runat="server" visible="false">
                    <asp:Button runat="server" Text="确定支付" class="btn btn-danger btn-lg ml-2 confirmPay" OnClick="Confirm_Click" />
                </div>
            </div>
        </div>
    </div>
    <div class="paytable" runat="server" id="AfterPay_Tb">
        <div class="p_center">
            <div class="pay_tab">
                <strong>恭喜您,下单成功！</strong><br />
            </div>
            <div class="PayPlat_s payed">
                <h3 class="r_green">确认款项：</h3>
                <div>支付方式：<asp:Label ID="zfpt" runat="server" CssClass="r_orange"></asp:Label></div>
                <div>订单号：<asp:Label ID="ddh" runat="server"></asp:Label></div>
                <div>支付金额：<asp:Label ID="PayNum_L2" runat="server" CssClass="r_red"></asp:Label></div>
                <div>
                    <asp:Label ID="fees" runat="server" Text="帐户余额："></asp:Label><asp:Label ID="sxf" runat="server" CssClass="r_red">></asp:Label>
                </div>
                <div id="ActualAmount" runat="server" visible="false"><span>实际金额：</span><asp:Label ID="sjhbje" runat="server" CssClass="r_red">></asp:Label></div>
                <asp:Literal runat="server" ID="remindHtml" EnableViewState="false"></asp:Literal>
                <div>
                    <asp:HyperLink runat="server" ID="Rurl_Href" CssClass="btn btn-info">我的订单</asp:HyperLink>
                </div>
            </div>
        </div>
    </div>
</div>
<div id="payremind_div" class="d_none">
    <div class="card">
        <div class="card-header"><span class="zi zi_bookmark"></span><span class="margin_l5">登录平台支付</span></div>
        <div class="card-body">
            <div class="pb-2 pl-1">请您在新打开的支付平台页面进行支付,支付完成前请不要关闭该窗口</div>
            <div class="text-center">
                <a id="PayComp_Href" runat="server" href="/User/Order/OrderList" class="btn btn-info">已完成支付</a>
                <a href="OrderPay.aspx?PayNo=<%:PayNo %>" class="btn btn-info m-2">重选支付平台</a>
            </div>
        </div>
    </div>
</div>

<section class="fixed-bottom fixed_Set">
<input type="submit" name="ctl00" id="pubspay" onClick="$('#cartpay_btn').click();" value="确定支付" class="Settlement_btn">
</section>

<footer class="fixed-bottom cord_footer">
<ul class="d-flex justify-content-around">
	<li><a  href="/"><i class="zi zi_home" aria-hidden="true"></i><span>首页</span></a></li>
	<li><a  href="#"><i class="zi zi_shoppingbag" aria-hidden="true"></i><span>商城</span></a></li>
	<li><a  href="/Cart/Cart.aspx?ProClass=1"><i class="zi zi_shoppingcart" aria-hidden="true"></i><span>购物车</span></a></li>
	<li><a  href="/User/Order/OrderList"><i class="zi zi_tag" aria-hidden="true"></i> <span>订单</span></a></li>
</ul>
</footer>
</form>
<asp:Panel runat="server" ID="alipay_form" class="d_none"><div class="mt-1" runat="server" id="LblHiddenValue"></div></asp:Panel>
<script>
function alipaySubmit() {
    $("#payform").submit();
    var diag = new ZL_Dialog();
    diag.maxbtn = false;
    diag.closebtn = false;
    diag.backdrop = true;
    diag.width = "minwidth";
    diag.title = "正在支付";
    diag.body = $("#payremind_div").show().html(); $("#payremind_div").remove();
    diag.ShowModal();
}

/*显示搜索框*/
function cartIsSearch(){
    $(".skey_div").css("opacity","1").css("z-index","1").css("right","30%").css("top","0").css("width",window.innerWidth/3);
//    $("#navbarsExample03 ul").fadeOut(200);
    $(".skey_div .form-control").focus();
}
/*关闭搜索框*/
function cartIsClose(){
    $(".skey_div").css("opacity","0").css("z-index","-1").css("right","-1em");
    $(".home_top_nav").fadeIn(1000);
}
//搜索
function skey()
{
var key = $("#skey_t").val();
window.open("/Search/SearchList?node=0&keyword="+key);
}

</script>
</body>
</html>