<%@ Page Language="C#"  MasterPageFile="~/Manage/I/Default.master" AutoEventWireup="true" CodeBehind="CollectionList.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Collect.CollectionList" %>
<%@ Import Namespace="ZoomLa.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"><title>采集状态</title></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
<table class="table table-bordered table-striped">
    <tr><td></td><td>项目名称</td><td>采集网站</td><td>执行时间</td></tr>
     <asp:Repeater runat="server" ID="RPT">
         <ItemTemplate>
             <tr>
                 <td><input type="checkbox" name="idchk" value="<%#((M_CollectionItem)Container.DataItem).CItem_ID %>" /></td>
                 <td><%# ((M_CollectionItem)Container.DataItem).ItemName %></td>
                 <td><%# ((M_CollectionItem)Container.DataItem).SiteName %></td>
                 <td><%# ((M_CollectionItem)Container.DataItem).LastTime %></td>
             </tr>
         </ItemTemplate>
     </asp:Repeater>
</table>
    <div class="margin_t5">
        <asp:Button runat="server" ID="Clear_Btn" OnClick="Clear_Btn_Click" OnClientClick="return confirm('确定要清空队列吗');" Text="清空队列" CssClass="btn btn-primary" />
    </div>
</asp:Content>