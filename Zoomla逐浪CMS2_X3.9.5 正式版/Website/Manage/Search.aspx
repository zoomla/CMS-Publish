<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="ZoomLaCMS.Manage.Search" MasterPageFile="~/Manage/I/index.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>功能检索</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol id="BreadNav" class="breadcrumb navbar-fixed-top">
<li class="breadcrumb-item"><a href="/admin/Main.aspx">工作台</a></li>
<li class="breadcrumb-item"><a href="<%=Request.RawUrl %>" style="margin-right:30px;">功能检索</a>
    <a href="<%=customPath2 %>Main.aspx" class="btn btn-info">从此开始</a>
    <a href="<%=customPath2 %>Workload/FuncList.aspx" class="btn btn-outline-info">功能列表</a>
</li>
</ol>
<ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" EnableTheming="False"  AllowPaging="true" OnPageIndexChanging="EGV_PageIndexChanging" PageSize="15"
    EmptyDataText="没有匹配的页面，建议更换关键词!!"   class="table table-striped table-bordered table-hover">
  <Columns>
  <asp:BoundField DataField="Index" HeaderText="ID"/>
  <asp:BoundField DataField="DTitle" HeaderText="标题" HtmlEncode="false"/>
  <asp:TemplateField HeaderText="路径">
    <ItemTemplate> <a href="<%#Eval("Url") %>" title="点击访问"><%#Eval("Url") %></a> </ItemTemplate>
  </asp:TemplateField>
  </Columns>
</ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>