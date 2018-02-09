<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MessageSend.aspx.cs" Inherits="ZoomLaCMS.Manage.User.MessageSend" ValidateRequest="false" MasterPageFile="~/Manage/I/Default.master"  %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>发送信息</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td class="tdleft td_l"><strong>收件人：</strong></td>
            <td>
                <div class="input-group">
                    <span class="input-group-addon"><input type="radio" name="sendmode_rad" value="all" checked="checked"/></span>
                    <input type="text" class="form-control text_300" value="全部用户" disabled="disabled" />
                </div>
                <div class="input-group margin_t5" style="width: 420px;">
                    <span class="input-group-addon"><input type="radio" name="sendmode_rad" value="custom" /></span>
                    <asp:TextBox CssClass="form-control text_300" ID="InceptUser_T" runat="server" />
                    <span class="input-group-btn">
                        <button type="button" onclick="user.sel('InceptUser', 'user', '')" class="btn btn-primary">选择用户</button>
                    </span>
                </div>
                <asp:HiddenField ID="InceptUser_Hid" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="tdleft"><strong>标题：</strong></td>
            <td>
                <asp:TextBox class="form-control text_405" ID="TxtTitle" runat="server"> </asp:TextBox>
                <span style="color:red;">*</span></td>
        </tr>
        <tr>
            <td class="tdleft"><strong>内容：</strong></td>
            <td>
                <asp:TextBox ID="EditorContent" runat="server" TextMode="MultiLine" Width="700px"  Height="300px" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="tdleft"><strong>已上传文件：</strong><asp:HiddenField runat="server" ID="hasFileData" />
            </td>
            <td id="hasFileTD" runat="server"></td>
        </tr>
        <tr>
            <td class="tdleft"><strong>附件：</strong></td>
            <td>
                <input type="button" id="upfile_btn" class="btn btn-primary" value="选择文件" />
                <div style="margin-top: 10px;" id="uploader" class="uploader">
                    <ul class="filelist"></ul>
                </div>
                <asp:HiddenField runat="server" ID="Attach_Hid" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="Send_Btn" runat="server" Text="发送信息" OnClick="Send_Btn_Click" OnClientClick="return SendConfirm();" class="btn btn-primary" />
                <asp:Button ID="Draft_Btn" runat="server" Text="存草稿" OnClick="Draft_Btn_Click" class="btn btn-primary" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
            </td>
        </tr>
    </table>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<link href="/JS/Controls/ZL_Webup.css" rel="stylesheet" />
<script src="/Plugins/Ueditor/ueditor.config.js"  charset="utf-8"></script>
<script src="/Plugins/Ueditor/ueditor.all.js" charset="utf-8"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Controls/ZL_Webup.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script src="/JS/SelectCheckBox.js"></script>
<%=Call.GetUEditor("EditorContent",2) %>
<script>
$(function () {
    $("#upfile_btn").click(ZL_Webup.ShowFileUP);
})
function AddAttach(file, ret, pval) { return ZL_Webup.AddAttach(file, ret, pval); }
user.hook["InceptUser"] = userdeal;
user.hook["CCUser"] = userdeal;
function userdeal(list, select) {
    var names = "", ids = "";
    for (var i = 0; i < list.length; i++) {
        names += list[i].UserName + ",";
        ids += list[i].UserID + ",";
    }
    $("#" + select + "_T").val(names);
    $("#" + select + "_Hid").val(ids);
    if (comdiag != null) { CloseComDiag(); }
}
function SendConfirm() {
    var chk = $("input[name='sendmode_rad']:checked")[0];
    if (chk.value == "custom") {
        if (ZL_Regex.isEmpty($("#InceptUser_T").val())) {
            alert('未选定收件人!'); return false;
        }
    }
    if (ZL_Regex.isEmpty($("#TxtTitle").val())) { alert('邮件标题不能为空!'); return false; }
    if (confirm('确定要发送该邮件吗')) {
        disBtn(this, 3000); return true;
    } else {
        return false;
    }
}
</script>
</asp:Content>
