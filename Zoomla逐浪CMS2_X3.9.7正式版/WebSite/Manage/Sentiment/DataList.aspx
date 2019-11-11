<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DataList.aspx.cs" Inherits="ZoomLaCMS.Manage.Sentiment.DataList" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>数据列表</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/Default.aspx","企业办公"),
        new Bread("Default.aspx","舆情监测"),
        new Bread() {url="", text="数据入库"+"["+Skey+"]",addon="" }}
		)
    %>
	<div class="list_choice pr-1">
    <ul class="nav nav-tabs">
        <li class="nav-item"><a class="nav-link" href="<%:"DataList.aspx?Skey="+HttpUtility.UrlEncode(Skey)%>">全部</a></li>
        <li class="nav-item"><a class="nav-link" href="<%="DataList.aspx?Skey="+HttpUtility.UrlEncode(Skey)+"&Source="+HttpUtility.UrlEncode("新闻") %>">新闻</a></li>
        <li class="nav-item"><a class="nav-link" href="<%="DataList.aspx?Skey="+HttpUtility.UrlEncode(Skey)+"&Source="+HttpUtility.UrlEncode("微信") %>">微信</a></li>
        <li class="nav-item"><a class="nav-link" href="<%="DataList.aspx?Skey="+HttpUtility.UrlEncode(Skey)+"&Source="+HttpUtility.UrlEncode("微博") %>">微博</a></li>
    </ul>
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="false" PageSize="10" OnRowCommand="EGV_RowCommand"
        OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" AllowPaging="True" AllowSorting="True"
        CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="没有内容">
        <Columns>
            <asp:TemplateField HeaderText="标题">
                <ItemTemplate>
                    <%#GetTitle() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="来源" DataField="Source" />
            <asp:BoundField HeaderText="作者" DataField="Author" />
            <asp:TemplateField HeaderText="发布日期">
                <ItemTemplate>
                    <%#Eval("CDate","{0:yyyy年MM月dd日}") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="<%#Eval("Link") %>" title="点击浏览" target="_blank" ><i class="zi zi_globe"></i></a>
                    <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="catch" ToolTip="抓取文章" ><i class="zi zi_plus"></i>抓取文章</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        $(function () {
            switch ("<%=Source%>") {
                case "新闻":
                    $(".nav-tabs li:eq(1)").find("a").addClass("active");
                    break;
                case "微信":
                    $(".nav-tabs li:eq(2)").find("a").addClass("active");
                    break;
                case "微博":
                    $(".nav-tabs li:eq(3)").find("a").addClass("active");
                    break;
                default:
                    $(".nav-tabs li:eq(0)").find("a").addClass("active");
                    break;
            }
        });
    </script>
</asp:Content>