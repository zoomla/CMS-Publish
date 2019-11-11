<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SpecialTree.ascx.cs" Inherits="ZoomLaCMS.Manage.I.ASCX.SpecialTree" %>
<div class="menu_tit pl-2"><i class="zi zi_forDown" zico="下指"></i>专题信息</div>
<div id="nodeNav">
    <div class="tvNavDiv">
        <div class="NodeTree_left_ul">
            <asp:Literal runat="server" ID="nodeHtml" EnableViewState="false"></asp:Literal>
        </div>
        <span style="color: green;" runat="server" id="remind" visible="false" />
    </div>
</div>