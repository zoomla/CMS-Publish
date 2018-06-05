<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NodeTreeJs.ascx.cs" Inherits="ZoomLaCMS.Manage.I.ASCX.NodeTreeJs" %>
<div id="nodeNav">
<div class="input-group">
<input type="text" id="keyWord" class="form-control ascx_key" onkeydown="return ASCX.OnEnterSearch('<%:CustomerPageAction.customPath2+"Content/ContentManage.aspx?keyWord=" %>',this);" placeholder="文章标题或ID" />
<div class="input-group-append">
    <button class="nput-group-text" type="button" onclick="ASCX.Search('<%:CustomerPageAction.customPath2+"Content/ContentManage.aspx?keyWord=" %>','keyWord');"><i class="zi zi_search" zico="搜索"></i></button>
</div>
</div>
<div class="tvNavDiv">
    <div class="left_ul">
	<asp:Literal runat="server" ID="nodeHtml" EnableViewState="false"></asp:Literal>
    </div>
</div>
<span style="color: green;" runat="server" id="remind" visible="false" />
</div>