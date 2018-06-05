<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DownTemplate.aspx.cs" Inherits="ZoomLaCMS.Manage.Template.DownTemplate"  MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>获取云模板</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/Main.aspx","系统设置"),
	new Bread("TemplateSet.aspx","模板风格"),
	new Bread("TemplateSetOfficial.aspx","云模板"), 
	new Bread() {url="", text="下载方案",addon="" }}
	)
%>
<div class="container-fluid">
<div class="row list_choice">
<asp:HiddenField ID="hfIsExist" runat="server" />
<table class="table table-striped table-bordered text-center">
<tr align="center">
	<td colspan="2">
		<asp:Label ID="LblTitle" runat="server"></asp:Label>
	</td>
</tr>
<tr>
<td>
<asp:Panel ID="Panel1" runat="server">
<div id="gallery">
	<div class="">
		<asp:Literal ID="tempimg" runat="server"></asp:Literal></div>
	<div id="DownTips" style="display: none;">
		<div class="d-flex justify-content-center alert alert-info alert-dismissible fade show">
			<div class="align-self-center">
			<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
			<h4><i class="zi zi_checkcircle" zico="圆打勾"></i> 云模板下载完成-现在就可以设为默认使用新模板:</h4>
			<p>
				<button id="setdef_b" type="button" onclick="setDefault()" class="btn btn-default"><i class="zi zi_squareCorrect" zico="打勾正方形"></i> 设为默认</button> 
			<a href="TemplateSetOfficial.aspx" class="btn btn-outline-info"><-返回模板列表</a>
			设置后可点这里<a id="mnbak_b" href="../Content/Addon/MNBakList.aspx">[恢复元数据]</a>(如果有)
			</p>
			</div>
			
		</div>
	</div>
	<!-- /example -->
</div>
</asp:Panel>
<asp:Panel ID="Panel3" runat="server">
<asp:Literal ID="installstart" runat="server"></asp:Literal>
</asp:Panel>
</td>
</tr>
</table>
</div></div>
<div id="downimg"  class="navbar fixed-bottom">
[<asp:Literal ID="tempname" runat="server"></asp:Literal>]模版下载中请耐心等待片刻…
<div class="progress progress-striped active" style="margin-top:5px;">
	<div id="downTempDiv" class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100">
		<span id="downTempSpan" class="sr-only" style="position: relative;"></span>
	</div>
</div>
</div>
<div id="downbtn" class="navbar fixed-bottom downbtnBar">
	<input type="button" id="down_b" value="点击从云端部署" onclick="beginCheckS('getTempP');" class="btn btn-outline-info" />
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
	var wida = 0;
	var interval;
	var actionArr = "getTempP";//下载模板
	function PostToCS(a, v) {
		$.ajax({
			type: "Post",
			url: "DownTemplate.aspx",
			data: { action: a, value: v },
			success: function (data) {
				$("#downTempDiv").css("width", data + "%");
				$("#downTempSpan").text(data + "%");
				if (data == 100) {
					clearInterval(interval);
					$("#downimg").hide();
					$("#DownTips").show();
				}
			},
			error: function (data) {
			}
		});
	}
	//调用其开始循环获取
//        function beginCheck(request) {
//            $("#downimg").show();
//            $("#downbtn").hide();
//            interval = setInterval(function () { PostToCS(request, '') }, 1000);
//        }

	function beginCheckS(request) {
		$("#downimg").show();
		$("#downbtn").hide();
		interval = setInterval(function () { PostToCS(request, '') }, 1000);
	}
	
	function setDefault() {
		if (!confirm("确认将该模板设为默认吗?")) { return; }
		$.ajax({
			type: "Post",
			url: "DownTemplate.aspx",
			data: { action: 'setdefault', value: '<%=Request.QueryString["dir"] %>' },
			success: function (data) {
				$("#setdef_b").attr("disabled", "disabled").html("<i class='zi zi_squareCorrect' zico="打勾正方形"></i> 设置成功");
			}
		});
	}
	//完成,可以开始安装
	//跳转
	function jump() {
		window.location.href = "<%= customPath2%>Config/SiteOption.aspx?prodirName=<%=prodirName%>";
	}
</script>
</asp:Content>