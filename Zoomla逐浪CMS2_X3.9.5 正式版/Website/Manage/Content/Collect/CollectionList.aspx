<%@ Page Language="C#"  MasterPageFile="~/Manage/I/Index.master" AutoEventWireup="true" CodeBehind="CollectionList.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Collect.CollectionList" %>
<%@ Import Namespace="ZoomLa.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"><title>采集状态</title></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" Runat="Server">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/Main.aspx","工作台"),
	new Bread("../ContentManage.aspx","内容管理"),
	new Bread("/{manage}/Content/Collect/CollectionManage.aspx","信息采集"),
	
	new Bread() {url="/{manage}/Content/Collect/CollectionList.aspx", text="采集队列",addon="" }}
	)
%>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
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
</div>
</div>
    <div class="sysBtline">
        <asp:Button runat="server" ID="Clear_Btn" OnClick="Clear_Btn_Click" OnClientClick="return confirm('确定要清空队列吗');" Text="清空队列" CssClass="btn btn-outline-danger" />
    </div>
</asp:Content>