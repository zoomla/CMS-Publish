<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowProBindUser.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Addon.ShowProBindUser" MasterPageFile="~/Manage/I/Default.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head"></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="该特选商品没有绑定用户">
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="UserID" />
            <asp:BoundField HeaderText="用户名" DataField="UserName" />
           <%-- <asp:BoundField HeaderText="昵称" DataField="HoneyName" />--%>
             <asp:BoundField HeaderText="姓名" DataField="TrueName" />
            <asp:TemplateField HeaderText="<%$Resources:L,商品名称 %>">
                <ItemTemplate>
                    <asp:LinkButton runat="server" CssClass="option_style" CommandName="remove" CommandArgument='<%# Eval("UserID") %>'><i class="fa fa-trash-o" title="删除"></i>删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
 <style type="text/css">
     #navHolder{display:none;}
 </style>
</asp:Content>
