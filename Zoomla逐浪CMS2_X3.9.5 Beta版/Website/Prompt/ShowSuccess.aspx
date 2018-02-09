<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowSuccess.aspx.cs" Inherits="ZoomLaCMS.Prompt.ShowSuccess" EnableViewStateMac="false" ValidateRequest="false" MasterPageFile="~/Common/Common.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>成功提示</title>
<link rel="stylesheet" href="/dist/css/animate.min.css"/>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container animated sysTips_prompt">
<div class="col-sm-6 offset-sm-3">
<div class="card">
  <div class="card-header"> <i class="fa fa-check"></i> 操作成功 </div>
  <div class="card-body text-center">
	<h5 class="card-title"></h5>
	<p class="card-text"><asp:Literal ID="LtrSuccessMessage" runat="server"></asp:Literal></p>
	<div class="card-text"><asp:HyperLink ID="LnkReturnUrl" runat="server" class="btn btn-info"><i class="fa fa-repeat" aria-hidden="true"></i> <- 返回上一页</asp:HyperLink></div>
</div>
</div>
</div>
<script>
function AutoReturn(url, time) { setTimeout(function () { location = url }, time); }
function SetUrl(url) { $("#LnkReturnUrl").attr("href", url); }
</script>
</asp:Content>