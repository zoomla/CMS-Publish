<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaterialAdd.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Addon.Material.MaterialAdd" MasterPageFile="~/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>原料管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-bordered table-striped">
    <tr><td class="td_m">原料名称</td><td><ZL:TextBox runat="server" ID="Name_T" class="form-control text_300" AllowEmpty="false"/></td></tr>
    <tr><td>单位</td><td><asp:TextBox runat="server" ID="Unit_T" class="form-control text_300" Text="件" />
        <div id="Unitd" class="btn btn-group">
            <button type="button" class="btn btn-default">件</button>
            <button type="button" class="btn btn-default">KG</button>
            <button type="button" class="btn btn-default">包</button>
            <button type="button" class="btn btn-default">箱</button>
            <button type="button" class="btn btn-default">罐</button>
            <button type="button" class="btn btn-default">只</button>
        </div>
     </td></tr>
    <tr><td>备注</td><td>
        <asp:TextBox runat="server" ID="Remind_T" TextMode="MultiLine" class="m715-50" style="height:100px;" />
                   </td></tr>
    <tr><td></td><td>
        <asp:Button runat="server" ID="Save_Btn" Text="保存信息" class="btn btn-info" OnClick="Save_Btn_Click" />
        <a href="Default.aspx" class="btn btn-default">返回列表</a>
                 </td></tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
    $(function () {
        $("#Unitd .btn").click(function () { $("#Unit_T").val($(this).text()); });
    })
</script>
</asp:Content>