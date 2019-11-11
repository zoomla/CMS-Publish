<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SetSpecOrder.aspx.cs" MasterPageFile="~/Manage/I/Index.master" Inherits="ZoomLaCMS.Manage.Content.SetSpecOrder" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>专题排序</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("","系统设置"),
	new Bread() {url="", text="专题管理",addon="" }}
	)
%>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
<table class="table table-striped table-bordered table-hover sys_table">
    <tr>
        <td class=""><strong>ID</strong></td>
        <td><strong>专题名</strong></td>
        <td><strong>专题标识</strong></td>
        <td><strong>专题描述</strong></td>
        <td class=""><strong>手动排序</strong></td>
        <td><strong>排序</strong></td>
    </tr>
    <asp:Repeater ID="RPT" runat="server" OnItemCommand="RPT_ItemCommand">
        <ItemTemplate>
            <tr>
                <td><%#Eval("SpecID") %></td>
                <td><%#Eval("SpecName") %></td>
                <td><%#Eval("SpecDir") %></td>
                <td><%#Eval("SpecDesc") %></td>
                <td>
                    <input type="text" class="l_input"  name="OrderField<%#Eval("SpecID")%>" id="OrderField<%#Eval("SpecID")%>" value="<%#Eval("OrderID") %>" />
                    <input type="hidden" name="SpecIDValue" id="SpecIDValue" value="<%#Eval("SpecID")%>" />
                </td>
                <td>
                    <asp:LinkButton runat="server" CommandName="UpMove" CommandArgument='<%# Eval("SpecID") %>'>上移</asp:LinkButton>
                    |
					<asp:LinkButton runat="server" CommandName="DownMove" CommandArgument='<%# Eval("SpecID") %>'>下移</asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
    </asp:Repeater>
</table>
</div></div>
<div class="alert alert-light">
<asp:Button ID="Save_Btn" runat="server" Text="批量更新排序" CssClass="btn btn-outline-info" OnClick="Save_Btn_Click" /></div>
</asp:Content>

