<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StructTree.ascx.cs" Inherits="ZoomLaCMS.Manage.I.ASCX.StructTree" %>
<div id="nodeNav">
<div class="menu_tit"><i class="zi zi_forDown"></i> 组织结构</div>
<%-- <div class="input-group">
<input type="text" id="keyWord" class="form-control" onkeydown="return ASCX.OnEnterSearch('<%:CustomerPageAction.customPath2+"Content/ContentManage.aspx?keyWord=" %>',this);" placeholder="用户名或ID" />
<div class="input-group-append">
<button class="input-group-text" type="button" onclick="ASCX.Search('<%:CustomerPageAction.customPath2+"Content/ContentManage.aspx?keyWord=" %>','keyWord');"><span class="zi zi_search"></span></button>
</div>
</div>--%>
<div class="NodeTree_left_ul">
<asp:Literal runat="server" ID="nodeHtml" EnableViewState="false"></asp:Literal>
</div>
<span style="color: green;" runat="server" id="remind" visible="false" />
</div>