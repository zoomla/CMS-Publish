<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNodeRoute.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.Route.AddNodeRoute" MasterPageFile="~/Manage/I/Index.Master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>节点路由</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/Main.aspx","工作台"),
	new Bread("","网站配置"),
	new Bread("RouteConfig.aspx","域名路由"),
	new Bread() {url="", text="路由管理",addon="" }}
	)
%>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
<table class="table table-bordered table-striped sys_table">
    <tr>
        <th scope="col" class="w12rem_lg">域名</th>
        <td scope="col">
			<div class="input-group mb-3">
			  <div class="input-group-prepend">
				<span class="input-group-text">http://</span>
			  </div>
			 <ZL:TextBox runat="server" ID="domain_t" CssClass="form-control max20rem" data-enter="1" ValidType="Url" AllowEmpty="false" />
			</div>
			<small class="text-muted">必须解析到网站服务器并开放80端口独占状态,示例:bbs.z01.com</small>
        </td>
    </tr>
    <tr><th>节点</td><th>
        <select id="node_dp" name="node_dp" class="form-control max20rem">
            <option value="0">请选择栏目</option>
            <asp:Literal runat="server" ID="node_lit" EnableViewState="false"></asp:Literal>
        </select>
                   </td></tr>
     <tr><th>备注</th><td><asp:TextBox runat="server" ID="Remind_T" CssClass="form-control max20rem"  TextMode="MultiLine"/></td></tr>
    <tr><td></td><td>
        <asp:Button runat="server" ID="Save_Btn" Text="保存配置" OnClick="Save_Btn_Click" CssClass="btn btn-info"/>
        <a href="RouteConfig.aspx" class="btn btn-outline-info">返回列表</a>
     </td></tr>
</table>
</div></div>
   <div class="alert alert-info">
       节点路由的域名,仅可访问节点相关信息(无法访问用户中心,后台管理)
   </div> 
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/SelectCheckBox.js"></script>
</asp:Content>