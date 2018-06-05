<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="ZoomLaCMS.Cart.cart" MasterPageFile="~/Cart/order.master" EnableViewState="false"%>
<%@ Import Namespace="ZoomLa.Common" %>
<%@ Import Namespace="ZoomLa.BLL.Shop" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>购物车_<%Call.Label("{$SiteName/}"); %></title> </asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="progress carpro">
<div class="progress-bar w-25" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"><h1>加入购物车</h1></div>
</div>
<section class="container cartbody">
<table id="EGV" class=" table-hover table-sm">
<tr class="shop_tabtr">
	<th></th>
	<th style="width: 12%">商品名称</th>
	<th></th>
	<th runat="server" id="ptype_td">单价</th>
	<th>数量</th>
	<th class="move_d_none">状态</th>
	<th class="move_d_none">小计</th>
	<th>操作</th>
</tr>
<asp:Repeater runat="server" ID="RPT" OnItemDataBound="RPT_ItemDataBound">
	<ItemTemplate>
		<tbody class="cart_body">
			<tr>
				<td colspan="8" class="storename">
					<label><input type="checkbox" class="store_chk" name="store_chk" checked="checked" value="<%#Eval("ID") %>" />
						<i class="zi zi_home" title="店铺"></i> <%#Eval("StoreName") %></label></td>
			</tr>
			<asp:Repeater runat="server" ID="ProRPT" OnItemDataBound="ProRPT_ItemDataBound">
				<ItemTemplate>
					<asp:Panel runat="server" Visible='<%#(Eval("Class","")=="2"?true:false) %>'>
						<tbody  id="suit_wrap_<%#Eval("ID") %>">
							<tr data-id="<%#Eval("ID") %>" class="cart_item">
							<td scope="col" class="posit_r">
								<input type="checkbox" name="prochk" data-store="<%#Eval("StoreID") %>" checked="checked" value="<%#Eval("ID") %>" />
								<div class="line_vertical"></div>
							</td>
							<td scope="col"><strong>【套装】</strong><%#Eval("ProName") %></td>
							<td scope="col"><%#GetMyPrice() %></td>
							<td scope="col" class="pronum_td" colspan="2">
								<div class="input-group mb-3">
								  <div class="input-group-prepend" onclick="cart.suit.setnum('<%#Eval("ID") %>','+');">
									<span class="input-group-text"><i class="zi zi_minus"></i></span>
								  </div>
								  <input type="text" class="form-control pronum_text" id="pronum_<%#Eval("ID") %>" value="<%#Eval("Pronum") %>" autocomplete="off" onblur="cart.suit.setnum('<%#Eval("ID") %>',this.value);">
								  <div class="input-group-append" onclick="cart.suit.setnum('<%#Eval("ID") %>','-');">
									<span class="input-group-text"><i class="zi zi_plus"></i></span>
								  </div>
								</div>
							</td>
							<td scope="col" class=""><span id="trprice_<%#Eval("ID") %>" class="trprice"><%#GetPrice() %></span></td>
							<td scope="col" class="">
								<a href="javascript:;" class="grayremind remove_cart" onclick="cart.del('<%#Eval("ID") %>');">删除</a>
							</td>
						</tr>
							<asp:Repeater runat="server" ID="SuitPro_RPT">
								<ItemTemplate>
									<tr class="suit_item">
										<td class="posit_r">
											<span class="line_circle"></span>
											<div class="line_vertical"></div>
										</td>
										<td>
											<a href="<%#GetShopUrl() %>" target="_blank" title="浏览商品">
												<img src="<%#GetImgUrl(Eval("Thumbnails"))%>" onerror="shownopic(this);" class="preimg_l cart_Ting" />
											</a>
											
										</td>
										<td class="coatShop_title"><a href="<%#GetShopUrl() %>" target="_blank" title="浏览商品"><%#Eval("ProName") %></a></td>
										<td class="tdline move_d_none suit_item_price"><%#Eval("LinPrice","{0:F2}") %></td>
										<td class="tdline text-center">
											<span class="suit_item_num"><%#Eval("suitnum") %></span><%#Eval("ProUnit") %>/套 X<span class="suit_item_pronum"><%#Eval("Pronum") %></span>
										</td>
										<td class="tdline move_d_none"></td>
										<td class="tdline suit_item_total"><%#(Convert.ToDouble(Eval("LinPrice"))*Convert.ToInt32(Eval("Pronum"))).ToString("F2") %></td>
										<td class="tdline">
											<%-- <a href="javascript:;" class="grayremind" onclick="cart.del('<%#Eval("ID") %>');">删除</a>--%>
										</td>
									</tr>
								</ItemTemplate>
							</asp:Repeater>
						</tbody>
					</asp:Panel>
					<asp:Panel runat="server" Visible='<%#(Eval("Class","")=="0"?true:false) %>'>
						<tr data-id="<%#Eval("ID") %>" class="cart_item">
							<td>
								<input type="checkbox" name="prochk" data-store="<%#Eval("StoreID") %>" checked="checked" value="<%#Eval("ID") %>" /></td>
							<td>
								<a href="<%#GetShopUrl() %>" target="_blank" title="浏览商品">
									<img src="<%#GetImgUrl(Eval("Thumbnails"))%>" onerror="shownopic(this);" class="preimg_l cart_Ting" />
								</a>
							</td>
							<td class="coatShop_title">
							<a href="<%#GetShopUrl() %>" target="_blank" title="浏览商品"><%#Eval("ProName") %></a>
							<asp:Label runat="server" ID="Present_HTML"></asp:Label>
							</td>
							<td class="tdline Price_box"><%#GetMyPrice() %></td>
							<td class="pronum_td tdline">
								<div class="input-group pronum_text">
								  <div class="input-group-prepend" onclick="cart.setnum('<%#Eval("ID") %>','+');">
									<span class="input-group-text"><i class="zi zi_minus"></i></span>
								  </div>
								  <input type="text" class="form-control" id="pronum_<%#Eval("ID") %>" value="<%#Eval("Pronum") %>" autocomplete="off" onblur="cart.suit.setnum('<%#Eval("ID") %>',this.value);">
								  <div class="input-group-append" onclick="cart.setnum('<%#Eval("ID") %>','-');">
									<span class="input-group-text"><i class="zi zi_plus"></i></span>
								  </div>
								</div>
								<span class="shop_sum"><%#Eval("Pronum") %></span>
							</td>
