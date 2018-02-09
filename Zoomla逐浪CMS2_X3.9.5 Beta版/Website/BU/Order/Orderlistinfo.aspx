<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Orderlistinfo.aspx.cs" Inherits="ZoomLaCMS.BU.Order.Orderlistinfo" MasterPageFile="~/Common/Master/User.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>订单信息</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<link rel="stylesheet" href="/App_Themes/control.css"/>
<link href="/App_Themes/V3.css" rel="stylesheet" />
<div id="pageflag" data-nav="shop" data-ban="store"></div>
<div class="container">
<div class="margin_t5">
    <ol class="breadcrumb">
        <li><a title="会员中心" href="/User/">会员中心</a></li>
        <li><a href="/User/UserShop/OrderList">店铺订单</a></li>
        <li class="active">订单管理</li>
        <div class="clearfix"></div>
    </ol>
</div>
<ul class="nav nav-tabs" role="tablist">
    <li class="active"><a href="#OrderState" role="tab" data-toggle="tab">订单状态</a></li>
    <li><a href="#Logistics" role="tab" data-toggle="tab">物流管理</a></li>
    <li><a href="#Financial" role="tab" data-toggle="tab">财务管理</a></li>
    <li><a href="#Selled" role="tab" data-toggle="tab">售后管理</a></li>
