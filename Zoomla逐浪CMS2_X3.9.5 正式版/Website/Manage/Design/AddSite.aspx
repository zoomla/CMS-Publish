<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSite.aspx.cs" Inherits="ZoomLaCMS.Manage.Design.AddSite"  MasterPageFile="~/Manage/I/index.master" %>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <link href="/dist/css/star-rating.min.css" rel="stylesheet" />
    <script src="/dist/js/star-rating.min.js"></script>
    <title>站点管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("Default.aspx","动力模块"),						
        new Bread("SiteList.aspx","站点列表"),						
        new Bread() {url="", text="站点信息",addon="" }}
		)
    %>
<ul class="nav nav-tabs list_choice">
    <li class="nav-item" data-tabs="0"><a class="nav-link" href="?ID=<%:Mid%>&tabs=0" >站点信息</a></li>
    <li class="nav-item" data-tabs="1"><a class="nav-link" href="?ID=<%:Mid%>&tabs=1" >站点页面</a></li>
</ul>
<div class="tab-content panel-body pr-1">
    <div class="tab-pane" id="Tabs0">
        <table class="table table-bordered table-striped sys_table">
            <tr><th class="w12rem_lg">站点名</th><td><ZL:TextBox runat="server" ID="SiteName_T" CssClass="form-control text_300" AllowEmpty="false" /></td></tr>
            <tr>
             <th>站点评分</th>
                <td id="num_td">
                    <input id="score_num" name="score_num" type="number" class="rating" min=0 max=5 step=0.5 data-size="xs">
                </td>
            </tr>
            <tr><th>Logo</th><td><ZL:SFileUp runat="server" ID="Logo_UP" FType="Img" /></td></tr>
            <tr><th>站点域名</th><td><a href="#" runat="server" id="domain_a" target="_blank" title="访问站点"></a></td></tr>
            <tr><th>物理路径</th><td><asp:Label runat="server" ID="SiteDir_L" CssClass="form-control text_300" /></td></tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button runat="server" ID="Save_Btn" Text="保存信息" OnClick="Save_Btn_Click" CssClass="btn btn-outline-info" />
                    <a href="SiteList.aspx" class="btn btn-outline-info">返回列表</a>
                </td>
            </tr>
        </table>
    </div>
    <div class="tab-pane" id="Tabs1">
        <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="5" IsHoldState="false" OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" OnRowCommand="EGV_RowCommand" 
            AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="你还没有创建页面">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="ID" />
                <asp:BoundField HeaderText="标题" DataField="Title" />
                <asp:BoundField HeaderText="路径" DataField="Path" />
                <asp:BoundField HeaderText="创建时间" DataField="CDate" DataFormatString="{0:yyyy年MM月dd日 hh:mm}" />
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton runat="server"  CommandName="del" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="zi zi_trashalt" title="删除"></i>删除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
    </div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        //选择滑动门
        function CheckTabs(id) {
            $("[data-tabs='" + id + "']").find("a").addClass('active');
            $("#Tabs" + id).addClass("active");
        }
        function setscore(score) {
            $("#score_num").val(score);
            $(".rating").rating('refresh', {
                showClear: false,
            });
        }
    </script>
</asp:Content>