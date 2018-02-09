<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProducerManage.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.ProducerManage"  MasterPageFile="~/Manage/I/Default.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>厂商管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" PageSize="10" 
        OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Egv_RowCommand" 
        IsHoldState="false" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="暂无厂商信息！！">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="td_xs">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value='<%#Eval("ID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="厂商名称" DataField="Producername" />
            <asp:BoundField HeaderText="厂商地址" DataField="Coadd" ItemStyle-CssClass="td_l"/>
            <asp:BoundField HeaderText="厂商缩写" DataField="Smallname" ItemStyle-CssClass="td_l"/>
            <asp:BoundField HeaderText="厂商分类" DataField="CoClass" ItemStyle-CssClass="td_l"/>
            <asp:BoundField HeaderText="联系电话" DataField="Telpho" ItemStyle-CssClass="td_l"/>
            <asp:BoundField HeaderText="创建日期" DataField="CreateTime" DataFormatString="{0:yyyy年MM月dd日 HH:mm}" ItemStyle-CssClass="td_l"/>
            <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="td_m">
                <ItemTemplate>
                    <a href="Producer.aspx?id=<%#Eval("id") %>" class="option_style"><i class="fa fa-pencil" title="修改"></i></a>
                    <asp:LinkButton CommandName="Del" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" runat="server" CssClass="option_style"><i class="fa fa-trash-o" title="删除"></i></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <asp:Button ID="Button1" class="btn btn-primary" Text="删除选中厂商" runat="server" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" OnClick="Button1_Click" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
</asp:Content>