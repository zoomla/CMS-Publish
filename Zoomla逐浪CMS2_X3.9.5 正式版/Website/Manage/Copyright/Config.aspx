<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Config.aspx.cs" Inherits="ZoomLaCMS.Manage.Copyright.Config"MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>版权配置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/Plus/ADManage.aspx","扩展功能"),	
        new Bread("Register.aspx","版权中心"),	
        new Bread() {url="", text="版权配置 [<i class='zi zi_checkcircle'></i>配置信息验证成功，请登陆管理版权收入] [<a href='"+CustomerPageAction.customPath2+"/Config/Third/AddPlatInfo.aspx?action=copyright&amp;id="+platMod.ID+"'>重新配置</a>]",addon="" }}
		)
    %>
	<div class="list_choice">
    <div runat="server" id="Prompt_Div" visible="false">
        <div class="alert alert-info in margin_b2px">
            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
            <h4><%=Resources.L.提示 %>!</h4>
            <p style="padding-left: 50px;">
                <strong><i class="zi zi_speaker"></i>
                 如登录显示服务器忙,可点击前往<a href="http://sale.banquanyin.com/account/licensor" class="rd_red" title="点击访问" target="_blank">版权印</a>,完成登录后再<a href="Config.aspx" class="rd_red">刷新</a>
                </strong>
            </p>
        </div>
    </div>
    <iframe runat="server" id="config_ifr" style="width:100%;height: 300px" frameborder="0" marginheight="0" marginwidth="0"></iframe>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
    $("#config_ifr").load(function () {
        var $obj = $(this);
        $obj.height($(document).height() - 120);
    });
</script>
</asp:Content>
