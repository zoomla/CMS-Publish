<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContentRank.aspx.cs" Inherits="ZoomLaCMS.Manage.Workload.ContentRank" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>综合排行</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("Subject.aspx?Type=subject","工作统计"),											
        new Bread() {url="", text="排行榜",addon="" }}
		)
    %>
    <div class="list_choice ranksort">
        <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item"><a class="nav-link active" href="ContentRank.aspx">综合排行</a></li>
        <li class="nav-item"><a class="nav-link" href="Rank.aspx?Type=click">点击排行</a></li>
        <li class="nav-item"><a class="nav-link" href="Rank.aspx?Type=comment">评论排行</a></li>
        </ul>
    </div>
<%--    <div class="nodelist">
        <strong>频道：</strong>
        <asp:DropDownList ID="NodeList" runat="server" CssClass="form-control" Width="200" DataTextField="NodeName" DataValueField="NodeId" SelectionMode="Multiple"></asp:DropDownList>     
    </div>--%>
    <div class="rankbox">
        <div class="rankbox_title">所有栏目</div>
		<div class="row m-0">
        <div class="col-12 col-sm-6  col-md-4 p-2">
            <div class="rankitem">
            <div class="ranktitle"><p><i class="zi zi_signal"></i>点击排行</p></div>
            <ul class="list-unstyled">
            <asp:Repeater ID="Hits_RPT" runat="server">
                <ItemTemplate>
                    <li><%#Eval("Title") %><span class="badge pull-right"><%#Eval("Hits") %></span></li>
                </ItemTemplate>
            </asp:Repeater>
            </ul>
            </div>
        </div>
        <div class="col-12 col-sm-6  col-md-4 p-2">
            <div class="rankitem">
            <div class="ranktitle"><p><i class="zi zi_signal"></i>评论排行</p></div>
            <ul class="list-unstyled">
            <asp:Repeater ID="Com_RPT" runat="server">
                <ItemTemplate>
                    <li><%#Eval("Title") %><span class="badge pull-right"><%#Eval("ComCount") %></span></li>
                </ItemTemplate>
            </asp:Repeater>
            </ul>
            </div>
        </div>
        <div class="col-12 col-sm-6  col-md-4 p-2">
            <div class="rankitem">
            <div class="ranktitle"><p><i class="zi zi_signal"></i>DIGG排行</p></div>
            <ul class="list-unstyled">
            <asp:Repeater ID="Di_RPT" runat="server">
                <ItemTemplate>
                    <li><%#Eval("Title") %><span class="badge pull-right"><%#Eval("GCount") %></span></li>
                </ItemTemplate>
            </asp:Repeater>
            </ul>
            </div>
        </div> 
		</div>
        <asp:Repeater ID="ItemList_RPT" OnItemDataBound="ItemList_RPT_ItemDataBound" runat="server">
        <ItemTemplate>
        <div class="rankbox">
        <div class="rankbox_title"><%#Eval("NodeName") %></div>
		<div class="row m-0">
        <div class="col-12 col-sm-6  col-md-4 p-2">
            <div class="rankitem">
            <div class="ranktitle"><p><i class="zi zi_signal"></i>点击排行</p></div>
            <ul class="list-unstyled">
                <asp:Repeater ID="Hits_RPT" runat="server">
                <ItemTemplate>
                <li><%#Eval("Title") %><span class="badge pull-right"><%#Eval("Hits") %></span></li>
                </ItemTemplate>
                </asp:Repeater>
            </ul>
            </div>
        </div>
        <div class="col-12 col-sm-6  col-md-4 p-2">
            <div class="rankitem">
            <div class="ranktitle"><p><i class="zi zi_signal"></i>评论排行</p></div>
            <ul class="list-unstyled">
                <asp:Repeater ID="Com_RPT" runat="server">
                <ItemTemplate>
                <li><%#Eval("Title") %><span class="badge pull-right"><%#Eval("ComCount") %></span></li>
                </ItemTemplate>
                </asp:Repeater>
            </ul>
            </div>
        </div>
        <div class="col-12 col-sm-6  col-md-4 p-2">
        <div class="rankitem">
        <div class="ranktitle"><p><i class="zi zi_signal"></i>DIGG排行</p></div>
        <ul class="list-unstyled">
        <asp:Repeater ID="Gi_RPT" runat="server">
            <ItemTemplate>
                <li><%#Eval("Title") %><span class="badge pull-right"><%#Eval("GCount") %></span></li>
            </ItemTemplate>
        </asp:Repeater>
        </ul>
        </div>
        </div>
		</div>
        </ItemTemplate>
    </asp:Repeater>
    </div>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>