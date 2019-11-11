<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserShopNodeTree.ascx.cs" Inherits="ZoomLaCMS.Manage.I.ASCX.UserShopNodeTree" %>
<div class="menu_tit pl-2"><i class="zi zi_forDown"></i> 店铺商品</div>
<div id="nodeNav">
<div class="input-group">
<input type="text" ID="keyWord" class="form-control" onkeydown="return ASCX.OnEnterSearch('<%:CustomerPageAction.customPath2+"Shop/ProductManage.aspx?souchtype=1&keyWord=" %>',this);" placeholder="店铺商品名称" />
<div class="input-group-append">
<button type="button" id="searchBtn" class="input-group-text" onclick="ASCX.Search('<%:CustomerPageAction.customPath2+"Shop/ProductManage.aspx?souchtype=1&keyWord=" %>','keyWord');"><i class="zi zi_search"></i></button>
</div>
</div>
<div class="tvNavDiv">
    <div class="NodeTree_left_ul">
	<asp:Literal runat="server" ID="nodeHtml" EnableViewState="false"></asp:Literal>
    </div>
</div>
<span style="color: green;" runat="server" id="Span1" visible="false" />
</div>