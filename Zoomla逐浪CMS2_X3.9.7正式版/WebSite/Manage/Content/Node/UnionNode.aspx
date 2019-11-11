<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UnionNode.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.UnionNode"MasterPageFile="~/Manage/I/Index.master"  %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>节点合并迁移</title>
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/I/Main.aspx","工作台"),
		new Bread("/{manage}/Config/SiteInfo.aspx","系统设置"), 
        new Bread("/{manage}/Content/Node/NodeManage.aspx","节点管理"), 
        new Bread() {url="", text="节点合并迁移",addon="" }},
		Call.GetHelp(16)
		)
    %>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice">
    <table class="table table-striped table-bordered">
        <tr class="text-center">
            <td colspan="3">批量设置节点</td>
        </tr>
        <tr class="sys_move_list d-flex flex-wrap">
            <td class="text-center">
                <span class="text-danger">提示：源节点</span><br />
                <br />
                <asp:ListBox ID="LstNodes" CssClass="form-control" runat="server" DataTextField="NodeName" DataValueField="NodeId" Height="282px" Width="307px" SelectionMode="Multiple"></asp:ListBox>
            </td>
            <td class="text-center">
                <span  class="text-danger">提示：目标节点</span><br />
                <br />
                <asp:ListBox ID="MainNode" CssClass="form-control" runat="server" Width="307px" Height="282px"></asp:ListBox>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="padding-left:30%;">
                <asp:CheckBox ID="CheckBox1" runat="server" Text="合并后删除来源节点" />
                <asp:Button ID="EBtnBacthSet" Text="合并节点" class="btn btn-outline-info" OnClick="EBtnBacthSet_Click" runat="server" OnClientClick="return confirm('将要合并节点吗，确定执行吗？')" />&nbsp;&nbsp;
            <asp:Button ID="Button1" Text="迁移节点" class="btn btn-outline-info" runat="server" OnClick="Button1_Click" OnClientClick="return confirm('迁移节点至新节点下，确定执行吗？')" />
            </td>
        </tr>
    </table>
	</div>
	</div>
    <script src="/JS/Common.js"></script>
    <script>
        function SelectAll()
        {
            for (var i = 0; i < document.getElementById('<%=LstNodes.ClientID%>').length; i++)
            {
                document.getElementById('<%=LstNodes.ClientID%>').options[i].selected = true;
            }
        }
        function UnSelectAll()
        {
            for (var i = 0; i < document.getElementById('<%=LstNodes.ClientID%>').length; i++)
            {
                document.getElementById('<%=LstNodes.ClientID%>').options[i].selected = false;
            }
        }
    </script>
</asp:Content>