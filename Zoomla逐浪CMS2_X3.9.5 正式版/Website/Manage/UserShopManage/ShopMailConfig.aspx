<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShopMailConfig.aspx.cs" Inherits="ZoomLaCMS.Manage.UserShopMannger.ShopMailConfig" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>送货方式设置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread( new Bread[] {
new Bread("/{manage}/I/Main.aspx","工作台"),
new Bread("StoreManage.aspx","店铺管理"),
new Bread(){url="", text="店铺邮件设置"}
}) %>

<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
    <table class="table table-striped table-bordered table-hover sys_table">
        <tr>
            <td colspan="3" class="text-center">店铺邮件设置</td>
        </tr>
        <tr>
            <th class="text-right w12rem_lg"><strong>邮件类型</strong></th>
            <td colspan="2">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server"  RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                    <asp:ListItem Value="1" Selected="True">团购成功邮件</asp:ListItem>
                    <asp:ListItem Value="2">团购失败邮件</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <th class="text-right"><strong>邮件标题</strong></th>
            <td class="max20rem" valign="top">
                <asp:TextBox ID="txtTitle" class="form-control max20rem" runat="server" ></asp:TextBox>
            </td>
            <td valign="top">请在标题中使用关键字{ProName}</td>
        </tr>
        <tr>
            <th class="text-right" valign="top"><strong>邮件内容</strong></th>
            <td class="max20rem" valign="top">
                <asp:TextBox ID="txtContext" class="form-control max20rem" runat="server"  TextMode="MultiLine" Rows="10" Height="70px"></asp:TextBox>
            </td>
            <td valign="top">请在内容中使用{UserName}</td>
        </tr>
        <tr>
            <td class="text-right" valign="top"></td>
            <td valign="top" colspan="2">
			<small class="text-muted"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle" ErrorMessage="请输入邮件标题"></asp:RequiredFieldValidator></small>
			<small class="text-muted"><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtContext" ErrorMessage="请输入邮件内容"></asp:RequiredFieldValidator></small>
            </td>
        </tr>
        <tr>
            <td colspan="3" class="text-center">
                <asp:Button ID="Button1" class="btn btn-outline-info" runat="server" Text="提交" OnClick="Button1_Click" />
            </td>
        </tr>
    </table>
</div>
</div>
</asp:Content>
