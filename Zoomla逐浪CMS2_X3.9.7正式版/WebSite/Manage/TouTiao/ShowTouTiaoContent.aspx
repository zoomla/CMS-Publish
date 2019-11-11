<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowTouTiaoContent.aspx.cs" Inherits="ZoomLaCMS.Manage.TouTiao.ShowTouTiaoContent" MasterPageFile="~/Manage/I/Default.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>发文详情</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-bordered table-striped">
        <tr>
            <td class="td_m">标题：</td>
            <td><asp:Label ID="Title_L" runat="server" /></td>
        </tr>
        <tr>
            <td>作者：</td>
            <td><asp:Label ID="UserName_L" runat="server" /></td>
        </tr>
        <tr>
            <td>状态：</td>
            <td><asp:Label ID="Status_L" runat="server" /></td>
        </tr>
        <tr>
            <td>发文类型：</td>
            <td><asp:Label ID="IsSave_L" runat="server" /></td>
        </tr>
        <tr>
            <td>文章类型：</td>
            <td><asp:Label ID="NewsType_L" runat="server" /></td>
        </tr>
        <tr>
            <td>文章分类：</td>
            <td><asp:Label ID="Type_L" runat="server" /></td>
        </tr>
        <tr>
            <td>发布时间：</td>
            <td><asp:Label ID="CDate_L" runat="server" /></td>
        </tr>
        <tr>
            <td>备注信息：</td>
            <td><asp:Label ID="ErrMsg_L" runat="server" /></td>
        </tr>
        <tr>
            <td>文章摘要：</td>
            <td><asp:Label ID="Abstract_L" runat="server" /></td>
        </tr>
        <tr>
            <td>发文内容：</td>
            <td><asp:Label ID="Content_L" runat="server" /></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <a href="TouTiaoContent.aspx" class="btn btn-info">返回</a>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
