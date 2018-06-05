<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Subject.aspx.cs" Inherits="ZoomLaCMS.Manage.Workload.Subject" MasterPageFile="~/Manage/I/Index.master" ClientIDMode="Static" ValidateRequest="false" %>
<%@ Register TagPrefix="uc"TagName="NodeList"Src="~/Manage/I/ASCX/NodeTreeJs.ascx"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>工作统计</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),								
        new Bread() {url="", text="工作统计",addon="" }},
		Call.GetHelp(52)+"<div class='pull-right down_ico' style='cursor: pointer' onclick='downtable();' title='导出数据表'> <span class='zi zi_download'></span> </div>"
		)
    %>
	<div class="list_choice">
<div class="row">
    <div class="col-12 col-sm-6 col-md-2 p-0">
        <div class="card">
            <div class="card-header">栏目列表</div>
            <div class="card-body">
                <uc:NodeList ID="Lists" runat="server" />
            </div>
        </div>
    </div>
    <div class="col-12 col-sm-6 col-md-10 p-0 table-responsive">
        <div id="filter">
            <div id="years_body" class="padding_td5 dashed">
                <strong>年份：</strong>
                <div class="btn-group" id="years_div" data-toggle="buttons">
                    <asp:Literal ID="Years_Li" EnableViewState="false" runat="server"></asp:Literal>
                </div>
            </div>
            <div id="months_body" class="padding_td5 dashed">
                <strong>月份：</strong>
                <div class="btn-group" data-toggle="buttons">
                    <asp:Literal ID="Months_Li" EnableViewState="false" runat="server"></asp:Literal>
                </div>
            </div>
            <div id="model_body" class="padding_td5">
                <strong>模型：</strong>
                <div class="btn-group" data-toggle="buttons">
                    <asp:Literal ID="Models_Li" runat="server" EnableViewState="false"></asp:Literal>
                </div>
            </div>
        </div>
        <div class="depart_list">
            <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False" CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!" OnPageIndexChanging="EGV_PageIndexChanging">
                <Columns>
                    <asp:BoundField DataField="Inputer" HeaderText="编辑" />
                    <asp:BoundField DataField="PCount" HeaderText="发稿量" />
                    <asp:BoundField DataField="Hits" HeaderText="访问量" />
                    <asp:BoundField DataField="ComCount" HeaderText="评论量" />
                    <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <a href="../Content/ContentManage.aspx?KeyType=1&KeyWord=<%#HttpUtility.UrlEncode(Eval("Inputer","")) %>" title="查看">查看</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle HorizontalAlign="Center" />
                <RowStyle Height="24px" HorizontalAlign="Center" />
            </ZL:ExGridView>
        </div>
    </div>
	</div>
	</div>
	<div class="d-none">
    <asp:Button ID="Export" runat="server" class="d-none" OnClick="Export_Click" CssClass="hidden" Text="导出" /></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/DatePicker/WdatePicker.js"></script>
    <script>
        $("#filter .sealink").click(function () {
            location.href = $(this).find("span").data("href");
        });
        function downtable() {
            $("#Export").click();
        }
        function ExNode(obj, nodid) {
            $(obj).parent().parent().find("ul").hide(500);
            $(obj).next("ul").show(500);
        }
        function ShowData(obj, nodeid) {
            location.href = "Subject.aspx?nodeid=" + nodeid;
        }
    </script>
</asp:Content>
