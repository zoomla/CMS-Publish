<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="ZoomLaCMS.webfont.write._default" MasterPageFile="../WebFont.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title><%:Call.SiteName %>字库大师-创作主页</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container-fulid ZfontC_banner">
<div class="container">
<h1><i class="fa fa-paint-brush"></i> 自由的字库创作之旅</h1>
<div class="alert alert-info text-center" role="alert">
      欢迎[wwwwwzf]莅临，当前您的会员级别是[普通会员]，可以创作最多4个字库，点此<a href="http://www.ziti163.com/Class_55/Default.aspx" target="_blank">升级VIP</a>即获不限字库生成功能！ <a href="http://www.ziti163.com/Class_55/Default.aspx" target="_blank">[工具介绍]</a> <a href="http://www.ziti163.com/Class_55/Default.aspx" target="_blank">[版权协议]</a> <a href="http://www.ziti163.com/Class_55/Default.aspx" target="_blank">[使用说明]</a>
    </div>
	</div>
</div>

<div class="ZfontC_list">
<div class="container">
<div class="ZfontC_list_t">我的字体</div>
<div class="row padding5">
<asp:Repeater runat="server" ID="RPT" EnableViewState="false">
<ItemTemplate>
<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 padding10">
<div class="ZfontC_list_c">
<div class="ZfontC_list_cb">
<div class="ZfontC_list_cbc">
<a href="wordlist.aspx?id=<%#Eval("ID") %>" class="btn btn-info"><i class="fa fa-pencil"></i> 继续书写</a>
</div>
</div>
<div class="ZfontC_list_cw"><span>已写<%#GetFontCount() %></span></div>
<div class="ZfontC_list_ct">
<div class="ZfontC_list_ctm">
<%# GetTopFont() %>
<div class="clearfix"></div>
</div>
<h3><%#Eval("FontName") %></h3>
<p><span><%#GetFontType() %></span><span style="font-size:0.9em;"><%# Eval("CDate","{0:yy-M-d}") %>创建</span></p>
</div>
</div>
</div>
</ItemTemplate>
</asp:Repeater>
</div>
</div>
</div>

<div class="container ZfontC_creat">
<a href="create.aspx" class="btn btn-danger btn-lg" style="width:30%;"><i class="fa fa-edit"></i> 创建字体</a>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
</asp:Content>
