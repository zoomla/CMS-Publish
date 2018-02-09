<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmptyData.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.EmptyData" MasterPageFile="~/Manage/I/Default.master" %>
<%@ Register Src="~/Manage/I/ASCX/SPwd.ascx" TagPrefix="uc1" TagName="SPwd" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>清空数据</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <uc1:SPwd runat="server" ID="SPwd" Visible="false" />
    <div id="maindiv" runat="server" visible="false">
	<div class="alert alert-danger fade in margin_b2px">
	<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
	<i class="fa fa-exclamation-triangle"></i>本操作将删除系统中的用户自定义表
	</div>
    <table class="table table-striped table-bordered table-hover">
        <tr><th colspan="2">选择要清除测试数据的数据库类别</th></tr>
        <tr>
            <td class="td_m"><label>内容 <input type="checkbox" class="clearchk" checked="checked" /></label></td>
            <td>
                <label><input type="checkbox" name="tbname_chk" checked="checked" value="ZL_Commonmodel"/>ZL_Commonmodel&nbsp;&nbsp;[所有内容主表数据]</label><br />
                <label><input type="checkbox" name="tbname_chk" checked="checked" value="ZL_C"/>ZL_C_&nbsp;&nbsp;[内容副表数据]</label><br />
                <label><input type="checkbox" name="tbname_chk" checked="checked" value="ZL_Node"/>ZL_Node&nbsp;&nbsp;[节点表]</label>
            </td>
        </tr>
        <tr>
            <td><label>商城 <input type="checkbox" class="clearchk" checked="checked" /></label></td>
            <td>
                <label><input type="checkbox" name="tbname_chk" checked="checked" value="ZL_commodities"/>ZL_Commodities&nbsp;&nbsp;[商城主表数据]</label><br />
                <label><input type="checkbox" name="tbname_chk" checked="checked" value="ZL_Store"/>ZL_Store_&nbsp;&nbsp;[自定义商城表]</label>
            </td>
        </tr>
        <tr>
            <td><label>社区 <input type="checkbox" class="clearchk"/></label></td>
            <td>
                <label><input type="checkbox" name="tbname_chk" value="ZL_Guestcate"/>ZL_Guestcate&nbsp;&nbsp;[论坛、留言栏目信息]</label><br />
                <label><input type="checkbox" name="tbname_chk" value="ZL_Guest_Bar"/>ZL_Guest_Bar&nbsp;&nbsp;[论坛数据]</label><br />
                <label><input type="checkbox" name="tbname_chk" value="ZL_Guestbook"/>ZL_Guestbook&nbsp;&nbsp;[留言数据]</label><br />
                <label><input type="checkbox" name="tbname_chk" value="ZL_Baike"/>ZL_Baike&nbsp;&nbsp;[百科数据]</label><br />
                <label><input type="checkbox" name="tbname_chk" value="ZL_Ask"/>ZL_Ask&nbsp;&nbsp;[问答数据]</label>
            </td>
        </tr>
        <tr>
            <td><label>能力 <input type="checkbox" class="clearchk"/></label></td>
            <td>
                <label><input type="checkbox" name="tbname_chk" value="ZL_Plat_Blog"/>ZL_Plat_Blog&nbsp;&nbsp;[能力中心发言数据]</label><br />
                <label><input type="checkbox" name="tbname_chk" value="ZL_Plat_Topic"/>ZL_Plat_Topic&nbsp;&nbsp;[能力中心话题数据]</label>
            </td>
        </tr>
        <tr>
            <td><label>用户 <input type="checkbox" class="clearchk"/></label></td>
            <td>
                <label><input type="checkbox" name="tbname_chk"  value="ZL_User"/>ZL_User&nbsp;&nbsp;[所有用户数据(不涉及管理员信息)]</label><br />
            </td>
        </tr>
        <tr><td></td><td>
            <input type="button" id="EmptyData" value="一键清空测试数据" class="btn btn-primary" onclick="$('#confirm').show();"/></td>
        </tr>
    </table>
       
    <div id="confirm" hidden class="alert alert-danger">
        <span>本操作不可逆，如果您需要重置系统，则可以使用此功能还原为默认初始状态。</span>
        <asp:Button ID="ConfirmClr" runat="server" Text="确认操作" CssClass="btn btn-warning" OnClick="ConfirmClr_Click" OnClientClick="return suredel(this);" />
    </div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
input[type=checkbox]{position:relative;top:-3px;}
</style>
<script>
$(function () {
    $(".clearchk").click(function () {
        var $this = $(this);
        var $tr = $this.closest("tr");
        $tr.find("input[name=tbname_chk]").each(function () { this.checked = $this[0].checked; });
    });
})
function suredel(btn) {
    if (!confirm('不可恢复性清除数据,确认操作？')) { return false; }
    disBtn(btn);
    return true;
}
</script>
</asp:Content>
