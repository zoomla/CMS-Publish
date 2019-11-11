<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IDCOrder_Add.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.IDC.IDCOrder_Add" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
<script src="/JS/DatePicker/WdatePicker.js"></script>
<title>创建IDC订单</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("../ProductManage.aspx","商城管理"),
        new Bread("IDCOrder.aspx","订单管理"),						
        new Bread() {url="IDCOrder_Add.aspx", text="<i class='zi zi_pencilalt'></i>补订单",addon="" }}
		)
    %>
    <div class="tab-content panel-body container-fluid pr-0">
        <div id="Tabs0" class="tab-pane active row sysRow list_choice">
            <table class="table table-striped table-bordered sys_table">
                <tr>
                    <th class="w12rem_lg">选择用户</th>
                    <td>
						<div class="input-group mb-3">
						  <ZL:TextBox CssClass="form-control max20rem" runat="server" Enabled="false" ID="UserID_T" AllowEmpty="false"></ZL:TextBox>
						  <div class="input-group-append">
							<input type="button" class="btn btn-outline-info" value="选择用户" onclick="SelUser();" />
						  </div>
						</div>
                        <asp:HiddenField ID="UserID_Hid" runat="server" />
                    </td>
                </tr>
                <tr>
                    <th>订单类型</th>
                    <td>
                        <asp:DropDownList ID="OrderType_DP" runat="server" CssClass="form-control max20rem">
                            <asp:ListItem Text="IDC订单" Value="7" Selected="True"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr id="pro_tr">
                    <th>站点方案</th>
                    <td>
                        <input type="button" class="btn btn-outline-info mb-2" value="选择商品" onclick="product.sel();" />
                        <asp:HiddenField runat="server" ID="ProID_Hid" />
                        <asp:HiddenField runat="server" ID="ProTime_Hid" />
                        <table id="pro_table" class="table table-striped table-bordered">
                            <tr><td>ID</td><td>商品名称</td><td>售价</td><td>服务期限</td></tr>
                            <tbody id="pro_body"></tbody>
                        </table>
                    </td>
                </tr>
                <tr><th>生效时间</th><td><ZL:TextBox runat="server" ID="STime_T"  CssClass="form-control max20rem" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd' });"></ZL:TextBox></td></tr>
                <tr><th>绑定域名</th><td><ZL:TextBox runat="server" ID="Domain_T" CssClass="form-control max20rem" AllowEmpty="false" ValidType="Url"></ZL:TextBox></td></tr>
                <tr>
                    <th>应付金额</th>
                    <td>
						<div class="input-group mb-1">
						  <ZL:TextBox ID="Price_T" runat="server" Text="0" CssClass="form-control max20rem" AllowEmpty="false" ValidType="FloatZeroPostive"></ZL:TextBox>
						  <div class="input-group-append">
							<span class="input-group-text" id="basic-addon2">元</span>
						  </div>
						</div>
						<small class="text-muted">为0则以商品金额为准</small>
                    </td>
                </tr>
                <tr>
                    <th>需要发票</th>
                    <td><input type="checkbox" runat="server" id="Invoiceneeds" class="switchChk" /></td>
                </tr>
                <tr>
                    <th>订单详记</th>
                    <td>
                        <asp:TextBox ID="Ordermessage_T" runat="server" TextMode="MultiLine" CssClass="form-control m50rem_50" Height="180"></asp:TextBox></td>
                </tr>
                <tr id="olist_tr" style="display:none">
                    <td colspan="2">
                        <iframe id="olist_ifr" width="100%" frameborder="0" ></iframe>
                    </td>
                </tr>
                <tr><td></td>
                    <td>
                        <asp:Button ID="Submit_B" runat="server" CssClass="btn btn-info" Text="创建" OnClick="Submit_B_Click" />
                        <a href="IDCOrder.aspx" class="btn btn-outline-info">取消</a>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/dist/js/bootstrap-switch.js"></script>
<script src="/JS/Controls/ZL_Array.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/ICMS/area.js"></script>
<script src="/JS/Controls/ZL_PCC.js"></script>
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
        $("#olist_ifr").attr("src", 'IDCOrderList.aspx?userid=' + list[0].UserID);
        $("#olist_ifr").load(function () {
            var $ifr = $(this);
            if ($ifr.contents().find("#EGV tr").length > 0) {
                $ifr.height($ifr.contents().find("#EGV").height()+25);
                $("#olist_tr").show();
            } else { $("#olist_tr").hide(); }
                
        });
        userDiag.CloseModal()
    }
    //-----选择商品
    var product = { list: [] };
    product.sel = function () {
        proDiag.title = "选择方案";
        proDiag.maxbtn = false;
        proDiag.url = "SelIDCPro.aspx";
        proDiag.ShowModal();
    }
    product.del = function (id) {
        product.list.RemoveByID(id);
        $("#protr_" + id).remove();
    }
    //添加商品绑定
    function BindPro(model) {
        $("#ProID_Hid").val(model.id);
        $("#ProTime_Hid").val(model.time);
        var trtlp = '<tr class="bindpro" id="protr_@id"><td>@id</td><td>@Proname(@name)</td><td>@price</td><td><input type="button" value="移除" onclick="product.del(@id);" class="btn btn-info" /></td></tr>';
        var $items = JsonHelper.FillItem(trtlp, model, null);
        $("#pro_body").html("").append($items);
        $("#Price_T").val(model.price);
    }
    function CloseDiag() {
        proDiag.CloseModal();
        userDiag.CloseModal();
    }

    var diag = new ZL_Dialog();
    function opentitle(url, title) {
        diag.reload = true;
        diag.title = title;
        diag.url = url;
        diag.backdrop = true;
        diag.maxbtn = true;
        diag.ShowModal();
    }
</script>
</asp:Content>
