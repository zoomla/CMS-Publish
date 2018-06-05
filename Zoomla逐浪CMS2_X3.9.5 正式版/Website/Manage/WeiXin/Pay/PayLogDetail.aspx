<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayLogDetail.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.Pay.PayLogDetail" MasterPageFile="~/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>支付详情</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-bordered table-striped">
        <tr>
            <td class="td_m">收款人：</td>
            <td><asp:Label ID="TrueName_L" runat="server" /></td>
        </tr>
        <tr>
            <td>公众号：</td>
            <td><asp:Label ID="APP_L" runat="server" /></td>
        </tr>
        <tr>
            <td>金额：</td>
            <td><asp:Label ID="AMount_L" runat="server" /></td>
        </tr>
        <tr>
            <td>付款方式：</td>
            <td><asp:Label ID="PayType_L" runat="server" /></td>
        </tr>
        <tr>
            <td>操作人：</td>
            <td><asp:Label ID="Admin_L" runat="server" /></td>
        </tr>
        <tr>
            <td>状态：</td>
            <td><asp:Label ID="Status_L" runat="server" /></td>
        </tr>
        <tr>
            <td>时间：</td>
            <td><asp:Label ID="CDate_L" runat="server" /></td>
        </tr>
        <tr>
            <td>表单XML：</td>
            <td><asp:Label ID="FormXML_L" runat="server" /></td>
        </tr>
        <tr>
            <td>结果字符串：</td>
            <td><asp:Label ID="WXResult_L" runat="server" /></td>
        </tr>
        <tr>
            <td>付款备注：</td>
            <td><asp:Label ID="Remind_L" runat="server" /></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <a href="PayLog.aspx" class="btn btn-info">返回列表</a>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>