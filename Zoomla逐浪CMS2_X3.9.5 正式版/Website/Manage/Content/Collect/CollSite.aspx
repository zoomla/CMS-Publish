<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CollSite.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Collect.CollSite" MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>统一检索</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/Main.aspx","工作台"),
	new Bread("CollSite.aspx","采集检索"),
	new Bread("","统一检索"),
	new Bread() {url="/{manage}/Content/AddSites.aspx", text="<span class='text-danger'>[添加检索源]</span>",addon="" }}
	)
%>
<ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10" EnableTheming="False" IsHoldState="false"
	class="table table-striped table-bordered table-hover list_choice" EmptyDataText="当前没有信息!!"
	OnPageIndexChanging="EGV_PageIndexChanging" OnRowCommand="EGV_RowCommand">
	<Columns>
		<asp:TemplateField>                            
			<ItemTemplate>
				<input type="checkbox" name="idchk" title="" value='<%#Eval("ID") %>' />
			</ItemTemplate>
			<ItemStyle  CssClass="tdbg" HorizontalAlign="Center" />
		</asp:TemplateField>
		<asp:TemplateField  HeaderText="ID">
			<ItemTemplate>
				<%#Eval("ID") %>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField  HeaderText="站点名">
			<ItemTemplate>
				<a href="AddSites.aspx?ID=<%#Eval("ID")%>&guang=all"><%#Eval("SiteName") %></a>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField  HeaderText="Http地址">
			<ItemTemplate>
				<a href="<%#Eval("SiteUrl") %>" target="_blank"><%#Eval("SiteUrl") %></a>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField  HeaderText="密钥">
			<ItemTemplate>
			   <%#Eval("SiteKey") %>
			</ItemTemplate>
		</asp:TemplateField>
		 <asp:TemplateField  HeaderText="更新时间">
			<ItemTemplate>
				<%#Eval("LastTime") %>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="操作">
			<ItemTemplate>
				<a href="AddSites.aspx?ID=<%#Eval("ID") %>"><i class="zi zi_pencilalt" title="修改"></i></a>
				<asp:LinkButton ID="LinkButton1" runat="server" CommandName="Del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('你确定要删除吗!');" ToolTip="删除" ><i class="zi zi_trashalt" title="删除"></i>删除</asp:LinkButton>
			</ItemTemplate>
		</asp:TemplateField>
	</Columns>
	<PagerStyle HorizontalAlign="Center" />
	<RowStyle Height="24px" HorizontalAlign="Center" />
</ZL:ExGridView>
<asp:Button runat="server" Text="批量删除" OnClientClick="return confirm('你确定要删除选中项吗!');" ToolTip="批量删除" CssClass="btn btn-outline-danger" OnClick="Unnamed_Click"/>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script type="text/javascript">
	$().ready(function () {
	   
	});
</script>
</asp:Content>
