<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddRegular.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Addon.AddRegular" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>添加规则</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/WeiXin/Home.aspx","用户管理"),				
        new Bread("RegularList.aspx","充值赠送"),				
        new Bread() {url="", text="赠送管理",addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
<table class="table table-bordered table-striped sys_table">
    <tr>
        <th scope="col" class="w12rem_lg">别名</th>
        <td scope="col"><ZL:TextBox runat="server" ID="Alias_T" class="form-control max20rem" AllowEmpty="false" /></td>
    </tr>
    <tr>
    <th scope="col">充值金额</th>
    <td scope="col">
        <ZL:TextBox runat="server" ID="Min_T" CssClass="form-control max20rem" AllowEmpty="false" ValidType="FloatZeroPostive" />
    </td>
    </tr>
<tr><th>赠送金额</th><td><ZL:TextBox runat="server" ID="Purse_T" CssClass="form-control max20rem" AllowEmpty="false" ValidType="FloatZeroPostive" /></td></tr>
<tr><th>赠送银币</th><td><ZL:TextBox runat="server" ID="SIcon_T" CssClass="form-control max20rem" AllowEmpty="false" ValidType="FloatZeroPostive" /></td></tr>
<tr><th>赠送积分</th><td><ZL:TextBox runat="server" ID="Point_T" CssClass="form-control max20rem" AllowEmpty="false" ValidType="FloatZeroPostive" /></td></tr>
<tr><th>备注</th><td><asp:TextBox runat="server" ID="UserRemind_T" CssClass="form-control m50rem_50" MaxLength="50" /></td></tr>
<tr><th>备注(管理员)</th><td><asp:TextBox runat="server" ID="AdminRemind_T" CssClass="form-control m50rem_50" MaxLength="50" /></td></tr>
<tr><td></td><td>
    <asp:Button runat="server" ID="Save_Btn" Text="保存信息" OnClick="Save_Btn_Click" CssClass="btn btn-info" />
    <a href="RegularList.aspx" class="btn btn-outline-info">返回列表</a>
</td></tr>
</table>
</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>