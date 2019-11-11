<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FlowManager.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Flow.FlowManager" MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>流程管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/Main.aspx","工作台"),
	new Bread("/{manage}/Config/SiteInfo.aspx","系统设置"),
	new Bread() {url="", text="流程管理<a href='AddFlow.aspx'> [添加流程]</a>",addon="" }}
	)
%>
<asp:ObjectDataSource ID="odsFlow" runat="server" SelectMethod="GetFlowAll" TypeName="ZoomLa.BLL.B_Flow"
	DeleteMethod="DelFlowById">
	<DeleteParameters>
		<asp:Parameter Name="id" Type="Int32" />
	</DeleteParameters>
</asp:ObjectDataSource>
<ZL:ExGridView ID="EGV" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
	DataSourceID="odsFlow" OnPageIndexChanging="EGV_PageIndexChanging"  DataKeyNames="id" RowStyle-HorizontalAlign="Center" 
	OnRowDataBound="gwFlow_RowDataBound" PageSize="20"  class="table table-striped table-bordered list_choice">
	<Columns>
		<asp:BoundField DataField="id" HeaderText="ID" ItemStyle-CssClass="w1rem" />
       <asp:TemplateField HeaderText="流程名称" ItemStyle-CssClass="text-left">
           <ItemTemplate>
               <span><%#Eval("FlowName") %></span>
               <span class="rd_green"><%# "("+ Eval("FlowDepict")+")"%></span>
           </ItemTemplate>
       </asp:TemplateField>
		<asp:TemplateField HeaderText="流程操作" ShowHeader="False" ItemStyle-CssClass="td_l">
			<ItemTemplate>
                <a href='AddFlow.aspx?id=<%#Eval("id") %>' ><i class="zi zi_pencilalt" title="修改"></i></a>
                <asp:LinkButton ID="lbDel" runat="server" CausesValidation="False" CommandName="Delete"  OnClientClick="return confirm('确定要删除吗');"><i class="zi zi_trashalt" title="删除"></i></asp:LinkButton>
                <a href='FlowManager.aspx?Action=copy&id=<%#Eval("id") %>' ><i class="zi zi_copy" title="复制"></i></a>
				<a href='FlowProcess.aspx?flowid=<%# Eval("id") %>'><i class="zi zi_plus" title="添加"></i>步骤</a>
                <a href='FlowProcessManager.aspx?id=<%# Eval("id") %>'><i class="zi zi_listalt" title="列表"></i>列表</a>
			</ItemTemplate>
		</asp:TemplateField>
	</Columns>
</ZL:ExGridView>
<style>
.allchk_l{display: none;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/Common.js"></script>
</asp:Content>

