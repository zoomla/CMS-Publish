<%@ Page Language="C#"  MasterPageFile="~/Manage/I/Index.master" AutoEventWireup="true" CodeBehind="AddStruct.aspx.cs" Inherits="ZoomLaCMS.Manage.AddOn.AddStruct" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
<title>添加项目类型</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
<%--	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("StructList.aspx","组织结构"),
        new Bread() {url="", text="组织管理",addon="" }}
		)
    %>--%>
    <table class="table table-striped table-bordered sys_table sys_table">
        <tr><th class="text-center" colspan="2">组织结构</th></tr>
        <tr>
            <th class="w12rem_lg">父结构</th>
            <td>
                <asp:Label runat="server" ID="parent_L" />
            </td>
        </tr>
        <tr>
            <th><strong>结构名</strong></th>
            <td>
                <ZL:TextBox ID="TxtStructName" class="form-control m50rem_50" runat="server" AllowEmpty="false" />
            </td>
        </tr>
<%--        <tr>
            <th><strong>管理人员 <span class="text-danger">*</span></strong></th>
            <td>
                <div class="mb-2">
                    <input type="button" class="btn btn-outline-info btn-sm" value="选择用户" onclick="user.sel();" />
                    <small class="text-muted">添加或删除用户,保存后才可生效</small>
                    <asp:HiddenField runat="server" ID="ManageIDS_Hid" />
                </div>
                <div class="m50rem_50" id="user_wrap"></div>
            </td>
        </tr>--%>
        <tr>
            <th><strong>结构描述</strong></th>
            <td>
                <asp:TextBox runat="server" ID="Remind_T" CssClass="form-control m50rem_50" TextMode="MultiLine" />
            </td>
        </tr>
        <tr>
            <th><strong>权限</strong></th>
            <td>
                <label><input type="checkbox" name="auth_chk" value="user_manage"/>用户管理</label>
                <label><input type="checkbox" name="auth_chk" value="act_manage"/>内容管理</label>
                <label><input type="checkbox" name="auth_chk" value="arr_manage"/>商品管理</label>
            </td>
        </tr>
        <tr>
            <th><strong>操作</strong></th>
            <td>
                <asp:Button ID="SaveBtn" runat="server" Text="保存信息" class="btn btn-outline-info" OnClick="SaveBtn_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Controls/ZL_Array.js"></script>
<script src="/dist/js/bootstrap-switch.js"></script>
<script src="/JS/SelectCheckBox.js"></script>
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