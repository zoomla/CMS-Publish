<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPlatInfo.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.AddPlatInfo" MasterPageFile="~/Manage/I/Index.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head"><title>信息管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
        new Bread("","扩展功能"),
		new Bread("/{manage}/Config/DBTools/RunSql.aspx","开发中心"),
		new Bread("PlatInfoList.aspx","平台信息"),
        new Bread() {url="", text="信息管理",addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
    <table class="table table-bordered table-striped sys_table">
        <tr>
            <th scope="col" class="w12rem_lg">名称</th>
            <td scope="col">
                <ZL:TextBox runat="server" ID="Name_T" CssClass="form-control max20rem" AllowEmpty="false" /></td>
        </tr>
        <tr>
            <th scope="col">标识</th>
            <td scope="col">
                <asp:TextBox runat="server" CssClass="form-control max20rem" ID="Flag_T"></asp:TextBox>
            </td>
        </tr>
        <tr id="AppID_Tr" runat="server">
            <th scope="col">APPID</th>
            <td scope="col"><ZL:TextBox runat="server" CssClass="form-control max20rem" ID="APPID_T" /></td>
        </tr>
        <tr id="Key_Tr" runat="server">
            <th scope="col">Key(ID)</th>
            <td scope="col">
                <ZL:TextBox runat="server" ID="APPKey_T" CssClass="form-control max20rem" AllowEmpty="false" /></td>
        </tr>
        <tr id="Secret_Tr" runat="server">
            <th scope="col">Secret</th>
            <td scope="col">
                <ZL:TextBox runat="server" ID="APPSecret_T" CssClass="form-control max20rem" AllowEmpty="false" /></td>
        </tr>
        <tr id="Callback_Tr" runat="server">
            <th scope="col">回调页</th>
            <td scope="col">
                <ZL:TextBox runat="server" ID="CallBack_T" CssClass="form-control max20rem" /></td>
        </tr>
        <tbody id="Login_Tbody" runat="server">
            <tr>
                <th scope="col">用户名</th>
                <td scope="col">
                    <asp:TextBox runat="server" ID="UserName_T" CssClass="form-control max20rem" /></td>
            </tr>
            <tr>
                <th scope="col">密码</th>
                <td scope="col">
                    <asp:TextBox runat="server" ID="UserPwd_T" CssClass="form-control max20rem" TextMode="Password" /></td>
            </tr>
        </tbody>
        <tr>
            <th scope="col">备注</th>
            <td scope="col">
                <asp:TextBox runat="server" ID="Remind_T" CssClass="form-control max20rem" /></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button runat="server" ID="Save_Btn" CssClass="btn btn-info" Text="保存信息" OnClick="Save_Btn_Click" />
                <a href="PlatInfoList.aspx" id="Return_B" class="btn btn-outline-info">返回列表</a>
            </td>
        </tr>
    </table>
</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
