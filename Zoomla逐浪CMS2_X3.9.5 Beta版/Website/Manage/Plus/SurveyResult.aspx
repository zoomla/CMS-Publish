<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyResult.aspx.cs" Inherits="ZoomLaCMS.Manage.Plus.SurveyResult" MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>结果分析</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<h1 style="color:#0094ff;font-size:26px;border-bottom:1px solid #ddd;padding-bottom:10px;" class="text-center"><asp:Label runat="server" ID="Title_L"></asp:Label></h1>
<div class="list">
    <asp:Repeater runat="server" ID="RPT" OnItemDataBound="RPT_ItemDataBound" EnableViewState="false">
        <ItemTemplate>
            <div class="item <%#Eval("QType") %>" id="item_<%#Eval("ID") %>">
                <div class="h4"><strong>第<%#Container.ItemIndex+1 %>题：<%#Eval("QTitle") %></strong><span class="qtype">(<%#GetQType() %>)</span></div>
                <div runat="server" visible='<%#Eval("QType","").Equals("radio") %>'>
                    <table class="table table-bordered table-striped">
                        <tr>
                            <td>选项</td>
                            <td>小计</td>
                            <td>比例</td>
                        </tr>
                        <asp:Repeater runat="server" ID="Radio_RPT" EnableViewState="false">
                            <ItemTemplate>
                                <tr class="option">
                                    <td><%#Eval("Text") %></td>
                                    <td><%#Eval("count") %></td>
                                    <td><%#GetPercent() %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
                <div runat="server" visible='<%#Eval("QType","").Equals("checkbox") %>'>
                    <table class="table table-bordered table-striped table-condensed">
                        <tr>
                            <td>选项</td>
                            <td>小计</td>
                            <td>比例</td>
                        </tr>
                        <asp:Repeater runat="server" ID="Checkbox_RPT" EnableViewState="false">
                            <ItemTemplate>
                                <tr class="option">
                                    <td><%#Eval("Text") %></td>
                                    <td><%#Eval("count") %></td>
                                    <td><%#GetPercent() %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
                <div runat="server" visible='<%#Eval("QType","").Equals("blank") %>'>
                    【<a href="javascript:;" onclick="vote.listByQid('<%#Eval("ID") %>');" class="answer_more">查看本题答案详细信息</a>】
                </div>
                <div runat="server" visible='<%#Eval("QType","").Equals("score") %>'>
                    <asp:TextBox runat="server" CssClass="rating" ID="Score_T" Style="display: none;" disabled="disabled" />
                </div>
                <div class="chart_wrap excel_no text-center" <%#ShowChartWrap() %>>
                    <button type="button" class="btn btn-xs btn-info" onclick="showchart('<%#Eval("ID") %>','pie')"><i class="fa fa-pie-chart"></i>饼状</button>
                    <button type="button" class="btn btn-xs btn-info" onclick="showchart('<%#Eval("ID") %>','circle')"><i class="fa fa-life-bouy"></i>圆环</button>
                    <button type="button" class="btn btn-xs btn-info" onclick="showchart('<%#Eval("ID") %>','bar')"><i class="fa fa-bar-chart"></i>柱状</button>
                    <button type="button" class="btn btn-xs btn-info" onclick="showchart('<%#Eval("ID") %>','line')"><i class="fa fa-reorder"></i>条形</button>
                    <button type="button" class="btn btn-xs btn-danger" onclick="hidechart('<%#Eval("ID") %>')"><i class="fa fa-remove"></i>关闭</button>
                    <asp:HiddenField runat="server" ID="chart_hid" />
                    <div class="zlchart" id="chart_<%#Eval("ID") %>" style="width: 100%;"></div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
<div runat="server" id="empty_div" visible="false" class="text-center">
    <i class="fa fa-inbox" style="font-size: 120px;"></i>
    <div class="padding-top">还没有人回答该问卷</div>
</div>
<div class="Conent_fix">
    <a href="/Vote/ResultAdd?ID=<%:Mid%>" class="btn btn-info" target="_blank"><i class="fa fa-plus"></i> 添加投票</a>
    <button type="button" class="btn btn-info" onclick="OutToExcel();"><i class="fa fa-expand"></i> 导出Excel</button>
<%--    <asp:CheckBox runat="server" ID="Filter_Chk" Text="过滤数据" AutoPostBack="true" OnCheckedChanged="Filter_Chk_CheckedChanged" CssClass="btn btn-default"/>--%>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/Plugins/ECharts/build/source/echarts.js"></script>
<script src="/Plugins/ECharts/VoteEChart.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Label/ZLHelper.js"></script>
<script>
    
    var vote = {};
    vote.listByQid = function (qid) {
        ShowComDiag("/Plugins/Vote/AnsList.aspx?ID=" + qid, "回答详情");
    }
    function OutToExcel() {
        var $table = $('<table><tr><td colspan="3" style="font-size:20px;text-align:center;">' + $("#Title_L").text() + '</td></tr></table>');
        $(".item.checkbox,.item.radio").each(function () {
            var $item = $(this.outerHTML);
            $table.append('<tr><td colspan="3">' + $item.find(".h4").text() + '</td></tr>');
            $table.append($item.find("tr.option"));
        });
        //items.find(".excel_no").remove();
        $table.find("td").css("border", "1px solid #666");
        $table.find("th").css("border", "1px solid #666");
        ZLHelper.OutToExcel($table[0].outerHTML, $("#Title_L").text() + "结果分析");
        //ZLHelper.OutToWord(items.html(), $("#Title_L").text() + "结果分析");
    }
</script>
</asp:Content>