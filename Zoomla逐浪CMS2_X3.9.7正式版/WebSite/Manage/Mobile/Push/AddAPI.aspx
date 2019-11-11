<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddAPI.aspx.cs" Inherits="ZoomLaCMS.Manage.Mobile.Push.AddAPI"MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>API设置</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("Default.aspx","消息推送"),
        new Bread() {url="/{manage}/Mobile/Push/APIList.aspx", text="API列表<a href='AddAPI.aspx'>[添加API]</a>",addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
<table class="table table-bordered table-striped sys_table">
<tr><th class="w12rem_lg">APP名称</th><td>
    <asp:TextBox runat="server" ID="Alias_T" CssClass="form-control max20rem" MaxLength="50"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" ID="R1" ControlToValidate="Alias_T" ForeColor="Red" ErrorMessage="名称不能为空" />
</td></tr>
<tr><th>Key</th><td><asp:TextBox runat="server" ID="APPKey_T" CssClass="form-control m50rem_50"/>
    <asp:RequiredFieldValidator runat="server" ID="R2" ControlToValidate="APPKey_T" ForeColor="Red" ErrorMessage="Key不能为空" />
</td></tr>
<tr><th>Secret</th><td><asp:TextBox runat="server" ID="APPSecret_T" CssClass="form-control m50rem_50"/>
        <asp:RequiredFieldValidator runat="server" ID="R3" ControlToValidate="APPSecret_T" ForeColor="Red" ErrorMessage="Secret不能为空" />
</td></tr>
<tr><td></td><td><asp:Button runat="server" ID="Save_Btn" Text="保存" OnClick="Save_Btn_Click" CssClass="btn btn-outline-info"></asp:Button></td></tr>
</table>
</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>