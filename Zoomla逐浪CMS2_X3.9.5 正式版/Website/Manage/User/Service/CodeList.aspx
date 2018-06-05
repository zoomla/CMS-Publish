<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CodeList.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Service.CodeList" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>客服代码列表</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("","后台管理"),
        new Bread("ServiceSeat.aspx","客服管理"),
        new Bread() {url="CodeList.aspx", text="引用管理<a href='ServiceCode.aspx'> [在线生成]</a>",addon="" }},
		Call.GetHelp(51)
		)
    %>
	<div class="list_choice table-responsive-md pr-1">
     <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" 
        OnPageIndexChanging="EGV_PageIndexChanging" IsHoldState="false" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand"	
        CssClass="table table-striped table-bordered table-hover " EnableTheming="False" EnableModelValidation="True">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="">
                <ItemTemplate><input type="checkbox" name="idchk" value="<%#Eval("ID") %>" /></ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="名称" DataField="Str1" />
            <asp:BoundField HeaderText="日期" DataField="CDate"/>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:LinkButton runat="server" CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');" CssClass="option_style"><i class="zi zi_trashalt" title="删除"></i></asp:LinkButton>
                    <a href="ServiceCode.aspx?ID=<%#Eval("ID") %>" ><i class="zi zi_pencilalt" title="修改"></i>修改</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>