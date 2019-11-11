<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NodeSearch.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.NodeSearch" MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>节点搜索</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<%=Call.SetBread( new Bread[] {
new Bread("/{manage}/Main.aspx","工作台"),
new Bread("/{manage}/Config/SiteInfo.aspx","系统设置"),
new Bread("NodeManage.aspx","节点管理"),
new Bread(){url="NodeManage.aspx", text="快速操作"}
}) %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
<table class="table table-striped table-bordered table-hover sys_table">
	<tr class="gridtitle" align="center"> 
		<th class="text-center" scope="col"><strong>ID</strong></th>
		<th class="text-center"  scope="col"><strong>节点名称</strong></th>
		<th class="text-center"  scope="col"><strong>节点类型</strong></th>                
        <th class="text-center"  scope="col"><strong>绑定模型</strong></th>
        <th class="text-center"  scope="col"><strong>节点模板</strong></th>
        <th class="text-center"  scope="col"><strong>操作</strong></th>
	</tr>
    <ZL:Repeater runat="server" ID="RPT" PageSize="10" PagePre="<tr class='hidden'><td></td><td colspan='12'><div class='text-center'>" PageEnd="</div></td></tr>">
        <ItemTemplate>
            <tr>
                <td><%#ZoomLa.Common.StringHelper.SkeyToRed(Eval("NodeID",""),Skey)  %></td>
                <td>
                    [<%#GetParentInfo() %>]
                    <a href="ContentManage.aspx?NodeID=<%#Eval("NodeID") %>"><%# GetIconPath(Convert.ToInt32(Eval("NodeID")))%></a>
                    <a href="EditNode.aspx?NodeID=<%#Eval("NodeID") %> "><%#ZoomLa.Common.StringHelper.SkeyToRed(Eval("NodeName",""),Skey) %></a></td>
                <td><%# ZoomLa.BLL.B_Node.GetNodeType(Convert.ToInt32(Eval("NodeType")))%></td>
                <td><%# GetTemplate(Convert.ToInt32(Eval("NodeID")))%></td>
                <td><a href="<%=CustomerPageAction.customPath2 %>Template/TemplateEdit.aspx?filepath=/<%# HttpUtility.UrlEncode(Eval("IndexTemplate",""))%>">
                    <%# Eval("IndexTemplate")%></a>
                </td>
                <td class="optd"><%#GetOper()%></td>
            </tr>
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </ZL:Repeater>
</table>
</div>
</div>
</asp:Content>