</ul>
<div class="tab-content">
    <div role="tabpanel" class="tab-pane active" id="OrderState">
        <table class="table table-striped table-bordered">
            <tr>
                <td colspan="4" class="text-center" style="font-weight:bolder;">
                    <asp:Label ID="HeadTitle_L" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="text_md">收货人：<asp:Label ID="Reuser" runat="server"></asp:Label></td>
                <td>用户名：<asp:Label runat="server" ID="UName_L"></asp:Label></td>
                <td>下单时间：<asp:Label runat="server" ID="OrderType_L"></asp:Label></td>
                <td>确认订单：<asp:Label runat="server" ID="IsSure_L" /></td>
            </tr>
            <tr>
                <td>需开发票：<asp:Label ID="Invoiceneeds" runat="server"></asp:Label></td>
                <td>已开发票：<asp:Label ID="Developedvotes" runat="server"></asp:Label></td>
                <td>付款状态：<asp:Label ID="Paymentstatus" runat="server"></asp:Label></td>
                <td>物流状态：<asp:Label ID="ExpStatus_L" runat="server"></asp:Label></td>
            </tr>
            <tr>
                <td>订单状态</td>
                <td colspan="3">
                    <div runat="server" id="prog_order_div"></div>
                </td>
            </tr>
        </table>
    </div>
    <div role="tabpanel" class="tab-pane" id="Logistics">
        <div class="panel panel-info">
            <div class="panel-heading">物流信息</div>
            <div class="panel-body">
                        <div class="col-md-6">
            <table class="table table-bordered table-striped">
                        <tr>
                            <td width="28%" align="right">收货人姓名：</td>
                            <td width="72%" align="left">&nbsp;<asp:Label ID="Reusers" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <td align="right">收货人地址：
                            </td>
                            <td align="left">&nbsp;<asp:Label ID="Jiedao" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">收货人邮箱：
                            </td>
                            <td align="left">&nbsp;<asp:Label ID="Email" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">付款方式：
                            </td>
                            <td align="left">&nbsp;<asp:Label ID="Payment" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">发票信息：
                            </td>
                            <td align="left">
                               <table class="table table-bordered table-striped">
                                   <tr><td class="td_m">抬头：</td><td><%:invMod.InvHead %></td></tr>
                                    <tr><td>识别号：</td><td><%:invMod.UserCode %></td></tr>
                                    <tr><td>类型：</td><td><%:invMod.InvClass %></td></tr>
                                    <tr><td>明细：</td><td><%:invMod.InvContent %></td></tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">缺货处理：
                            </td>
                            <td align="left">&nbsp;<asp:Label ID="Outstock" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">配送时间：
                            </td>
                            <td align="left">&nbsp;<asp:Label ID="ExpTime_L" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
        </div>
        <div class="col-md-6">
            <table class="table table-bordered table-striped">
                        <tr>
                            <td width="28%" align="right">联系电话：
                            </td>
                            <td width="72%" align="left">&nbsp;<asp:Label ID="Phone" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">邮政编码：
                            </td>
                            <td align="left"&nbsp;<asp:Label ID="ZipCode" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">收货人手机：
                            </td>
                            <td align="left">&nbsp;<asp:Label ID="Mobile" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">跟单员：
                            </td>
                            <td align="left">&nbsp;<asp:Label ID="AddUser" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">订单状态：&nbsp;
                            </td>
                            <td align="left">&nbsp;<asp:Label ID="OrderStatus" runat="server"></asp:Label>
                                
                            </td>
                        </tr>
                        <tr>
                            <td class="text-right">快递信息：</td>
                            <td>
                                <div>快递公司：<asp:Label runat="server" ID="ExpName_L"></asp:Label></div>
                                <div>
                                    快递单号：<asp:Label runat="server" ID="ExpCode_L"></asp:Label>
                                    <a href="http://m.kuaidi100.com/index_all.html?type=<%=ExpName_L.Text %>&postid=<%=ExpCode_L.Text %>&callbackurl=<%=Request.Url.AbsoluteUri %>" target="_blank">查看物流信息</a>
                                </div>

                            </td>
                        </tr>
                    </table>
        </div>
            </div>
            <div class="panel-footer text-center">
                <a href="../iServer/BiServer.aspx?orderid=<%:Mid %>" class="btn btn-primary">服务记录</a>
            </div>
        </div>

    </div>
    <div role="tabpanel" class="tab-pane" id="Financial">
        <div class="panel panel-primary">
            <div class="panel-heading"><span class="fa fa-th"></span><span class="margin_l5">商品信息</span></div>
            <div class="panel-body">
                <table class="table table-striped table-bordered">
                    <tr>
                        <td class="td_s">ID</td>
                        <td class="td_m">图片</td>
                        <td>商品名称</td>
                        <td class="td_s">单位</td>
                        <td class="td_m">价格</td>
                        <td class="td_s">数量</td>
                        <td class="td_m">金额</td>
                    </tr>
                    <asp:Repeater ID="Procart_RPT" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("ProID") %></td>
                                <td>
                                    <img src="<%#ZoomLa.Common.function.GetImgUrl(Eval("Thumbnails"))%>" onerror="shownopic(this);" class="img_50" /></td>
                                <td>
                                    <a href='<%#GetShopUrl()%>' target='_blank'><%#Eval("proname")%></a>
                                    <%#Eval("PClass","").Equals("2")?"<input type='button' value='促销组合' onclick=\"showSuit("+Eval("ID")+");\" class='btn btn-info'>":"" %>
                                </td>
                                <td><%#Eval("Danwei") %></td>
                                <td><%#Eval("Shijia","{0:F2}")%></td>
                                <td><%#Eval("pronum") %></td>
                                <td><%#Eval("AllMoney","{0:F2}") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                                      <tr>
                        <td colspan="7">
                            <div class="input-group pull-right" style="width:550px;">
                                <span class="input-group-addon">运费</span>
                                <asp:TextBox runat="server" ID="PI_OrderExpMoney_T" class="form-control text_s" />
                                <span class="input-group-addon">订单</span>
                                <asp:TextBox runat="server" ID="PI_OrdersMoney_T" class="form-control text_md" />
                                <span class="input-group-addon">合计</span>
                                <asp:TextBox runat="server" ID="PI_OrderTotal_T" class="form-control text_md" disabled="disabled"/>
                                <span class="input-group-btn">
                                    <asp:Button ID="ChangeMoney_Btn" runat="server" Text="确认修改" CssClass="btn btn-primary" OnClick="ChangeMoney_Btn_Click" OnClientClick="return confirm('确定要修改订单和运费金额吗');" />
                                </span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="7">
                            <span>订单金额：</span>
                            <asp:Label runat="server" ID="PI_Order_L" Text="0" class="rd_green" />元
                            +
                            <span>运费：</span>
                            <asp:Label runat="server" ID="PI_Freight_L" Text="0" class="rd_green" />
                            -
                            <span>优惠：</span>
                            <asp:Label runat="server" ID="PI_Arrive_L" Text="0" class="rd_green" />元
                            -
                            <span>积分：</span>
                            <asp:Label runat="server" ID="PI_Point_L" Text="0" class="rd_green" />
                            =
                            <span>需付：</span>
                            <asp:Label runat="server" ID="PI_NeedPay_L" Text="0" class="rd_green" />元
                            (<span>已收金额：</span><asp:Label ID="PI_ReceMoney_L" runat="server" class="rd_red"></asp:Label>)
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div role="tabpanel" class="tab-pane" id="Selled">
        <div class="panel panel-primary">
            <div class="panel-heading" id="msg_tabs">
                <a href="javascript:;" data-tar="#tab1" class="btn btn-default active"><i class="fa fa-history"></i> 内部记录</a> 
                <a href="javascript:;" data-tar="#tab2" class="btn btn-default"><i class="fa fa-sticky-note-o"></i> 备注留言</a>
                <a href="javascript:;" data-tar="#tab3" class="btn btn-default"><i class="fa fa-user"></i> 客户详情</a>
            </div>
            <div class="panel-body tab-content" id="msg_content" style="min-height:240px;">
                <div class="tab-pane active" id="tab1">
                    <asp:TextBox runat="server" ID="Internalrecords_T" CssClass="form-control" style="height:200px;" TextMode="MultiLine" placeholder="内部记录"></asp:TextBox>
                </div>
                <div class="tab-pane" id="tab2">
                    <asp:TextBox runat="server" ID="Ordermessage_T" CssClass="form-control" style="height:200px;" TextMode="MultiLine" placeholder="备注留言"></asp:TextBox>
                </div>
                <div class="tab-pane" id="tab3">
                    <table class="table table-bordered">
                    <tr>
                        <td class="td_m">姓名</td>
                        <td>证件号</td>
                        <td>手机</td>
                    </tr>
                    <asp:Repeater runat="server" ID="UserRPT" EnableViewState="false">
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("Name") %></td>
                                <td><%#Eval("CertCode") %></td>
                                <td><%#Eval("Mobile") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
                </div>
            </div>
            <div class="panel-footer"><asp:Button runat="server" ID="SaveRemind_Btn" Text="保存修改" OnClick="SaveRemind_Btn_Click" CssClass="btn btn-primary" /></div>
        </div>
       <div class="panel panel-primary">
            <div class="panel-heading"><i class="fa fa-chevron-left"></i> 退款申请</div>
            <div class="panel-body">
                <table class="table table-bordered">
                    <tr><td class="td_l">用户退款理由：</td><td><asp:Label ID="Back_UserRemind_L" runat="server" /></td></tr>
                    <tr><td>退款处理记录：</td><td><asp:Label ID="Back_AdminRemind_L" runat="server" /></td></tr>
                    <tr><td>处理结果：</td><td><asp:Label runat="server" ID="Back_ZStatus_L" /></td></tr>
                </table>
            </div>
            <div class="panel-footer">
                <input type="button" value="处理退款" onclick="ShowDrawDiag();" runat="server" class="btn btn-danger" id="Back_Btn" visible="false"/>
            </div>
        </div>
    </div>
