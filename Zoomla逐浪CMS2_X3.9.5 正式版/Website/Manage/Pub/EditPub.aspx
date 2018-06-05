<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditPub.aspx.cs" Inherits="ZoomLaCMS.Manage.Pub.EditPub" MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
<script src="/JS/DatePicker/WdatePicker.js"></script>
<script src="/JS/Common.js"></script>
<title>互动信息</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class=" table table-bordered">
        <tr>
            <td class="td_m text-right">标题：</td>
            <td>
                <asp:TextBox ID="TextBox1" class=" form-control text_300" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="text-right">内容：</td>
            <td>
                <asp:TextBox ID="tx_PubContent" class="form-control" runat="server" Height="107px" TextMode="MultiLine" Width="456px"></asp:TextBox>
            </td>
        </tr>
        <asp:Literal ID="ModelHtml" runat="server"></asp:Literal><tr class="tdbgbottom border">
            <td></td>
            <td>
                <asp:Button ID="EBtnSubmit" Text="保存信息" class="btn btn-primary" OnClick="EBtnSubmit_Click" runat="server" />
                <a href="Pubsinfo.aspx?Pubid=<%=PubID %>" class="btn btn-info">返回列表</a>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
