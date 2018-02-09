<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMailTemp.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Mail.AddMailTemp" ValidateRequest="false" MasterPageFile="~/Manage/I/Default.master"  %>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
<title>创建邮件模板</title>
<script src="/Plugins/Ueditor/ueditor.config.js"></script>
<script src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered">
           <tr>
            <td class="tdleft"><strong>选择类型：</strong></td>
            <td>
                <asp:DropDownList ID="drType" class="form-control m715-50" runat="server">
                    <asp:ListItem Value="1" Selected="True">系统通知</asp:ListItem>
                    <asp:ListItem Value="2">用户订阅</asp:ListItem>
                    <asp:ListItem Value="3">贺卡消息</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="tdleft td_l"><strong>模板名称：</strong></td>
            <td>
                <ZL:TextBox ID="TxtTempName" class="form-control m715-50" runat="server" AllowEmpty="false" ValidType="String"></ZL:TextBox></td>
        </tr>
        <tr><td class="tdleft"><strong>预览图片：</strong></td>
            <td><ZL:SFileUp runat="server" ID="SFileUp" FType="Img"/></td>
        </tr>
        <tr>
            <td colspan="2">
                <textarea id="TxtContent" style="height:350px;width:960px;margin:0 auto;" runat="server"></textarea>
            </td>
        </tr>
        <tr><td></td>
            <td>
                <asp:Button ID="EBtnSubmit" class="btn btn-primary" Text="保存" runat="server" OnClick="EBtnSubmit_Click" />
                <a href="MailTemplist.aspx" class="btn btn-primary">返回</a>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        $(function () {
            UE.getEditor("TxtContent");
        })
    </script>
</asp:Content>