</div>
<table class="table table-striped table-bordered table-hover">
    <tr>
        <td rowspan="2" class="text_md">订单流程</td>
        <td>
            <%--<asp:Button ID="OS_Normal_Btn" CssClass="btn btn-danger" runat="server" Text="重启订单" OnClick="OS_Normal_Btn_Click" OnClientClick="return confirm('确定重启订单吗,订单与付款状态将还原');" />--%>
            <asp:Button ID="OS_Sure_Btn" Enabled="false" CssClass="btn btn-info" runat="server" Text="确认订单" OnClick="OS_Sure_Btn_Click" />
            <%--<asp:Button runat="server" ID="CompleteOrder_Btn" CssClass="btn btn-danger" Text="完结订单" OnClick="CompleteOrder_Btn_Click" OnClientClick="return confirm('确定完结订单吗!');" />--%>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="OS_NoSure_Btn" CssClass="btn btn-warning" runat="server" Text="取消确认" OnClick="OS_NoSure_Btn_Click" />
            <asp:Button ID="OS_Pause_Btn" CssClass="btn btn-warning" runat="server" Text="暂停处理" OnClick="OS_Pause_Btn_Click" />
            <asp:Button ID="OS_Freeze_Btn" CssClass="btn btn-warning" runat="server" Text="冻结订单" OnClick="OS_Freeze_Btn_Click" />
            <%--<asp:Button ID="OS_Aside_Btn" CssClass="btn btn-warning" runat="server" Text="订单作废" OnClick="OS_Aside_Btn_Click" OnClientClick="return confirm('确定要作废订单吗?');" />--%>
        </td>
    </tr>
    <tr>
        <td>财务管理</td>
        <td>
