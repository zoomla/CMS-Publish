<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SiteList.aspx.cs" Inherits="ZoomLaCMS.Manage.Design.SiteList" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <link href="/dist/css/star-rating.min.css" rel="stylesheet" />
    <script src="/dist/js/star-rating.min.js"></script>
    <title>站点列表</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("Default.aspx","动力模块"),
        new Bread() {url="", text="站点列表",addon="" }}
		)
    %>
	<div class="table-responsive-md pr-1">
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
        OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
        CssClass="table table-striped table-bordered table-hover list_choice" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="w1rem">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ID" HeaderText="ID" />
            <asp:TemplateField HeaderText="站点信息">
                <ItemTemplate>
                    <img src="<%#Eval("Logo") %>" class="img_3rem" onerror="shownopic(this);" />
                    <%#Eval("SiteName") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="所属用户">
                <ItemTemplate>
                    <a href="javascript:;" onclick="showUser('<%#Eval("UserID") %>');"><%#Eval("UserName") %>(<%#Eval("UserID") %>)</a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="绑定域名">
                <ItemTemplate>
                    <a href="http://<%#Eval("DomName") %>" target="_blank" title="点击访问"><%#Eval("DomName") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="站点评分">
                <ItemTemplate>
                    <input  value="<%#Eval("Score") %>" type="number" disabled class="rating" min=0 max=5 step=0.5 data-size="xs">   
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="创建时间" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="AddSite.aspx?id=<%#Eval("ID") %>"><i class="zi zi_pencilalt" title="修改"></i></a>
                    <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="del2"  OnClientClick="return confirm('确定要删除吗');"><i class="zi zi_trash"></i>删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
    function showUser(uid) {
        comdiag.ShowModal("../User/UserInfo.aspx?id=" + uid, "用户信息");
    }
    $(".rating").rating('refresh', {
        showClear: false
    });
</script>
</asp:Content>