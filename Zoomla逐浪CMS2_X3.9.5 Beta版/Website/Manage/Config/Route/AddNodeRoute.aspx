<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNodeRoute.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.Route.AddNodeRoute" MasterPageFile="~/Manage/I/Default.Master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>节点路由</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-bordered table-striped">
    <tr>
        <td>域名</td>
        <td>
            <div class="input-group">
                <span class="input-group-addon">http://</span>
                <ZL:TextBox runat="server" ID="domain_t" CssClass="form-control" Style="width: 232px;" data-enter="1" ValidType="Url" AllowEmpty="false" />
            </div>
            <span class="rd_green">必须解析到网站服务器并开放80端口独占状态,示例:bbs.z01.com</span>
        </td>
    </tr>
    <tr><td>节点</td><td>
        <select id="node_dp" name="node_dp" class="form-control text_300">
            <option value="0">请选择栏目</option>
            <asp:Literal runat="server" ID="node_lit" EnableViewState="false"></asp:Literal>
        </select>
                   </td></tr>
     <tr><td>备注</td><td><asp:TextBox runat="server" ID="Remind_T" CssClass="form-control text_300" style="height:100px;"  TextMode="MultiLine"/></td></tr>
    <tr><td></td><td>
        <asp:Button runat="server" ID="Save_Btn" Text="保存配置" OnClick="Save_Btn_Click" CssClass="btn btn-primary"/>
        <a href="RouteConfig.aspx" class="btn btn-default">返回列表</a>
     </td></tr>
</table>
   <div class="alert alert-info">
       节点路由的域名,仅可访问节点相关信息(无法访问用户中心,后台管理)
   </div> 
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/SelectCheckBox.js"></script>
</asp:Content>