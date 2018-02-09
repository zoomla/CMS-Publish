<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateMap.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.CreateMap" MasterPageFile="~/Manage/I/Index.master" Debug="true" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>后台管理索引</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/Admin/I/Main.aspx","工作台"),
	new Bread("SiteInfo.aspx","系统设置"),
	new Bread("SiteInfo.aspx","网站配置"),
	new Bread() {url="", text="页面索引(用于主页右上方的快速搜索功能)",addon="" }}
	)
%>
  
<div class="mid_txtbox">
    <div class="mid_txtcnt">
    <h1>快速生成系统应用查询索引</h1>
    <h2>一般维护时发布一次即可</h2>
     </div>
    <div class="creat_btn">
    <asp:LinkButton runat="server" ID="Sure_Btn" OnClick="Sure_Btn_Click" CssClass="btn btn-primary" OnClientClick="return confirm('确定要重新生成SiteMap.config吗?');" ><i class="fa fa-th-large"></i><br/>生成后台索引</asp:LinkButton>
<asp:LinkButton ID="SureUser_Btn" runat="server" CssClass="btn btn-info" OnClientClick="return confirm('确定要生成UserMap.config吗?');" OnClick="SureUser_Btn_Click" ><i class="fa fa-user"></i><br />生成会员索引</asp:LinkButton>
    </div>
    </div>
</asp:Content>