<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FlowManager.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Flow.FlowManager" MasterPageFile="~/Manage/I/Default.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>流程管理</title><style>#AllID_Chk{display:none;}</style></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<asp:ObjectDataSource ID="odsFlow" runat="server" SelectMethod="GetFlowAll" TypeName="ZoomLa.BLL.B_Flow"
	DeleteMethod="DelFlowById">
	<DeleteParameters>
		<asp:Parameter Name="id" Type="Int32" />
	</DeleteParameters>
</asp:ObjectDataSource>
<ZL:ExGridView ID="EGV" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False"
	DataSourceID="odsFlow" OnPageIndexChanging="EGV_PageIndexChanging"  DataKeyNames="id" RowStyle-HorizontalAlign="Center" 
	OnRowDataBound="gwFlow_RowDataBound" PageSize="20"  class="table table-striped table-bordered">
	<Columns>
		<asp:BoundField DataField="id" HeaderText="ID" ItemStyle-CssClass="td_xs" />
       <asp:TemplateField HeaderText="流程名称" ItemStyle-CssClass="text-left">
           <ItemTemplate>
               <span><%#Eval("FlowName") %></span>
               <span class="rd_green"><%# "("+ Eval("FlowDepict")+")"%></span>
           </ItemTemplate>
       </asp:TemplateField>
		<asp:TemplateField HeaderText="流程操作" ShowHeader="False" ItemStyle-CssClass="td_l">
			<ItemTemplate>
                <a href='AddFlow.aspx?id=<%#Eval("id") %>' class="option_style"><i class="fa fa-pencil" title="修改"></i></a>
                <asp:LinkButton ID="lbDel" runat="server" CausesValidation="False" CommandName="Delete" CssClass="option_style" OnClientClick="return confirm('确定要删除吗');"><i class="fa fa-trash-o" title="删除"></i></asp:LinkButton>
                <a href='FlowManager.aspx?Action=copy&id=<%#Eval("id") %>' class="option_style"><i class="fa fa-copy" title="复制"></i></a>
				<a href='FlowProcess.aspx?flowid=<%# Eval("id") %>' class="option_style"><i class="fa fa-plus" title="添加"></i>步骤</a>
                <a href='FlowProcessManager.aspx?id=<%# Eval("id") %>' class="option_style"><i class="fa fa-list-alt" title="列表"></i>列表</a>
			</ItemTemplate>
		</asp:TemplateField>
	</Columns>
</ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/js/Common.js"></script>
</asp:Content>

