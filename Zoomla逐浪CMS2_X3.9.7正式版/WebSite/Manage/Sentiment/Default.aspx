<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Manage.Sentiment.Default" MasterPageFile="~/Manage/I/Index.master"%>
 <asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
<title>舆情监测</title> 
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/Default.aspx","企业办公"),
        new Bread() {url="Default.aspx", text="舆情监测",addon="" }}
		)
    %>
<div class="list_choice Testing_box">
<div class="ani_icon text-center"> 
<div><i class="zi zi_rocket animated homeb201503"></i></div> 
<h1 class="animated homeb201505">舆情监测-做信息时代的主人</h1>
</div>
<div class="ani_func text-center">
<ul class="list-inline d-flex justify-content-center">
<li><a href="SenConfig.aspx" class="btn btn-outline-info">系统配置</a></li>
<li><a href="DataList.aspx" class="btn btn-outline-info">监测报表</a></li>
<li><a href="DataList.aspx" class="btn btn-outline-info">监测报告</a></li>
</ul>
</div> 
</div>
<script>
    $().ready(function () {
        setInterval("$('.ani_func').fadeIn()", 3000);
    })
</script>        

</asp:Content> 
