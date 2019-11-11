<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SaleByDay.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.SaleReport.SaleByDay" MasterPageFile="~/Manage/I/Index.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>按日统计</title>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="BreadDiv">
    <div>
	<ol id="BreadNav" class="breadcrumb navbar-fixed-top">
        <li class="breadcrumb-item"><a href="ProductManage.aspx">商城管理</a></li>
        <li class="breadcrumb-item"><a href="TotalSale.aspx">按日销售统计</a></li>
        <div id="help" class="pull-right text-center"><a href="javascript:;" class="help_btn active" onclick="selbox.toggle();"><i class="zi zi_search"></i></a></div>
        <div id="sel_box">
            <div class="input-group">
                <asp:TextBox runat="server" ID="SDate_T" class="form-control max20rem" placeholder="起始时间" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd' });" />
                <asp:TextBox runat="server" ID="EDate_T" class="form-control max20rem" placeholder="起始时间" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd' });" />
                <span class="input-group-btn">
                    <asp:LinkButton runat="server" ID="Search_Btn" OnClick="Search_Btn_Click" class="btn btn-outline-dark"><i class="zi zi_search"></i></asp:LinkButton>
                </span>
            </div>
        </div>
	</ol>
    </div>
</div>
<div class="date_wrap">
    <div class="item">
        <strong>年份：</strong>
        <div class="btn-group" id="years_div">
            <asp:Literal ID="Years_Li" runat="server"></asp:Literal>
        </div>
    </div>
    <div class="item">
        <strong>月份：</strong>
        <div class="btn-group">
            <asp:Literal ID="Months_Li" runat="server"></asp:Literal>
        </div>
    </div>
</div>
<div id="condiv" class="container-fluid pr-0">
<div class="row sysRow">
<table class="table table-bordered table-striped mb-5">
    <tr><td class="td_m">日期</td><td>在线支付</td><td>余额支付</td><td>总计销售</td></tr>
    <asp:Repeater runat="server" ID="Day_RPT">
        <ItemTemplate>
            <tr><td><%#Eval("date") %></td><td><%#Eval("pay_online") %></td><td><%#Eval("pay_purse") %></td><td><%#Eval("total") %></td></tr>
        </ItemTemplate>
    </asp:Repeater>
</table>
</div>
</div>
<div class="Conent_fix">
    <input type="button" value="导出Excel" onclick="OutToExcel();" class="btn btn-info" />
    在线支付：<asp:Label runat="server" ID="PayOnline_L" class="rd_red_l" />
    余额支付：<asp:Label runat="server" ID="PayPurse_L" class="rd_red_l" />
    销售总计：<asp:Label runat="server" ID="TotalSale_L" class="rd_red_l" />
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/DatePicker/WdatePicker.js"></script>
<script src="/JS/Controls/DateHelper.js"></script>
<script src="/JS/Label/ZLHelper.js"></script>
<script>
    $(function () {
        $(".filter_year").click(function () {
            $(".filter_year").removeClass("active");
            $(this).addClass("active");
            filter();
        });
        $(".filter_month").click(function () {
            $(".filter_month").removeClass("active");
            $(this).addClass("active");
            filter();
        });
    })
    function filter() {
        var year = $(".filter_year.active").data("num");
        var month = $(".filter_month.active").data("num");
        var stime = year + "/" + month + "/01";
        var etime = year + "/" + month + "/" + DateHelper.getMonthDays(year,month);
        location = "SaleByDay.aspx?stime=" + stime + "&etime=" + etime;
    }
    function OutToExcel() {
        var $html = $(document.getElementById("condiv").outerHTML);
        $html.find("td").css("border", "1px solid #666");
        ZLHelper.OutToExcel($html.html(), $("title").text());
    }
</script>
</asp:Content>
