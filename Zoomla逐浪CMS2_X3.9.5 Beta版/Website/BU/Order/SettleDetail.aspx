<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SettleDetail.aspx.cs" Inherits="ZoomLaCMS.BU.Order.SettleDetail" MasterPageFile="~/Common/Master/User.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>结清详情</title><style type="text/css">
.prochk,input[name='prochk']{display:none;}
.table tr td,.table tr th { border-bottom:1px solid #ddd;}
.cartbody .suit_item{background:#fff4e8;}
.cartbody .line_circle{background:url(/App_Themes/Admin/shop/cart-line-02.png) 0 -17px no-repeat;top:0px;left:10px;height:30px;display:block;position:absolute;width:7px;}
.cartbody .line_vertical{border:none; border-left:1px dashed #ddd;width:1px;height:100%;display:block;position:absolute;left:13px;min-height:90px;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="store"></div> 
<div class="container">
    <div class="margin_t5">
        <ol class="breadcrumb">
            <li><a title="会员中心" href="/User/">会员中心</a></li>
            <li class="active">结算详情</li>
            <div class="clearfix"></div>
        </ol>
    </div>
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
</table>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>