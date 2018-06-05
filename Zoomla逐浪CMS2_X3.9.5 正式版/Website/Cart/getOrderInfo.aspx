<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="getOrderInfo.aspx.cs" Inherits="ZoomLaCMS.Cart.getOrderInfo"  MasterPageFile="~/Cart/order.master" EnableViewStateMac="true"%>
<%@ Import Namespace="ZoomLa.Common" %>
<%@ Import Namespace="ZoomLa.BLL.Shop" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/ICMS/ZL_Common.js"></script>
<title>订单结算_<%Call.Label("{$SiteName/}"); %></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<div class="progress carpro">
		<div class="progress-bar w-50" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"><h1>填写订单信息</h1></div>
	</div>
	
	<div class="container cartbody">
    <div class="row card Settlbody">
        <div class="bordered card" runat="server" id="Address_Div">
            <div class="card-header" onclick="showlistbox('#shopuserMap')">
                <i class="zi zi_pencilsquare strong">收货人信息</i>
                <button type="button" class="btn btn-info btn-sm ml-2" onclick="AddAddress();"><i class="zi zi_tmAdn"></i>添加新地址</button>
            </div>
            <section class="card-header" id="shopuserMap">
                <ul class="addresssul indent" id="addressul"></ul>
                <div class="ml-2">
                    <span>配送时间：</span>
                    <span id="exptime_sp">工作日、双休日与节假日均可送货</span>
                    <a href="javascript:;" onclick="exp.showExpTime();">修改</a>
                    <asp:HiddenField runat="server" ID="exptime_hid" Value="工作日、双休日与节假日均可送货" />
                </div>
            </section>
        </div>
        <div class="bordered card">
            <div class="card-header mb-1"  onclick="showlistbox('#self_wrap')">
                <label class="btn btn-info btn-sm">
                    <i class="zi zi_gouwulan"></i> 用户自提取商品
                 <input type="radio" value="self" name="ars_chk" style="display: none;" />
                </label>
            </div>
            <div class="arsInfo_wrap card-body" id="self_wrap" style="display: none;">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text">联系人</span>
                    </div>
                    <input type="text" class="form-control text_md" id="arsInfo_name" name="arsInfo_name" />
                    <div class="input-group-prepend">
                        <span class="input-group-text">联系电话</span>
                    </div>
                    <input type="text" class="form-control text_md" id="arsInfo_mobile" name="arsInfo_mobile" />
                </div>
            </div>
        </div>
        <div class="bordered card" runat="server" visible="false" id="wx_address">
            <div class="card-header mb-1" onclick="showlistbox('#wx_address_wrap')">
                <label onclick="wx_openAddress();" class="btn btn-info btn-sm arsItem">
                    <i class="zi zi_tmWeixin"></i> 微信收货地址
                    <input type="radio" value="wechat" name="ars_chk" style="display:none;"/>
                </label>
            </div>
            <div class="arsInfo_wrap card-body" id="wx_address_wrap" style="display: none;">
                <table class="table table-bordered table-striped">
                    <tr><td>收货人</td><td><input type="text" class="form-control" id="wxad_name" name="wxad_name" /></td></tr>
                    <tr><td>手机</td><td><input type="text" class="form-control" id="wxad_mobile" name="wxad_mobile" /></td></tr>
                    <tr><td>省份城市</td><td><input type="text" class="form-control" id="wxad_city" name="wxad_city" /></td></tr>
                    <tr><td>详细地址</td><td><input type="text" class="form-control" id="wxad_address" name="wxad_address" /></td></tr>
                </table>
            </div>
        </div>
		<div class="card">
		<div class="card-header mb-1" onClick="showlistbox('.shopInvoice')">发票信息</div>
        <div class="bordered card-body shopInvoice">
            <p><i class="zi zi_th strong"> 发票信息</i></p>
            <asp:Literal runat="server" ID="Invoice_Lit" EnableViewState="false"></asp:Literal>
        </div>
		</div>
        <div class="card bordered">
            <div class="card-header mb-1 shop_list_t" onClick="showlistbox('.orderbody')"><i class="zi zi_cubes strong">商品清单: </i>
                <a runat="server" id="ReUrl_A1" visible="false" title="返回购物车" class="pull-right padding_r10">&lt;返回修改购物车</a>
                <a runat="server" id="ReUrl_A2" visible="false" class="pull-right padding_r10">返回修改信息</a>
            </div>
            <div class="card-body indent orderbody">
                <table class="table text-center Settlement_table">
                <tr class="shop_tabtr"><td>商品</td><td></td><td>金额</td><td>优惠</td><td>数量</td><td class="move_d_none">状态</td></tr>
                    <asp:Repeater runat="server" ID="Store_RPT" OnItemDataBound="Store_RPT_ItemDataBound" EnableViewState="false">
                        <ItemTemplate>
                            <tbody>
                                <tr>
                                    <td colspan="6" class="storename text-left"><label><i class="zi zi_home"></i> <%#Eval("StoreName") %></label></td></tr>
                                     <asp:Repeater runat="server" ID="ProRPT" EnableViewState="false" OnItemDataBound="ProRPT_ItemDataBound">
                                                <ItemTemplate>
                                                    <asp:Panel runat="server" Visible='<%#(Eval("Class","")=="2"?true:false) %>'>
                                                        <tr>
                                                            <td class="text-left">
                                                                <div>
                                                                    <a href="<%#GetShopUrl() %>" target="_blank" title="浏览商品"><strong>【套装】</strong><%#Eval("ProName") %></a>
                                                                </div>
                                                            </td>
                                                            <td>
                                                                <i class="zi zi_yensign"><%#Eval("AllMoney","{0:F2}") %></i>
                                                            </td>
                                                            <td class="text-danger"><%#GetDisCount()%></td>
                                                            <td>x <%#Eval("Pronum") %></td>
                                                            <td><%#GetStockStatus() %></td>
                                                        </tr>
                                                        <asp:Repeater runat="server" ID="SuitPro_RPT">
                                                            <ItemTemplate>
                                                                <tr class="suit_item">
                                                                    <td class="text-left pl-4">
                                                                        <div class="pull-left">
                                                                            <a href="<%#GetShopUrl() %>" target="_blank" title="浏览商品">
                                                                                <img src="<%#function.GetImgUrl(Eval("Thumbnails"))%>" onerror="shownopic(this);" class="preimg_m" /></a>
                                                                        </div>
                                                                        
                                                                    </td>
																	<td>
																	<div class="tdtext shop_ddcon" >
                                                                            <a href="<%#GetShopUrl() %>" target="_blank" title="浏览商品"><span><%#Eval("ProName") %></span></a>
																	</div>
																	</td>
                                                                    <td class="tdtext">
                                                                       <%-- <i class="zi zi_yensign"><%#Eval("AllMoney","{0:F2}") %></i>--%>
                                                                    </td>
                                                                    <td class="text-danger"></td>
                                                                    <td class="r_gray tdtext">1件/套 x<%#Eval("Pronum") %></td>
                                                                    <td class="tdtext cartStock move_d_none"><%#GetStockStatus() %></td>
                                                                </tr>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </asp:Panel>
                                                    <asp:Panel runat="server" Visible='<%#(Eval("Class","")=="0"?true:false) %>'>
                                                        <tr>
                                                            <td class="text-left">
                                                                <div class="pull-left">
                                                                    <a href="<%#GetShopUrl() %>" target="_blank" title="浏览商品">
                                                                        <img src="<%#function.GetImgUrl(Eval("Thumbnails"))%>" onerror="shownopic(this);" class="preimg_m" /></a>
                                                                </div>
                                                                
                                                            </td>
															<td>
															<div class="tdtext shop_ddcon text-left">
																<a href="<%#GetShopUrl() %>" target="_blank" title="浏览商品"><span><%#Eval("ProName") %></span></a>
																<p class="grayremind"><%#GetAddition() %></p>
															</div>
															<div>
																 <asp:Label runat="server" ID="Present_HTML"></asp:Label>
															</div>
															</td>
                                                            <td class="tdtext">
                                                                <i class="zi zi_yensign"><%#Eval("AllMoney","{0:F2}") %></i>
                                                            </td>
                                                            <td class="tdtext text-danger"><%#GetDisCount()%></td>
                                                            <td class="tdtext">x <%#Eval("Pronum") %></td>
                                                            <td class="tdtext cartStock move_d_none"><%#GetStockStatus() %></td>
                                                        </tr>
                                                    </asp:Panel>
                                                </ItemTemplate>
                                        </asp:Repeater>
                                   <tr><td colspan="6" class="text-right">
                                           <span>配送方式:</span>
                                       <asp:Literal runat="server" ID="FareType_L" EnableViewState="false"></asp:Literal>
                                       </td></tr>
                                 </tbody>
                        </ItemTemplate>
                    </asp:Repeater>
                <tr>
                    <td colspan="6">
                        <div class="text-right total_count_div">
                            <div><span><span runat="server" id="itemnum_span" class="text-success">1</span>件商品,总商品金额：</span><i class="zi zi_yensign" runat="server" id="totalmoney_span1">0.00</i>
                               <%-- <span>余额:<span id="totalPurse_sp"></span></span>
                                <span>银币:<span id="totalSicon_sp"></span></span>
                                <span>积分:<span id="totalPoint_sp"></span></span>--%>
                            </div>
                            <div><span>优惠券：</span><i class="zi zi_yensign" id="arrive_money_sp">0.00</i></div>
                            <div><span>积分折扣：</span><i class="zi zi_yensign" id="point_money_sp">0.00</i></div>
                            <div><span>运费：</span><i class="zi zi_yensign" id="fare_span">0.00</i></div>
                            <div class="pay_moneyAll"><span>应付总额：</span><i class="zi zi_yensign" runat="server" id="totalmoney_span2">0.00</i></div>
                        </div>
                    </td>
                </tr>
            </table>
                <ul class="extend_ul">
                    <li runat="server" visible="false" id="userli">
                         <p><a href="javascript:;" onclick="$('#userlist_div').toggle();" title="显示顾客详情"><i class="zi zi_users"> 顾客与联系人列表</i></a></p>
                        <div id="userlist_div" class="extenddiv" style="display:block;">
                            <table class="table table-bordered">
                                <tr>
                                    <td class="td_m">姓名</td><td>证件号</td><td>手机</td>
                                </tr>
                                <asp:Repeater runat="server" ID="UserRPT" EnableViewState="false">
                                    <ItemTemplate><tr><td><%#Eval("Name") %></td><td><%#Eval("CertCode") %></td><td><%#Eval("Mobile") %></td></tr></ItemTemplate>
                                </asp:Repeater>
                            </table>
                        </div>
                    </li>
                    <li>
                        <div><a href="javascript:;" onclick="$('#arrive_div').toggle();"><i class="zi zi_pluscircle"> 优惠券</i></a></div>
                        <asp:Literal runat="server" ID="Arrive_Lit" EnableViewState="false"></asp:Literal>
                    </li>
                    <li id="point_li">
                        <div><a href="javascript:;" onclick="$('.point_div').toggle();"><i class="zi zi_pluscircle"> 积分抵扣</i></a></div>
                        <div id="point_body" runat="server" visible="false" class="extenddiv point_div">
                            共<asp:Label ID="Point_L" runat="server"></asp:Label>个积分,本次可用<span id="usepoint_span" class="text-danger"></span>个积分,<asp:TextBox runat="server" ID="Point_T" Text="0" onkeyup="checkMyPoint(this);" CssClass="form-control text_150 num"/>
                        </div>
                        <div id="point_tips" runat="server" visible="false" class="alert alert-warning point_div extenddiv" role="alert">
                            <i class="zi zi_exclamationcircle"></i> 积分抵扣已关闭!
                        </div>
                    </li>
                    <li>
                       <div><a href="javascript:;" onclick="$('#oremind_div').toggle();"><i class="zi zi_pluscircle"> 订单备注</i></a></div>
                        <div id="oremind_div" class="extenddiv">
                            <p>提示：请勿填写有关支付、收货、发票方面的信息</p>
                            <asp:TextBox runat="server" ID="ORemind_T" CssClass="form-control max" MaxLength="100" placeholder="限100个字" />
                        </div>
                   </li>
                </ul>
            </div>
        </div>
        <div class="total_div total_divPC card-footer text-right">
            <span class="total">应付总额：</span><asp:Button runat="server" CssClass="btn btn-danger btn-lg ml-2" ID="AddOrder_Btn" Text="提交订单" OnClientClick="return subCheck();" OnClick="AddOrder_Btn_Click" />
        </div>

        <section class="fixed-bottom fixed_Set">
            <span class="Settlement_tex total">应付总额: <i runat="server" id="totalmoney_i" class="zi zi_yensign">0.00</i></span>
            <input type="button" id="pubsdd" value="提交订单" class="Settlement_btn">
        </section>
    </div>
	</div>
	

