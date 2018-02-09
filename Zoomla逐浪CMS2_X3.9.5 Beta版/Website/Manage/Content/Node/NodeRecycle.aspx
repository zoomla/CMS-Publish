<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NodeRecycle.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Node.NodeRecycle" MasterPageFile="~/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>节点回收站</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="20" IsHoldState="false" 
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
    CssClass="table table-striped table-bordered" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
    <Columns>
        <asp:TemplateField ItemStyle-CssClass="td_xs">
            <ItemTemplate>
                <input type="checkbox" name="idchk" value="<%#Eval("NodeID") %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="NodeID" DataField="NodeID" ItemStyle-CssClass="td_s" />
        <asp:TemplateField HeaderText="节点名称">
            <ItemTemplate>
                <%#Eval("NodeName") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="父节点名称">
            <ItemTemplate>
                <%#ShowParentName() %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="节点类型" ItemStyle-CssClass="td_m">
            <ItemTemplate>
                <%#ShowNodeType() %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="创建时间" ItemStyle-CssClass="td_l"/>
        <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="td_l">
            <ItemTemplate>
                <asp:LinkButton runat="server" class="option_style" CommandName="del2" CommandArgument='<%#Eval("NodeID") %>'><i class="fa fa-recycle" title=""></i>恢复</asp:LinkButton>
                <asp:LinkButton runat="server" class="option_style" CommandName="del2" CommandArgument='<%#Eval("NodeID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="fa fa-trash-o"></i>删除</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
<div>
    <asp:Button runat="server" ID="BatReconver_Btn" class="btn btn-info" Text="批量恢复" OnClick="BatReconver_Btn_Click" />
    <asp:Button runat="server" ID="BatDel_Btn" class="btn btn-info" Text="批量删除" OnClientClick="return confirm('确定要删除吗');" OnClick="BatDel_Btn_Click" />
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>