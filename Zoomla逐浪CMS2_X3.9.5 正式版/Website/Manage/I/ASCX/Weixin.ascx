<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Weixin.ascx.cs" Inherits="ZoomLaCMS.Manage.I.ASCX.Weixin" EnableViewState="false" %>
<div class="m_left_ul open">
<div class="menu_tit" onclick="wxclick(this);"><i class="zi zi_forDown"></i> <%=Resources.L.微信配置%></div>
<div id="wx_menu" class="NodeTree_left_ul">
<ul>
<li id="menu10_2_2" onclick="wxclick(this);"><a href="WeiXin/WxAppManage.aspx" target='main_right'> <%=Resources.L.公众号码%></a></li>
<li id="menu10_2_3" onclick="wxclick(this);"><a href="WeiXin/LiteAPP/Default.aspx" target='main_right'>小程序</a></li>
<li id="menu10_2_7" onclick="wxclick(this);"><a href="WeiXin/Addon/ScanCode.aspx" target='main_right'>条码扫描</a></li>
<li id="menu10_2_8" onclick="wxclick(this);"><a href="WeiXin/Addon/QrCodeDecode.aspx" target='main_right'> <%=Resources.L.解码管理%></a></li>
<%--        <li id="menu7_9_6" onclick="wxclick(this);"><a href="AddOn/UAgent.aspx" target='main_right'> <%=Resources.L.设备接入%></a></li>--%>
<li class="pl-0"> <p class="menu_tit laybtn below"><i class="zi zi_forDown"></i> 微信公众号</p></li>
<asp:Repeater ID="RPT" runat="server">
    <ItemTemplate>
	<li class="wx_item" onclick="wxclick(this);"><a href="javascript:;"><i class="zi zi_tmWeixin"></i> <%#Eval("Alias") %></a></li>
	<ul class="downmenu d-none">
	    <li><a class="margin_l15" href="Weixin/WelPage.aspx?appid=<%#Eval("ID") %>" target='main_right'><i class="zi zi_globe"></i> 欢迎语</a></li>
	    <li><a class="margin_l15" href="Weixin/WxConfig.aspx?id=<%#Eval("ID") %>" target='main_right'><i class="zi zi_qrcode"></i> 二维码</a></li>
	    <li><a class="margin_l15" href="Weixin/ReplyList.aspx?appid=<%#Eval("ID") %>" target='main_right'><i class="zi zi_comments"></i> 自动回复</a></li>
	    <li><a class="margin_l15" href="Weixin/Msg/MsgTlpList.aspx?appid=<%#Eval("ID") %>" target='main_right'><i class="zi zi_filePic"></i> 消息群发</a></li>
	    <li><a class="margin_l15" href="Weixin/EditWxMenu.aspx?appid=<%#Eval("ID") %>" target='main_right'><i class="zi zi_book"></i> 菜单配置</a></li>
	    <li><a class="margin_l15" href="Weixin/WxUserList.aspx?appid=<%#Eval("ID") %>" target='main_right'><i class="zi zi_users"></i> 粉丝管理</a></li>
	    <li><a class="margin_l15" href="Weixin/WxMaterial.aspx?appid=<%#Eval("ID") %>&type=image" target='main_right'><i class="zi zi_newspaper"></i> 素材管理</a></li>
	    <li><a class="margin_l15" href="Weixin/MsgTlpList.aspx?appid=<%#Eval("ID") %>" target='main_right'><i class="zi zi_comment"></i> 模板消息</a></li>
	    <li><a class="margin_l15" href="Weixin/Red/RedPacket.aspx?appid=<%#Eval("ID") %>" target='main_right'><i class="zi zi_gift"></i> 红包管理</a></li>
	    <li><a class="margin_l15" href="Weixin/Pay/EnterPrise.aspx?appid=<%#Eval("ID") %>" target='main_right'><i class="zi zi_creditCard"></i> 企业付款</a></li>
	    <li><a class="margin_l15" href="Weixin/Pay/PayLog.aspx?appid=<%#Eval("ID") %>" target='main_right'><i class="zi zi_database"></i> 支付日志</a></li>
	    <li><a class="margin_l15" href="Weixin/Pay/WxPayConfig.aspx?appid=<%#Eval("ID") %>" target='main_right'><i class="zi zi_shoppingcart"></i> 支付配置</a></li>
	</ul>
    </ItemTemplate>
</asp:Repeater>
</ul>
</div>
</div>