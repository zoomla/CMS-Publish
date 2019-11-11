<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Tools.aspx.cs" Inherits="ZoomLaCMS.Tools.dbdic.Tools" MasterPageFile="~/Common/Master/Empty.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>数据字典工具</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div>
   <asp:Button runat="server" ID="HasDelTables_Btn" Text="获取已删除的表" OnClick="HasDelTables_Btn_Click" class="btn btn-info"/>
    <asp:Button runat="server" ID="DelOldTable_Btn" Text="删除旧表" OnClick="DelOldTable_Btn_Click" class="btn btn-info"/>
</div>
<div class="margin_t5">
    <table class="table table-bordered table-striped">
        <tr><td class="td_m">表名</td></tr>
        <asp:Repeater runat="server" ID="RPT">
            <ItemTemplate>
               <tr><td>
                   <%#Eval("Name") %>
                   </td></tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
</div>
<div runat="server" id="result_div" class="margin_t5 alert alert-info">

</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script"></asp:Content>