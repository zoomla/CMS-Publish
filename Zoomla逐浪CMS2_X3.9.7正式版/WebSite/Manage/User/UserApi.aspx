<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserApi.aspx.cs" Inherits="ZoomLaCMS.Manage.User.UserApi" MasterPageFile="~/Manage/I/Index.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <link rel="stylesheet" href="/dist/css/bootstrap-switch.min.css" />
    <title>整合配置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/User/UserManage.aspx","用户管理"),
	new Bread("/{manage}/user/UserManage.aspx","会员管理"),
	new Bread() {url="", text="整合接口配置<a href='SiteManage.aspx'> [站点管理]</a>",addon= "" }}
	)
%>
<div class="list_choice">
    <table class="table table-striped table-bordered" style="display: none;">
        <tr class="tdbg">
            <td class="tdbgleft" colspan="2" align="center">
                <asp:Button ID="btnSubmit" class="btn btn-primary" runat="server" OnClick="btnSubmit_Click" Text="保存" />
                <asp:Button ID="btnCancel" class="btn btn-primary" runat="server" Text="取 消" OnClick="btnCancel_Click" /></td>
        </tr>
    </table>
    <div id="remind" runat="server"></div>
<div class="container-fluid pr-0">
<div class="row sysRow">
    <table class="table table-bordered sys_table">
        <tr>
            <th class="w12rem_lg"><strong>主站数据库服务器IP</strong></th>
            <td>
                <asp:TextBox runat="server" ID="ServerIP_T" Text="127.0.0.1" CssClass="form-control required ip max20rem" data-enter="1" /></td>
        </tr>
        <tr>
            <th><strong>数据库名称</strong></th>
            <td>
                <asp:TextBox runat="server" ID="DBName_T" CssClass="form-control required max20rem" data-enter="2" /></td>
        </tr>
        <tr>
            <th><strong>数据库用户</strong></th>
            <td>
                <asp:TextBox runat="server" ID="UName_T" CssClass="form-control required max20rem" data-enter="3" /></td>
        </tr>
        <tr>
            <th><strong>数据库密码</strong></th>
            <td>
                <asp:TextBox runat="server" ID="Pwd_T" data-enter="4" CssClass="form-control required max20rem" /></td>
        </tr>
        <tr>
            <th><strong>服务器Token</strong></th>
            <td>
                <asp:TextBox runat="server" ID="Token_T" CssClass="form-control max20rem" data-enter="5" /></td>
        </tr>
        <tr>
            <th><strong>是否子站</strong></th>
            <td>
                <input type="checkbox" runat="server" id="RemoteEnable" class="switchChk" /></td>
        </tr>
        <%--  <tr><td>启用Discuz!NT论坛：</td><td><input type="checkbox" runat="server" id="RBLDZ" class="switchChk" /></td></tr>--%>
        <tr>
            <th><strong>操作</strong></th>
            <td>
                <asp:Button runat="server" ID="Begin_Btn" CssClass="btn btn-outline-info" Text="生成整合SQL" OnClientClick="CheckData();" OnClick="Begin_Btn_Click" data-enter="6" />
                <asp:Button runat="server" ID="Cancel_Btn" CssClass="btn btn-outline-info" Text="生成取消SQL" OnClick="Cancel_Btn_Click" />
                <a href="http://code.z01.com/Files/跨站整合示例.docx" target="_blank" class="btn btn-outline-info">下载示例文档</a>
                <asp:Button runat="server" ID="Save_Btn" Text="保存配置" OnClick="Save_Btn_Click" CssClass="btn btn-outline-info" />
            </td>
        </tr>
    </table>
	</div></div>
	<div class="alert alert-light">
    <input type="button" id="copyhref" class="btn btn-outline-info opition" value="复制保存下面语句">
    <abbr class="ml-3">在数据库管理器或后台SQL查询界面中按说明执行下列脚本：</abbr>
	</div>
    <div runat="server" id="Sql_Div" class="alert alert-info">尚未生成SQL语句</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/dist/js/bootstrap-switch.js"></script>
    <script src="/JS/Controls/Control.js"></script>
    <script src="/JS/jquery.validate.min.js"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/ZL_Regex.js"></script>
    <script>
        var diag = new ZL_Dialog();
        $(function () {
            Control.EnableEnter();
        })
        function CheckData() {
            var vaild = $("form").validate({ meta: "validate" });
            return vaild.form();
        }
        function ShowConfig() {
            diag.title = "站群用户整合";
            diag.url = "UApiConfig.aspx";
            diag.backdrop = true;
            diag.maxbtn = false;
            diag.ShowModal();
        }
        function CloseDiag() {
            diag.CloseModal();
            location = location;
        }
    </script>
</asp:Content>
