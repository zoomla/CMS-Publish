<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Orderlistinfo.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Orderlistinfo"  MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>订单信息</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<asp:Label runat="server" ID="Bread_L"></asp:Label>
<asp:ImageButton runat="server" ID="btnPre2" ImageUrl="/images/up.gif" OnClick="btnPre_Click" ToolTip="上一张" Visible="false" />
<asp:ImageButton runat="server" ID="btnNext2" ImageUrl="/images/down.gif" OnClick="btnNext_Click" ToolTip="下一张" Visible="false" />
<ul class="nav nav-tabs list_choice" role="tablist">
    <li class="nav-item"><a class="nav-link active" href="#OrderState" role="tab" data-toggle="tab">订单状态</a></li>
    <li class="nav-item"><a class="nav-link" href="#Logistics" role="tab" data-toggle="tab">物流管理</a></li>
    <li class="nav-item"><a class="nav-link" href="#Financial" role="tab" data-toggle="tab">财务管理</a></li>
    <li class="nav-item"><a class="nav-link" href="#Selled" role="tab" data-toggle="tab">售后管理</a></li>
</ul>
<div class="tab-content">
    <div role="tabpanel" class="tab-pane active table-responsive-md" id="OrderState">
        <table class="table table-striped table-bordered sys_table">
            <tr>
                <td colspan="4" class="text-center" style="font-weight:bolder;">
                    <asp:Label ID="HeadTitle_L" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="">收货人：<asp:Label ID="Reuser" runat="server"></asp:Label></td>
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
        <div class="card">
            <div class="card-header">物流信息</div>
            <div class="card-body row ml-0 mr-0">
                <div class="col-12 col-md-6 table-responsive-md">
                    <table class="table table-bordered table-striped sys_table">
                        <tr>
                            <th scope="col" class="w12rem_lg">收货人姓名</th>
                            <td scope="col">
                                <asp:Label ID="Reusers" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>收货人地址</th>
                            <td>
                                <asp:Label ID="Jiedao" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>收货人邮箱</th>
                            <td>
                                <asp:Label ID="Email" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>付款方式</th>
                            <td>
                                <asp:Label ID="Payment" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>发票信息</th>
                            <td>
                                <table class="table table-bordered table-striped">
                                   <tr><td class="td_m">抬头：</td><td><%:invMod.InvHead %></td></tr>
                                    <tr><td>识别号：</td><td><%:invMod.UserCode %></td></tr>
                                    <tr><td>类型：</td><td><%:invMod.InvClass %></td></tr>
                                    <tr><td>明细：</td><td><%:invMod.InvContent %></td></tr>
                                </table>
                        </tr>
                    </table>
                </div>
        <div class="col-12 col-md-6 table-responsive-md">
            <table class="table table-bordered table-striped sys_table">
                        <tr>
                            <th sclass="w12rem_lg">联系电话：</th>
                            <td><asp:Label ID="Phone" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>邮政编码</th>
                            <td><asp:Label ID="ZipCode" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>收货人手机</th>
                            <td><asp:Label ID="Mobile" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>跟单员</th>
                            <td><asp:Label ID="AddUser" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>订单状态</th>
                            <td><asp:Label ID="OrderStatus" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>快递信息</th>
                            <td>
                                <div>快递公司：<asp:Label runat="server" ID="ExpName_L"></asp:Label></div>
                                <div>
                                    快递单号：<asp:Label runat="server" ID="ExpCode_L"></asp:Label>
                                    <a href="http://m.kuaidi100.com/index_all.html?type=<%=ExpName_L.Text %>&postid=<%=ExpCode_L.Text %>&callbackurl=<%=Request.Url.AbsoluteUri %>" target="_blank">查看物流信息</a>
                                </div>
                            </td>
                        </tr>
                                        <tr>
                            <th>缺货处理</th>
                            <td>
                                <asp:Label ID="Outstock" runat="server"></asp:Label></td>
                        </tr>
                        <tr>
                            <th>配送时间</th>
                            <td>
                                <asp:Label ID="ExpTime_L" runat="server"></asp:Label></td>
                        </tr>
                    </table>
        </div>
            </div>
            <div class="card-footer text-center">
                <a href="javascript:;" class="btn btn-outline-info" onclick=' ShowComDiag("../iServer/BiServer.aspx?orderid=<%:Mid %>","服务记录");'>查看服务记录</a>
            </div>
        </div>
    </div>
    <div role="tabpanel" class="tab-pane" id="Financial">
        <div class="card">
            <div class="card-header"><span class="zi zi_thlist"></span><span class="m-2">商品信息</span></div>
            <div class="card-body table-responsive-md">
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
                                    <img src="<%#ZoomLa.Common.function.GetImgUrl(Eval("Thumbnails"))%>" onerror="shownopic(this);" class="img_3rem" /></td>
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
                                
								<div class="input-group mb-3">
								  <div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1">运费</span>
								  </div>
								  <asp:TextBox runat="server" ID="PI_OrderExpMoney_T" class="form-control max20rem" />
								  
								  <div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1">订单</span>
								  </div>
								  <asp:TextBox runat="server" ID="PI_OrdersMoney_T" class="form-control max20rem" />
								  <div class="input-group-prepend">
									<span class="input-group-text" id="basic-addon1">合计</span>
								  </div>
								  <asp:TextBox runat="server" ID="PI_OrderTotal_T" class="form-control max20rem" disabled="disabled"/>
								  <div class="input-group-append">
									 <asp:Button ID="ChangeMoney_Btn" runat="server" Text="确认修改" CssClass="btn btn-info" OnClick="ChangeMoney_Btn_Click" OnClientClick="return confirm('确定要修改订单和运费金额吗');" />
								  </div>
								</div>
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
        <div class="card">
            <div class="card-header" id="msg_tabs">
                <a href="javascript:;" data-tar="#tab1" class="btn btn-default active"><i class="zi zi_history" zico="历史纪录"></i> 内部记录</a> 
                <a href="javascript:;" data-tar="#tab2" class="btn btn-default"><i class="zi zi_edit" zico="编辑"></i> 备注留言</a>
                <a href="javascript:;" data-tar="#tab3" class="btn btn-default"><i class="zi zi_user" zico="用户标志"></i> 客户详情</a>
            </div>
            <div class="card-body tab-content" id="msg_content" style="min-height:240px;">
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
            <div class="card-footer text-center"><asp:Button runat="server" ID="SaveRemind_Btn" Text="保存修改" OnClick="SaveRemind_Btn_Click" CssClass="btn btn-info" /></div>
        </div>
        <div class="card">
            <div class="card-header"><i class="zi zi_circleLeftBold"></i>  退款申请</div>
            <div class="card-body">
                <table class="table table-bordered sys_table">
                    <tr><th class="w12rem_lg">用户退款理由：</th><td><asp:Label ID="Back_UserRemind_L" runat="server" /></td></tr>
                    <tr><th>退款处理记录：</th><td><asp:Label ID="Back_AdminRemind_L" runat="server" /></td></tr>
                    <tr><th>处理结果：</th><td><asp:Label runat="server" ID="Back_ZStatus_L" /></td></tr>
                </table>
            </div>
            <div class="card-footer">
                <input type="button" value="处理退款" onclick="ShowDrawDiag();" runat="server" class="btn btn-danger" id="Back_Btn" visible="false"/>
            </div>
        </div>
    </div>
