<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RepairDeailt.aspx.cs" Inherits="ZoomLaCMS.BU.Order.RepairDeailt" MasterPageFile="~/Common/Master/User.Master" %>
<%@ Import Namespace="ZoomLa.Common" %>
<asp:Content ContentPlaceHolderID="head" runat="Server"><title>售后详情</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="store"></div>
<div class="container">
    <div class="margin_t5">
        <ol class="breadcrumb">
            <li><a title="会员中心" href="/User/">会员中心</a></li>
            <li><a href="/User/UserShop/OrderList">店铺订单</a></li>
            <li class="active">返退详情</li>
            <div class="clearfix"></div>
        </ol>
    </div>
<table class="table table-striped table-bordered">
        <tr><td class="td_m text-right">商品信息：</td><td>
            <table class="table protable">
                <tr style="background-color: #f5f5f5;">
                    <td>商品名称</td>
                    <td>购买数量</td>
                    <td>商品单价</td>
                    <td>购买时间</td>
                </tr>
                <tr>
                    <td class="proinfo_td">
                        <div class="col-md-2">
                            <img src="<%=function.GetImgUrl(proMod.Thumbnails) %>" onerror="shownopic(this);" id="ProImgSrc" style="width: 100%; height: 80px;" /></div>
                        <div class="col-md-10 title_td">
                            <%=cartMod.Proname %>
                            <%=ZoomLa.BLL.Helper.PageHelper.Aspx_GetHtml("/Cart/Comp/Cart_Present.aspx?cartid="+cartMod.ID) %>
                        </div>
                    </td>
                    <td><%=cartMod.Pronum %></td>
                    <td>￥<%=cartMod.Shijia.ToString("F2") %></td>
                    <td><%=cartMod.Addtime %></td>
                </tr>
            </table>
        </td></tr>
        <tr>
            <td class="text-right td_m">服务类型：</td>
            <td><asp:Label ID="ServiceType_L" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="text-right">提交数量：</td>
            <td><asp:Label ID="ProNum_L" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="text-right">问题描述：</td>
            <td>
                <asp:Literal runat="server" ID="Deailt_T"></asp:Literal>
            </td>
        </tr>
        <tr>
            <td class="text-right">图片信息：</td>
            <td>
                <div style="margin-top: 10px;" id="uploader" class="uploader">
                    <ul class="filelist"></ul>
                </div>
                <asp:HiddenField runat="server" id="Attach_Hid"></asp:HiddenField>
            </td>
        </tr>
        <tr>
            <td class="text-right">返回方式：</td>
            <td><asp:Label ID="ReType_L" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="text-right">取货地点：</td>
            <td>
                <asp:Label ID="TakeCounty_L" runat="server"></asp:Label> (<asp:Label ID="TakeAddress_L" runat="server"></asp:Label>)
            </td>
        </tr>
        <tr>
            <td class="text-right">取件时间：</td>
            <td><asp:Label ID="TakeTime_L" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="text-right">收货地点：</td>
            <td>
                <asp:Label ID="ReCounty_L" runat="server"></asp:Label> (<asp:Label ID="ReAddress_L" runat="server"></asp:Label>)
            </td>
        </tr>
        <tr>
            <td class="text-right">客户姓名：</td>
            <td><asp:Label ID="UserName_L" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="text-right">手机号码：</td>
            <td><asp:Label ID="Phone_L" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="Audit_Btn" CssClass="btn btn-info" runat="server" Text="审核通过" OnClick="Audit_Btn_Click" />
                <asp:Button ID="UnAudit_Btn" CssClass="btn btn-info" runat="server" Text="取消审核" OnClick="UnAudit_Btn_Click" />
            </td>
        </tr>
            <tr><td>店铺备注</td><td>
            <asp:TextBox runat="server" ID="AdminRemind_T" TextMode="MultiLine" class="m715-50" style="height:100px;" />
        </td></tr>
    <tr><td></td><td>
         <asp:Button runat="server" ID="Save_Btn" Text="保存信息" class="btn btn-primary" OnClick="Save_Btn_Click" />
         <a href="OrderRepairAudit.aspx" class="btn btn-primary">返回列表</a></td></tr>
    </table>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<link href="/JS/Controls/ZL_Webup.css" rel="stylesheet" />
<script src="/JS/Controls/ZL_Webup.js"></script>
<script>
$(function () {
    var imgs = $("#Attach_Hid").val();
    if (imgs != "") { ZL_Webup.AddReadOnlyLi(imgs); }
});
</script>
</asp:Content>

