<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TemplateSet.aspx.cs" Inherits="ZoomLaCMS.Manage.Template.TemplateSet" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>模板方案</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol class="breadcrumb fixed-top" id="breadcrumb">
<li class="breadcrumb-item"><a href="<%=CustomerPageAction.customPath2 %>Main.aspx">工作台</a></li>
<li class="breadcrumb-item"><a href="TemplateSet.aspx">模板风格</a></li>
<li class="breadcrumb-item">方案列表 </li>
<div class="ml-auto"><a href="TemplateSetOfficial.aspx"><i class="zi zi_clouddownloadalt" zico="从云下载"></i>> 云模板下载 </a></div>
</ol>

<div class="list_choice" >
<div class="card-body" >
	<ul class="list-unstyled">
		<ZL:ExRepeater runat="server" ID="RPT" PageSize="12" BoxType="dp" PagePre="</div> <div class='panel-footer text-center'>" PageEnd="</div>" OnItemCommand="RPT_ItemCommand">
			<ItemTemplate>
				<li class="Template_list_card">
					<div class="Template_box">
						<div class="tempthumil"><a href="TemplateManage.aspx?setTemplate=<%#Eval("name") %>" title="点击进入模板管理">
						<span style="background: url(/Template/<%#Eval("name") %>/view.jpg) no-repeat top;"></span>						
						</div>
						<ul>
						<li class="temp_title">
						<a href="javascript:;" title="作者:<%# GetTlpName("Author")%>" data-toggle="tooltip" data-placement="top"><i class="zi zi_copyright" zico="版权"></i></a>
						<a href="TemplateManage.aspx?setTemplate=<%#Eval("name") %>" title='<%# GetTlpName("Project")%>'><%# GetTlpName("Project")%></a>
						</li>
							<li class="temp_isuse"><asp:LinkButton runat="server" ID="isUse" CommandArgument='<%#Eval("name") %>' CommandName="set">状态:</asp:LinkButton><%#IsDefaultTlp() %></li>
							<li class="temp_del">
							 <a href='/Template/<%#Eval("name") %>/view.jpg' class="lightbox"> <i class="zi zi_searchplus" zico="搜索放大"></i> 预览</a>
								<asp:LinkButton runat="server" CommandArgument='<%#Eval("name") %>' CommandName="del2" OnClientClick="return confirm('你确定删除吗');"> <i class="zi zi_trashalt" zico="垃圾箱竖条"></i> 删除 </asp:LinkButton>
							</li>
						</ul>
						</span>
						<div class="clearfix"></div>
					</div>
				</li>
			</ItemTemplate>
			<FooterTemplate>
				<div class="clearfix"></div>
			</FooterTemplate>
	</ZL:ExRepeater>
</div>
</ul>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<link href="/Plugins/JqueryUI/LightBox/css/lightbox.css" rel="stylesheet" media="screen" />
<script src="/Plugins/JqueryUI/LightBox/jquery.lightbox.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function () {
		base_url = document.location.href.substring(0, document.location.href.indexOf('index.html'), 0);
		$(".lightbox").lightbox({
			fitToScreen: true,
			imageClickClose: false
		});
	});

	$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	})
</script>
</asp:Content>