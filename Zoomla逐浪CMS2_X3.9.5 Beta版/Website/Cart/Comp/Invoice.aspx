<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Invoice.aspx.cs" Inherits="ZoomLaCMS.Cart.Comp.Invoice" EnableViewState="false"%>
<div class="indent" runat="server">
    <label>
        <input type="radio" name="invoice_rad" value="0" onclick="invHelper.open(0);" checked="checked" />不开发票</label>
    <label>
        <input type="radio" name="invoice_rad" value="1" onclick="invHelper.open(1);" />需要发票</label><br />
    <div id="invoice_div">
        <div class="indent padding0 invoice_wrap">
            <asp:repeater id="Invoice_RPT" runat="server">
                        <ItemTemplate>
                                <button type="button" class="btn btn-default" value="<%#Eval("ID") %>">
                                    <i class="fa fa-check"></i>
                                    <%#Eval("InvHead") %>
                                </button>
                        </ItemTemplate>
                        <FooterTemplate> 
                                <button type="button" value="0" class="btn btn-link">+新发票</button>
                        </FooterTemplate>
                    </asp:repeater>
        </div>
        <div>
            <div>
                <input type="text" id="InvoTitle_T" name="InvoTitle_T" class="form-control text_400 margin_t5" maxlength="50" placeholder="发票抬头（个人或公司名称）" />
            </div>
            <div>
                <input type="text" id="InvoUserCode_T" name="InvoUserCode_T" class="form-control text_400 margin_t5" maxlength="50" placeholder="纳税人识别号或统一社会信用代码" />
            </div>
            <div>
                <div>
                    <label>
                        <input type="radio" value="明细" name="invUseType_rad" />明细</label>
                    <label>
                        <input type="radio" value="办公用品" name="invUseType_rad" />办公用品</label>
                    <label>
                        <input type="radio" value="电脑配件" name="invUseType_rad" />电脑配件</label>
                    <label>
                        <input type="radio" value="食品" name="invUseType_rad" />食品</label>
                    <label>
                        <input type="radio" value="服装服饰" name="invUseType_rad" />服装服饰</label>
                    <label>
                        <input type="radio" value="酒水餐饮" name="invUseType_rad" />酒水餐饮</label>
                </div>
                <textarea id="Invoice_T" name="Invoice_T" class="form-control invoice_t" maxlength="180" placeholder="在此输入发票开具科目明细"></textarea>
                <a href="http://www.gsxt.gov.cn" target="_blank">(查询统一社会信用代码)</a>
            </div>
        </div>
    </div>
    <input type="hidden" id="InvoiceList_Hid" value="<%:InvJson %>"/>
</div>
<style type="text/css">
.invoice_wrap .btn{min-width:90px;}
.invoice_wrap .btn .fa{display:none;color:#0094ff;}
.invoice_wrap .btn.active{border:1px solid #0094ff;}
.invoice_wrap .btn.active .fa{display:inline-block;}
</style>
<script>
    var invHelper = { list: [] };
    invHelper.get = function (id) {
        var model = { "ID": 0, "OrderID": 0, "InvType": 1,InvClass:"明细", "InvHead": "", "InvContent": "", "UserCode": "", "UserMobile": "", "UserEmail": "", "CDate": "0001-01-01T00:00:00" };
        if (id == "0") { return model; }
        else
        {
            for (var i = 0; i < invHelper.list.length; i++) {
                if (invHelper.list[i].ID == id) { model = invHelper.list[i]; break; }
            }
        }
        return model;
    }
    invHelper.init = function () {
        $("input[name='invUseType_rad']").click(function () {
            var $text = $("#Invoice_T");
            if (this.value != "明细") { $text.hide(); $text.text(this.value); }
            else { $text.text(""); $text.show(); }
        });
        $("input[name='invUseType_rad']:first").click();
        //-----
        //最近五次的不重复发票数据
        var $invList = $(".invoice_wrap .btn");
        if ($invList.length > 0) {
            invHelper.list = JSON.parse($("#InvoiceList_Hid").val());
            $invList.click(function () {
                $invList.removeClass("active");
                $(this).addClass("active");
                var model = invHelper.get($(this).val());
                $("#InvoTitle_T").val(model.InvHead);
                $("#InvoUserCode_T").val(model.UserCode);
                $("#Invoice_T").val(model.InvContent);
                $("input[name=invUseType_rad]").each(function () {
                    if (this.value == model.InvClass) { $(this).click(); }
                });
            });
        }

    }
    //是否需要发票
    invHelper.open = function (flag) {
        switch (flag) {
            case 0:
                $('#invoice_div').hide();
                break;
            default:
                $('#invoice_div').show();
                if ($(".invoice_wrap .btn").length > 0) {
                    $(".invoice_wrap .btn:first").click();
                }
                break;
        }
    }
    invHelper.init();
</script>