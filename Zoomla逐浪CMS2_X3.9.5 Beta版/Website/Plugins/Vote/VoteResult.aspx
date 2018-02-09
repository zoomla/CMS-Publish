<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VoteResult.aspx.cs" Inherits="ZoomLaCMS.Plugins.VoteResult" EnableViewStateMac="false" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>结果分析</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="askres_main container">
       <div runat="server" id="result_div" visible="false">
            <h1 style="color: #0094ff; font-size: 26px; border-bottom: 1px solid #ddd; padding-bottom: 10px;" class="text-center">
            <asp:Label runat="server" ID="Title_L"></asp:Label></h1>
        <div class="list">
            <asp:Repeater runat="server" ID="RPT" OnItemDataBound="RPT_ItemDataBound" EnableViewState="false">
                <ItemTemplate>
                    <div class="item" id="item_<%#Eval("ID") %>">
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
                                        <tr>
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
                                        <tr>
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
                        <div class="chart_wrap text-center" <%#ShowChartWrap() %>>
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
       </div>
       <div id="onlyRemind_div" runat="server" visible="false" class="text-center">
           <div style="line-height:80px;font-size:16px;">您的答卷已经提交，感谢您的参与！</div>
           <div style="border-top:2px solid #ddd;line-height:40px;">
               <%=Call.SiteName %>
           </div>
       </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<style>
html { overflow-y: auto; }
body, .ionic-body { overflow-y: auto; }
.popup-container { position: fixed; }
.popup-container .popup { width: 95%; }
.item .qtype { color: #999; display: inline-block; margin-left: 5px; }
.item .ans_more { color: #0094ff; font-weight: bold; }
.item .rating-container .caption { display: none; }
#empty_div { color: #999; }
.ask_tips{text-align:center;}
body{background-color:rgba(0, 0, 0, 0.0784314);}
.container{background-color:#fff;box-shadow: rgba(0, 0, 0, 0.0980392) 0px 2px 5px 0px, rgba(0, 0, 0, 0.0784314) 0px 2px 10px 0px;margin-top:70px;padding:10px 50px;}
</style>
<%--<link href="/dist/css/bootstrap.min.css" rel="stylesheet" />
<link href="/dist/css/star-rating.min.css" rel="stylesheet" />
<script src="/dist/js/star-rating.min.js"></script>--%>
<script src="/Plugins/ECharts/build/source/echarts.js"></script>
<script src="/Plugins/ECharts/VoteEChart.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
    var vote = {};
    vote.listByQid = function (qid) {
        ShowComDiag("/Plugins/Vote/AnsList.aspx?ID="+qid,"回答详情");
    }
</script>
</asp:Content>