</div>
<div class="container-fluid pr-0">
<div class="row sysRow table-responsive-md">
<table class="table table-striped table-bordered table-hover sys_table">
    <tr>
        <th scope="col" rowspan="2" class="w12rem_lg">订单流程</th>
        <td scope="col">
            <asp:Button ID="OS_Normal_Btn" CssClass="btn btn-outline-danger" runat="server" Text="重启订单" OnClick="OS_Normal_Btn_Click" OnClientClick="return confirm('确定重启订单吗,订单与付款状态将还原');" />
            <asp:Button ID="OS_Sure_Btn" Enabled="false" CssClass="btn btn-outline-info" runat="server" Text="确认订单" OnClick="OS_Sure_Btn_Click" />
            <asp:Button runat="server" ID="CompleteOrder_Btn" CssClass="btn btn-outline-danger" Text="完结订单" OnClick="CompleteOrder_Btn_Click" OnClientClick="return confirm('确定完结订单吗!');" />
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="OS_NoSure_Btn" CssClass="btn btn-outline-danger mb-1" runat="server" Text="取消确认" OnClick="OS_NoSure_Btn_Click" />
            <asp:Button ID="OS_Pause_Btn" CssClass="btn btn-outline-danger mb-1" runat="server" Text="暂停处理" OnClick="OS_Pause_Btn_Click" />
            <asp:Button ID="OS_Freeze_Btn" CssClass="btn btn-outline-danger mb-1" runat="server" Text="冻结订单" OnClick="OS_Freeze_Btn_Click" />
            <asp:Button ID="OS_Aside_Btn" CssClass="btn btn-outline-danger mb-1" runat="server" Text="订单作废" OnClick="OS_Aside_Btn_Click" OnClientClick="return confirm('确定要作废订单吗?');" />
        </td>
    </tr>
    <tr>
        <th>财务管理</th>
        <td>
            <asp:Button runat="server" ID="Pay_Cancel_Btn" CssClass="btn btn-outline-danger" Text="取消支付" OnClientClick="return confirm('确定要变更状态为未支付吗?');" OnClick="Pay_Cancel_Btn_Click"/>
            <button runat="server" type="button" class="btn btn-outline-info" id="Pay_Has_Btn" onclick="orderpay();" >已经支付</button>
        <%--    <div class="mt-2">
                <button runat="server" type="button" class="btn btn-outline-info" id="Pay_Settle_Btn" onclick="orderSettle();">订单结算</button>
                <small class="text-muted">（*此操作用于预付款购物,可调整商品数量与补交金额,用户支付后才可操作）</small>
            </div>--%>
            <div class="mt-2">
                <input type="button" id="Refund_B" runat="server" class="btn btn-outline-info" value="退单返款" onclick="refund()" />
                <asp:Button runat="server" ID="Refund_Btn" style="display:none;" OnClick="Refund_Btn_Click" />
                <small class="text-muted">（*此操作将本订单的款项以余额的方式存入下单人会员ID中）</small>
            </div>
        </td>
    </tr>
    <tr><th>物流状态</th><td>
        <asp:Button runat="server" CssClass="btn btn-outline-danger" ID="Exp_Cancel_Btn" Text="取消发送" OnClick="EXP_Cancel_Btn_Click" OnClientClick="return confirm('确定要修改发送状态吗');" />
        <asp:Button runat="server" CssClass="btn btn-outline-info" ID="Exp_Send_Btn" Text="发送货物" OnClientClick="return ShowSendGood();" />
        <asp:Button runat="server" CssClass="btn btn-outline-info" ID="Exp_ClientSign_Btn"  Text="客户签收"  OnClick="Exp_ClientSign_Btn_Click" Enabled="false" />
    </td></tr>
    <tr>
        <th>附加操作</th>
        <td>
            <a runat="server" id="give_score_a" class="btn btn-outline-info mb-1">赠送积分</a>
            <a runat="server" id="give_purse_a" class="btn btn-outline-info mb-1">现金返利</a>
            <asp:Button ID="OS_Invoice_Btn" CssClass="btn btn-outline-info mb-1" runat="server" Text="已开发票" OnClick="OS_Invoice_Btn_Click" />
            <button id="ExpPrint_B" runat="server" type="button" class="btn btn-outline-info mb-1" onclick="printexp();" >快递打单</button>
            <a href="addon/printorder.aspx?id=<%:Mid %>"target="_blank" class="btn btn-outline-info mb-1">打印订单</a>
        </td>
    </tr>
    <tr>
        <td colspan="5" style="text-align: center; padding-top: 5px;">&nbsp;
            <asp:Button ID="btnPre" runat="server" Text="上一个订单" OnClick="btnPre_Click" CssClass="btn btn-outline-info" />
            <asp:Button ID="btnNext" runat="server" Text="下一个订单" OnClick="btnNext_Click" CssClass="btn btn-outline-info" />
        </td>
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
    function precheck() {
        var val = $("#Back_T").val();
        if (val == "" || val.length < 5) { alert("理由最少需要5个字符"); return false; }
        return true;
    }
    //发货弹出框(后期改为独立页面)
    function ShowSendGood() {
        comdiag.maxbtn = false;
        comdiag.ShowModal("Addon/exp/delivery.aspx?ID=<%=Mid %>", "发货操作");
        return false;
    }
    function CloseDiag() {
        diag.CloseModal();
        comdiag.CloseModal();
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
        ShowComDiag("addon/after/orderback.aspx?id=<%:Mid%>","退款处理");
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
        location.href = "Addon/after/OrderSettle.aspx?ID=<%:Mid%>";
    }
    function printexp() {
        window.location.href = "Addon/ExpPrint.aspx?ID=<%:Mid%>";
    }
    function showSuit(cartid) {
        ShowComDiag("/common/comp/SuitPro_Cart.aspx?CartID=" + cartid, "促销组合");
    }
</script>
</asp:Content>
