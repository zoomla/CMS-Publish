<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditDataList.aspx.cs" MasterPageFile="~/Manage/I/Default.master" Inherits="ZoomLaCMS.Manage.Config.EditDataList" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>修改表说明</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-striped table-bordered">
    <tr>
        <td>数据表名：</td>
        <td>
            <asp:Label ID="TxtTableName" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td><strong>类型：</strong></td>
        <td>
            <asp:Label ID="TxtType" runat="server"></asp:Label><asp:HiddenField ID="TxtTypeID" runat="server" />
        </td>
    </tr>

    <tr>
        <td><strong>说明：</strong></td>
        <td>
            <asp:TextBox ID="TxtExplain" runat="server" class="form-control text_300"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td></td>
        <td>
            <asp:Button ID="EBtnTable" runat="server" OnClick="EBtnTable_Click" Text="保存信息" class="btn btn-primary" />
            <a href="DataListProfile.aspx" class="btn btn-default">返回列表</a>
        </td>
    </tr>
</table>
</asp:Content>
