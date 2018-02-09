<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Weixin.ascx.cs" Inherits="ZoomLaCMS.Manage.I.ASCX.Weixin" EnableViewState="false" %>
<div id="wx_menu" class="left_ul">
    <ul class='m_left_ulin'>
        <li class="menu_tit" onclick="wxclick(this);"><span class="fa fa-chevron-down"></span> <%=Resources.L.微信配置%></li>
        <li id="menu10_2_2" onclick="wxclick(this);"><a href="WeiXin/WxAppManage.aspx" target='main_right'> <%=Resources.L.公众号码%></a></li>
        <li id="menu10_2_3" onclick="wxclick(this);"><a href="WeiXin/LiteAPP/Default.aspx" target='main_right'>小程序</a></li>
        <li id="menu10_2_7" onclick="wxclick(this);"><a href="WeiXin/Addon/ScanCode.aspx" target='main_right'>条码扫描</a></li>
        <li id="menu10_2_8" onclick="wxclick(this);"><a href="WeiXin/Addon/QrCodeDecode.aspx" target='main_right'> <%=Resources.L.解码管理%></a></li>
<%--        <li id="menu7_9_6" onclick="wxclick(this);"><a href="AddOn/UAgent.aspx" target='main_right'> <%=Resources.L.设备接入%></a></li>--%>
        <li><p class="bg-info" style="margin:0;"><i class="fa fa-arrow-circle-down"></i> 微信公众号</p></li>
        <asp:Repeater ID="RPT" runat="server">
            <ItemTemplate>
                <li class="wx_item" onclick="wxclick(this);"><a href="javascript:;"><i class="fa fa-wechat"></i><%#Eval("Alias") %></a></li>
                <ul class="downmenu hidden">
                    <li><a class="margin_l15" href="Weixin/WelPage.aspx?appid=<%#Eval("ID") %>" target='main_right'><i class="fa fa-globe"></i> 欢迎语</a></li>
                    <li><a class="margin_l15" href="Weixin/WxConfig.aspx?id=<%#Eval("ID") %>" target='main_right'><i class="fa fa-qrcode"></i> 二维码</a></li>
                    <li><a class="margin_l15" href="Weixin/ReplyList.aspx?appid=<%#Eval("ID") %>" target='main_right'><i class="fa fa-comments-o"></i> 自动回复</a></li>
                    <li><a class="margin_l15" href="Weixin/Msg/MsgTlpList.aspx?appid=<%#Eval("ID") %>" target='main_right'><i class="fa fa-file-image-o"></i> 消息群发</a></li>
                    <li><a class="margin_l15" href="Weixin/EditWxMenu.aspx?appid=<%#Eval("ID") %>" target='main_right'><i class="fa fa-book"></i> 菜单配置</a></li>
                    <li><a class="margin_l15" href="Weixin/WxUserList.aspx?appid=<%#Eval("ID") %>" target='main_right'><i class="fa fa-users"></i> 粉丝管理</a></li>
                    <li><a class="margin_l15" href="Weixin/WxMaterial.aspx?appid=<%#Eval("ID") %>&type=image" target='main_right'><i class="fa fa-newspaper-o"></i> 素材管理</a></li>
                    <li><a class="margin_l15" href="Weixin/MsgTlpList.aspx?appid=<%#Eval("ID") %>" target='main_right'><i class="fa fa-comment"></i> 模板消息</a></li>
                    <li><a class="margin_l15" href="Weixin/Red/RedPacket.aspx?appid=<%#Eval("ID") %>" target='main_right'><i class="fa fa-gift"></i> 红包管理</a></li>
                    <li><a class="margin_l15" href="Weixin/Pay/EnterPrise.aspx?appid=<%#Eval("ID") %>" target='main_right'><i class="fa fa-credit-card"></i> 企业付款</a></li>
                    <li><a class="margin_l15" href="Weixin/Pay/PayLog.aspx?appid=<%#Eval("ID") %>" target='main_right'><i class="fa fa-database"></i> 支付日志</a></li>
                    <li><a class="margin_l15" href="Weixin/Pay/WxPayConfig.aspx?appid=<%#Eval("ID") %>" target='main_right'><i class="fa fa-shopping-cart"></i> 支付配置</a></li>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</div>