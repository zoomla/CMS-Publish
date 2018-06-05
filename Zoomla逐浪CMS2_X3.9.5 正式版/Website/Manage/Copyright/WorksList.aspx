<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorksList.aspx.cs" Inherits="ZoomLaCMS.Manage.Copyright.WorksList" MasterPageFile="~/Manage/I/Index.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>我的作品</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/Plus/ADManage.aspx","扩展功能"),	
        new Bread("Config.aspx","版权中心"),	
        new Bread() {url="", text="作品列表<a href='AddWorks.aspx'> [添加作品]</a>",addon="" }}
		)
    %>
<div class="list_choice">
    <iframe runat="server" id="workslist_ifr" style="width:100%;height: 500px;" frameborder="0" marginheight="0" marginwidth="0"></iframe>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
    $("#workslist_ifr").load(function () {
        var $obj = $(this);
        $obj.height($(document).height() - 120);
    });
</script>
</asp:Content>

