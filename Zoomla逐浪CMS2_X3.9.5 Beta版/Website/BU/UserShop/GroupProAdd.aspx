<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GroupProAdd.aspx.cs" Inherits="ZoomLaCMS.BU.UserShop.GroupProAdd" MasterPageFile="~/Common/Master/User.Master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>组合管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="store"></div>
<div class="container">
<div class="margin_t5">
    <ol class="breadcrumb">
        <li><a title="会员中心" href="/User/">会员中心</a></li>
        <li><a href="/User/UserShop/ProductList">商品管理</a></li>
        <li class="active">组合管理</li>
        <div class="clearfix"></div>
    </ol>
</div>
<table class="table table-bordered table-striped">
    <tr><td class="td_m">组合名称</td><td><ZL:TextBox runat="server" ID="Name_T" AllowEmpty="false" MaxLength="50" class="form-control text_300" /></td></tr>
    <tr><td>组合商品</td><td>
                <input type="button" value="选择商品" onclick="upro.showdiag('store');" class="btn btn-info" runat="server" id="selpro_btn" />
                <div id="uprolist" class="uprolist"></div>
                <asp:HiddenField runat="server" ID="UProIDS_Hid" />
                     </td></tr>
    <tr><td>备注</td><td><asp:TextBox runat="server" ID="Remind_T" class="form-control m715-50" style="height:100px;" TextMode="MultiLine" /></td></tr>
    <tr><td></td><td>
        <asp:Button runat="server" ID="Save_Btn" Text="保存信息" OnClick="Save_Btn_Click" class="btn btn-info" />
        <a href="GroupPro.aspx" class="btn btn-default">返回列表</a>
    </td></tr>
</table>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
.proname{display:inline-block;}
</style>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Controls/ZL_Array.js"></script>
<script src="/JS/shop_upro.js?v=2"></script>
<script>
    function closeDiag() { CloseComDiag(); }
</script>
</asp:Content>