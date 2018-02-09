<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IconAdd.aspx.cs" Inherits="ZoomLaCMS.Manage.Plus.Logo.IconAdd" MasterPageFile="~/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>图标管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="BreadDiv" class="container-fluid mysite">
        <div class="row">
            <ol id="BreadNav" class="breadcrumb navbar-fixed-top">
                <li><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
                <li><a href="IconList.aspx">图标列表</a></li>
                <li class="active"><a href='<%=Request.RawUrl %>'>图标管理</a></li>
            </ol>
        </div>
    </div>
    <table class="table table-bordered table-striped">
        <tr><td class="td_m">别名</td><td><asp:TextBox runat="server" ID="Alias_T" class="form-control text_300" /></td></tr>
        <tr><td>类型</td><td><ZL:TextBox runat="server" ID="ZType_T" class="form-control text_300" AllowEmpty="false"/></td></tr>
        <tr><td class="td_m">SVG文件</td><td>
            <input type="button" id="upfile_btn" class="btn btn-info" value="选择需要上传的文件" />
            <div style="margin-top: 10px;" id="uploader" class="uploader">
                <ul class="filelist"></ul>
            </div>
            <input type="hidden" id="Attach_Hid" name="Attach_Hid" />
            <div class="alert alert-info margin_t5">
                你可以选择多个SVG文件批量上传
            </div>
        </td>
        </tr>
        <tr><td></td><td>
            <asp:Button runat="server" ID="Save_Btn" Text="保存信息" OnClick="Save_Btn_Click" class="btn btn-info"/>
                     </td></tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <link href="/JS/Controls/ZL_Webup.css" rel="stylesheet" />
    <script src="/JS/Controls/ZL_Dialog.js"></script>   
    <script src="/JS/Controls/ZL_Webup.js"></script>
    <script>
        $(function () {
            ZL_Webup.config.json.ashx = "action=General";
            $("#upfile_btn").click(ZL_Webup.ShowFileUP);
        })
        function AddAttach(file, ret, pval) { return ZL_Webup.AddAttach(file, ret, pval); }
    </script>
</asp:Content>