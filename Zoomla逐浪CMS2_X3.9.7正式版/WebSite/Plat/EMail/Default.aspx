<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Plat.EMail.Default"  MasterPageFile="~/Plat/Main.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>收件箱</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<div class="row p-0 m-0">
    <div class="colwrap platcontainer col-md-3  offset-md-1">
        <div class="col_head">
            <span class="title"><i class="zi zi_inbox"></i> 收件箱</span>
            <div class="opwrap">
             <%--   <a href="MailWrite.aspx"><i class="zi zi_pencilalt" style="font-size:25px;"></i> 新邮件</a>--%>
                <a href="MailList.aspx" title="更多邮件"><i class="zi zi_ellipsish"></i></a>
            </div>
        </div>
        <div class="col_body">
            <asp:Repeater runat="server" ID="Rece_RPT" EnableViewState="false">
                <ItemTemplate>
                    <div class="item" id="email_<%#Eval("id") %>">
                        <div class="item_tit"><a href="MailDetail.aspx?ID=<%#Eval("ID") %>" title="浏览"><i class="zi zi_envelopeOpen"></i> <%#Eval("Title") %></a></div>
                        <div class="item_op">
                            <a href="MailWrite.aspx?reply=<%#Eval("ID") %>"><i class="zi zi_share" title="回复"></i></a>
                            <a href="javascript:;" onclick="email.del(<%#Eval("ID") %>);"><i class="zi zi_trashalt" title="删除"></i></a>
                            <span class="item_from">来自：<%#Eval("Receiver") %></span>
                            <span class="item_date"><%#Eval("MailDate","{0:yyyy年MM月dd日 HH:mm}") %></span>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div runat="server" id="Rece_Empty" class="empty_body" visible="false">
                <div class="text-center"><i class="zi zi_tmMixcloud" style="font-size:120px;"></i></div>
                <div class="empty_txt">收件箱中没有信息</div>
            </div>
        </div>
    </div>
    <div class="colwrap platcontainer col-md-3">
        <div class="col_head">
            <span class="title"><i class="zi zi_history"></i> 已发邮件</span>
            <div class="opwrap">
                <a href="MailWrite.aspx"><i class="zi zi_pencilalt" style="font-size:25px;"></i> 新邮件</a>
                <a href="MailList.aspx?mailtype=1" title="我的邮件"><i class="zi zi_ellipsish"></i></a>
            </div>
        </div>
        <div class="col_body">
            <asp:Repeater runat="server" ID="Send_RPT" EnableViewState="false">
                <ItemTemplate>
                    <div class="item" id="email_<%#Eval("id") %>">
                        <div class="item_tit"><a href="MailDetail.aspx?ID=<%#Eval("ID") %>" title="浏览"><i class="zi zi_envelopeOpen"></i> <%#Eval("Title") %></a></div>
                        <div class="item_op">
                            <a href="MailDetail.aspx?ID=<%#Eval("ID") %>"><i class="zi zi_eye" title="浏览"></i></a>
                            <a href="javascript:;" onclick="email.del(<%#Eval("ID") %>);"><i class="zi zi_trashalt" title="删除"></i></a>
                            <span class="item_from">来自：<%#Eval("Receiver") %></span>
                            <span class="item_date"><%#Eval("MailDate","{0:yyyy年MM月dd日 HH:mm}") %></span>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <div runat="server" id="Send_Empty" class="empty_body" visible="false">
                <div class="text-center"><i class="zi zi_coffee" style="font-size:120px;"></i></div>
                <div class="empty_txt">发件箱中没有信息</div>
            </div>
        </div>
    </div>
    <div class="colwrap platcontainer col-md-3">
        <div class="col_head">
            <span class="title"><i class="zi zi_paper"></i> 站内信息</span>
            <div class="opwrap">
                <a href="/Plat/Mail/MessageSend.aspx"><i class="zi zi_plus" style="font-size:25px;"></i> 新联络</a>
                <a href="/Plat/Mail/" title="更多信息"><i class="zi zi_ellipsish"></i></a>
            </div>
        </div>
        <div class="col_body">
            <asp:Repeater runat="server" ID="SiteMail_RPT" EnableViewState="false">
                <ItemTemplate>
                    <div class="item" id="mail_<%#Eval("MsgID") %>">
                        <div class="item_tit"><a href="/Plat/Mail/MessageRead.aspx?id=<%#Eval("MsgID") %>"><i class="zi zi_commentalt"></i> <%#Eval("Title") %></a></div>
                        <div class="item_op">
                            <a href="/Plat/Mail/MessageSend.aspx?ID=<%#Eval("MsgID") %>"><i class="zi zi_commentalt" title="回复"></i></a>
             <%--               <a href="javascript:;" onclick="email.mail_del(<%#Eval("MsgID") %>);"><i class="zi zi_trashalt" title="删除"></i></a>--%>
                            <span class="item_from">来自：<%#GetUName() %></span>
                            <span class="item_date"><%#Eval("PostDate","{0:yyyy年MM月dd日 HH:mm}") %></span>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
             <div runat="server" id="SiteMail_Empty" class="empty_body" visible="false">
                <div class="text-center"><i class="zi zi_bell" style="font-size:120px;"></i></div>
                <div class="empty_txt">没有站内信</div>
            </div>
        </div>
    </div>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Modal/APIResult.js"></script>
<script>
$(function () { leftnav.enabled = false; setactive("办公"); });
var email = { api: "/Plat/Email/email.ashx?action=" };
email.del = function (id) {
    if (!confirm("确定要删除吗?")) { return false; }
    var $item = $("#email_" + id);
    $item.remove();
    $.post(email.api + "del", { "ids": id }, function (data) {
        var model = APIResult.getModel(data);
        if (!APIResult.isok(model)) { console.log(model.retmsg); }
    })
}</script>
</asp:Content>