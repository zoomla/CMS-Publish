<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Producerlist.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Producerlist"  MasterPageFile="~/Common/Master/Empty.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>选择厂商</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div class="input-group">
        <asp:TextBox runat="server" ID="Skey_T" class="form-control" placeholder="请输入厂商名称"></asp:TextBox>
        <span class="input-group-btn">
            <asp:Button runat="server" ID="Skey_Btn" class="btn btn-info" Text="搜索" OnClick="Skey_Btn_Click" />
            <input type="button" class="btn btn-primary" value="确定" onclick="selback();" />
        </span>
    </div>
   <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" PageSize="10" 
        OnRowDataBound="Egv_RowDataBound" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="Egv_RowCommand" 
        IsHoldState="false" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered margin_t10" EnableTheming="False" EnableModelValidation="True" EmptyDataText="暂无厂商信息！！">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="td_xs">
                <ItemTemplate>
                    <input type="radio" name="idchk" value='<%#Eval("ID") %>' data-name="<%#Eval("Producername") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="厂商名称" DataField="Producername" />
            <asp:BoundField HeaderText="厂商分类" DataField="CoClass" />
            <asp:BoundField HeaderText="联系电话" DataField="Telpho"/>
        </Columns>
    </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
.allchk_l{display:none;}
</style>
<script>
function selback() {
    if (!parent || !parent.producer.selback) { alert("未找到可回调方法"); return false; }
    var $rad = $("input[name='idchk']:checked");
    if ($rad.length < 1) { alert("尚未选择厂商"); return false; }
    parent.producer.selback({ id: $rad[0].value, name: $($rad[0]).data("name") });
}
</script>
</asp:Content>