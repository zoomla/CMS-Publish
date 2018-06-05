<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AuditingState.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Flow.AuditingState" MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>工作流配置</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/Main.aspx","工作台"),
	new Bread("/{manage}/Config/SiteInfo.aspx","系统设置"),
	new Bread() {url="", text="状态编码管理<a href='AddAuditingState.aspx'> [添加状态编码]</a>",addon="" }}
	)
%>
    <ZL:ExGridView ID="EGV" runat="server" DataSourceID="odsAuditingState" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="stateCode" AllowSorting="True" 
        PageSize="20" OnRowCommand="gvAuditingState_RowCommand" OnPageIndexChanging="EGV_PageIndexChanging"   class="table table-striped table-bordered table-hover list_choice" >
	<Columns>
		<asp:TemplateField HeaderText="状态编码"  ItemStyle-HorizontalAlign="Center">
			<ItemTemplate>
				<asp:Label ID="Label1" runat="server" Text='<%# Bind("StateCode") %>'></asp:Label>
			</ItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="状态名称">
			<ItemTemplate>
				<asp:Label ID="Label3" runat="server" Text='<%#Eval("StateName") %>'></asp:Label>
			</ItemTemplate>
			<EditItemTemplate>
				<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("StateName") %>'></asp:TextBox>
			</EditItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="状态类型"  ItemStyle-HorizontalAlign="Center">
			<ItemTemplate>
				<%# GetStateType(Eval("StateType").ToString())%>
			</ItemTemplate>
			<EditItemTemplate>
				<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("StateType") %>'></asp:TextBox>
			</EditItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="编辑" ShowHeader="False"  ItemStyle-HorizontalAlign="Center">
			<ItemTemplate >
				<asp:LinkButton ID="btnEdit" runat="server" CausesValidation="True" CommandName="Edit" Enabled='<%# IsEnabled(Eval("StateType").ToString())%>'><i class="zi zi_pencilalt" title="编辑"></i>编辑</asp:LinkButton>
			</ItemTemplate>
			<EditItemTemplate>
				<asp:LinkButton ID="btnUpdate" runat="server" CausesValidation="True" CommandName="Update" CommandArgument='<%# Container.DisplayIndex+":"+ Eval("StateCode")%>' Text="更新" />
				&nbsp;<asp:LinkButton ID="btnCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
			</EditItemTemplate>
		</asp:TemplateField>
		<asp:TemplateField HeaderText="删除" ShowHeader="False"  ItemStyle-HorizontalAlign="Center">
			<ItemTemplate>
				<asp:LinkButton ID="btnDel" runat="server" CommandName="Delete" OnClientClick="return confirm('你确定将该数据删除吗？');"  CommandArgument='<%# Eval("StateCode")%>' Enabled='<%# IsEnabled(Eval("StateType").ToString())%>' ><i class="zi zi_trashalt" title="删除"></i>删除</asp:LinkButton>
			</ItemTemplate>
		</asp:TemplateField>
	</Columns>
	<RowStyle />
	<HeaderStyle/>
</ZL:ExGridView>
<asp:ObjectDataSource ID="odsAuditingState" runat="server" SelectMethod="GetAuditingStateAll"
	TypeName="ZoomLa.BLL.B_AuditingState" DeleteMethod="DelBystateCode"
	UpdateMethod="Update">
	<DeleteParameters>
		<asp:Parameter Name="stateCode" Type="String" />
	</DeleteParameters>
	<UpdateParameters>
		<asp:Parameter Name="stateName" Type="String" />
		<asp:Parameter Name="stateType" Type="String" />
		<asp:Parameter Name="stateCode" Type="String" />
	</UpdateParameters>
</asp:ObjectDataSource>
<style>
.allchk_l{display: none;}
</style>
</asp:Content>