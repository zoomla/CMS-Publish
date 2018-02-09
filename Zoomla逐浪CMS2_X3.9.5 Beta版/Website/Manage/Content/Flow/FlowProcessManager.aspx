<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FlowProcessManager.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Flow.FlowProcessManager"  MasterPageFile="~/Manage/I/Default.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>流程管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
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
            <asp:BoundField DataField="id" HeaderText="ID" ItemStyle-CssClass="td_s" />
            <asp:BoundField DataField="PName" HeaderText="流程步骤名称" />
            <asp:BoundField DataField="PDepcit" HeaderText="流程步骤描述" />
            <asp:BoundField DataField="PPassName" HeaderText="通过操作的操作名" />
            <asp:BoundField DataField="PNoPassName" HeaderText="打回操作的操作名" />
            <asp:TemplateField HeaderText="流程步骤操作 " ShowHeader="False" ItemStyle-CssClass="td_l">
                <ItemTemplate>
                    <a href='FlowProcess.aspx?id=<%#Eval("id") %>' class="option_style"><i class="fa fa-pencil" title="修改"></i></a>
				<asp:LinkButton ID="lbDel" runat="server" CausesValidation="False" OnClientClick="{return confirm('你确定要将所有选择项删除吗？')}"
                    CommandName="Delete" CssClass="option_style"><i class="fa fa-trash-o" title="删除"></i>删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
