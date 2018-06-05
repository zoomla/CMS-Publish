<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MailManage.aspx.cs" Inherits="ZoomLaCMS.MIS.OA.Mail.MailManage" MasterPageFile="~/Office/OAMain.master"  ValidateRequest="false"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>邮箱管理</title> 
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="mainDiv mt-2 p-1">
<div class="mainDiv_l">
<div class="Messge_topul">
<ul class="Messge_nav Messge_navbold list-group">
<li class="list-group-item  list-group-item-action" id="MessageSend"><a href="javascript:;" data-target="/Office/Mail/MessageSend.aspx"><i class="zi zi_pencilalt"></i> 写信</a></li>
<li class="list-group-item list-group-item-action" id="Message1"><a href="javascript:;" data-target="/Office/Mail/Message.aspx"><i class="zi zi_envelope"></i> 收信</a></li>
<li class="list-group-item list-group-item-action" id="Contact"><a href="javascript:;" data-target="/Office/Other/StructList.aspx?action=struct&value=2"><i class="zi zi_userfriends"></i> 通讯录</a></li>
</ul>
</div>

<div class="Messge_mainul mt-1">
<ul class="Messge_nav list-group"> 
<li class="list-group-item list-group-item-action"><a href="javascript:;" data-target="/Office/Mail/Message.aspx">收件箱 <span style="color:red;">(<%=GetUnreadMsg()%>)</span></a></li> 
<li class="list-group-item list-group-item-action" id="MessageOutbox"><a href="javascript:;" data-target="/Office/Mail/MessageOutbox.aspx">发件箱</a></li>
<li class="list-group-item list-group-item-action" id="MessageDraftbox"><a href="javascript:;" data-target="/Office/Mail/MessageDraftbox.aspx">草稿箱</a></li>
<li class="list-group-item list-group-item-action" id="MessageGarbagebox"><a href="javascript:;" data-target="/Office/Mail/MessageGarbagebox.aspx">垃圾箱</a></li>
</ul>
</div>
<div class="clearfix"></div>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script>
$().ready(function (e) { 
    $(".Messge_nav li a").click(function (e) {
        var str = $(this).attr("data-target");
        if (str != "") {
            $(".Messge_nav li").removeClass("active");
            $(this).parent().addClass("active");
            parent.showRightCnt(str);
        }
    });
}); 
</script>
</asp:Content>