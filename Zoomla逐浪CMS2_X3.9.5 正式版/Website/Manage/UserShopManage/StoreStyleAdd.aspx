<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StoreStyleAdd.aspx.cs" Inherits="ZoomLaCMS.Manage.UserShopManage.StoreStyleAdd" MasterPageFile="~/Manage/I/Index.Master" %>

<%@ Register Src="~/Manage/I/ASCX/TlpDP.ascx" TagPrefix="ZL" TagName="TlpDP" %>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>样式管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread( new Bread[] {
new Bread("/{manage}/I/Main.aspx","工作台"),
new Bread("../Shop/ProductManage.aspx","商城管理"),
new Bread("StoreManage.aspx","店铺管理"),
new Bread("StoreStyle.aspx","店铺样式"),
new Bread(){url="", text="样式管理"}
}) %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
    <table class="table table-bordered table-striped sys_table">
        <tr>
            <th class="w12rem_lg">样式名称</th>
            <td>
                <ZL:TextBox ID="StyleName_T" runat="server" CssClass="form-control max20rem" AllowEmpty="false" />
            </td>
        </tr>
        <tr>
            <th>预览图片</th>
            <td>
                <ZL:SFileUp runat="server" ID="Thumbnail_Img" FType="Img" />
            </td>
        </tr>
        <tr>
            <th>首页模板</th>
            <td>
                <%=PageCommon.GetTlpDP("Template_Index") %>
                <asp:HiddenField ID="Template_Index_hid" runat="server" />
            </td>
        </tr>
        <tr>
            <th>内容模板</th>
            <td>
                <%=PageCommon.GetTlpDP("Template_Content") %>
                <asp:HiddenField ID="Template_Content_hid" runat="server" />
            </td>
        </tr>
        <tr>
            <th>列表模板</th>
            <td>
                <%=PageCommon.GetTlpDP("Template_List") %>
                <asp:HiddenField ID="Template_List_hid" runat="server" />
            </td>
        </tr>
        <tr>
            <th>备注信息</th>
            <td>
                <asp:TextBox ID="Remind_T" runat="server" CssClass="form-control" Height="120" TextMode="MultiLine" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="Save_B" runat="server" CssClass="btn btn-info" OnClick="Save_B_Click" Text="保存" />
                <a href="StoreStyle.aspx" class="btn btn-outline-info">返回</a>
            </td>
        </tr>
    </table>
</div>
</div>
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
