<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ShopNodeTree.ascx.cs" Inherits="ZoomLaCMS.Manage.I.ASCX.ShopNodeTree" %>
<div class="menu_tit pl-2"><i class="fa fa-chevron-down"></i> 商品管理</div>
<div id="nodeNav">
<div class="input-group">
<input type="text" ID="keyWord" class="form-control ascx_key" onkeydown="return ASCX.OnEnterSearch('<%:CustomerPageAction.customPath2+"Shop/ProductManage.aspx?stype=id_proname&keyWord=" %>',this);" placeholder="<%=Resources.L.商品名称或ID %>" />
<div class="input-group-append">
    <button type="button" id="searchBtn" class="input-group-text" onclick="ASCX.Search('<%:CustomerPageAction.customPath2+"Shop/ProductManage.aspx?stype=id_proname&keyWord=" %>','keyWord');"> <i class="fa fa-search"></i></button>
</div>
</div>
<div class="tvNavDiv">
<div class="NodeTree_left_ul">
<asp:Literal runat="server" ID="nodeHtml" EnableViewState="false"></asp:Literal>
</div>
<span style="color: green;" runat="server" id="Span1" visible="false" />
</div>
</div>