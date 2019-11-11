<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Weixin.ascx.cs" Inherits="ZoomLaCMS.Manage.I.ASCX.Weixin" EnableViewState="false" %>
<div class="m_left_ul open">
<div class="menu_tit" onclick="wxclick(this);"><i class="zi zi_forDown"></i> <%=Resources.L.微信配置%></div>
<div id="wx_menu" class="NodeTree_left_ul">
<ul>
<li id="menu10_2_2" onclick="wxclick(this);"><a onclick="ShowMain('','WeiXin/WxAppManage.aspx');"> <%=Resources.L.公众号码%></a></li>
<li id="menu10_2_3" onclick="wxclick(this);"><a onclick="ShowMain('','WeiXin/LiteAPP/Default.aspx');">小程序</a></li>
<li id="menu10_2_7" onclick="wxclick(this);"><a onclick="ShowMain('','WeiXin/Addon/ScanCode.aspx');">条码扫描</a></li>
<%--<li id="menu10_2_8" onclick="wxclick(this);"><a onclick="ShowMain('','WeiXin/Addon/QrCodeDecode.aspx');"> <%=Resources.L.解码管理%></a></li>--%>
<%--        <li id="menu7_9_6" onclick="wxclick(this);"><a href="AddOn/UAgent.aspx"> <%=Resources.L.设备接入%></a></li>--%>
<li class="pl-0"> <p class="menu_tit laybtn below"><i class="zi zi_forDown"></i> 微信公众号</p></li>
<asp:Repeater ID="RPT" runat="server">
    <ItemTemplate>
	<li class="wx_item" onclick="wxclick(this);"><a href="javascript:;"><i class="zi zi_tmWeixin"></i> <%#Eval("Alias") %></a></li>
	<ul class="downmenu d-none">
	    <li><a class="margin_l15" href="javascript:;" onclick="ShowMain('','Weixin/WelPage.aspx?appid=<%#Eval("ID") %>');"><i class="zi zi_globe"></i> 欢迎语</a></li>
	    <li><a class="margin_l15" href="javascript:;" onclick="ShowMain('','Weixin/WxConfig.aspx?id=<%#Eval("ID") %>');"><i class="zi zi_qrcode"></i> 二维码</a></li>
	    <li><a class="margin_l15" href="javascript:;" onclick="ShowMain('','Weixin/ReplyList.aspx?appid=<%#Eval("ID") %>');"><i class="zi zi_comments"></i> 自动回复</a></li>
	    <li><a class="margin_l15" href="javascript:;" onclick="ShowMain('','Weixin/Msg/MsgTlpList.aspx?appid=<%#Eval("ID") %>');"><i class="zi zi_filePic"></i> 消息群发</a></li>
	    <li><a class="margin_l15" href="javascript:;" onclick="ShowMain('','Weixin/EditWxMenu.aspx?appid=<%#Eval("ID") %>');"><i class="zi zi_book"></i> 菜单配置</a></li>
	    <li><a class="margin_l15" href="javascript:;" onclick="ShowMain('','Weixin/WxUserList.aspx?appid=<%#Eval("ID") %>');"><i class="zi zi_users"></i> 粉丝管理</a></li>
	    <li><a class="margin_l15" href="javascript:;" onclick="ShowMain('','Weixin/WxMaterial.aspx?appid=<%#Eval("ID") %>&type=image');"><i class="zi zi_newspaper"></i> 素材管理</a></li>
	    <li><a class="margin_l15" href="javascript:;" onclick="ShowMain('','Weixin/MsgTlpList.aspx?appid=<%#Eval("ID") %>');"><i class="zi zi_comment"></i> 模板消息</a></li>
	    <li><a class="margin_l15" href="javascript:;" onclick="ShowMain('','Weixin/Red/RedPacket.aspx?appid=<%#Eval("ID") %>');"><i class="zi zi_gift"></i> 红包管理</a></li>
	    <li><a class="margin_l15" href="javascript:;" onclick="ShowMain('','Weixin/Pay/EnterPrise.aspx?appid=<%#Eval("ID") %>');"><i class="zi zi_creditCard"></i> 企业付款</a></li>
	    <li><a class="margin_l15" href="javascript:;" onclick="ShowMain('','Weixin/Pay/PayLog.aspx?appid=<%#Eval("ID") %>');"><i class="zi zi_database"></i> 支付日志</a></li>
	    <li><a class="margin_l15" href="javascript:;" onclick="ShowMain('','Weixin/Pay/WxPayConfig.aspx?appid=<%#Eval("ID") %>');"><i class="zi zi_shoppingcart"></i> 支付配置</a></li>
	</ul>
    </ItemTemplate>
</asp:Repeater>
</ul>
</div>
</div>