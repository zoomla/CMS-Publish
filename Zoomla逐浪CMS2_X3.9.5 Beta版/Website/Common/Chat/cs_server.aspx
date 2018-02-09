<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cs_server.aspx.cs" Inherits="ZoomLaCMS.Common.Chat.cs_server" ValidateRequest="false" MasterPageFile="~/Common/Chat/chat.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>客服端</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container">
    <div class="chat_top">
        <img class="chat_top_l" src="chat_logo.png" onerror='this.src="/Images/userface/noface.png";' />
        <span id="uinfo_name">
            <asp:Label runat="server" ID="CustomerName_L" Text=" "></asp:Label></span>
        <span class="chat_top_r margin_l5" title="点击关闭聊天窗口"><a href="javascript:;" onclick="closechat();"><i class="fa fa-close"></i></a></span>
        <span class="chat_top_r margin_r5" data-toggle="tooltip" data-placement="left" title="点击查看历史记录"><a href="javascript:;" onclick="ShowHistory();"><i class="fa fa-list-alt"></i>历史记录</a></span>
    </div>
    <div class="chat_main">
        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 hidden-xs chat_main_r" style="padding: 0">
            <div class="chat_main_rt">
                <!-- Nav tabs -->
                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">在线用户</a></li>
                </ul>
            </div>
            <!-- Tab panes -->
            <div class="tab-content">
                <div role="tabpanel" class="tab-pane active" id="home">
                    <div class="chat_main_rc">
                        <ul class="media-list" id="user_list">
                           <%-- <asp:Repeater runat="server" ID="Customs_RPT">
                                <ItemTemplate>
                                    <li onclick="ChangeTalker(<%#"'"+Eval("UserID")+"','"+Eval("UserName")+"','"+Eval("S_FaceImg")+"'" %>);" class="media" id="list_item_<%#Eval("HoneyName") %>">
                                        <div class="media-left">
                                            <img src="<%#Eval("S_FaceImg") %>" class="media-object" onerror="shownoface(this);" /></div>
                                        <div class="media-body media-middle">
                                            <h4 class="media-heading"><%#Eval("UserName") %> <span class="isonline remindgray isonline_<%#Eval("UserID") %>">(检测中)</span></h4>
                                            <span id="unread_<%#Eval("HoneyName") %>" class="badge"></span>
                                        </div>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>--%>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12 chat_main_l" style="padding: 0">
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
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script>
var cs = {};
cs.allOnline = function () {
    curChat.post("cs_allonline", {}, function (data) {
        if (!curChat.isEmpty(data)) {
            var list = JSON.parse(data);
            var ids = "";
            //不存在则补上,存在则更新状态
            for (var i = 0; i < list.length; i++) {
                var uid=list[i].UserID;
                ids +=uid + ",";
                if ($("#list_item_" + uid).length < 1) {
                    var tlp = curChat.tlp_fill(curChat.tlp_online, list[i]);
                    $("#user_list").append(tlp);
                }
            }
            curChat.UpdateOnline(ids);
        }
    });
}
$(function () {
    cs.allOnline();
    setInterval(cs.allOnline, 10000);
})
</script>
</asp:Content>
