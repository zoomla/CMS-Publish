<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChangeUser.aspx.cs" Inherits="ZoomLaCMS.Office.Flow.diag.ChangeUser" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>修改用户</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div style="min-height:500px;">
<table class="table table-bordered table-striped">
    <tr><td><input runat="server" type="button" ID="CCUser_Alias"  value="协办人" class="btn btn-info" onclick="ShowSelUser('ccuser');"/></td><td>
        <div id="ccuser_wrap" class="userwrap"></div>
        <asp:HiddenField runat="server" ID="ccuser_hid" /></td></tr>
    <tr><td><input runat="server" type="button" ID="HelpUser_Alias" value="辅办人" class="btn btn-info" onclick="ShowSelUser('helpuser');"/></td><td>
          <div id="helpuser_wrap" class="userwrap"></div>
          <asp:HiddenField runat="server" ID="helpuser_hid" /></td></tr>
    <tr><td></td><td>
        <asp:Button runat="server" ID="Save_Btn" Text="保存修改" OnClick="Save_Btn_Click" class="btn btn-info" />
    </td></tr>
</table>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<style type="text/css">
.userwrap{width:500px;max-height:300px;overflow-y:auto;}
</style>
<script src="/JS/ZL_Regex.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Controls/ZL_Array.js"></script>
<script>
$(function () {
    $("#ccuser_wrap").load("/office/comp/UserByList.aspx", { ids: $("#ccuser_hid").val(), "del": "delCCUser" });
    $("#helpuser_wrap").load("/office/comp/UserByList.aspx", { ids: $("#helpuser_hid").val(), "del": "delHelpUser" });
})
function delCCUser(td, uid) {
    $(td).closest("tr").remove();
    var ids = idshelp.del($("#ccuser_hid").val(), uid);
    $("#ccuser_hid").val(ids);
}
function delHelpUser(td, uid) {
    $(td).closest("tr").remove();
    var ids = idshelp.del($("#helpuser_hid").val(), uid);
    $("#helpuser_hid").val(ids);
}
function UserFunc(json, select) {
    json = JSON.parse(JSON.stringify(json));
    switch (select) {
        case "ccuser":
            var ids = json.GetIDS("UserID");
            $("#ccuser_hid").val(idshelp.merge($("#ccuser_hid").val(), ids));
            $("#ccuser_wrap").load("/office/comp/UserByList.aspx", { ids: $("#ccuser_hid").val(), "del": "delCCUser" });
            break;
        case "helpuser":
            var ids = json.GetIDS("UserID");
            $("#helpuser_hid").val(idshelp.merge($("#helpuser_hid").val(), ids));
            $("#helpuser_wrap").load("/office/comp/UserByList.aspx", { ids: $("#helpuser_hid").val(), "del": "delHelpUser" });
            break;
    }
    CloseComDiag();
}
function ShowSelUser(select) {
    //$("#User_IFrame").attr("src", "/Common/Dialog/SelStructure.aspx?Type=AllInfo#" + select);
    //$("#User_IFrame")[0].contentWindow.ClearChk();
    //$("#select").show();
    ShowComDiag("/Common/Dialog/SelStructure.aspx?Type=AllInfo#" + select,"");
}
function RefreshParent() { if (parent) { parent.location = parent.location; } }
</script>
</asp:Content>