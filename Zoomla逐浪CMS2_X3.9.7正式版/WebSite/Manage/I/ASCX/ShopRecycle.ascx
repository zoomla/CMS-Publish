<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShopRecycle.ascx.cs" Inherits="ZoomLaCMS.Manage.I.ASCX.ShopRecycle" %>
<div class="menu_tit"><i class="zi zi_forDown"></i> 商品管理</div>
<div id="nodeNav">
<div class="input-group">
<input type="text" ID="keyWord" class="form-control" onkeydown="return ASCX.OnEnterSearch('<%:CustomerPageAction.customPath2+"Shop/ShopRecycler.aspx?keyWord=" %>',this);" placeholder="请输入商品名称或ID" />
<div class="input-group-append">
    <button type="button" id="searchBtn" class="input-group-text" onclick="ASCX.Search('<%:CustomerPageAction.customPath2+"Shop/ShopRecycler.aspx?keyWord=" %>','keyWord');"><i class="zi zi_search"></i></button>
</div>
</div>
<div class="tvNavDiv">
    <div class="NodeTree_left_ul">
	<asp:Literal runat="server" ID="nodeHtml" EnableViewState="false"></asp:Literal>
    </div>
</div>
<span style="color: green;" runat="server" id="Span1" visible="false" />
</div>