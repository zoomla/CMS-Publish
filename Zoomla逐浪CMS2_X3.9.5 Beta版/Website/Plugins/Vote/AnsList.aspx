<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnsList.aspx.cs" Inherits="ZoomLaCMS.Plugins.Vote.AnsList" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title></title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="15" IsHoldState="false"
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
    CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
    <Columns>
        <asp:BoundField HeaderText="回答" DataField="Answer" />
        <asp:TemplateField HeaderText="用户" ItemStyle-CssClass="td_m">
            <ItemTemplate><%#GetCUser() %></ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="提交IP" ItemStyle-CssClass="td_m">
            <ItemTemplate><%#GetIP() %></ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="答题时间" DataField="CDate" DataFormatString="{0:yyyy-MM-dd HH:mm}" ItemStyle-CssClass="td_l" />
<%--        <asp:TemplateField HeaderText="操作">
            <ItemTemplate>
                <a href='AnsDetailList.aspx?ansid=<%#Eval("ID") %>'><i class="fa fa-list"></i>详情</a>
                <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="del" OnClientClick="return confirm('确认删除？')" CssClass="option_style"><i class="fa fa-trash-o" title="<%=Resources.L.删除 %>"></i><%=Resources.L.删除 %></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>--%>
    </Columns>
</ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<style type="text/css">
.allchk_l{display:none;}
</style>
</asp:Content>