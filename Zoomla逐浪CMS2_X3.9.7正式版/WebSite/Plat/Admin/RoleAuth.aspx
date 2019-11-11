<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoleAuth.aspx.cs" Inherits="ZoomLaCMS.Plat.Admin.RoleAuth"  MasterPageFile="~/Plat/Main.master"  %>
<asp:Content runat="server" ContentPlaceHolderID="Head">
<title>角色权限</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="table-responsive-md mt-1 pr-1">
  <table class="table table-striped table-bordered sys_table">
    <tr>
      <th class="w12rem_lg">角 色 名</th>
      <td><asp:Label runat="server" ID="RoleName_L" /></td>
    </tr>
    <tr>
      <th>角色描述</th>
      <td><asp:Label runat="server" ID="RoleDesc_L" /></td>
    </tr>
    <tr>
      <th colspan="2" class="text-center">权限配置</th>
    </tr>
    <tr>
      <th>文档管理</th>
      <td><input type="checkbox" name="Article" value="P_Article_Send" />
        发文
        <input type="checkbox" name="Article" value="P_Article_Del" />
        删文
        <input type="checkbox" name="Article" value="P_Article_View" />
        查看 </td>
    </tr>
    <tr>
      <th>OA公文流程</th>
      <td><input type="checkbox" name="Article" value="P_OA_Send" />
        发送公文
        <input type="checkbox" name="Article" value="P_OA_Audit" />
        公文审核
        <input type="checkbox" name="Article" value="P_OA_View" />
        公文浏览 </td>
    </tr>
    <tr>
      <th>操作</th>
      <td><asp:Button runat="server" ID="Save_Btn" Text="保存" CssClass="btn btn-outline-info" OnClick="Save_Btn_Click" /></td>
    </tr>
  </table>
  </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
  <script type="text/javascript">
      $(function () {
          $("#top_nav_ul li[title='管理']").addClass("active");
      })
function InitValue(v) {
	$("input[type='checkbox']").each(function () {
		var cv = $(this).val();
		this.checked = v.indexOf("," + cv + ",") >= 0;
	});
}
</script>
</asp:Content>