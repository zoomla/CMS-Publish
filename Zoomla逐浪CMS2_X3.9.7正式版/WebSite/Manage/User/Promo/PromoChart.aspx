<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PromoChart.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Promo.PromoChart" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>推广列表</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread( new Bread[] {
new Bread("/{manage}/I/Main.aspx","工作台"),
new Bread("UserManage.aspx","用户管理"),
new Bread(){url="PromoChart.aspx", text="图表分析"}
}) %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
  <%--  <div class="dashed">
        <strong>年份：</strong>
        <div class="btn-group" id="years_div" data-toggle="buttons">
            <asp:Literal ID="Years_Li" EnableViewState="false" runat="server"></asp:Literal>
        </div>
    </div>
    <div class="margin_t5 dashed">
        <strong>月份：</strong>
        <div class="btn-group" data-toggle="buttons">
            <asp:Literal ID="Months_Li" EnableViewState="false" runat="server"></asp:Literal>
        </div>
    </div>--%>
    <textarea class="codetext" id="code" runat="server"></textarea>
    <textarea class="codetext" id="piecode" runat="server" visible="false"></textarea>
    <textarea class="codetext" id="barcode" runat="server"></textarea>
<%--    <textarea class="codetext" id="mapcode" runat="server"></textarea>--%>
<%--    <iframe src="/Plugins/ECharts/ZLEcharts.aspx?codeid=mapcode" scrolling="no" class="chart_ifr" style="width:100%;"></iframe>--%>
    <iframe src="/Plugins/ECharts/ZLEcharts.aspx?codeid=code" scrolling="no" class="chart_ifr w-100"></iframe>
   <%-- <iframe src="/Plugins/ECharts/ZLEcharts.aspx?CodeID=piecode" scrolling="no" style="width:48%;height:500px;border:none;"></iframe>--%>
    <div class="panel panel-default col-lg-4 col-md-6 rankbox">
        <div class="panel-heading"><i class="zi zi_signal"></i> 推广排行榜</div>
        <div class="panel-body rankitem">
            <ul class="list-unstyled">
                <asp:Repeater runat="server" ID="TopRPT">
                    <ItemTemplate>
                        <li class="pr-3"><span><%#Eval("UserName") %></span><strong class="pull-right"><%#Eval("PCount") %></strong></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
    </div>
    <iframe src="/Plugins/ECharts/ZLEcharts.aspx?CodeID=barcode" class="col-lg-8 col-md-6" scrolling="no" style="height:410px;border:none;display:inline-block;"></iframe>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>