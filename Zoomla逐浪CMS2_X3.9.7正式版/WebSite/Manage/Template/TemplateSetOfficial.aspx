<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TemplateSetOfficial.aspx.cs" Inherits="ZoomLaCMS.Manage.Template.TemplateSetOfficial"  MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<link href="/Plugins/JqueryUI/LightBox/css/lightbox.css" rel="stylesheet" media="screen" />
<script type="text/javascript" src="/Plugins/JqueryUI/LightBox/jquery.lightbox.js"></script>
<title><%=Resources.L.获取云模板 %></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol class="breadcrumb navbar-fixed-top" id="breadcrumb">
	<li class="breadcrumb-item"><a href="<%=CustomerPageAction.customPath2 %>Main.aspx"><%=Resources.L.工作台 %></a></li>
	<li class="breadcrumb-item"><a href="TemplateSet.aspx"><%=Resources.L.模板风格 %></a></li>
	<li class="breadcrumb-item"><%=Resources.L.从云端下载模板方案 %><a href="AddtemplateSet.aspx"> [ <%=Resources.L.发布当前站点方案 %> ] </a><a href="#" data-toggle="modal" data-target="#myModal1">[ <%=Resources.L.使用前必读 %> ]</a></li>
</ol>

<div class="template">
<div class="panel panel-default">
<div class="panel-body">
<h1><i class="zi zi_cloud" zico="云"></i> <%=Resources.L.模板云 %> <a title="<%=Resources.L.免费云建站 %>" target="_blank" href="//site.73ic.com" class="btn btn-outline-info">-><%=Resources.L.免费在线拖拽式云建站 %></a>
</h1>

<div class="template sys_Template">
<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
<div class="modal-dialog modal-dialog-centered">
	<div class="modal-content">
		<div class="modal-header">
			<h4 class="modal-title" id="myModalLabel"><%=Resources.L.免费云方案下载 %></h4>
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
		</div>
		<div class="modal-body">
			<p>
				<%=Resources.L.云模板_notice1 %><br>
				<%=Resources.L.云模板_notice2 %><br>
				<%=Resources.L.云模板_notice3 %>
			</p>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		</div>
	</div>
</div>
</div>

<ul class="list-unstyled">
	<ZL:ExRepeater runat="server" ID="RPT" PageSize="12" PagePre="</div> <div class='panel-footer text-center'>" PageEnd="</div>">
		<ItemTemplate>
			<li class="Template_list_card">
				<div class="Template_box">
					<div class="tempthumil">
						<a href="<%#GetDownUrl() %>" title="<%=Resources.L.点击下载模板 %>">
						<span style="background: url(<%=serverdomain %>/Template/<%#Eval("TempDirName") %>/view.jpg) no-repeat top;"></span>
						</a>
					</div>

					<ul>
					
					<li class="temp_title">
					<span class="pull-right pr-2"><a href="<%#GetDownUrl() %>" title="<%=Resources.L.下载模板 %>"><i class="zi zi_clouddownloadalt" zico="从云下载"></i></a></span>
					<span class="pull-left"><a href="<%#GetDownUrl() %>" title="<%#Eval("Project") %>" style="padding-left:5px;"><%#Eval("Project") %></a></span>
					</li>
					
					<li class="temp_isuse"><i class="zi zi_yensign" zico="人民币与日元符"></i> <%#Eval("Author") %></li>
					<li class="temp_del"><i class="zi zi_yensign" zico="人民币与日元符"></i> <%=Resources.L.免费 %>
					<a class="mr-2 lightbox" href='<%=serverdomain %>/Template/<%#Eval("TempDirName") %>/view.jpg' class="lightbox" title="<%=Resources.L.大图预览 %>"><i class="zi zi_searchplus" zico="搜索放大"></i> <%=Resources.L.预览 %></a></li>
					
					
					
					</ul>
				</div>
			</li>
		</ItemTemplate>
		<FooterTemplate>
			<div class="clearfix"></div>
		</FooterTemplate>
	</ZL:ExRepeater>
</ul>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<link href="/Plugins/JqueryUI/LightBox/css/lightbox.css" rel="stylesheet" media="screen" />
<script src="/Plugins/JqueryUI/LightBox/jquery.lightbox.js" type="text/javascript"></script>
<script>
$(document).ready(function () {
base_url = document.location.href.substring(0, document.location.href.indexOf('index.html'), 0);
$(".lightbox").lightbox({
	fitToScreen: true,
	imageClickClose: false
});
});
</script>
</asp:Content>