<!--                                    <td class="tdline hidden-lg hidden-md hidden-sm r_green text-center"><%#Eval("Pronum") %></td>-->
							<td class="tdline move_d_none"><%#GetStockStatus()%></td>
							<td class="tdline xj_Price move_d_none"><span id="trprice_<%#Eval("ID") %>" class="trprice"><%#GetPrice() %></span></td>
							<td class="tdline">
								 <a href="javascript:;" class="grayremind remove_cart" onclick="cart.del('<%#Eval("ID") %>');">删除</a>
							</td>
						</tr>
					</asp:Panel>
					</tr>
				</ItemTemplate>
			</asp:Repeater>
		</tbody>
	</ItemTemplate>
</asp:Repeater>
<tr><td colspan="8">
	<label class="">
		<input type="checkbox" checked="checked" class="shaopqx" onclick="ChkAll(this);" />全选</label>
		<input type="button" value="批量删除" class="btn btn-link  pl_remove" onclick="cart.batdel();" />
		
		<span class="Settlement_tex Settlement_texPc"><span>数量：<span class="trprice pronum_span"></span>总价:<span runat="server"  class="totalmoney">0.00</span>(不含邮费)</span></span>
	<div class="pull-right">

<%--                <span>余额:<span id="totalPurse_sp"></span></span>
		<span>银币:<span id="totalSicon_sp"></span></span>
		<span>积分:<span id="totalPoint_sp"></span></span>--%>
		
		<input type="button"  value="去结算" class="btn btn-danger btn-lg ml-2 NextStep_btn" onclick="GetNextStep();" />
		<asp:Button runat="server" ID="RealNext_Btn" OnClick="NextStep_Click" class="d_none" />
	</div>
</td></tr>
</table>
</section>
<div id="remind_max" class="d_none p-4">
<div>
<span class="zi zi_exclamationTriangle zi_2x"></span>
<span class="ml-2">商品数量不能大于200</span>
</div>
</div>

