<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContentMove.aspx.cs" Inherits="ZoomLaCMS.Manage.I.ASCX.ContentMove" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>内容管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/I/Main.aspx","工作台"),
	new Bread("ContentManage.aspx","内容管理"),
	new Bread() {url="", text="内容批量移动",addon= "" }}
	)
%>
	<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
    <table class="table table-striped table-bordered sys_table">
        <tr ><th class="text-center" colspan="2">批量移动内容到其他节点</th></tr>
        <tr>
            <th scope="col" class="w12rem_lg">内容ID</th>
            <td scope="col" class="bqright">
                <asp:TextBox ID="TxtContentID" class="form-control text_300"  runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RV1" runat="server" ControlToValidate="TxtContentID" ErrorMessage="内容ID不能为空" ForeColor="Red" />
            </td>
        </tr>
        <tr>
            <th>目标节点</th>
            <td>
                <select name="targetNode" class="form-control text_300">
                    <asp:Literal ID="Nodes_Li" runat="server"></asp:Literal>
                </select>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="BatMove_Btn" class="btn btn-info" runat="server" Text="批量处理" OnClick="BatMove_Btn_Click" />
                <a href="ContentManage.aspx" class="btn btn-outline-info">取消</a>
            </td>
        </tr>
    </table>
	</div>
	</div>
</asp:Content>
