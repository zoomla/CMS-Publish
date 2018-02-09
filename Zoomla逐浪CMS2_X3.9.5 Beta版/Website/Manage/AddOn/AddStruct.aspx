<%@ Page Language="C#"  MasterPageFile="~/Manage/I/Default.master" AutoEventWireup="true" CodeBehind="AddStruct.aspx.cs" Inherits="ZoomLaCMS.Manage.AddOn.AddStruct" %>

<asp:Content ContentPlaceHolderID="head" runat="Server">
<link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
<title>添加项目类型</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
    <table class="table table-striped table-bordered">
        <tr><td class="text-center" colspan="2">组织结构</td></tr>
        <tr>
            <td class="td_m"><strong>父结构：</strong></td>
            <td>
                <asp:Label runat="server" ID="parent_L" />
            </td>
        </tr>
        <tr>
            <td><strong>结构名：</strong></td>
            <td>
                <ZL:TextBox ID="TxtStructName" class="form-control m715-50" runat="server" AllowEmpty="false" />
                <asp:Label ID="LblMessage" runat="server"></asp:Label>
            </td>
        </tr>
        <tr><td><strong>管理人员：</strong></td><td>
            <div>
                <input type="button" class="btn btn-info" value="选择用户" onclick="user.sel();"/><span class="rd_green">*添加或删除用户,保存后才可生效</span>
                <asp:HiddenField runat="server" ID="ManageIDS_Hid" />
            </div>
            <div class="margin_t5 m715-50" id="user_wrap"></div>
          </td></tr>
         <tr>
            <td><strong>结构描述：</strong></td>
            <td>
                <asp:TextBox runat="server" ID="Remind_T" CssClass="form-control m715-50" TextMode="MultiLine" style="height:150px;"/>
            </td>
        </tr>
         <tr>
            <td><strong>是否启用：</strong></td>
            <td>
                <input type="checkbox" runat="server" id="rd1" class="switchChk" checked="checked"/>
            </td>
        </tr>
        <tr>
            <td><strong>操作：</strong></td>
            <td>
                <asp:Button ID="BtnCommit" runat="server" Text="保存信息" class="btn btn-primary" OnClick="Button1_Click" />
                <a href="StructList.aspx?type=0" class="btn btn-primary">返回列表</a>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Controls/ZL_Array.js"></script>
<script src="/dist/js/bootstrap-switch.js"></script>
<script>
$(function () {
    loadUser();
})
function delUser(uid) {
    var $hid = $("#ManageIDS_Hid");
    $("#ulist_" + uid).remove();
    $hid.val(idshelp.del($hid.val(), uid));
}
function loadUser() {
    var $hid = $("#ManageIDS_Hid");
    $("#user_wrap").html("");
    $("#user_wrap").load("/common/Comp/UserList.aspx", { ids: $hid.val() });
    CloseComDiag();
}
user.hook["user"] = function (list, select) {
    var $hid = $("#ManageIDS_Hid");
    var ids = list.GetIDS("UserID");
    $hid.val($hid.val() + "," + ids);
    loadUser();
}
</script>
</asp:Content>

