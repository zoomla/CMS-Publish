<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="ZoomLaCMS.MIS.OA.Main" MasterPageFile="~/Office/OAMain.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title></title>
<link href="/dist/css/zico.min.css" rel="stylesheet" />
<script src="/JS/DatePicker/WdatePicker.js"></script>
<script src="/JS/ICMS/ZL_Common.js"></script>
<script src="/JS/jquery-ui.min.js"></script>
    <script>
        $(function () {
            $("#sortable").sortable(
                {
                    stop: sortCallBack//拖动结束后回调方法
                });
            $("#sortable").disableSelection();
        });
        function sortCallBack() {
            var s = "";
            $("#sortable li").each(function () { s += $(this).attr("id") + "," });
            setCookie("sortli", s);
        }
        $().ready(function () {
            var s2 = getCookie("sortli");
            if (s2) {
                liArr = s2.split(',');
                for (var i = 0; i < liArr.length; i++) {
                    $li = $("#" + liArr[i]).remove();
                    $("#sortable").append($li);
                }
            }
            $().ready(function () {
                $(".table_mouse tr").addClass("tdbg");
                $(".table_mouse tr").mouseover(function () { $(this).removeClass("tdbg").addClass("tdbgmouseover") }).mouseout(function () { $(this).removeClass("tdbgmouseover").addClass("tdbg") });
                $(".table_mouse tr").dblclick(function () { v = $(this).find("#chkID").val(); location = "ViewContent.aspx?Gid=" + v; });
            });
        });
    </script>
    <script>
        $().ready(function () {
            $("#user_left").hide();
            $("#user_right").css({ width: '100%' });
        })
