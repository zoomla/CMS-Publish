<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZoneStyleAdd.aspx.cs" Inherits="ZoomLaCMS.Manage.Zone.ZoneStyleAdd" MasterPageFile="~/Manage/I/Index.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head"><title>模板管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/I/Main.aspx","工作台"),
	new Bread("/{manage}/User/UserManage.aspx","会员管理"),
	new Bread("ZoneConfig.aspx","会员空间管理"),
	new Bread("ZoneStyleManage.aspx","空间模板管理"),
	new Bread() {url="", text="添加空间模板",addon= "" }}
	)
%>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
    <table class="table table-striped table-bordered table-hover sys_table">
        <tr>
            <th scope="col" class="w12rem_lg">
                <strong>模板名称</strong>
            </th>
            <td scope="col">
                <asp:TextBox ID="StyleName_T" class="form-control max20rem" runat="server" MaxLength="20" />
            </td>
        </tr>
        <tr>
            <th>
                <strong>模板缩略图</strong>
            </th>
            <td>
                <asp:TextBox ID="StylePic_T" class="form-control max20rem" runat="server" Width="300px" />
				<small class="text-muted">填写模板图片路径</small>
            </td>
        </tr>
        <tr>
            <th><strong>首页模板</strong></th>
            <td>
				<div class="input-group">
				  <asp:TextBox ID="UserIndexStyle_T" class="form-control max20rem" runat="server" />
					<div class="input-group-append">
					<input type="button" value="选择模板" class="btn btn-outline-info" onclick="opentitle('../Template/TemplateList.aspx?OpenerText=' + escape('UserIndexStyle_T') + '&FilesDir=')" />
				    </div>
			    </div>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="EBtnSubmit" Text="保存模板" class="btn btn-info" runat="server" OnClick="EBtnSubmit_Click" />
                <a href="ZoneStyleManage.aspx" class="btn btn-outline-info">取消保存</a>
            </td>
        </tr>
    </table>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script>
        function GV(id, value) { $("#" + id).val(value); }
        var TemDiag = new ZL_Dialog();
        function opentitle(url) {
            TemDiag.title = "选择模板";
            TemDiag.maxbtn = false;
            TemDiag.url = url;
            TemDiag.ShowModal();
        }
        function CloseDiag() { TemDiag.CloseModal(); }
        function Tlp_SetValByName(name, val) { $("#" + name).val(val); }
    </script>
</asp:Content>
