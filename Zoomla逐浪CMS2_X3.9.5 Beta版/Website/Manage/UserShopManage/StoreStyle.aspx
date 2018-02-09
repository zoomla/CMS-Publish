<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StoreStyle.aspx.cs" Inherits="ZoomLaCMS.Manage.UserShopManage.StoreStyle" MasterPageFile="~/Manage/I/Default.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head"><title>店铺样式</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="20" IsHoldState="false" OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" OnRowDataBound="EGV_RowDataBound"
        OnRowCommand="EGV_RowCommand" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="当前没有店铺样式">
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:BoundField HeaderText="样式名称" DataField="StyleName" />
            <asp:TemplateField HeaderText="预览图片">
                <ItemTemplate>
                    <img src="<%#Eval("Thumbnail") %>" class="img_50" onerror="shownopic(this);" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="首页模板" DataField="Template_Index" />
            <asp:BoundField HeaderText="内容模板" DataField="Template_Content" />
            <asp:BoundField HeaderText="列表页模板" DataField="Template_List" />
            <asp:BoundField HeaderText="创建时间" DataField="CDate" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:BoundField HeaderText="备注" DataField="Remind" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="StoreStyleAdd.aspx?ID=<%#Eval("ID") %>" class="option_style"><i class="fa fa-pencil"></i>修改</a>
                    <asp:LinkButton runat="server" CssClass="option_style" CommandName="del" CommandArgument='<%#Eval("ID") %>'><i class="fa fa-trash-o"></i>删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <style type="text/css">
        .allchk_l { display: none; }
    </style>
</asp:Content>
