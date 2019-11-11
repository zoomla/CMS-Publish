<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPage.aspx.cs" Inherits="ZoomLaCMS.Manage.Template.SPage.AddPage" MasterPageFile="~/Manage/I/Index.Master" ValidateRequest="false"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title><%=Resources.L.页面管理 %></title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx",Resources.L.工作台),
        new Bread("Default.aspx",Resources.L.可视设计),						
        new Bread("Default.aspx",Resources.L.页面列表),						
        new Bread() {url="/{manage}/Template/SPage/AddPage.aspx", text=Resources.L.页面管理,addon="" }}
		)
    %>
    <div class="container-fluid pr-0">
	<div class="row sysRow list_choice">
        <table class="table table-bordered table-striped sys_table">
        <tr><th scope="col" class="w12rem_lg"><%=Resources.L.页面名称 %></th><td scope="col"><ZL:TextBox runat="server" ID="PageName_T" CssClass="form-control max20rem" AllowEmpty="false" ValidType="String"  /></td></tr>
        <tr><th><%=Resources.L.预览链接 %></th><td><asp:TextBox runat="server" ID="ViewUrl_T" CssClass="form-control max20rem" placeholder="为空则使用默认预览链接"/></td></tr>
        <tr><th><%=Resources.L.模板类型 %></th>
           <td>
               <div class="btn-group">
                   <button type="button" class="btn btn-outline-info" onclick="sethead('node');"><%=Resources.L.节点模板 %></button>
                   <button type="button" class="btn btn-outline-info" onclick="sethead('content');"><%=Resources.L.内容模板 %></button>
                   <button type="button" class="btn btn-outline-info" onclick="sethead('custom');"><%=Resources.L.自由模板 %></button>
               </div>
           </td>
        </tr>
        <tr><th><%=Resources.L.数据源标签 %></th><td><asp:TextBox runat="server" ID="PageDSLabel_T" class="form-control" placeholder="<%$Resources:L,数据源标签_notice %>"></asp:TextBox></td></tr>
        <tr><th><%=Resources.L.页面头部 %></th><td>
            <asp:TextBox runat="server" ID="PageRes_T" CssClass="form-control" TextMode="MultiLine" style="height:240px;" placeholder="<%$Resources:L,页面头部_notice %>">
            </asp:TextBox>
        </td></tr>
        <tr><th><%=Resources.L.页面底部 %></th><td>
             <asp:TextBox runat="server" ID="PageBottom_T" CssClass="form-control" TextMode="MultiLine" style="height:120px;" placeholder="<%$Resources:L,页面底部_notice %>"></asp:TextBox>
        </td></tr>
        <tr><th><%=Resources.L.备注 %></th><td><asp:TextBox runat="server" ID="PageDesc_T" CssClass="form-control" /></td></tr>
        <tr><td></td><td>
            <asp:Button runat="server" ID="Save_Btn" class="btn btn-outline-info" Text="<%$Resources:L,保存信息 %>" OnClick="Save_Btn_Click" />
        </td></tr>
    </table>
    </div>
	</div>
<div style="display:none;">
<textarea id="node_label">{ZL.Source id="节点栏目信息数据源"/}</textarea>
<textarea id="node_res">
<meta charset="utf-8">
<meta name="Keywords" content="{SField sid="节点栏目信息数据源" FD="Meta_Keywords" page="0"/}" />
<meta name="description" content="{SField sid="节点栏目信息数据源" FD="Meta_Description" page="0"/}" />
<link href="{$CssDir/}global.css?Version={ZL.Label id="前端样式版本号"/}" rel="stylesheet"/>
<title>{SField sid="节点栏目信息数据源" FD="NodeName" page="0"/}_{$SiteName/}</title>
{ZL:Boot4()/}
</textarea>
<textarea id="content_label">{ZL.Source id="文章模型数据源标签"/}</textarea>
<textarea id="content_res">
<meta charset="utf-8">
<meta name="Keywords" content="{SField sid="文章模型数据源标签" FD="Tagkey" page="0"/}" />
<meta name="Description" content="{SField sid="文章模型数据源标签" FD="Title" page="0"/}">
<link href="{$CssDir/}global.css?Version={ZL.Label id="前端样式版本号"/}" rel="stylesheet"/>
<title>{SField sid="文章模型数据源标签" FD="Title" page="0"/}_{$SiteName/}</title>
{ZL:Boot4()/}
</textarea>
<textarea id="custom_res">
<meta charset="utf-8">
<link href="{$CssDir/}global.css?Version={ZL.Label id="前端样式版本号"/}" rel="stylesheet"/>
<title>{$SiteName/}</title>
{ZL:Boot4()/}
</textarea>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
 <script>
$(function () {
    if ("<%=Mid%>" == "0") { sethead("node"); }
})
function sethead(id) {
    $("#PageDSLabel_T").val($("#" + id + "_label").text());
    $("#PageRes_T").val($("#" + id + "_res").text());
}
 </script>
</asp:Content>