<section class="fixed-bottom fixed_Set">
<a href="javascript:;" class="SelectObj" id="SelectObj" data-xz="true" onClick="$('.shaopqx').click();changqx()">
<i class="zi zi_checkcircle"></i>
<span>全选</span>
</a>
<span class="Settlement_tex"><span>数量：<span class="trprice pronum_span" id="pronum_span"></span>总价:<span runat="server" id="totalmoney" class="totalmoney">0.00</span></span></span>
<input type="button" id="NextStep" value="去结算" class="Settlement_btn" onclick="GetNextStep();" disabled="">
</section>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/B_User.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Controls/Control.js"></script>
<script src="/JS/ICMS/ZL_Common.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script src="/JS/Modal/APIResult.js"></script>
<script>
    var buser = new B_User();
    var diag = new ZL_Dialog();
    var cart = { api: "/cart/OrderCom.ashx?action=", suit: {}, price: {} };
    cart.del = function (id) {
        if (!confirm("确定要删除吗")) { return false; }
        $.post(cart.api + "cart_del", { "ids": id }, function (data) {
            APIResult.ifok(data, function () { location = location; }, function () { console.log("failed", data); });
        })
    }
    cart.batdel = function () {
        var ids = "";
        var $chks = $("input[name='prochk']:checked");
        if ($chks.length < 1) { alert("未选定需要删除的商品"); }
        $chks.each(function () { ids += this.value + ","; });
        ids = ids.substr(0, ids.length - 1);
        cart.del(ids);
    }
    cart.setnum = function (id, num) {
        num = cart.getnum(id, num);
        $.post(cart.api + "cart_setnum", { "id": id, pronum: num }, function (data) {
            APIResult.ifok(data, function () { }, function () { console.log("setnum failed:", data); })
        });
        cart.updatePrice(id);
    }
    cart.updatePrice = function (id) {
        var pronum = $("#pronum_" + id).val();
        var price = $("#price_" + id).text();
        var obj = $("#trprice_" + id);
        obj.text((price * pronum).toFixed(2));
        UpdateTotalPrice();
    }
    //套装商品修改数量
    cart.suit.setnum = function (id, num) {
        num = cart.getnum(id, num);
        //$("#suit_wrap_" + id).find(".suit_item_pronum").text(num);
        $.post(cart.api + "cart_setnum", { "id": id, pronum: num }, function (data) {
            APIResult.ifok(data, function () { }, function () { console.log("setnum failed:", data); })
        });
        cart.updatePrice(id);
        cart.suit.updateNumAndPrice(id,num);
    }
    //更新套装商品价格,仅显示,不参与逻辑
    cart.suit.updateNumAndPrice = function (id,num) {
        var $items = $("#suit_wrap_" + id).find(".suit_item");
        //直接根据零售价和数量算出总价
        $items.each(function () {
            var $this = $(this);
            var price = Convert.ToDouble($this.find(".suit_item_price").text());
            var suitnum = Convert.ToInt($this.find(".suit_item_num").text());
            $this.find(".suit_item_pronum").text(num * suitnum);
            $this.find(".suit_item_total").text((price * num).toFixed(2))
        });
    }
    //解绑套装,并删除对应商品,解绑定作为普通商品存在
    cart.suit.unbind = function (suitid, proid) {

    }
    //-----------------公用方法
    cart.getnum = function (id, num) {
        var $text = $("#pronum_" + id);
        var v = Convert.ToInt($text.val(), 1);
        switch (num) {
            case "+":
                if (v > 1) { --v; }
                $text.val(v);
                break;
            case "-":
                $text.val(++v);
                break;
            default:
                $text.val(Convert.ToInt(num, 1));
                break;
        }
        return parseInt($text.val());
    }
    //-------------------------------------------
    $(function () {
        ZL_Regex.B_Num(".pronum_text");
        ZL_Regex.B_Value(".pronum_text", {
            min: 1, max: 200, overmin: function () { }, overmax: function () {
                ShowRemind();
            }
        });
        $("input[name=prochk]").click(function () {
            UpdateTotalPrice();
            UpdateItemNum();
        });
        $(".store_chk").click(function () {
            ChkByStore(this);
            UpdateItemNum();
            UpdateTotalPrice();
        });
        UpdateItemNum();
        UpdateTotalPrice();
        Control.EnableEnter();
        buser.IsLogged(function () { });
    })
    //------AJAX
    function GetNextStep() {
        disBtn($("#NextStep")[0], 2000);
        buser.IsLogged(function (data, flag) {
            if (flag) {
                $("#RealNext_Btn").click();
            }
            else {
                diag.width = "minwidth";
                diag.title = "用户登录";
                diag.url = "/com/login_Ajax";
                diag.maxbtn = false;
                diag.backdrop = true;
                diag.ShowModal();
            }
        });
    }
    function LoginSuccess() {
        diag.CloseModal();
        $("#RealNext_Btn").click();
    }
    function AutoHeight() { diag.AutoHeight(); }
    //------Page
    function skey()
    {
        var key = $("#skey_t").val();
        window.open("/Search/SearchList?node=0&keyword="+key);
    }
    //全选本店商品
    function ChkByStore(obj) {
        $(":checkbox[name=prochk][data-store=" + obj.value + "]").each(function () { this.checked = obj.checked; });
    }
    //--商品数量相关
    function ChkAll(obj) {
        $("#EGV :checkbox").each(function () { this.checked = obj.checked; });
        UpdateItemNum();
    }
    //更新数量,确定是否禁用按钮
    function UpdateItemNum() {
        var num = $("[name=prochk]:checked").length;
        $("#pronum_span").text(num);
        $(".pronum_span").text(num);
        document.getElementById("NextStep").disabled = (num < 1) ? "disabled" : "";
    }
    //更新总金额
    function UpdateTotalPrice() {
        var $chkarr = $("[name=prochk]:checked");
        var money = 0.00, purse = 0.00, sicon = 0.00, point = 0.00;
        for (var i = 0; i < $chkarr.length; i++) {
            var id = $chkarr[i].value;
            var num = $("#pronum_" + id).val();
            var pursePrice = parseFloat($("#price_purse_" + id).text());
            var siconPrice = parseFloat($("#price_sicon_" + id).text());
            var pointPrice = parseFloat($("#price_point_" + id).text());
            if (pursePrice)
                purse += pursePrice * num;
            if (siconPrice)
                sicon += siconPrice * num;
            if (pointPrice)
                point += pointPrice * num;
            money += parseFloat($("#trprice_" + id).text());
        }
        $("#totalmoney").text(money.toFixed(2));
        $(".totalmoney").text(money.toFixed(2));
        $("#totalPurse_sp").text(purse.toFixed(2));
        $("#totalSicon_sp").text(sicon.toFixed(2));
        $("#totalPoint_sp").text(point.toFixed(2));
    }
    //---------------------------数量提示窗
    var reminddiv;
    $(function () {
        reminddiv = $("#remind_max");
        reminddiv.remove();
        reminddiv.show();
    })
    function ShowRemind() {
        var diag = new ZL_Dialog();
        diag.width = "minwidth";
        diag.maxbtn = false;
        diag.backdrop = false;
        diag.title = "提示";
        diag.body = reminddiv[0].outerHTML;
        diag.ShowModal();
    }
	//处理商品图片大小
	var cart_Ting = $(".cart_Ting");
	for(var iseq = 0;iseq<=cart_Ting.length;iseq++){
//	console.log(cart_Ting.eq(iseq).height());
	if(cart_Ting.eq(iseq).height()>150){
	cart_Ting.eq(iseq).css({"width":"128px","height":"128px"})
	}
	}
	
	//全选切换图标
	function changqx(){
	if($("#SelectObj").attr("data-xz")=="true"){
	$("#SelectObj").attr("data-xz",false);
	$("#SelectObj i").attr("class","zi zi_checkcircle");
	}else{
	$("#SelectObj").attr("data-xz",true);
	$("#SelectObj i").attr("class","zi zi_checkcircle");
	}
	}
	
</script>
<script runat="server">
public string GetShopUrl()
{
    return OrderHelper.GetShopUrl(DataConverter.CLng(Eval("StoreID")), Convert.ToInt32(Eval("ProID")));
}
public string GetImgUrl(object o)
{
    return function.GetImgUrl(o);
}
        public string GetStockStatus()
        {
            if (Eval("Allowed").ToString().Equals("0"))
            {
                int pronum = Convert.ToInt32(Eval("Pronum"));
                int stock = Convert.ToInt32(Eval("Stock"));
                if (stock < pronum)
                {
                    return "<span class='r_red_x'>缺货</span>";
                }
            }
            return "<span class='r_green_x'>有货</span>";
        }
</script>
</asp:Content>