<%--            <asp:Button runat="server" ID="Pay_Cancel_Btn" CssClass="btn btn-info" Text="取消支付" OnClientClick="return confirm('确定要变更状态为未支付吗?');" OnClick="Pay_Cancel_Btn_Click"/>
            <button runat="server" type="button" class="btn btn-info" id="Pay_Has_Btn" onclick="orderpay();" >已经支付</button>--%>
            <div class="margin_t5">
                <button runat="server" type="button" class="btn btn-info" id="Pay_Settle_Btn" onclick="orderSettle();">订单结清</button>
                <span class="rd_green">（*此操作用于预付款购物,可调整商品数量与补交金额,用户支付后才可操作）</span>
            </div>
 <%--           <div class="margin_t5">
                <input type="button" id="Refund_B" runat="server" class="btn btn-info" value="退单返款" onclick="refund()" />
                <asp:Button runat="server" ID="Refund_Btn" CssClass="hidden" OnClick="Refund_Btn_Click" />
                <span class="rd_green">（*此操作将本订单的款项以余额的方式存入下单人会员ID中）</span>
            </div>--%>
        </td>
    </tr>
    <tr><td>物流状态</td><td>
        <asp:Button runat="server" CssClass="btn btn-info" ID="Exp_Cancel_Btn" Text="取消发送" OnClick="EXP_Cancel_Btn_Click" OnClientClick="return confirm('确定要修改发送状态吗');" />
        <asp:Button runat="server" CssClass="btn btn-info" ID="Exp_Send_Btn" Text="发送货物" OnClientClick="return ShowSendGood();" />
        <asp:Button runat="server" CssClass="btn btn-info" ID="Exp_ClientSign_Btn"  Text="客户签收"  OnClick="Exp_ClientSign_Btn_Click" Enabled="false" />
    </td></tr>
    <tr>
        <td>附加操作</td>
        <td>
            <asp:Button ID="OS_Invoice_Btn" CssClass="btn btn-info" runat="server" Text="已开发票" OnClick="OS_Invoice_Btn_Click" />
            <button id="ExpPrint_B" runat="server" type="button" class="btn btn-info" onclick="printexp();" >快递打单</button>
            <a href="addon/printorder.aspx?id=<%:Mid %>"target="_blank" class="btn btn-info">打印订单</a>
        </td>
    </tr>
</table>
<div id="chkreturn_div" style="display:none;">
    <table class="table table-bordered table-striped">
        <tr>
            <td style="width:20%;" class="text-right">订单号：</td><td><asp:Label ID="OrderNo_L" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width:20%;" class="text-right">订单金额：</td><td><asp:Label ID="Orderamounts_L" runat="server"></asp:Label> </td>
        </tr>
        <tr>
            <td style="width:20%;" class="text-right">下单日期：</td><td><asp:Label ID="Cdate_L" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td style="width:20%;" class="text-right">理由：</td><td><asp:TextBox runat="server" ID="Back_T" TextMode="MultiLine" CssClass="form-control" style="height:120px;width:100%;max-width:100%;" /></td>
        </tr>
    </table>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<link href="/Plugins/Third/alert/sweetalert.css" rel="stylesheet" />
<script src="/Plugins/Third/alert/sweetalert.min.js?v=1"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Controls/ZL_Array.js"></script>
<script src="/JS/Controls/Control.js"></script>
<script src="/JS/DatePicker/WdatePicker.js"></script>
<script>
    var diag = new ZL_Dialog();
    //发货弹出框(后期改为独立页面)
    function ShowSendGood() {
        comdiag.maxbtn = false;
        comdiag.ShowModal("Addon/exp/delivery.aspx?ID=<%=Mid %>", "发货操作");
        return false;
    }
    function CloseDiag() {
        diag.CloseModal();
        comdiag.CloseModal();
        DrawDiag.CloseModal();
    }
    function showuinfo(uid) {
        var url = siteconf.path + "User/UserInfo.aspx?id=" + uid
        comdiag.maxbtn = false;
        comdiag.ShowModal(url, "会员信息");
    }
    function showtxt(obj) {
        if (obj.options[obj.selectedIndex].value == "77") {
            var txt = document.getElementById("kdgs");
            txt.style.display = "";

        } else {
            var txt = document.getElementById("kdgs");
            txt.style.display = "none";
        }
    }
    function ShowDrawDiag() {
        ShowComDiag("addon/back/orderback.aspx?id=<%:Mid%>","退款处理");
    }
    function RefreshDiv() {
        v = $("#inter_Text").val();
        $("#inter_Div").html(v);
    }
    $(function () {
        $("#msg_tabs a").click(function () {
            $("#msg_tabs a").removeClass("active");
            $(this).addClass("active");
            $("#msg_content .tab-pane").removeClass("active");
            $($(this).data("tar")).addClass("active");
        });
    });
    function refund() {
        swal({ title: "退单返款", "text": "该订单收款<%=orderinfo.Receivablesamount%>元,确定要退回用户[<%=orderinfo.AddUser%>]的余额中吗？", type: "info", showCancelButton: true, confirmButtonColor: "#DD6B55", confirmButtonText: "确定", closeOnConfirm: false }, function () { $("#Refund_Btn").click(); });
    }
    function orderpay() {
        diag.url = "Diag/OrderPay.aspx?orderid=<%=Mid%>";
        diag.title = "确认支付";
        diag.maxbtn = false;
        diag.ShowModal();
    }
    function orderSettle() {
        location.href = "/BU/Money/OrderSettle.aspx?ID=<%:Mid%>";
    }
    function printexp() {
        window.location.href = "Addon/ExpPrint.aspx?ID=<%:Mid%>";
    }
    function showSuit(cartid) {
        ShowComDiag("/common/comp/SuitPro_Cart.aspx?CartID=" + cartid, "促销组合");
    }
</script>
</asp:Content>