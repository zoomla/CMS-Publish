<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderSettle.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Addon.after.BackSuit" MasterPageFile="~/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>订单清结</title>
<link href="/App_Themes/User.css" rel="stylesheet" />
<style type="text/css">
.prochk,input[name='prochk']{display:none;}
.table tr td,.table tr th { border-bottom:1px solid #ddd;}
.cartbody .suit_item{background:#fff4e8;}
.cartbody .line_circle{background:url(/App_Themes/Admin/shop/cart-line-02.png) 0 -17px no-repeat;top:0px;left:10px;height:30px;display:block;position:absolute;width:7px;}
.cartbody .line_vertical{border:none; border-left:1px dashed #ddd;width:1px;height:100%;display:block;position:absolute;left:13px;min-height:90px;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-bordered table-striped">
    <tr><td class="td_m">订单编号</td><td><asp:Label runat="server" ID="OrderNo_L" /></td></tr>
    <tr><td>收货人</td><td><asp:Label runat="server" ID="Receiver_L"></asp:Label></td></tr>
    <tr><td>订单日期</td><td><asp:Label runat="server" ID="AddTime_L"></asp:Label></td></tr>
    <tr><td colspan="2">
        <table id="EGV" class="table cartbody">
        <tr class="table_title">
            <td class="td_s"></td>
            <td>商品</td>
            <td class="td_l">单价</td>
            <td class="td_m">数量</td>
            <td class="td_m hidden-xs">状态</td>
            <td class="td_l">小计</td>
            <td class="td_s">操作</td>
        </tr>
        <asp:Repeater runat="server" ID="RPT" OnItemDataBound="RPT_ItemDataBound">
            <ItemTemplate>
                <tbody style="border:none;" class="cart_body">
                    <tr>
                        <td colspan="7" class="storename">
                            <label><input type="checkbox" class="store_chk" name="store_chk" checked="checked" value="<%#Eval("ID") %>" />
                                <%#Eval("StoreName") %></label></td>
                    </tr>
                    <asp:Repeater runat="server" ID="ProRPT" OnItemDataBound="ProRPT_ItemDataBound">
                        <ItemTemplate>
                            <asp:Panel runat="server" Visible='<%#(Eval("PClass","")=="2"?true:false) %>'>
                                <tbody style="border:none;" id="suit_wrap_<%#Eval("ID") %>">
                                    <tr data-id="<%#Eval("ID") %>" class="cart_item">
                                    <td style="position:relative;">
                                        <input type="checkbox" name="prochk" checked="checked" value="<%#Eval("ID") %>" />
                                        <div class="line_vertical"></div>
                                    </td>
                                    <td><strong>【套装】</strong><%#Eval("ProName") %></td>
                                    <td><%#GetMyPrice() %></td>
                                    <td class="pronum_td hidden-xs" colspan="2">
                                        <div class="input-group td_m">
                                            <span class="input-group-addon" onclick="cart.suit.setnum('<%#Eval("ID") %>','+');"><span class="fa fa-minus"></span></span>
                                            <input type="text" class="form-control pronum_text" id="pronum_<%#Eval("ID") %>" name="pronum_<%#Eval("ID") %>" value="<%#Eval("Pronum") %>" autocomplete="off" onblur="cart.suit.setnum('<%#Eval("ID") %>',this.value);">
                                            <span class="input-group-addon" onclick="cart.suit.setnum('<%#Eval("ID") %>','-');"><span class="fa fa-plus"></span></span>
                                        </div>
                                    </td>
                                    <td class=""><%#GetPrice() %></td>
                                    <td class="">
                                     <%--   <a href="javascript:;" class="grayremind" onclick="cart.del('<%#Eval("ID") %>');">删除</a>--%>
                                    </td>
                                </tr>
                                    <asp:Repeater runat="server" ID="SuitPro_RPT">
                                        <ItemTemplate>
                                            <tr class="suit_item">
                                                <td style="position: relative;">
                                                    <span class="line_circle"></span>
                                                    <div class="line_vertical"></div>
                                                </td>
                                                <td>
                                                    <a href="<%#GetShopUrl() %>" target="_blank" title="浏览商品">
                                                        <img src="<%#GetImgUrl(Eval("Thumbnails"))%>" onerror="shownopic(this);" class="preimg_l" />
                                                    </a>
                                                    <a href="<%#GetShopUrl() %>" target="_blank" title="浏览商品"><%#Eval("ProName") %></a>
                                                </td>
                                                <td class="tdline hidden-xs suit_item_price" style="color: #999; font-size: 12px;"><%#Eval("LinPrice","{0:F2}") %></td>
                                                <td class="tdline text-center" style="color: #999; font-size: 12px;">
                                                    <span class="suit_item_num"><%#Eval("suitnum") %></span><%#Eval("ProUnit") %>/套 X<span class="suit_item_pronum"><%#Eval("Pronum") %></span>
                                                </td>
                                                <td class="tdline hidden-xs"></td>
                                                <td class="tdline suit_item_total" style="color: #999;"><%#(Convert.ToDouble(Eval("LinPrice"))*Convert.ToInt32(Eval("Pronum"))).ToString("F2") %></td>
                                                <td class="tdline">
                                                    <%-- <a href="javascript:;" class="grayremind" onclick="cart.del('<%#Eval("ID") %>');">删除</a>--%>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </tbody>
                            </asp:Panel>
                            <asp:Panel runat="server" Visible='<%#(Eval("PClass","")=="0"?true:false) %>'>
                                <tr data-id="<%#Eval("ID") %>" class="cart_item">
                                    <td>
                                        <input type="checkbox" name="prochk" checked="checked" value="<%#Eval("ID") %>" /></td>
                                    <td>
                                        <a href="<%#GetShopUrl() %>" target="_blank" title="浏览商品">
                                            <img src="<%#GetImgUrl(Eval("Thumbnails"))%>" onerror="shownopic(this);" class="preimg_l" />
                                        </a>
                                        <a href="<%#GetShopUrl() %>" target="_blank" title="浏览商品"><%#Eval("ProName") %></a>
                                    </td>
                                    <td class="tdline hidden-xs"><%#GetMyPrice() %></td>
                                    <td class="pronum_td hidden-xs">
                                        <div class="input-group margin_t20 td_m">
                                            <span class="input-group-addon" onclick="cart.setnum('<%#Eval("ID") %>','+');"><span class="fa fa-minus"></span></span>
                                            <input type="text" class="form-control pronum_text" id="pronum_<%#Eval("ID") %>" name="pronum_<%#Eval("ID") %>" value="<%#Eval("Pronum") %>" autocomplete="off" onblur="cart.setnum('<%#Eval("ID") %>',this.value);">
                                            <span class="input-group-addon" onclick="cart.setnum('<%#Eval("ID") %>','-');"><span class="fa fa-plus"></span></span>
                                        </div>
                                    </td>
                                    <td class="tdline hidden-lg hidden-md hidden-sm r_green text-center"><%#Eval("Pronum") %></td>
                                    <td class="tdline hidden-xs"></td>
                                    <td class="tdline"><%#GetPrice() %></td>
                                    <td class="tdline">
                                      <%--   <a href="javascript:;" class="grayremind" onclick="cart.del('<%#Eval("ID") %>');">删除</a>--%>
                                    </td>
                                </tr>
                            </asp:Panel>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </ItemTemplate>
        </asp:Repeater>
        <tr><td colspan="7">
            <label>计价：</label>
             <asp:Label runat="server" id="PI_Total_L"></asp:Label>
            -<asp:Label runat="server" ID="PI_Receive_L"></asp:Label>
            -<asp:Label runat="server" ID="PI_Arrive_L"></asp:Label>
            -<asp:Label runat="server" ID="PI_Point_L"></asp:Label>
            =<ZL:TextBox runat="server" ID="PI_NeedPay_T" class="form-control text_s" AllowEmpty="false" ValidType="Float"></ZL:TextBox>
        <%--    <asp:Label runat="server" ID="PI_NeedPay_L" class="totalmoney">0.00</asp:Label> --%>
            (总计-预付-优惠-积分抵扣=需付)
        </td></tr>
</table>
        </td></tr>
    <tr><td>备注</td><td><asp:TextBox runat="server" TextMode="MultiLine" class="form-control m715-50" style="height:100px;" ID="Remind_T"/></td></tr>
    <tr runat="server" id="op_wrap"><td></td><td><asp:Button runat="server" ID="Save_Btn" Text="结算订单" OnClick="Save_Btn_Click" OnClientClick="return confirm('确定要结清吗,将会同步修改已支付数据');" class="btn btn-primary"/></td></tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Controls/Control.js"></script>
<script src="/JS/ICMS/ZL_Common.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script src="/JS/Modal/APIResult.js"></script>
<script>
    var diag = new ZL_Dialog();
    var cart = { api: "OrderSettle.aspx?action=", suit: {}, price: {} };
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
        cart.suit.updateNumAndPrice(id, num);
    }
    //更新套装商品价格,仅显示,不参与逻辑
    cart.suit.updateNumAndPrice = function (id, num) {
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
    })
    //更新数量,确定是否禁用按钮
    function UpdateItemNum() {
        var num = $("[name=prochk]:checked").length;
        $("#pronum_span").text(num);
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
        $("#PI_Total_L").text(money.toFixed(2));
        var receive = parseFloat($("#PI_Receive_L").text());
        var arrive = parseFloat($("#PI_Arrive_L").text());
        var point = parseFloat($("#PI_Point_L").text());
        var needpay = (money - receive - arrive - point);
        //$("#PI_NeedPay_L").text((money - receive - arrive - point).toFixed(2));
        $("#PI_NeedPay_T").val(needpay.toFixed(2));
    }
</script>
</asp:Content>