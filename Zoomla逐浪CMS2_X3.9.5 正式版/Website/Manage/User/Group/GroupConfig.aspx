<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GroupConfig.aspx.cs" Inherits="ZoomLaCMS.Manage.User.GroupConfig" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>会员组设置</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","后台管理"),
        new Bread("GroupManage.aspx","会员组管理"),
        new Bread() {url="", text="会员组设置",addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
    <table class="table table-striped table-bordered table-hover sys_table">
        <tr>
            <th class="text-center spacingtitle" colspan="2" align="center">
                <asp:Literal ID="LTitle" runat="server" Text="会员组设置"></asp:Literal></th>
        </tr>
        <tr>
            <th scope="col" class="w12rem_lg">会员组名称</th>
            <td scope="col">
                <asp:Label ID="GroupName" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <th>会员组描述</th>
            <td>
                <asp:Label ID="GroupInfo" runat="server" Text=""></asp:Label></td>
        </tr>
        <tr>
            <th>选择用户模型</th>
            <td>
                <asp:RadioButtonList ID="GroupModel" runat="server"></asp:RadioButtonList>
                <!--单选用这个-->
                <asp:CheckBoxList ID="CheckBoxList1" runat="server"></asp:CheckBoxList>
                <!--多选用这个-->
            </td>
        </tr>
        <tr>
            <td colspan="2">&nbsp;
        <asp:Button ID="EBtnSubmit" Text="保存" runat="server" OnClick="EBtnSubmit_Click" class="btn btn-info" />
                <a href="GroupManage.aspx" class="btn btn-outline-info">取消</a></td>
        </tr>
    </table>
	</div></div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>
