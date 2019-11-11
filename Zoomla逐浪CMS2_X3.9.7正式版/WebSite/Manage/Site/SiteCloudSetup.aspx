<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SiteCloudSetup.aspx.cs" Inherits="ZoomLaCMS.Manage.Site.SiteCloudSetup"  MasterPageFile="~/Manage/I/Index.master" Title="快云安装"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
<meta charset="utf-8" />
<title>快云安装</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/Main.aspx","工作台"),
	new Bread("Default.aspx","站群中心"),
	new Bread() {url="", text="快云安装",addon="" }}
	)
%>
<asp:ScriptManager runat="server" ></asp:ScriptManager>
<div id="CSWSDiv" class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
    <table class="table table-bordered table-hover table-striped sys_table">
        <tr><th class="w12rem_lg">文件来源</th><td>
             <div class="input-group">
                <asp:TextBox runat="server" ID="codeSource" CssClass="form-control max20rem"></asp:TextBox>
                <span class="input-group-append">
                    <asp:Button runat="server" Text="恢复为原始地址" OnClick="ResetUrl_Click" CssClass="btn btn-info" />
                </span>
            </div></td></tr>
        <tr><th>目标站点</th><td>
            <asp:DropDownList runat="server" ID="siteListDP" onchange="dpChange(this);" CssClass="form-control max20rem"></asp:DropDownList>
            <asp:Button runat="server" ID="setupBtn" Text="开始下载安装" Style="display: none;" class="btn btn-info" OnClick="setupBtn_Click" />
                          </td></tr>
        <tr><th>存放地址</th><td>
            <asp:TextBox runat="server" ID="zipSavePath" CssClass="form-control max20rem" />
            <asp:RegularExpressionValidator runat="server" ID="spValid" ControlToValidate="zipSavePath" ValidationExpression="^\\[\w\W]*\\$"
                ErrorMessage="格式不正确,必须以\开头以\结束例:\Zoomla\" Display="Dynamic" ForeColor="Red" /></td></tr>
        <tr><th>服务器IP</th><td><asp:Label runat="server" ID="serverIP" /></td></tr>
        <tr><th>管理操作</th><td>
            <asp:Button runat="server" ID="saveBtn" Text="保存" CssClass="btn btn-outline-info" OnClick="saveBtn_Click" />
            <input type="button" value="返回站点列表" onclick="location = 'Default.aspx'" class="btn btn-outline-info" />
                          </td></tr>
    </table>
	</div>
    <ul class="list-unstyled">
        <%--    <li style="display: none;">
        <strong>绑定信息：</strong>
        <label runat="server" id="sitePort" style='position: relative; bottom: 5px;'>请选择站点</label>
        <label runat="server" id="domain" style='position: relative; bottom: 5px; margin-left: 8px;'></label>
    </li>--%>
        <%--    <li>
        <strong>安装路径：</strong><asp:TextBox runat="server" ID="setupPath" CssClass="site_input" Style="width: 315px;"></asp:TextBox>例:/为安装在网站根目录
        <asp:RegularExpressionValidator runat="server" ID="spValid" ControlToValidate="setupPath" ValidationExpression="^/[\w\W]*"
            ErrorMessage="格式不正确,必须以/开头" Display="Dynamic" />
        <asp:RequiredFieldValidator runat="server" ControlToValidate="setupPath" ErrorMessage="安装路径不能为空，推荐为/" Display="Dynamic" />
    </li>--%>
    </ul>
</div><!--Main End-->
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script type="text/javascript">
        function dpChange(obj) {
            var index = $(obj).find("option:selected").index();
            if (index > 2) {
                $("#<%=setupBtn.ClientID%>").css("display", "");
            }
            else if (index == 1) {
                $("#<%=setupBtn.ClientID%>").css("display", "none");
                newSite();
            }
            else {
                $("#<%=setupBtn.ClientID%>").css("display", "none");
            }
    }

    function newSite() {//打开新站点，对话框
        ShowComDiag("CreateSite.aspx","新建站点");
    }
    function CreateSuccess()
    {
        CloseComDiag();
        location = location;
    }
    </script>
</asp:Content>