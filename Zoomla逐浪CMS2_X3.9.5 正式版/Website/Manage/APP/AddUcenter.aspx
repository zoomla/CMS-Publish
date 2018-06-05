<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUcenter.aspx.cs" Inherits="ZoomLaCMS.Manage.APP.AddUcenter" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <link type="text/css" href="/dist/css/bootstrap-switch.min.css"  rel="stylesheet"/>
    <script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
    <title>添加授权</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/I/Main.aspx","工作台"),
		new Bread("/{manage}/user/UserManage.aspx","用户管理"),
        new Bread("WsApi.aspx","跨站接入"),
        new Bread() {url="", text="添加授权网站",addon="" }}
		)
    %>
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice">
     <table class="table table-striped table-bordered table-hover sys_table">
      <tr class="spacingtitle">
        <th align="center" class="text-center" colspan="2" ><asp:Label ID="lblText" runat="server">添加授权网站</asp:Label></th>
      </tr>
         <tr><th scope="col" class="w12rem_lg"><strong>授权名称</strong></th><td scope="col"><asp:TextBox runat="server" ID="Alias_T" CssClass="form-control max20rem required" /></td></tr>
      <tr>
        <th><strong>网站域名</strong></th>
        <td><asp:TextBox ID="TxtWebSite" class="form-control max20rem isurl" runat="server" placeholder="www.z01.com" />
            <asp:RequiredFieldValidator runat="server" ID="R1" ControlToValidate="TxtWebSite" Display="Dynamic" ErrorMessage="网址不能为空" ForeColor="Red" />
        </td>
      </tr>
         <tr><th><strong>App Key</strong></th><td><asp:Label runat="server" ID="Key_L" /></td></tr>
         <tr><th><strong>用户管理</strong></th>
             <td>
                 <label><input type="checkbox" value="adduser" name="userauth" />增加</label>
                 <label><input type="checkbox" value="deluser" name="userauth"/>删除</label>
                 <label><input type="checkbox" value="edituser" name="userauth"/>修改</label>
                 <label><input type="checkbox" value="seluser" name="userauth"/>查询</label>
             </td></tr>
             <tr><th><strong>百科问答</strong></th>
             <td>
                 <label><input type="checkbox" value="addask" name="askauth"/>增加</label>
                 <label><input type="checkbox" value="delask" name="askauth"/>删除</label>
                 <label><input type="checkbox" value="editask" name="askauth"/>修改</label>
                 <label><input type="checkbox" value="selask" name="askauth"/>查询</label>
             </td></tr>
             <tr><th><strong>数据库用户与密码</strong></th>
             <td>
                 <asp:TextBox runat="server" ID="DBUName_T" CssClass="form-control max20rem" placeholder="数据库用户名" /><br />
                 <asp:TextBox runat="server" ID="DBPwd_T" CssClass="form-control max20rem" TextMode="Password" /><br />
                 <span class="text-success" >
                     1,数据库中添加一个用户<br />
                     2,为这个用指定权限(例如对 ZL_User表的查询权限)<br />
                     3,在这里填入用户名与密码<br />
                     (该用户名与密码仅针对 Insert,Del,Update,Select四个方法,用于实现WebServices中未提供的接口)
                 </span>
             </td></tr>
             <tr><th><strong>启用</strong></th><td><input type="checkbox" runat="server" id="Status_Chk" checked="checked" class="switchChk" /></td></tr>
         <tr>
		 <td></td>
		 <td colspan="2" >
             <asp:Button ID="BtnCommit" runat="server" Text="提交" class="btn btn-info" OnClick="Button1_Click" />
             <a href="WsApi.aspx" class="btn btn-outline-info ml-2">返回</a></td></tr>
  </table>
  </div>
  </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
<script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
<script src="/JS/SelectCheckBox.js"></script>
<script src="/JS/jquery.validate.min.js"></script>
<script src="/JS/ZL_Regex.js"></script>
    <script>
        $(function () {
            $.validator.addMethod("isurl", function (value) {
                value = StrHelper.UrlDeal(value);
                return ZL_Regex.isUrl(value);
            }, "链接格式不正确");
            $("form").validate({});
        })
    </script>
</asp:Content>