</script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
        <div class="container-fluid">
            <ul id="sortable" class="o_sortable row" >
                <li class="ui-state-default col-12 col-md-6" runat="server" id="mainChk1">
                    <div class="OAborder">
                        <div class="duty_t" style="background: url('Images/Document.gif') no-repeat;">
                            <div class="duty_tp d-flex">
                                <span class="oaarrowDown" style="display: none;" onclick="coll2(this);"></span>
								<i class="zi zi_clipboard zi_2x" aria-hidden="true"></i>
                                <span class="title_text">公文流转</span>
								<div class="ml-auto mr-4">
								<i class="zi zi_times" aria-hidden="true" onclick="closeDiv(this);"></i>
                                <i class="zi zi_compress oaarrow" aria-hidden="true"  onclick="coll(this);"></i>
                                <i class="zi zi_expand oaarrow" aria-hidden="true"  onclick="coll2(this);" style="display: none;"></i>
								</div>
                            </div>
                        </div>
                        <div class="content templatelist">
                            <div class="inContent executive">
                                <table class="myTable threeTr table ">
                                    <tr class="hover_hander">
                                        <td scope="col"><a href="javascript:;" onclick="ShowMain('#draftdoc_ul','/Office/Flow/FlowApply.aspx?proid=1')">
											<i class="zi zi_fileEdit zi_3x" aria-hidden="true"></i>
											<div>公文拟稿</div>
                                        </a></td>
                                        <td scope="col">
                                            <a href="javascript:;" onclick="ShowMain('#agencydoc_ul','/Office/Flow/ApplyList.aspx?view=1')">
                                                <i class="zi zi_fileEdit zi_3x" aria-hidden="true"></i>
												<div>待办公文<span id="affairSpan" style="color: red;"></span></div>
                                            </a></td>
                                        <td scope="col"><a href="javascript:;" onclick="ShowMain('#office_ul','/Office/Flow/ApplyList.aspx?view=2')">
                                            <i class="zi zi_fileEdit zi_3x" aria-hidden="true"></i>
											<div>已办事务</div>
                                        </a></td>
                                    </tr>
                                    <tr class="hover_hander">
                                        <td scope="col"><a href="javascript:;" onclick="ShowMain('#senddoc_ul','/Office/Flow/ApplyList.aspx?view=3&proid=2')">
                                            <i class="zi zi_fileEdit zi_3x" aria-hidden="true"></i>
											<div>发文管理</div>
                                        </a></td>
                                        <td scope="col"><a href="javascript:;" onclick="ShowMain('#userinfo_ul','/Office/Flow/ApplyList.aspx?view=3')">
                                            <i class="zi zi_fileEdit zi_3x" aria-hidden="true"></i>
											<div>收文管理</div>
                                        </a></td>
                                        <td scope="col"><a href="javascript:;" onclick="ShowMain('#userinfo_ul','/Office/Doc/FiledList.aspx')">
                                            <i class="zi zi_fileEdit zi_3x" aria-hidden="true"></i>
											<div>传阅管理</div>
                                        </a></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="text-align: right;"><a href="#">More...</a></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </li>
                <li class="ui-state-default col-12 col-md-6" runat="server" id="mainChk2">
                    <div class="OAborder">
                        <div class="duty_t" style="background: url('Images/Branch.gif') no-repeat;">
                            <div class="duty_tp d-flex">
                                <span class="oaarrowDown" style="display: none;" onclick="coll2(this);"></span>
								<i class="zi zi_file zi_2x" aria-hidden="true"></i>
                               <span class="title_text">日常管理</span>
								<div class="ml-auto mr-4">
								<i class="zi zi_times" aria-hidden="true" onclick="closeDiv(this);"></i>
                                <i class="zi zi_compress oaarrow" aria-hidden="true"  onclick="coll(this);"></i>
                                <i class="zi zi_expand oaarrow" aria-hidden="true"  onclick="coll2(this);" style="display: none;"></i>
								</div>
                            </div>
                        </div>
                        <div class="content templatelist">
                            <div class="inContent office">
                                <table class="myTable threeTr table">
                                    <tr class="hover_hander">
                                        <td scope="col"><a href="javascript:;" onclick="ShowMain('#newdoc_ul','/Office/Flow/FlowList.aspx')">
											<i class="zi zi_fileEdit zi_3x" aria-hidden="true"></i>
											<div>新建发文</div>
                                        </a></td>
                                        <td scope="col"><a href="/Office/Flow/ApplyList.aspx?view=3">
                                            <i class="zi zi_fileEdit zi_3x" aria-hidden="true"></i>
											<div>我的公文</div>
                                        </a></td>
                                        <td scope="col"><a href="/Office/Flow/ApplyList.aspx?view=1">
                                            <i class="zi zi_fileEdit zi_3x" aria-hidden="true"></i>
											<div class="oa_item">待审公文
                                            <span class="item_count" id="wait_sp"></span></div>
                                        </a></td>
                                        <td scope="col"><a href="/Office/Flow/ApplyList.aspx?view=2">
                                            <i class="zi zi_fileEdit zi_3x" aria-hidden="true"></i>
											<div>已办公文</div>
                                        </a></td>
                                    </tr>
                                    <tr class="hover_hander"> 
                                        <td scope="col"><a href="javascript:;" onclick="ShowMain('#newdoc_ul','/Office/Flow/FlowList.aspx')" >
                                            <i class="zi zi_fileEdit zi_3x" aria-hidden="true"></i>
											<div>新建发文</div>
                                        </a></td>
                                        <td scope="col"><a href="javascript:;" onclick="ShowMain('#newdoc_ul','/Office/Flow/ApplyList.aspx?view=4')">
                                            <i class="zi zi_fileEdit zi_3x" aria-hidden="true"></i>
											<div>我的借阅</div>
                                        </a></td>
                                        <td scope="col"><a href="javascript:;" onclick="ShowMain('#doclist_ul','/Office/Doc/FiledList.aspx')">
                                            <i class="zi zi_fileEdit zi_3x" aria-hidden="true"></i>
											<div>档案管理</div>
                                        </a></td>
                                        <td scope="col"><a href="javascript:;" onclick="ShowMain('#doclist_ul','/Office/Doc/BorrowList.aspx')">
                                           <i class="zi zi_fileEdit zi_3x" aria-hidden="true"></i>
											<div>借阅记录</div>
                                        </a></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" style="text-align: right;"><a href="#">More...</a></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="ui-state-default col-12 col-md-6">
                    <div class="OAborder">
                        <div class="duty_t">
                            <div class="duty_tp d-flex">
							<i class="zi zi_thlarge zi_2x" aria-hidden="true"> </i>
                            <span class="title_text">系统管理</span>
                            </div>
                        </div>
                        <div class="content templatelist">
                            <div class="inContent email">
                                <table class="myTable threeTr table">
                                    <tr class="hover_hander">
                                        <td scope="col"><a href="Flow/FlowApply.aspx?ProID=1">
                                            <i class="zi zi_signinalt prcess"></i><div>新建收文</div>
                                        </a></td>
                                        <td scope="col"><a href="Flow/FlowApply.aspx?ProID=2">
                                            <i class="zi zi_signoutalt prcess"></i><div>新建发文</div>
                                        </a></td>
                                        <td scope="col"><a href="Flow/FlowApply.aspx?ProID=3">
                                            <i class="zi zi_clock prcess"></i><div>新建请假</div>
                                        </a></td>
                                        <td scope="col"><a href="Flow/FlowApply.aspx?ProID=4">
                                            <i class="zi zi_users prcess"></i><div>新建会议</div>
                                        </a></td>
                                    </tr>
                                    <tr class="hover_hander">
                                        <td scope="col">
                                            <a href="Flow/ApplyList.aspx?view=3&proid=1">
                                                <span class="zi zi_briefcase prcess"></span><div>我的收文</div>
                                            </a>
                                        </td>
                                        <td scope="col">
                                            <a href="Flow/ApplyList.aspx?view=3&proid=2">
                                                <span class="zi zi_newspaper prcess"></span><div>我的发文</div>
                                            </a>
                                        </td>
                                        <td scope="col">
                                            <a href="Flow/ApplyList.aspx?view=3&proid=3">
                                                <span class="zi zi_pensquare prcess"></span><div>我的请假</div>
                                            </a>
                                        </td>
                                        <td scope="col">
                                            <a href="Flow/ApplyList.aspx?view=3&proid=4">
                                                <span class="zi zi_comments prcess"></span><div>我的会议</div>
                                            </a>
                                        </td>
                                    </tr>
                                    
                                </table>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="ui-state-default col-12 col-md-6" runat="server" id="mainChk4">
                    <div class="OAborder">
                        <div class="duty_t" style="background: url('Images/Myemail.gif') no-repeat;">
                            <div class="duty_tp d-flex">
                                <span class="oaarrowDown" style="display: none;" onclick="coll2(this);"></span>
								<i class="zi zi_envelope zi_2x" aria-hidden="true"> </i>
                               <span class="title_text">我的邮箱管理</span>
							   <div class="ml-auto mr-4">
								<i class="zi zi_times" aria-hidden="true" onclick="closeDiv(this);"></i>
                                <i class="zi zi_compress oaarrow" aria-hidden="true"  onclick="coll(this);"></i>
                                <i class="zi zi_expand oaarrow" aria-hidden="true"  onclick="coll2(this);" style="display: none;"></i>
								</div>
                            </div>
                        </div>
                        <div class="content templatelist">
                            <div class="inContent email">
                                <table class="myTable threeTr table">
                                    <tr class="hover_hander">
                                        <td scope="col"><a href="javascript:;" onclick="ShowMain('Mail/MailManage.aspx','/Office/Mail/MessageSend.aspx')">
                                            <i class="zi zi_envelope zi_3x" aria-hidden="true"></i>
											<div>写邮件</div>
                                        </a></td>
                                        <td scope="col"><a href="javascript:;" onclick="ShowMain('Mail/MailManage.aspx','/Office/Mail/Message.aspx')">
                                            <i class="zi zi_envelope zi_3x" aria-hidden="true"></i>
                                            <div class="oa_item">
                                                收邮件<span class="item_count" id="email_unread_sp"></span>
                                            </div>
                                        </a></td>
                                        <td scope="col"><a href="javascript:;" onclick="ShowMain('Mail/MailManage.aspx','/Office/Mail/MessageOutbox.aspx')">
                                            <i class="zi zi_envelope zi_3x" aria-hidden="true"></i>
											<div>发件箱</div>
                                        </a></td>
                                    </tr>
                                    <tr class="hover_hander">
                                        <td scope="col"><a href="javascript:;" onclick="ShowMain('Mail/MailManage.aspx','/Office/Mail/MessageDraftbox.aspx')">
                                            <i class="zi zi_envelope zi_3x" aria-hidden="true"></i>
											<div>草稿箱</div>
                                        </a></td>
                                        <td scope="col"><a href="javascript:;" onclick="ShowMain('Mail/MailManage.aspx','/Office/Mail/MessageGarbagebox.aspx')">
                                            <i class="zi zi_envelope zi_3x" aria-hidden="true"></i>
											<div>垃圾箱</div>
                                        </a></td>
                                        <td scope="col"><a href="javascript:;" onclick="ShowMain('Mail/MailManage.aspx','/Office/Other/StructList.aspx')">
                                           <i class="zi zi_envelope zi_3x" aria-hidden="true"></i>
											<div>通迅录</div>
                                        </a></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" style="text-align: right;"><a href="#">More...</a></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="ui-state-default col-12 col-md-6" runat="server" id="mainChk5">
                    <div class="OAborder">
                        <div class="duty_t">
                            <div class="duty_tp d-flex">
                                <span class="oaarrowDown" style="display: none;" onclick="coll2(this);"></span>
								<i class="zi zi_comments zi_2x" aria-hidden="true"></i>
                                <span class="title_text">最新通知</span>
								<div class="ml-auto mr-4">
								<i class="zi zi_times" aria-hidden="true" onclick="closeDiv(this);"></i>
                                <i class="zi zi_compress oaarrow" aria-hidden="true"  onclick="coll(this);"></i>
                                <i class="zi zi_expand oaarrow" aria-hidden="true"  onclick="coll2(this);" style="display: none;"></i>
								</div>
                            </div>
                        </div>
                        <div class="content templatelist">
                            <div class="inContent o_rnews">
                                <table class="table_li table_mouse">
                                   <%Call.Label("{ZL.Label id=\"输出指定节点标题_无时间属性\" NodeID=\"1\" TitleNum=\"30\" ShowNum=\"10\" /}"); %> 
                                </table>
                                <div class="more text-right"><a href="/Class_1/Default.aspx" target="_blank">More...</a></div>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="ui-state-default col-12 col-md-6" runat="server" id="mainChk6">
                    <div class="OAborder">
                        <div class="duty_t" style="background: url('Images/Bbs.gif') no-repeat;">
                            <div class="duty_tp d-flex">
                                <span class="oaarrowDown" style="display: none;" onclick="coll2(this);"></span>
								<i class="zi zi_users zi_2x" aria-hidden="true"></i>
                                <span class="title_text">论坛交流</span>
								<div class="ml-auto mr-4">
								<i class="zi zi_times" aria-hidden="true" onclick="closeDiv(this);"></i>
                                <i class="zi zi_compress oaarrow" aria-hidden="true"  onclick="coll(this);"></i>
                                <i class="zi zi_expand oaarrow" aria-hidden="true"  onclick="coll2(this);" style="display: none;"></i>
								</div>
                            </div>
                        </div>
                        <div class="content templatelist">
                            <div class="inContent o_rnews">
                                <table class="table_li table_mouse"> 
                                    <ZL:Repeater runat="server" ID="RPT">
                                        <ItemTemplate>
                                            <li><a href="/PItem?id=<%#Eval("ID") %>" target="_blank"><%#Eval("Title") %></a></li>
                                        </ItemTemplate>
                                    </ZL:Repeater>
                                    <%//Call.Label("{ZL.Label id=\"贴吧输出热点新闻标题\" NodeID=\"1\" TitleNum=\"30\" ShowNum=\"10\"  SysNum=\"80\" /}"); %>
                                </table>
                                <div class="more text-right"><a href="/index" target="_blank">More...</a></div>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
        <script type="text/javascript">
            function coll(obj) {
                $p = $(obj).closest('li');
                $p.find(".content").hide("fast");
                $(obj).hide().siblings().show();
            }
            function coll2(obj) {
                $p = $(obj).closest('li');
                $p.find(".content").show("fast");
                $(obj).hide().siblings().show();
            }
            function closeDiv(obj) {
                $p = $(obj).closest('li');
                //$p.hide("fast");
                $li = $p.remove();
            }
        </script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script src="/JS/Modal/APIResult.js"></script>
<script>
    var oamain = { api: "/office/other/oacom.ashx?action="};
oamain.getWaitCount = function () {
    $.post(oamain.api + "oadoc_undeal", {}, function (data) {
        APIResult.ifok(data, function (result) {
            $("#wait_sp").show().text(result); 
        }, function () { console.log("err", data); })
    })
}
oamain.getUnreadEmailCount = function ()
{
    $.post(oamain.api + "email_unread", {}, function (data) {
        APIResult.ifok(data, function (result) {
            $("#email_unread_sp").show().text(result);
        }, function () { console.log("err", data); })
    })
}
//oamain.getNewFiled = function () {
//    $.post(oamain.api + "oadoc_newfiled", {}, function (data) {
//        APIResult.ifok(data, function (result) {
//            $("#oadoc_newfiled_sp").show().text(result);
//        }, function () { console.log("err", data); })
//    })
//}
$(function () {
    oamain.getWaitCount();
    oamain.getUnreadEmailCount();
    setInterval(function () { oamain.getWaitCount(); oamain.getUnreadEmailCount(); }, 8000);
})
</script>
</asp:Content>
