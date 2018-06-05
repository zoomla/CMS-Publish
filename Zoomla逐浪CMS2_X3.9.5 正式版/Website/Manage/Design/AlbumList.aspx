<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AlbumList.aspx.cs" Inherits="ZoomLaCMS.Manage.Design.AlbumList" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>智能相册</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("Default.aspx","动力模块"),
        new Bread() {url="", text="智能相册",addon="" }}
		)
    %>
<div>
<div id="template" class="list_choice table-responsive-md pr-1">
    <ZL:ExGridView id="EGV" runat="server" PageSize="10" AutoGenerateColumns="False" AllowPaging="True" AllowSorting="True" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" 
        CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:BoundField HeaderText="相册名称" DataField="AlbumName" />
            <asp:TemplateField HeaderText="创建人">
                <ItemTemplate>
                    <%#GetUser() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="封面图片">
                <ItemTemplate>
                    <img src="<%#Eval("Photos", "").Split('|')[0] %>" alt="封面图片" onerror="" class="img_50" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="创建时间" DataField="CDate" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />
            <asp:BoundField HeaderText="相册说明" DataField="AlbumDesc" HeaderStyle-Width="30%" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="/design/album/mbview.aspx?id=<%#Eval("ID") %>" class="option_style" target="_blank"><i class="zi zi_globe"></i>预览</a>
                    <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="del2" OnClientClick="return confirm('确定要删除吗');" class="option_style"><i class="zi zi_trashalt" title="删除"></i>删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
