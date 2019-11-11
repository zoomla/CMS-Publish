<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QuickPrint.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Printer.QuickPrint" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>模板管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("ListDevice.aspx","智能硬件"),
        new Bread() {url="", text="模板管理<a href='AddQuickPrint.aspx'>[添加设备]</a>",addon="" }}
		)
    %>
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
        OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
        CssClass="table table-striped table-bordered table-hover list_choice" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="">
                <ItemTemplate><input type="checkbox" name="idchk" value="<%#Eval("ID") %>" /></ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:TemplateField HeaderText="模板名称" ItemStyle-CssClass="">
                <ItemTemplate><a href="AddQuickPrint.aspx?ID=<%#Eval("ID") %>"><%#Eval("Alias") %></a></ItemTemplate>
            </asp:TemplateField>
           <asp:TemplateField HeaderText="内容">
               <ItemTemplate><%#GetContent() %></ItemTemplate>
           </asp:TemplateField>
            <asp:BoundField HeaderText="日期" DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" ItemStyle-CssClass="" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a  href="AddQuickPrint.aspx?id=<%#Eval("ID") %>"><i class="zi zi_pencil" title="修改"></i></a>
                    <asp:LinkButton runat="server"  CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="zi zi_trashalt" title="删除"></i></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
