<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockManage.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.StockManage" MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>库存管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="20" IsHoldState="false" 
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
    CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="td_xs">
                <ItemTemplate>
                    <input name="idchk" type="checkbox" value='<%# Eval("id")%>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="商品名称" DataField="Proname" ItemStyle-CssClass="td_l" />
            <asp:TemplateField HeaderText="单据类型">
                <ItemTemplate>
                    <%#GetStockType()%> [<%#Eval("danju") %>]
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="数量" DataField="Pronum" />
            <asp:BoundField HeaderText="录入时间" DataField="addtime" ItemStyle-CssClass="td_l" />
            <asp:BoundField HeaderText="录入者" DataField="adduser" />
            <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="td_l">
                <ItemTemplate>
                    <a class="option_style" href="Stock.aspx?id=<%#Eval("id") %>"><i class="fa fa-pencil" title="修改"></i></a>
                    <asp:LinkButton CssClass="option_style" OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" CommandName="del1" CommandArgument='<%# Eval("ID") %>' runat="server"><i class="fa fa-trash-o" title="删除"></i>删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
<div class="margin_t5">
    <asp:Button runat="server" ID="BatDel_Btn" Text="批量删除" class="btn btn-info" OnClick="BatDel_Btn_Click" OnClientClick="return confirm('确定要删除吗');"/>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/SelectCheckBox.js"></script>
<script>
    //function IsSelectedId() {
    //    var checkArr = $("input[type=checkbox][name=Item]:checked");
    //    if (checkArr.length > 0)
    //        return true
    //    else
    //        return false;
    //}
    //$(function () {
    //    $("#Egv tr").dblclick(function () {
    //        var id = $(this).find("[name=idchk]").val();
    //        if (id) {
    //            location = "Stock.aspx?id=" + id;
    //        }
    //    });
    //});
</script>
</asp:Content>
