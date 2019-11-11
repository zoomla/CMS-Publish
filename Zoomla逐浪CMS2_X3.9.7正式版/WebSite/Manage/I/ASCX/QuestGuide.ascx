<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuestGuide.ascx.cs" Inherits="ZoomLaCMS.Manage.I.ASCX.QuestGuide" %>
<div class="menu_tit pl-2"><i class="zi zi_forDown"></i> 试卷管理</div>
<div id="nodeNav" class="input-group">
<input type="text" id="keyWord" class="form-control ascx_key" onkeydown="return ASCX.OnEnterSearch('<%:Url+"?skey=" %>',this);" placeholder="试卷名称或ID" />
<div class="input-group-append">
    <button class="input-group-text" type="button" onclick="ASCX.Search('<%:Url+"?keyWord=" %>','keyWord');"><i class="zi zi_search"></i></button>
</div>
</div>
<div class="tvNavDiv">
<div class="NodeTree_left_ul">
<asp:Literal runat="server" ID="nodeHtml" EnableViewState="false"></asp:Literal>
</div>
<span style="color: green;" runat="server" id="remind" visible="false" />
</div>