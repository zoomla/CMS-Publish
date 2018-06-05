<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProducerManage.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.ProducerManage"  MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>厂商管理</title>
<%=Call.SetBread( new Bread[] {
	new Bread("/{manage}/I/Main.aspx","工作台"),
	new Bread("ProductManage.aspx","商城管理"),
	new Bread("Addon/Exp/DeliverType.aspx","商城设置"),
	new Bread(){url="", text="厂商管理<a href='Producer.aspx'> [添加厂商]</a>"}
	}) %>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" PageSize="10" 
        OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Egv_RowCommand" 
        IsHoldState="false" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover list_choice" EnableTheming="False" EnableModelValidation="True" EmptyDataText="暂无厂商信息！！">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value='<%#Eval("ID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="厂商名称" DataField="Producername" />
            <asp:BoundField HeaderText="厂商地址" DataField="Coadd" ItemStyle-CssClass=""/>
            <asp:BoundField HeaderText="厂商缩写" DataField="Smallname" ItemStyle-CssClass=""/>
            <asp:BoundField HeaderText="厂商分类" DataField="CoClass" ItemStyle-CssClass=""/>
            <asp:BoundField HeaderText="联系电话" DataField="Telpho" ItemStyle-CssClass=""/>
            <asp:BoundField HeaderText="创建日期" DataField="CreateTime" DataFormatString="{0:yyyy年MM月dd日 HH:mm}" ItemStyle-CssClass=""/>
            <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="">
                <ItemTemplate>
                    <a href="Producer.aspx?id=<%#Eval("id") %>" ><i class="zi zi_pencilalt" title="修改"></i></a>
                    <asp:LinkButton CommandName="Del" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" runat="server" ><i class="zi zi_trashalt" title="删除"></i></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	<div class="alert alert-light">
    <asp:Button ID="Button1" class="btn btn-outline-danger" Text="删除选中厂商" runat="server" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" OnClick="Button1_Click" />
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
</asp:Content>