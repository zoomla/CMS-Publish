<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WxMaterialAdd.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.WxMaterialAdd" MasterPageFile="~/Manage/I/Index.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>素材上传</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/I/Main.aspx","工作台"),
	new Bread("WeiXin/WxAppManage.aspx","公众号管理"),
	new Bread("WXMaterial.aspx?appid="+AppId+"&type=imageD","素材管理"),
	new Bread() {url="", text="添加素材",addon= "" }},
	Call.GetHelp(2)
	)
%>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
<table class="table table-bordered table-hover sys_table">
	<tr>
	<th scope="row" class="w12rem_lg">素材类型</th>
		<td>
			<label><input type="radio" value="image" name="type_rad" checked="checked" />图片</label>
		</td>
	</tr>
	<tr>
		<th scope="row">素材</th>
	
		<td>
			<ZL:FileUpload runat="server" ID="ImgFile_Up" OnlyImg="true"/>
		</td>
	</tr>
	<tr>
		<td></td>
		<td>
			<asp:Button runat="server" ID="Save_Btn" class="btn btn-outline-info" Text="上传素材" OnClick="Save_Btn_Click" />
			<a href="WXMaterial.aspx" class="btn btn-link"><-返回列表</a>
		</td>
	</tr>
</table>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>