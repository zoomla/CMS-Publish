<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPointGroup.aspx.cs" Inherits="ZoomLaCMS.Manage.User.AddPointGroup"  MasterPageFile="~/Manage/I/Index.master" %>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>积分等级</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/User/AdminManage.aspx","用户管理"),
		new Bread("/{manage}/User/UserManage.aspx","会员管理"),
		new Bread("PointGroup.aspx","积分等级管理"),
        new Bread() {url="", text="积分等级",addon= "" }}
        )
    %>
    <div class="container-fluid pr-0">
<div class="row sysRow list_choice">
<div class="tab-content col-12 table_box table-responsive-md">

<table class="table table-bordered table-striped sys_table">
    <tr>
        <th scope="col" class="w12rem_lg">等级名称</th>
        <td scope="col">
            <ZL:TextBox runat="server" ID="Alias_T" class="form-control text_300" AllowEmpty="false"/>
        </td>
    </tr>
    <tr>
        <th>等级图片</th>
        <td>
            <ZL:SFileUp runat="server" ID="SFileUp" FType="Img" />
        </td>
    </tr>
    <tr>
        <th>备注</th>
        <td>
            <asp:TextBox runat="server" ID="Remark_T" class="form-control text_715" Rows="5" TextMode="MultiLine"/></td>
    </tr>
    <tr>
        <th></th>
        <td>
            <asp:Button runat="server" ID="Save_Btn" Text="保存信息" OnClick="Save_Btn_Click" class="btn btn-info" />
            <a href="PointGroup.aspx" class="btn btn-outline-info">返回列表</a>
        </td>
    </tr>
</table>
</div></div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>