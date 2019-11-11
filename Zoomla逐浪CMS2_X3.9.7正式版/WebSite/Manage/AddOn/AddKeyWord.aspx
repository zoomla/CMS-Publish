<%@ Page Language="C#" MasterPageFile="~/Manage/I/Index.master" AutoEventWireup="true" CodeBehind="AddKeyWord.aspx.cs" Inherits="ZoomLaCMS.Manage.AddOn.AddKeyWord" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server"><title>添加关键字</title></asp:Content>
<asp:Content ContentPlaceHolderID="Content" Runat="Server">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("","内容管理"),	
        new Bread("KeyWordManage.aspx","关键字集"),	
        new Bread() {url="", text="关键字",addon="" }}
		)
    %>
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice">
    <table class="table table-striped table-bordered sys_table table-responsive-md">
    <tr>
        <th scope="col" class="w12rem_lg">关键字名称</th><td>
            <ZL:TextBox ID="KeyWord_T" runat="server" class=" form-control max20rem" AllowEmpty="false" />
        </td>
    </tr>
    <tr>
        <th scope="col">关键字类别</th>
        <td scope="col">
            <label><input type="radio" name="keyttype_rad" value="1" checked="checked" />搜索关键字</label>
        </td>
    </tr>
    <tr>
        <th scope="col">关键字权重</th>
        <td scope="col">
            <ZL:TextBox ID="TxtPriority" runat="server" class=" form-control max20rem" AllowEmpty="false" ValidType="IntZeroPostive" Text="3" />
			<small class="text-muted">数字越大权重越高越被优先</small>
        </td>
    </tr>
    <tr>
        <td scope="col"></td>
        <td scope="col">
            <asp:Button ID="EBtnSubmit" class="btn btn-info" Text="保存信息" OnClick="EBtnSubmit_Click" runat="server" />
            <a href="KeyWordManage.aspx" class="btn btn-outline-info">返回列表</a>
        </td>
    </tr>
</table>
</div></div>
</asp:Content>