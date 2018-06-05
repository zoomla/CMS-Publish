<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeliverType.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.DeliverType" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>运费模板</title>
			<%=Call.SetBread( new Bread[] {
	new Bread("../../ProductManage.aspx","商城管理"),
	new Bread(){url="", text="运费模板列表<a href='AddDeliverType.aspx'> [添加运费模板]</a>"}
	}) %>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
     <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" PageSize="10" OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Egv_RowCommand" IsHoldState="false" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover list_choice" EnableTheming="False" EnableModelValidation="True" EmptyDataText="暂无信息！！">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" DataField="ID"/>
            <asp:TemplateField HeaderText="模板名称">
                <ItemTemplate>
                     <a href="AddDeliverType.aspx?id=<%#Eval("id") %>"><%#Eval("TlpName") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="计价方式" >
                <ItemTemplate>
                     <%#GetMode() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="备注" DataField="Remind" />
            <asp:BoundField HeaderText="备注(仅卖家可见)" DataField="Remind2" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a  href="AddDeliverType.aspx?id=<%#Eval("id") %>"><i class="zi zi_pencilalt" title="修改"></i></a>
                    <asp:LinkButton ID="LinkButton1"  CommandName="Del" CommandArgument='<%# Eval("ID") %>' OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" runat="server"><i class="zi zi_trashalt" title="删除"></i>删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
</asp:Content>