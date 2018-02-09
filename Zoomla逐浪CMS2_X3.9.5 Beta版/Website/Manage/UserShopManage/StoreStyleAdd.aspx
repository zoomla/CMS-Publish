<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StoreStyleAdd.aspx.cs" Inherits="ZoomLaCMS.Manage.UserShopManage.StoreStyleAdd" MasterPageFile="~/Manage/I/Default.Master" %>

<%@ Register Src="~/Manage/I/ASCX/TlpDP.ascx" TagPrefix="ZL" TagName="TlpDP" %>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>样式管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-bordered table-striped">
        <tr>
            <td class="td_m">样式名称：</td>
            <td>
                <ZL:TextBox ID="StyleName_T" runat="server" CssClass="form-control text_300" AllowEmpty="false" />
            </td>
        </tr>
        <tr>
            <td>预览图片：</td>
            <td>
                <ZL:SFileUp runat="server" ID="Thumbnail_Img" FType="Img" />
            </td>
        </tr>
        <tr>
            <td>首页模板：</td>
            <td>
                <%=PageCommon.GetTlpDP("Template_Index") %>
                <asp:HiddenField ID="Template_Index_hid" runat="server" />
            </td>
        </tr>
        <tr>
            <td>内容模板：</td>
            <td>
                <%=PageCommon.GetTlpDP("Template_Content") %>
                <asp:HiddenField ID="Template_Content_hid" runat="server" />
            </td>
        </tr>
        <tr>
            <td>列表模板：</td>
            <td>
                <%=PageCommon.GetTlpDP("Template_List") %>
                <asp:HiddenField ID="Template_List_hid" runat="server" />
            </td>
        </tr>
        <tr>
            <td>备注信息：</td>
            <td>
                <asp:TextBox ID="Remind_T" runat="server" CssClass="form-control" Width="475" Height="120" TextMode="MultiLine" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="Save_B" runat="server" CssClass="btn btn-info" OnClick="Save_B_Click" Text="保存" />
                <a href="StoreStyle.aspx" class="btn btn-info">返回</a>
            </td>
        </tr>
    </table>
    <ZL:TlpDP runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/chinese.js"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/Controls/ZL_Array.js"></script>
    <script src="/JS/ZL_Regex.js"></script>
    <script>
        $(function () {
            Tlp_initTemp();
        })
    </script>
</asp:Content>
