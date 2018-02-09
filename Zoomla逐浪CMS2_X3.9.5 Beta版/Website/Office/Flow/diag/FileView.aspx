<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileView.aspx.cs" Inherits="ZoomLaCMS.Office.Flow.diag.FileView" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>文件传阅</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div style="min-height:500px;">
<table class="table table-bordered table-striped">
    <tr><td class="td_m">公文标题</td><td><asp:Label runat="server" ID="Title_L" /></td></tr>
    <tr><td>流程名称</td><td><asp:Label runat="server" ID="ProceName_L" /></td></tr>
    <tr><td>传阅人</td><td>
        <div style="max-height:220px;overflow-y:auto;width:600px;" id="userlist_wrap">正在加载中...</div>
        <asp:HiddenField runat="server" ID="User_Hid" />
        <div class="r_red">默认会加载所有办理过该公文的用户</div>
    </td></tr>
    <tr><td></td><td><asp:Button runat="server" ID="Save_Btn" Text="保存信息" OnClick="Save_Btn_Click" class="btn btn-info" OnClientClick="return confirm('确定要传阅给选定用户吗');" /></td></tr>
</table>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script src="/JS/Controls/ZL_Array.js"></script>
<script>
$(function () {
    $("#userlist_wrap").load("/office/comp/UserByList.aspx", { "ids": $("#User_Hid").val() });
})
function delUser(td, uid) {
    $(td).closest("tr").remove();
    var ids = idshelp.del($("#User_Hid").val(), uid);
    $("#User_Hid").val(ids);
}
function ParentUrl(url) {
    if (parent) { parent.location = url; }
}
</script>
</asp:Content>