<asp:HiddenField ID="PointRate_Hid" runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Modal/APIResult.js"></script>
<%--<script src="/JS/Mobile/vconsole.min.js"></script>--%>
<div runat="server" id="wx_area" visible="false">
<script src="https://res.wx.qq.com/open/js/jweixin-1.2.0.js"></script>
<script>
    try {
          if (wx) {
               wx.config({<%Call.Label("{ZL:WXJSSign(1,)/}");%>,jsApiList:['checkJsApi','onMenuShareTimeline','onMenuShareAppMessage','openAddress','chooseWXPay']});}
    }catch (ex) { console.log("wechat",ex.message); }
    //-----------------------------
	var allow_wx_address=true;
    function wx_openAddress(){
		    var e = event || window.event;
            if (e && e.stopPropagation) { e.stopPropagation(); }
            else { e.cancelBubble = true; }
		if(allow_wx_address==false){return;}
        wx.openAddress({
            success: function (res) {
                $("#wxad_name").val(res.userName);
                $("#wxad_mobile").val(res.telNumber);
                $("#wxad_city").val(res.provinceName+" "+res.cityName+" "+res.countryName);
                $("#wxad_address").val(res.detailInfo);
                IsDisBtn();
            },
            cancel:function(res){console.log("cancel");},
            fail:function(res){
				alert("加载微信地址数据失败");
				allow_wx_address=false;//避免单击卡死
			;}
        })

            return false;
		
		};
