<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FileAttachManage.aspx.cs" Inherits="ZoomLaCMS.Office.Flow.diag.FileAttachManage" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>附件管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div style="min-height:500px;">
    <div id="uploader" class="uploader">
    <ul class="filelist"></ul>
</div>
<asp:HiddenField runat="server" ID="Attach_Hid" />
<div class="margin_t5">
    <input type="button" value="上传附件" class="btn btn-info" id="upfile_btn" />
    <asp:Button runat="server" ID="Save_Btn" class="btn btn-primary" Text="保存修改" OnClientClick="return confirm('确定要保存修改吗?');" OnClick="Save_Btn_Click" />
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<link href="/JS/Controls/ZL_Webup.css" rel="stylesheet" />
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Controls/ZL_Webup.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script>
$(function () {
    ZL_Webup.config.json.ashx = "action=OAattach";
    $("#upfile_btn").click(ZL_Webup.ShowFileUP);
    if (!ZL_Regex.isEmpty($("#Attach_Hid").val())) {
        var files = $("#Attach_Hid").val().split('|');
        $("#Attach_Hid").val("");
        for (var i = 0; i < files.length; i++) {
            console.log(files[i]);
            AddAttach(files[i], { _raw: files[i] }, {});
        }
    }
})
function AddAttach(file, ret, pval) { return ZL_Webup.AddAttach(file, ret, pval); }
function RefreshParent() { if (parent) { parent.location = parent.location; } }
</script>
</asp:Content>