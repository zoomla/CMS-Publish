<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="ZoomLaCMS.Cart.cart" MasterPageFile="~/Cart/order.master" EnableViewState="false"%>
<%@ Import Namespace="ZoomLa.Common" %>
<%@ Import Namespace="ZoomLa.BLL.Shop" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>购物车</title> </asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="head_div hidden-xs">
    <a href="/"><img src="<%=Call.LogoUrl %>" /></a>
    <div class="input-group pull-right skey_div text_300">
        <input type="text" id="skey_t" placeholder="全站检索" class="form-control skey_t" data-enter="0"/>
        <span class="input-group-btn">
            <input type="button" value="搜索" class="btn btn-default" onclick="skey();" data-enter="1"/>
        </span>
    </div>
    <div class="clearfix"></div>
</div>
<table id="EGV" class="table cartbody">
        <tr class="table_title">
            <td class="td_s"></td>
            <td>商品</td>
            <td class="hidden-xs" runat="server" id="ptype_td">单价</td>
            <td class="td_m">数量</td>
            <td class="td_m hidden-xs">状态</td>
            <td class="td_m">小计</td>
            <td class="td_s">操作</td>
        </tr>
        <asp:Repeater runat="server" ID="RPT" OnItemDataBound="RPT_ItemDataBound">
            <ItemTemplate>
                <tbody style="border:none;" class="cart_body">
                    <tr>
                        <td colspan="7" class="storename">
                            <label><input type="checkbox" class="store_chk" name="store_chk" checked="checked" value="<%#Eval("ID") %>" />
                                <i class="fa fa-home" title="店铺"></i> <%#Eval("StoreName") %></label></td>
                    </tr>
                    <asp:Repeater runat="server" ID="ProRPT" OnItemDataBound="ProRPT_ItemDataBound">
                        <ItemTemplate>
                            <asp:Panel runat="server" Visible='<%#(Eval("Class","")=="2"?true:false) %>'>
                                <tbody style="border:none;" id="suit_wrap_<%#Eval("ID") %>">
                                    <tr data-id="<%#Eval("ID") %>" class="cart_item">
                                    <td style="position:relative;">
                                        <input type="checkbox" name="prochk" data-store="<%#Eval("StoreID") %>" checked="checked" value="<%#Eval("ID") %>" />
                                        <div class="line_vertical"></div>
                                    </td>
                                    <td><strong>【套装】</strong><%#Eval("ProName") %></td>
                                    <td><%#GetMyPrice() %></td>
                                    <td class="pronum_td hidden-xs" colspan="2">
                                        <div class="input-group td_m">
                                            <span class="input-group-addon" onclick="cart.suit.setnum('<%#Eval("ID") %>','+');"><span class="fa fa-minus"></span></span>
                                            <input type="text" class="form-control pronum_text" id="pronum_<%#Eval("ID") %>" value="<%#Eval("Pronum") %>" autocomplete="off" onblur="cart.suit.setnum('<%#Eval("ID") %>',this.value);">
                                            <span class="input-group-addon" onclick="cart.suit.setnum('<%#Eval("ID") %>','-');"><span class="fa fa-plus"></span></span>
                                        </div>
                                    </td>
                                    <td class=""><span id="trprice_<%#Eval("ID") %>" class="trprice"><%#GetPrice() %></span></td>
                                    <td class="">
                                        <a href="javascript:;" class="grayremind" onclick="cart.del('<%#Eval("ID") %>');">删除</a>
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
                            <asp:Panel runat="server" Visible='<%#(Eval("Class","")=="0"?true:false) %>'>
                                <tr data-id="<%#Eval("ID") %>" class="cart_item">
                                    <td>
                                        <input type="checkbox" name="prochk" data-store="<%#Eval("StoreID") %>" checked="checked" value="<%#Eval("ID") %>" /></td>
                                    <td>
                                        <a href="<%#GetShopUrl() %>" target="_blank" title="浏览商品">
                                            <img src="<%#GetImgUrl(Eval("Thumbnails"))%>" onerror="shownopic(this);" class="preimg_l" />
                                        </a>
                                        <a href="<%#GetShopUrl() %>" target="_blank" title="浏览商品"><%#Eval("ProName") %></a>
                                        <asp:Label runat="server" ID="Present_HTML"></asp:Label>
                                    </td>
                                    <td class="tdline hidden-xs"><%#GetMyPrice() %></td>
                                    <td class="pronum_td hidden-xs">
                                        <div class="input-group margin_t20 td_m">
                                            <span class="input-group-addon" onclick="cart.setnum('<%#Eval("ID") %>','+');"><span class="fa fa-minus"></span></span>
                                            <input type="text" class="form-control pronum_text" id="pronum_<%#Eval("ID") %>" value="<%#Eval("Pronum") %>" autocomplete="off" onblur="cart.setnum('<%#Eval("ID") %>',this.value);">
                                            <span class="input-group-addon" onclick="cart.setnum('<%#Eval("ID") %>','-');"><span class="fa fa-plus"></span></span>
                                        </div>
                                    </td>
                                    <td class="tdline hidden-lg hidden-md hidden-sm r_green text-center"><%#Eval("Pronum") %></td>
                                    <td class="tdline hidden-xs"><%#GetStockStatus()%></td>
                                    <td class="tdline"><span id="trprice_<%#Eval("ID") %>" class="trprice"><%#GetPrice() %></span></td>
                                    <td class="tdline">
                                         <a href="javascript:;" class="grayremind" onclick="cart.del('<%#Eval("ID") %>');">删除</a>
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
            <label>
                <input type="checkbox" checked="checked" onclick="ChkAll(this);" />全选</label>
                <input type="button" value="批量删除" class="btn btn-primary btn-xs margin_l5" onclick="cart.batdel();" />
            <div class="pull-right">
                <span>已选择<span class="trprice" id="pronum_span"></span>件商品,总价(不含运费):<span runat="server" id="totalmoney" class="totalmoney">0.00</span></span>
<%--                <span>余额:<span id="totalPurse_sp"></span></span>
                <span>银币:<span id="totalSicon_sp"></span></span>
                <span>积分:<span id="totalPoint_sp"></span></span>--%>
                <input type="button" id="NextStep" value="去结算" class="btn btn bg-primary" onclick="GetNextStep();" />
                <asp:Button runat="server" ID="RealNext_Btn" OnClick="NextStep_Click" Style="display: none;" />
            </div>
        </td></tr>
</table>
<div id="remind_max" style="padding: 20px; display: none;">
    <div>
        <span class="fa fa-warning" style="font-size: 48px; color: #ffd800;"></span>
        <span style="font-size: 18px; font-weight: bold; margin-left: 10px;">商品数量不能大于200</span>
    </div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
@media(max-width:768px) {.container {padding-left:0px;padding-right:0px;}}
.cartbody .suit_item{background:#fff4e8;}
.cartbody .line_circle{background:url(/App_Themes/Admin/shop/cart-line-02.png) 0 -17px no-repeat;top:0px;left:10px;height:30px;display:block;position:absolute;width:7px;}
.cartbody .line_vertical{border:none; border-left:1px dashed #ddd;width:1px;height:100%;display:block;position:absolute;left:13px;min-height:90px;}
</style>
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