</script>
</div>
<script>
    $(function () {
        //付款方式
        $(".methodul li").click(function () {
            $(this).siblings().removeClass("active");
            $(this).addClass("active");
            $(this).find(":radio")[0].checked = true;
        })
        $(".methodul li:first").click();
        //运费
        $(".fare_select").change(function () {
            UpdateTotalPrice();
        });
        arrive.init();
        exp.init();
        UpdateTotalPrice();
        ZL_Regex.B_Num(".num");
        IsDisBtn();
    })
    var diag = new ZL_Dialog();
    diag.width = "minwidth";
    diag.maxbtn = false;
    function AddAddress() {
        diag.title = "添加新地址";
        diag.url = "address.aspx";
        diag.ShowModal();
    }
    function EditAddress(id) {
        diag.title = "修改地址";
        diag.url = "address.aspx?id=" + id;
        diag.ShowModal();
    }
    function DelAddress(myid) {
        if (confirm("确定要删除吗")) {
            $("#addli_" + myid).remove();
            exp.addressDefChk();
            $.post("ordercom.ashx", { action: "deladdress", id: myid }, function () {});
        }
    }
    //价格统计
    function UpdateTotalPrice() {
        var total = parseFloat($("#totalmoney_span1").text());
        var arrive = parseFloat($("#arrive_money_sp").text());
        var point = parseFloat($("#point_money_sp").text());
        var fare = 0;
        //根据所选,计算运费
        $(".fare_select").each(function () {
            fare += parseFloat($(this).find("option:selected").data("price"));
        });
        total = (total + arrive + fare - point);
        total = total > 0 ? total : 0;
        $("#fare_span").text(fare.toFixed(2));
        $("#totalmoney_span2").text(total.toFixed(2));
        $("#totalmoney_i").text(total.toFixed(2));
        $("#totalPurse_sp").text(GetSumByFilter(".purse_sp"));
        $("#totalSicon_sp").text(GetSumByFilter(".sicon_sp"));
        $("#totalPoint_sp").text(GetSumByFilter(".point_sp"));
    }
    //计算可用积分抵扣
    function SumByPoint(usepoint) {
        var point = parseFloat($("#Point_L").text());
        if (usepoint > point) { usepoint = point; };
        $("#usepoint_span").text(usepoint);
        $("#Point_T").change(function () {
            var point = Convert.ToDouble(this.value);
            if (point > usepoint) { point = usepoint; }
            this.value = point;
        });
    }
    function GetSumByFilter(filter) {
        var total = 0.00;
        $(filter).each(function () {
            var price = parseFloat($(this).text());
            if (price) total += price;
        });
        return total.toFixed(2);
    }
    //是否禁用按钮
    function IsDisBtn() {
        var flag = false;
        if ($("input[name='ars_chk']:checked").length>0) { }
        else if ($("#Address_Div").length > 0 && $(".addresssul li").length < 1) {
            console.log("未选定地址"); flag = true;
        }
        if ($(".stockout").length > 0) { console.log("有缺货数据"); flag = true; }
        if (flag) { disBtn(document.getElementById("AddOrder_Btn")); }
        else { console.log("检测通过"); disBtn(document.getElementById("AddOrder_Btn"),100); }
    }
    //提交前检测
    function subCheck() {
        $rad = $("input[name='ars_chk']:checked");
        if ($rad.length > 0) {
            switch ($rad.val()) {
                case "self":
                    {
                        if (ZL_Regex.isEmpty($("#arsInfo_name").val())) { alert("联系人不能为空"); return false; }
                        if (!ZL_Regex.isMobilePhone($("#arsInfo_mobile").val())) { alert("手机号码格式错误"); return false; }
                    }
                    break;
                case "wechat":
                    {
                        if (ZL_Regex.isEmpty($("#wxad_name").val())) { alert("联系人不能为空"); return false; }
                        if (!ZL_Regex.isMobilePhone($("#wxad_mobile").val())) { alert("手机号码格式错误"); return false; }
                        if (ZL_Regex.isEmpty($("#wxad_address").val())) { alert("详细地址不能为空"); return false; }
                    }
                    break;
            }
        }
        disBtn(document.getElementById("AddOrder_Btn"), 5000);
        return true;
    }
    function checkMyPoint(obj) {
        if (isNaN(parseFloat($(obj).val()))) { $(obj).val("0"); }
        var val = parseFloat($(obj).val());
        var usepoint = parseFloat($("#usepoint_span").text());//可用积分
        if (usepoint <= val) { val = usepoint; };
        var pointrate = parseFloat($("#PointRate_Hid").val());
        $("#point_money_sp").text((val * pointrate).toFixed(2));
        UpdateTotalPrice();
    }
    function closeDiag() { diag.CloseModal(); CloseComDiag(); }
    //--------------
    var exp = {};
    exp.init = function () {
        $("#addressul").load("/cart/comp/AddressList.aspx", {}, function () {
            exp.addressDefChk();          
        });
        $(".arsItem").click(function () {
            if ($(this).hasClass("checked")) { return; }
            //------------------
            $(".addresssul li").removeClass("active");
            $(".addresssul li input:radio").each(function () { this.checked = false; });
            $(".arsItem").removeClass("checked");
            $(".arsInfo_wrap").hide();
            $(this).addClass("checked");
            $(this).parent(".bordered").find(".arsInfo_wrap").show();
        });
    }
    //选中第一个地址,添加或删除后
    exp.addressDefChk = function () {
        if ($(".addresssul li").length > 0) {
            $(".addresssul li").click(function () {
                $(this).siblings().removeClass("active");
                $(this).addClass("active");
                $(this).find("input:radio")[0].checked = true;
                //隐藏用户自提
                $(".arsItem").removeClass("checked");
//                $(".arsInfo_wrap").hide();
                $("input[name='ars_chk']").each(function () {
                    this.checked = false;
                });
            });
            $(".addresssul li:first").click(); $(":radio[name=address_rad]")[0].checked = true;
        }
        IsDisBtn();
    }
    //快递添加修改后回调
    exp.addressBack = function () {
        diag.CloseModal(); $("#addressul").load("/cart/comp/AddressList.aspx", {}, function () {
            exp.addressDefChk();
        });
    }
    exp.showExpTime = function () {
        diag.title = "配送时间";
        diag.url = "/cart/comp/exptime.aspx";
        diag.ShowModal();
    }
    exp.expTimeBack = function (json) {
        $("#exptime_sp").text(json.txt);
        $("#exptime_hid").val(json.txt);
        //$("#exptime_hid").data("json", JSON.stringify(json));
    }
    //--------------
    var arrive = {};
    arrive.init = function () {
        $("#arrive_active_ul .item").click(function () {
            var $this = $(this);
            if ($this.hasClass("choose")) {//取消使用
                $this.removeClass("choose");
                arrive.use("");
            }
            else {
                $(".arrive_o .item").removeClass("choose");
                $this.addClass("choose");
                arrive.use($this.data("flow"));
            }
        });
    }
    arrive.use = function (flow) {
        var model = { action: "arrive", "flow": flow, money: $("#totalmoney_span1").text(), ids: "<%=Request["ids"]%>" };
        if (flow == "") {
            $("#arrive_money_sp").text("-0.00"); $("#Arrive_Hid").val(flow); UpdateTotalPrice(); return;
        }
        $.post("ordercom.ashx", model, function (data) {
            var model = APIResult.getModel(data);
            if (APIResult.isok(model)) {
                $("#arrive_money_sp").text("-" + parseFloat(model.result.amount).toFixed(2));
            }
            else { $("#arrive_money_sp").text("-0.00"); alert(model.retmsg); }
            $("#Arrive_Hid").val(flow);
            UpdateTotalPrice();
        });
    }
	
	//处理商品图片大小
    var cart_Ting = $(".preimg_m");
    for(var iseq = 0;iseq<=cart_Ting.length;iseq++){
        //	console.log(cart_Ting.eq(iseq).height());
        if(cart_Ting.eq(iseq).height()>150){
            cart_Ting.eq(iseq).css({"width":"128px","height":"128px"})
        }
    }
	
	function showlistbox(obj){
	    $(obj).slideToggle();
	}
	//提交订单
	$("#pubsdd").click(function(){
	    $('#AddOrder_Btn').click();
	})
	//搜索
	function skey()
	{
	    var key = $("#skey_t").val();
	    window.open("/Search/SearchList?node=0&keyword="+key);
	}
</script>
<script runat="server">
    public string GetShopUrl()
    {
        return OrderHelper.GetShopUrl(DataConverter.CLng(Eval("StoreID")), Convert.ToInt32(Eval("ProID")));
    }
    public string GetStockStatus()
    {
        if (Eval("Allowed").ToString().Equals("0"))
        {
            int pronum = Convert.ToInt32(Eval("Pronum"));
            int stock = Convert.ToInt32(Eval("Stock"));
            if (stock < pronum)
            {
                return "<span class='text-danger_x'>缺货</span>";
            }
        }
        return "<span class='r_green_x'>有货</span>";
    }
    //已折扣的金额
    public string GetDisCount()
    {
        //return "- " + (Convert.ToDouble(Eval("AllIntegral")) - Convert.ToDouble(Eval("AllMoney"))).ToString("f2");
        return "";
    }
	
</script>
</asp:Content>