<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TouTiaoAuth.aspx.cs" Inherits="ZoomLaCMS.Manage.TouTiao.TouTiaoAuth" MasterPageFile="~/Manage/I/Index.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>头条号登录</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("TouTiaoContent.aspx","头条号管理"),
        new Bread() {url="", text="头条号登录检测",addon="" }}
		)
    %>

<div class="list_choice table-responsive-md">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="alert alert-warning alert-dismissible fade show">
        使用头条号需要验证用户身份，点击前往 <i class="zi zi_share" zico="转发粗黑"></i><a href="<%=url %>" target="_blank">登录头条号</a>，完成登录后刷新页面即可。
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:Timer ID="CheckToken_Timer" runat="server" Interval="1000" OnTick="CheckToken_Timer_Tick" />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="CheckToken_Timer" EventName="Tick" />
        </Triggers>
    </asp:UpdatePanel>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
