<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSensitivity.aspx.cs" MasterPageFile="~/Manage/I/Index.master" Inherits="ZoomLaCMS.Manage.Config.AddSensitivity" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加过滤敏感词汇</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/I/Main.aspx","工作台"),
		new Bread("/{manage}/Config/SiteOption.aspx","系统设置"),
        new Bread("SiteInfo.aspx","网站配置"),
        new Bread() {url="", text="敏感词汇",addon="" }}
		)
    %>
    <div id="form1" runat="server">
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice">
        <table cellspacing="1" cellpadding="0" class="table table-striped table-bordered table-hover sys_table">
            <th class="spacingtitle text-center" colspan="2" align="center">
                <asp:Label ID="Label1" runat="server" Text="添加敏感词汇"></asp:Label></th>
            <tr class="tdbg">
                <th class="w12rem_lg">关键字</th>
                <td>
                    <asp:TextBox ID="keyword" runat="server" CssClass=" form-control max20rem"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ErrorMessage="关键字不能为空！" ControlToValidate="keyword"></asp:RequiredFieldValidator></td>
            </tr>
            <tr class="tdbg">
                <th>状态 </th>
                <td>
                    <asp:CheckBox ID="istrue" runat="server" Checked="true" Text="启用" /></td>
            </tr>
            <tr class="tdbg">
                <td class="tdbg" colspan="2" align="center">
                    <asp:Button ID="Button1" runat="server" Text=" 添 加 " CssClass="btn btn-info" OnClick="Button1_Click" />
                    <asp:Button ID="Button2" runat="server" Text=" 返 回 " CssClass="btn btn-outline-info" OnClick="Button2_Click" CausesValidation="false" />
                </td>
            </tr>
        </table>
		</div></div>
    </div>
</asp:Content>