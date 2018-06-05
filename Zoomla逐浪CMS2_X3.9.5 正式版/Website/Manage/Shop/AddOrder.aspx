<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddOrder.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.AddOrder" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
<title>创建订单</title>
<%=Call.SetBread( new Bread[] {
	new Bread("ProductManage.aspx","商城管理"),
	new Bread("OrderList.aspx","订单管理"),
	new Bread(){url="AddOrder.aspx", text="添加订单"}
}) %>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ul class="nav nav-tabs list_choice">
        <li class="nav-item"><a class="nav-link active show" href="#Tabs0" data-toggle="tab">订单信息</a></li>
        <li class="nav-item"><a class="nav-link" href="#Tabs1" data-toggle="tab">物流信息</a></li>
        <li class="nav-item"><a class="nav-link" href="#Tabs2" data-toggle="tab">商品信息</a></li>
    </ul>
    <div class="tab-content panel-body container-fluid pr-0 sys_table mb-5">
        <div id="Tabs0" class="tab-pane active row sysRow table-responsive-md">
            <table class="table table-striped table-bordered">
                <tr>
                    <th scope="col" class="w12rem_lg">选择用户</th>
                    <td scope="col">
                        <div class="input-group">
                            <ZL:TextBox CssClass="form-control max20rem" runat="server" ID="UserID_T" AllowEmpty="false"></ZL:TextBox>
                            <span class="input-group-append">
                                <input type="button" class="btn btn-info" style="width: 101px;" value="选择用户" onclick="SelUser();" /></span>
                        </div>
						
						
						
                        <asp:HiddenField ID="UserID_Hid" runat="server" />
                    </td>
                </tr>
                <tr>
                    <th>订单类型</th>
                    <td>
                        <asp:DropDownList ID="OrderType_DP" runat="server" CssClass="form-control max20rem">
                            <asp:ListItem Text="普通订单" Value="0"></asp:ListItem>
                            <asp:ListItem Text="酒店" Value="1"></asp:ListItem>
                            <asp:ListItem Text="航班" Value="2"></asp:ListItem>
                            <asp:ListItem Text="旅游" Value="3"></asp:ListItem>
                            <asp:ListItem Text="积分" Value="4"></asp:ListItem>
                            <asp:ListItem Text="域名" Value="5"></asp:ListItem>
                            <asp:ListItem Text="Purse充值" Value="6"></asp:ListItem>
                            <asp:ListItem Text="云购订单" Value="8"></asp:ListItem>
                            <asp:ListItem Text="代购" Value="10"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <th>所属店铺<span class="text-danger">*</span></th>
                    <td>
                        <ZL:TextBox ID="StoreID_T" runat="server" AllowEmpty="false" Text="0" CssClass="form-control max20rem"></ZL:TextBox>
						
						<small class="text-muted">店铺ID,0则为自营商城</small>
					</td>
                </tr>
                <tr>
                    <th>应付金额</th>
                    <td>
						<div class="input-group">
							<ZL:TextBox ID="Price_T" runat="server" Text="0" CssClass="form-control max20rem" AllowEmpty="false" ValidType="FloatZeroPostive"></ZL:TextBox>
							<div class="input-group-append">
							<span class="input-group-text">元</span>
							</div>
						</div>
                    </td>
                </tr>
                <tr>
                    <th>邮费</th>
                    <td>
						<div class="input-group">
							<ZL:TextBox ID="Freight_T" runat="server" Text="0" CssClass="form-control max20rem" ValidType="FloatZeroPostive"></ZL:TextBox>
							<div class="input-group-append">
							<span class="input-group-text">元</span>
							</div>
						</div>
                    </td>
                </tr>
                <tr>
                    <th>索要发票</th>
                    <td>
                        <input type="checkbox" runat="server" id="Invoiceneeds" class="switchChk" /></td>
                </tr>
                <tr>
                    <th>订单状态</th>
                    <td>
                        <asp:DropDownList ID="OrderStatus_DP" runat="server" CssClass="form-control max20rem">
                            <asp:ListItem Text="正常" Value="0"></asp:ListItem>
                            <asp:ListItem Text="管理员确认" Value="1"></asp:ListItem>
                            <asp:ListItem Text="订单已付款,等待发货" Value="90"></asp:ListItem>
                            <asp:ListItem Text="卖家确认发货" Value="91"></asp:ListItem>
                            <asp:ListItem Text="买家确认收货" Value="99"></asp:ListItem>
                            <asp:ListItem Text="申请退款" Value="-1"></asp:ListItem>
                            <asp:ListItem Text="拒绝退款" Value="-2"></asp:ListItem>
                            <asp:ListItem Text="确认退款" Value="-3"></asp:ListItem>
                            <asp:ListItem Text="拒绝订单" Value="-5"></asp:ListItem>
                            <asp:ListItem Text="回收站" Value="-99"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <th>支付方式</th>
                    <td>
                        <asp:RadioButtonList runat="server" ID="PayType_Rad" RepeatDirection="Horizontal">
                            <asp:ListItem Text="正常" Selected="True" Value="0"></asp:ListItem>
                            <asp:ListItem Text="需预付(PreMoney)" Value="1"></asp:ListItem>
                            <asp:ListItem Text="代理商代收" Value="2"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <th>支付状态</th>
                    <td>
                        <asp:RadioButtonList runat="server" ID="Pay_Rad" RepeatDirection="Horizontal">
                            <asp:ListItem Text="未支付" Selected="True" Value="0"></asp:ListItem>
                            <asp:ListItem Text="已支付" Value="1"></asp:ListItem>
                            <asp:ListItem Text="收款首款" Value="2"></asp:ListItem>
                            <asp:ListItem Text="退款中" Value="-1"></asp:ListItem>
                            <asp:ListItem Text="已退款" Value="-2"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <th>物流状态</th>
                    <td>
                        <asp:RadioButtonList runat="server" ID="Exp_Rad" RepeatDirection="Horizontal">
                            <asp:ListItem Text="未发货" Selected="True" Value="0"></asp:ListItem>
                            <asp:ListItem Text="已发货" Value="1"></asp:ListItem>
                            <asp:ListItem Text="已收货" Value="2"></asp:ListItem>
                            <asp:ListItem Text="已退货" Value="-1"></asp:ListItem>
                            <asp:ListItem Text="确认退货" Value="-2"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <th>订单备注</th>
                    <td>
                        <asp:TextBox ID="Ordermessage_T" runat="server" TextMode="MultiLine" Width="400" Height="100"></asp:TextBox></td>
                </tr>
            </table>
        </div>
        <div id="Tabs1" class="tab-pane row sysRow table-responsive-md">
            <table class="table table-striped table-bordered">
                <tr>
                    <th scope="col" class="w12rem_lg">收货人名</th>
                    <td scope="col">
                        <ZL:TextBox CssClass="form-control max20rem" runat="server" ID="ReceUser_T" AllowEmpty="false"></ZL:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>所在地区</th>
                    <td class="d-flex flex-row">
                        <select id="province_dp" name="province_dp" class="form-control sys_region" ></select>
                        <select id="city_dp" name="city_dp" class="form-control sys_region" ></select>
                        <select id="county_dp" name="county_dp" class="form-control sys_region"></select>
                        <asp:HiddenField ID="address_hid" runat="server" />
                    </td>
                </tr>
                <tr>
                    <th>收货地址</th>
                    <td>
                        <ZL:TextBox ID="Address_T" runat="server" CssClass="form-control max20rem"></ZL:TextBox></td>
                </tr>
                <tr>
                    <th>邮政编码</th>
                    <td>
                        <ZL:TextBox ID="ZipCode_T" runat="server" CssClass="form-control max20rem" ValidType="Int" ></ZL:TextBox></td>
                </tr>
                <tr>
                    <th>手机号码</th>
                    <td>
                        <ZL:TextBox ID="Mobile_T" runat="server" CssClass="form-control max20rem" ValidType="MobileNumber"></ZL:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div id="Tabs2" class="tab-pane row sysRow table-responsive-md">
            <table class="table table-striped table-bordered">
                <tr id="pro_tr">
                    <th scope="col" class="w12rem_lg">订单商品:</th>
                    <td scope="col">
                        <input type="button" class="btn btn-outline-info" value="关联商品" onclick="OpenSelect();" />
                        <table id="pro_table" hidden class="table table-striped table-bordered" style="margin:10px auto;">
                            <tr>
                                <td>ID</td>
                                <td>商品图片</td>
                                <td>商品名称</td>
                                <td>零售价</td>
                                <td>数量</td>
                                <td>操作</td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <asp:HiddenField ID="Pro_Hid" runat="server" />
        </div>
    </div>
    <div class="text-center Conent_fix">
        <asp:Button ID="Submit_B" runat="server" CssClass="btn btn-info" Text="添加订单" OnClientClick="return checkSubmit();" OnClick="Submit_B_Click" /></div>
 <%--   <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />--%>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/dist/js/bootstrap-switch.js"></script>
    <script src="/JS/Controls/ZL_Array.js"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/ICMS/area.js"></script>
    <script src="/JS/Controls/ZL_PCC.js"></script>
    <script src="/JS/ZL_Regex.js"></script>
    <script>
        $(function () {
            var pcc = new ZL_PCC("province_dp", "city_dp", "county_dp");
            if ($("#address_hid").val() == "") {
                pcc.ProvinceInit();
            }
            else {
                var attr = $("#address_hid").val().split(' ');
                pcc.SetDef(attr[0], attr[1], attr[2]);
                pcc.ProvinceInit();
            }
        });
        var userDiag = new ZL_Dialog(), proDiag = new ZL_Dialog();
        //-----选择用户
        function SelUser() {
            userDiag.title = "选择用户";
            userDiag.maxbtn = false;
            userDiag.url = "/Common/Dialog/SelGroup.aspx";
            userDiag.ShowModal();
        }
        function UserFunc(list, select) {
            $("#UserID_T").val(list[0].UserName);
            $("#UserID_Hid").val(list[0].UserID);
            userDiag.CloseModal()
        }

        //-----选择商品
        var bindpro = {proattr:[]};
        function OpenSelect() {
            proDiag.title = "添加捆绑商品";
            proDiag.maxbtn = false;
            proDiag.url = "/Common/AddbindPro.aspx";
            proDiag.ShowModal();
            return false;
        }
        //添加商品绑定
        function BindPro(data) {
            $(".bindpro").remove();
            if (data) {
                try {
                    bindpro.proattr = JSON.parse(data);
                    $("#Pro_Hid").val(data);
                } catch (ex) { console.log(ex); }
            }
            if (bindpro.proattr.length < 1) { $("#pro_table").hide(); }
            else { $("#pro_table").show(); }
            var trtlp = '<tr class="bindpro"><td>@id</td><td><img onerror="shownopic(this);" style="width:60px;height:45px;" src="/@Thumbnails" /></td><td>@Proname</td><td>@LinPrice</td><td>@pronum</td><td><input type="button" value="移除" onclick="RemoveBind(@id);" class="btn btn-info" /></td></tr>';
            var trs = JsonHelper.FillData(trtlp, bindpro.proattr);
            $("#pro_table").append(trs);
        }
        //移除商品
        function RemoveBind(id) {
            bindpro.proattr.RemoveByID(id);
            BindPro();
        }
        function CloseDiag() {
            proDiag.CloseModal();
        }
        function checkSubmit() {
            if (ZL_Regex.isEmpty($("#UserID_Hid").val())) { alert("未指定用户"); return false; }
            if (Convert.ToInt($("#Price_T").val()) <= 0) { alert("未指定订单金额"); return false; }
            if (ZL_Regex.isEmpty($("#ReceUser_T").val())) { alert("未指定收货人"); return false; }
            if (ZL_Regex.isEmpty($("#Pro_Hid").val())) { alert("未指定需要购买的商品"); return false; }
            return true;
        }
    </script>
</asp:Content>
