<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllSearch.aspx.cs" Inherits="ZoomLaCMS.Manage.Guest.AllSearch" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>聚合搜索</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread() {url="", text="聚合搜索",addon="" }}
		)
    %>
	<div class="list_choice table-responsive-md pr-1">
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False"
        CssClass="table table-striped table-bordered table-hover" EmptyDataText="当前没有信息!!"
        OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="ID" ItemStyle-CssClass="w1rem">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("ID")+":"+Eval("SType")%>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass=""/>
            <asp:TemplateField HeaderText="来源" ItemStyle-CssClass="">
                <ItemTemplate>
                    <%#GetTieType() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="标题" ItemStyle-CssClass="">
                <ItemTemplate>
                  <%--  [<a href="TieList.aspx?CateID=<%#Eval("CateID")%>"><%#Eval("CateName") %></a>]--%>
                    <a href="<%#GetEditUrl() %>" title="管理该条信息"><%#Eval("Title") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="用户" ItemStyle-CssClass="">
                <ItemTemplate>
                    <a href="../User/UserInfo.aspx?id=<%#Eval("CUser") %>" title="查看用户"><%#Eval("UserName") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="添加时间" ItemStyle-CssClass="">
                <ItemTemplate>
                    <%#Eval("CDate","{0:yyyy年MM月dd日 HH:mm}") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="">
                <ItemTemplate>
                    <a href="<%#GetEditUrl() %>">编辑</a>
                    <asp:LinkButton CommandName='<%#Eval("SType") %>' CommandArgument='<%#Eval("ID") %>' runat="server">删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>
