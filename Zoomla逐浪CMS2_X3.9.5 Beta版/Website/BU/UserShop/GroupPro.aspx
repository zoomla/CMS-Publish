<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GroupPro.aspx.cs" Inherits="ZoomLaCMS.BU.UserShop.GroupPro" MasterPageFile="~/Common/Master/User.Master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>组合商品</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="store"></div>
<div class="container">
<div class="margin_t5">
    <ol class="breadcrumb">
        <li><a title="会员中心" href="/User/">会员中心</a></li>
        <li><a href="/User/UserShop/ProductList">商品管理</a></li>
        <li class="active">组合管理 [<a href="GroupProAdd.aspx">添加组合</a>]</li>
        <div class="clearfix"></div>
    </ol>
</div>
<div id="topwrap"></div>
<script>
    $("#topwrap").load("/User/Index/ASCXHtml?ascx=UserShopTop", {}, function (data) { console.log(data); });
</script>
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="20" IsHoldState="false" 
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
    CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
    <Columns>
        <asp:TemplateField ItemStyle-CssClass="td_xs">
            <ItemTemplate>
                <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="td_s" />
        <asp:BoundField HeaderText="组合名称" DataField="Name" />
        <asp:BoundField DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="创建时间" ItemStyle-CssClass="td_l"/>
        <asp:BoundField DataField="Remind" HeaderText="备注" />
        <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="td_l">
            <ItemTemplate>
                <a class="option_style" href="GroupProAdd.aspx?id=<%#Eval("ID") %>"><i class="fa fa-pencil" title="修改"></i></a>
                <asp:LinkButton runat="server" CssClass="option_style" CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="fa fa-trash-o" title="删除"></i></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
<div class="margin_t5">
    <asp:Button runat="server" ID="BatDel_Btn" Text="批量删除" OnClick="BatDel_Btn_Click" OnClientClick="return confirm('确定要删除吗');" class="btn btn-info" />
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>