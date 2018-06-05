<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompetenceAdd.aspx.cs" Inherits="ZoomLaCMS.Manage.User.CompetenceAdd" MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>角色权限</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered">
        <tr>
            <td colspan="2" class="text-center text_150">角色权限设置</td>
        </tr>
        <tr>
            <td class="text-right">部门名：</td>
            <td><asp:Label ID="RoleName" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="text-right">部门描述：</td>
            <td><asp:Label ID="RoleInfo" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td class="text-right td_m">OA流程权限</td>
            <td>
                 <label><input type="checkbox" name="auth_oa_chk" value="oa_doc_edit" />修订</label>
                 <label><input type="checkbox" name="auth_oa_chk" value="oa_doc_sign" />签章</label>
                 <label><input type="checkbox" name="auth_oa_chk" value="oa_doc_head" />套红</label>
                 <label><input type="checkbox" name="auth_oa_chk" value="oa_doc_traceless" />无痕修订</label>
                 <label><input type="checkbox" name="auth_oa_chk" value="oa_doc_hastrace" />有痕修订</label>
            </td>
        </tr>
        <tr><td class="text-right">OA权限</td><td>
            <label><input type="checkbox" name="auth_oa_chk" value="oa_pro_no"/>编号</label>
            <label><input type="checkbox" name="auth_oa_chk" value="oa_pro_file" />档案管理</label>
            <label><input type="checkbox" name="auth_oa_chk" value="oa_pro_visor" />督办</label></td></tr>
        <tr>
            <td class="text-right">模块权限</td>
            <td>
                <label><input type="checkbox" name="auth_user_chk" value="user_content"/>内容管理</label>
                <label><input type="checkbox" name="auth_user_chk" value="user_shop"/>商城管理</label>
                <label><input type="checkbox" name="auth_user_chk" value="user_page" />黄页管理</label>
                <label><input type="checkbox" name="auth_user_chk" value="user_store"/>店铺管理</label>
            </td>
        </tr>
        <tr><td class="text-right">其它权限</td><td><label><input type="checkbox" value="design" name="other_chk" />网页设计</label></td></tr>  
        <tr>
            <td></td>
            <td>
                <asp:Button runat="server" ID="Save_Btn" Text="保存信息" OnClick="Save_Btn_Click" CssClass="btn btn-primary" />
                <a href="PermissionInfo.aspx" class="btn btn-primary">返回列表</a>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/SelectCheckBox.js"></script>
<style type="text/css">
label{min-width:75px;}
label input[type=checkbox]{position:relative;top:-2px;}
</style>
</asp:Content>