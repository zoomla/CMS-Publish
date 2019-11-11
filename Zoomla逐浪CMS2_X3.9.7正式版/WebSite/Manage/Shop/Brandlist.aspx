<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Brandlist.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Brandlist" MasterPageFile="~/Common/Master/Empty.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>选择品牌</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="input-group">
        <asp:TextBox runat="server" ID="Skey_T" class="form-control" placeholder="请输入品牌名称"></asp:TextBox>
        <span class="input-group-btn">
            <asp:Button runat="server" ID="Skey_Btn" class="btn btn-info" Text="搜索" OnClick="Skey_Btn_Click" />
            <input type="button" class="btn btn-primary" value="确定" onclick="selback();" />
        </span>
    </div>
 <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
    CssClass="table table-striped table-bordered margin_t10" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
    <Columns>
        <asp:TemplateField ItemStyle-CssClass="td_xs">
            <ItemTemplate>
                <input type="radio" name="idchk" value="<%#Eval("ID") %>"  data-name="<%#Eval("TrName") %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="td_s" />
        <asp:TemplateField HeaderText="所属厂商" ItemStyle-CssClass="td_l">
            <ItemTemplate>
                <%#Eval("ProName") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="品牌名称" DataField="Trname" />
        <asp:BoundField HeaderText="品牌分类" DataField="TrClass" ItemStyle-CssClass="td_l"/>
    </Columns>
</ZL:ExGridView> 
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
.allchk_l{display:none;}
</style>
<script>
function selback() {
    if (!parent || !parent.brand.selback) { alert("未找到可回调方法"); return false; }
    var $rad = $("input[name='idchk']:checked");
    if ($rad.length < 1) { alert("尚未选择品牌"); return false; }
    parent.brand.selback({ id: $rad[0].value, name: $($rad[0]).data("name") });
}
</script>
</asp:Content>