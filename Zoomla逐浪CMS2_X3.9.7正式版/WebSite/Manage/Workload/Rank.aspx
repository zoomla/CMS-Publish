<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rank.aspx.cs" Inherits="ZoomLaCMS.Manage.Workload.Rank" MasterPageFile="~/Manage/I/Index.master" %>
<%@ Register TagPrefix="uc"TagName="NodeList"Src="~/Manage/I/ASCX/NodeTreeJs.ascx"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>分类排行</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("Subject.aspx?Type=subject","工作统计"),											
        new Bread() {url="", text="排行榜"+"<div class='pull-right down_ico' onclick='downtable();' style='cursor: pointer' title='导出数据表'> <span class='zi zi_download'></span></div>",addon="" }}
		)
    %>
    <div class="list_choice">
        <ul class="nav nav-tabs" role="tablist">
            <li class="nav-item"><a class="nav-link" href="ContentRank.aspx">综合排行</a></li>
            <li class="nav-item"><a class="nav-link click" href="Rank.aspx?Type=click">点击排行</a></li>
            <li class="nav-item"><a class="nav-link comment" href="Rank.aspx?Type=comment">评论排行</a></li>
        </ul>
    </div>
    <div class="rankbody">
	<div class="row">
        <div class="col-12 col-sm-6 col-md-2 p-0">
            <div class="card">
                <div class="card-header">栏目列表</div>
                <div class="card-body left_ul">
                    <uc:NodeList ID="Lists" runat="server" />
                </div>
            </div>
        </div>
        <div class="col-12 col-sm-6 col-md-10 p-0 table-responsive">
            <div id="filter">
                <div id="years_body" class="container-fluid padding_td5 dashed">
                    <strong>年份：</strong>
                    <div class="btn-group" id="years_div" data-toggle="buttons">
                        <asp:Literal ID="Years_Li" EnableViewState="false" runat="server"></asp:Literal>
                    </div>
                </div>
                <div id="months_body" class="container-fluid padding_td5 dashed">
                    <strong>月份：</strong>
                    <div class="btn-group" data-toggle="buttons">
                        <asp:Literal ID="Months_Li" EnableViewState="false" runat="server"></asp:Literal>
                    </div>
                </div>
                <div id="model_body" class="container-fluid padding_td5">
                    <strong>模型：</strong>
                    <div class="btn-group" data-toggle="buttons">
                        <asp:Literal ID="Models_Li" runat="server" EnableViewState="false"></asp:Literal>
                    </div>
                </div>
            </div>
            <div class="depart_list">
                <table class="table table-striped table-bordered">
                    <tr>
                        <th>标题</th>
                        <th>点击数</th>
                        <th>评论数</th>
                        <th>录入</th>
                        <th>录入时间</th>
                    </tr>
                    <tbody>
                        <ZL:ExRepeater ID="RPT" runat="server" PageSize="10" PagePre="<tr><td class='text-center' colspan='5'>" PageEnd="</td></tr>">
                            <ItemTemplate>
                                <tr>
                                    <td><%#Eval("Title") %></td>
                                    <td><%#Eval("Hits") %></td>
                                    <td><%#Eval("ComCount") %></td>
                                    <td><%#Eval("Inputer") %></td>
                                    <td><%#Eval("CreateTime","{0:yyyy-MM-dd}") %></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate></FooterTemplate>
                        </ZL:ExRepeater>
                    </tbody>
                </table>
            </div>
        </div>
		</div>
    </div>
    <asp:Button ID="DownToExcel_B" runat="server" CssClass="hidden" OnClick="DownToExcel_B_Click" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script>
        $(function () {
            var ztype = '<%=ZType %>';
            if (ztype == 'comment') { $(".comment").addClass("active"); }
            else { $(".click").addClass("active"); }
        });
        $("#filter .sealink").click(function () {
            location.href = $(this).find("span").data("href");
        });
        function downtable() {
            $("#DownToExcel_B").click();
        }
        function ExNode(obj, nodid) {
            $(obj).parent().parent().find("ul").hide(500);
            $(obj).next("ul").show(500);
        }
        function ShowData(obj, nodeid) {
            location.href = "Rank.aspx?nodeid=" + nodeid;
        }
    </script>
</asp:Content>

