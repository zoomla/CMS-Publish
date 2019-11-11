<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddQuickPrint.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Printer.AddQuickPrint"MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>模板管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("ListDevice.aspx","智能硬件"),
        new Bread("QuickPrint.aspx","快速指令"),
        new Bread() {url="", text="模板管理",addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
<table class="table table-bordered table-striped sys_table">
    <tr><th class="w12rem_lg">别名</th><td>
        <asp:TextBox runat="server" ID="Alias_T" CssClass="form-control max20rem" MaxLength="30" />
        <asp:RequiredFieldValidator runat="server" ID="R1" ControlToValidate="Alias_T" ForeColor="Red" ErrorMessage="别名不能为空" />
                                </td></tr>
    <tr><th>内容</th><td>
        <asp:TextBox runat="server" ID="Content_T" TextMode="MultiLine" cssclass="m50rem_50" />
        <asp:RequiredFieldValidator runat="server" ID="R2" ControlToValidate="Content_T" ForeColor="Red" ErrorMessage="内容不能为空" />
                   </td></tr>
    <tr><th>备注</th><td><asp:TextBox runat="server" ID="Remind_T" TextMode="MultiLine" CssClass="m50rem_50"  /></td></tr>
    <tr><td></td><td>
        <asp:Button runat="server" ID="Save_Btn" Text="保存信息" OnClick="Save_Btn_Click" CssClass="btn btn-info" />
        <a href="QuickPrint.aspx" class="btn btn-outline-info">返回列表</a>
                 </td></tr>
</table>
</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>
