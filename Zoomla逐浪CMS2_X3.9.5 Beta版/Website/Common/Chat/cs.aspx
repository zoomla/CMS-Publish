<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cs.aspx.cs" Inherits="ZoomLaCMS.Common.Chat.cs" ValidateRequest="false" MasterPageFile="~/Common/Chat/chat.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>在线客服</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container">
<div class="chat_top">
<img class="chat_top_l" src="chat_logo.png" onerror='this.src="/Images/userface/noface.png";' />
<span id="uinfo_name"><asp:Label runat="server" ID="CustomerName_L" Text="尚未指定客服"></asp:Label></span>
<span class="chat_top_r margin_l5" title="点击关闭聊天窗口"><a href="javascript:;" onclick="closechat();" ><i class="fa fa-close"></i></a></span>
<span class="chat_top_r margin_r5" data-toggle="tooltip" data-placement="left" title="点击查看历史记录"><a href="javascript:;" onclick="ShowHistory();"><i class="fa fa-list-alt"></i> 历史记录</a></span>
</div>
<div class="chat_main">
<div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 hidden-xs chat_main_r" style="padding:0">
<div class="chat_main_rt">
<!-- Nav tabs -->
<ul class="nav nav-tabs" role="tablist">
<li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">客服人员</a></li>
</ul>
</div>
<!-- Tab panes -->
<div class="tab-content">
<div role="tabpanel" class="tab-pane active" id="home">
<div class="chat_main_rc">
<ul class="media-list">
<asp:Repeater runat="server" ID="Customs_RPT">
<ItemTemplate>
<li onclick="ChangeTalker(<%#"'"+Eval("UserID")+"','"+Eval("UserName")+"','"+Eval("S_FaceImg")+"'" %>);" class="media" id="list_item_<%#Eval("HoneyName") %>">
<div class="media-left"><img src="<%#Eval("S_FaceImg") %>" class="media-object" onerror="shownoface(this);" /></div>
<div class="media-body media-middle">
<h4 class="media-heading"><%#Eval("UserName") %> <span class="isonline remindgray isonline_<%#Eval("UserID") %>">(检测中)</span></h4>
<span id="unread_<%#Eval("HoneyName") %>" class="badge"></span>
</div>
</li>
</ItemTemplate>
</asp:Repeater>
</ul>
</div>
</div>
</div>
</div>

