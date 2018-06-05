<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FlowProcessManager.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Flow.FlowProcessManager"  MasterPageFile="~/Manage/I/index.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>流程管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/I/Main.aspx","工作台"),
		new Bread("/{manage}/Config/SiteOption.aspx","系统设置"),
        new Bread("FlowManager.aspx","流程管理"),
        new Bread("FlowProcessManager.aspx?id="+Mid,"三级审核流程"),
        new Bread() {url="", text="步骤列表<a href='FlowProcess.aspx?flowid="+Mid+"'> [添加步骤]</a>",addon="" }}
		)
    %>
<div class="list_choice">
    <asp:ObjectDataSource ID="odsFlowProcess" runat="server"
        SelectMethod="GetProcessByFlowId" TypeName="ZoomLa.BLL.B_Process"
        DeleteMethod="DelProcessById">
        <DeleteParameters>
            <asp:Parameter Name="id" Type="Int32" />
        </DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="flowId" QueryStringField="id" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <div>
    </div>
    <ZL:ExGridView ID="EGV" runat="server" AllowPaging="True"
        AllowSorting="True" AutoGenerateColumns="False"
        DataSourceID="odsFlowProcess" class="table table-striped table-bordered table-hover"
        PageSize="20" OnRowDataBound="gwFlowProcess_RowDataBound"  DataKeyNames="id">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="ID" ItemStyle-CssClass="" />
            <asp:BoundField DataField="PName" HeaderText="流程步骤名称" />
            <asp:BoundField DataField="PDepcit" HeaderText="流程步骤描述" />
            <asp:BoundField DataField="PPassName" HeaderText="通过操作的操作名" />
            <asp:BoundField DataField="PNoPassName" HeaderText="打回操作的操作名" />
            <asp:TemplateField HeaderText="流程步骤操作 " ShowHeader="False" ItemStyle-CssClass="">
                <ItemTemplate>
                    <a href='FlowProcess.aspx?id=<%#Eval("id") %>' ><i class="zi zi_pencilalt" title="修改"></i> </a>
				<asp:LinkButton ID="lbDel" runat="server" CausesValidation="False" OnClientClick="{return confirm('你确定要将所有选择项删除吗？')}"
                    CommandName="Delete"> <i class="zi zi_trashalt" title="删除"></i>删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
