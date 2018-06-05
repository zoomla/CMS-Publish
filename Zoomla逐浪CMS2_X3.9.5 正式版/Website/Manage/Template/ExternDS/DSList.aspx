<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DSList.aspx.cs" Inherits="ZoomLaCMS.Manage.Template.ExternDS.DSList" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>数据源列表</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),		
		new Bread("/{manage}/Config/SiteInfo.aspx","系统设置"),		
		new Bread("DSList.aspx","模板风格"),		
        new Bread() {url="", text="外部数据源 <a href='DSAdd.aspx'>[添加新数据源]</a>",addon="" }}
		)
    %>
<ZL:ExGridView ID="EGV" runat="server" AllowPaging="True" AutoGenerateColumns="false" IsHoldState="false" 
    CssClass="table table-striped table-bordered table-hover list_choice" EnableTheming="False" EmptyDataText="没有任何数据！" EnableModelValidation="True"
    OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound">
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <input type="checkbox" name="idchk" value="<%# Eval("ID") %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="DSName" ControlStyle-CssClass="form-control w12rem_lg" HeaderText="名称" />
        <asp:TemplateField HeaderText="类型">
            <ItemTemplate>
                <%#Eval("Type","")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="连接字符串">
            <ItemTemplate>
                <%# Eval("ConnectionString") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="创建时间">
            <ItemTemplate>
                <%# DataBinder.Eval(Container.DataItem, "CreateTime", "{0:yyyy年M月d日}")%>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="CreateMan" HeaderText="创建者" ReadOnly="true" />
        <asp:TemplateField HeaderText="描述">
            <ItemTemplate>
                <%# Eval("Remind") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="操作">
            <ItemTemplate>
                <a href="DSAdd.aspx?ID=<%#Eval("ID") %>"><i class="zi zi_pencilalt" title="修改"></i></a>
                <asp:LinkButton runat="server" CommandName="del2" CommandArgument='<%# Eval("ID") %>' OnClientClick="return confirm('确定删除该数据源?');"><i class="zi zi_trashalt" title="删除"></i>删除</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>