<div class="col-lg-9 col-md-9 col-sm-9 col-xs-12 chat_main_l" style="padding:0">
<div class="chat_container">
<div id="chat_body_list"></div>
<div id="mymsg">
<textarea id="content" style="height: 135px;"></textarea>
<div class="chat_send">
<span class="remindgray">支持Ctrl+Enter快捷键发送信息</span>
<button type="button" id="sendbtn" class="btn btn-primary pull-right" disabled="disabled" onclick="SendMsg();">发送</button>
<div class="clearfix"></div>
</div>
</div>
</div>
</div>
<div class="clearfix"></div>
</div>
<asp:HiddenField runat="server" ID="UserID_Hid" />
</div>
<div class="list_body" hidden>
<div class="chat_header">
<asp:TextBox CssClass="form-control" placeholder="搜索联系人" onkeyup="SearchUserList()" ID="UserSearch_T" runat="server"></asp:TextBox></div>
<ul style="height: 426px; overflow-y: auto;">
<ul>
<li class="list_group" id="visitor_ul" visible="false" runat="server">
<div class="list_group_title">
<span class="fa fa-chevron-right remindgray"></span>
<span>游客</span>
<span class="remindgray" style="float: right; margin-right: 10px;">
<asp:Label runat="server" ID="Unum_L"></asp:Label>
</span>
<div style="clear: both; height: 8px;"></div>
</div>
</li>
<ul class="list_item_body" id="visitorlist">
<asp:Repeater runat="server" ID="Y_RPT">
<ItemTemplate>
<li onclick="ChangeTalker(<%#"'"+Eval("UserID")+"','"+Eval("UserName")+"','"+Eval("UserFace")+"'" %>);" class="list_item" id="list_item_<%#Eval("UserID") %>">
<img src="<%#Eval("UserFace") %>" class="member_face" onerror="shownoface(this);" />
<p class="member_nick">
<%#Eval("UserName") %><br />
<span class="isonline remindgray isonline_<%#Eval("UserID") %>">(检测中)</span>
<span id="unread_<%#Eval("UserID") %>" class="badge"></span>
</p>
<div style="clear: both;"></div>
</li>
</ItemTemplate>
</asp:Repeater>
</ul>
</ul>
<ul>
<li class="list_group" id="customs_ul" visible="false" runat="server">
<div class="list_group_title">
<span class="fa fa-chevron-right remindgray"></span>
<span>客服人员</span>
<span class="remindgray" style="float: right; margin-right: 10px;">
<asp:Label runat="server" ID="Label1" Text="0"></asp:Label>
</span>
<div style="clear: both; height: 8px;"></div>
</div>
</li>
<ul class="list_item_body">
</ul>
</ul>
<ul>
<li class="list_group">
<div class="list_group_title">
<span class="fa fa-chevron-right remindgray"></span>
<span>我的好友</span>
<span class="remindgray" style="float: right; margin-right: 10px;">
<asp:Label runat="server" ID="Friend_Num"></asp:Label>
</span>
<div style="clear: both; height: 8px;"></div>
</div>
</li>
</ul>
<ul class="list_search" style="display: none;">
</ul>
</ul>
</div>
<div style="float: left; padding-left: 10px; display: none;">
<input type="button" value="获取在线用户" onclick="GetOnlineList();" />
<div>
<audio src="msg.mp3" id="msg_ad" />
</div>
<ul>
<li>
<img id="myfaceimg" style="width: 80px; height: 80px;" onerror="shownoface(this);" /></li>
<li>名字:<input type="text" id="myname_t" /></li>
<li>ID:<input type="text" id="myid_t" /></li>
<li>在线用户：<textarea id="onlineids_text" style="height: 100px;"></textarea>
</li>
<li>与谁聊:<input type="text" id="ReceUser_Hid" />
<input type="button" value="测试" onclick="testF();" />
<input type="button" value="接收" onclick="GetMsg();" />
</li>
<li>获取在线用户:</li>
</ul>
<input type="text" id="test_fid" />
<button type="button" onclick="AddFriend()">添加好友</button>
</div>
<div class="modal fade" id="modeldiv" data-backdrop="static" style="top: 20%; left: 20%;">
<div class="modal-dialog" style="width: 300px;">
<div class="modal-content">
<ul class="nav nav-tabs">
<li class="active"><a href="#tab0" data-toggle="tab">用户登录</a></li>
<li><a href="#tab1" data-toggle="tab">游客登录</a></li>
</ul>
<div class="modal-body">
<div class="tab-content">
<div class="tab-pane active" id="tab0">
<input type="text" id="uname_t" class="form-control" placeholder="用户名" onkeyup="GetEnterCode('focus','pwd_t');" />
<input type="password" id="pwd_t" class="form-control" onkeyup="GetEnterCode('click','ulogin_btn');" />
<input type="button" id="ulogin_btn" value="登录" class="btn btn-primary" onclick="AJAXLogin(); disBtn(this, 2000);" />
<input type="button" value="注册" class="btn btn-default" onclick="GetToReg();" />
</div>
<div class="tab-pane" id="tab1">
<input type="text" id="visname_t" class="form-control" value="游客" onkeyup="GetEnterCode('click','vlogin_btn');" />
<input type="button" id="vlogin_btn" class="btn btn-primary" value="游客登录" onclick="VisitorLogin(); disBtn(this, 2000);" />
</div>
</div>
</div>
</div>
</div>
</div>
<asp:HiddenField runat="server" ID="Wel_Hid" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script"></asp:Content>