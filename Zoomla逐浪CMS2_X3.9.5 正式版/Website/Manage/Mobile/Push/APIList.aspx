<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="APIList.aspx.cs" Inherits="ZoomLaCMS.Manage.Mobile.Push.APIList" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="BreadDiv" class="container-fluid mysite">
    <div class="row">
        <ol id="BreadNav" class="breadcrumb navbar-fixed-top w-100">
            <li class="breadcrumb-item"><a href="/Admin/Main.aspx">工作台</a></li>
            <li class="breadcrumb-item"><a href="Default.aspx">消息推送</a></li>
            <li class="breadcrumb-item"><a href="/admin/Mobile/Push/APIList.aspx">API列表</a> [<a href="AddAPI.aspx">添加API</a>]</li>
             <a href="https://www.jpush.cn" target="_blank" class="pull-right ml-auto mr-2"><i class="zi zi_bulbLine"></i> 注册账号</a>
        </ol>
    </div>
</div> 
 <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
        OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
        CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="尚未添加需要推送的APP">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="APP名称" DataField="Alias" />
            <asp:BoundField HeaderText="Key" DataField="APPKey" />
            <asp:BoundField HeaderText="Secret" DataField="APPSecret" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a  href="AddAPI.aspx?id=<%#Eval("ID") %>"><i class="zi zi_pencilalt" title="修改"></i></a>
                    <asp:LinkButton runat="server"  CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="zi zi_trashalt" title="删除"></i></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>