<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Plat.Blog.Default"  MasterPageFile="~/Plat/Main.master" ValidateRequest="false" EnableViewState="false"%>
<asp:Content runat="server" ContentPlaceHolderID="Head"> 
<link type="text/css" rel="stylesheet" href="/JS/atwho/jquery.atwho.css" /> 
<link type="text/css" href="/dist/css/zico.min.css" rel="stylesheet"/>
<link type="text/css" rel="stylesheet" href="/Plugins/FancyBox/jquery.fancybox.css" />
<link type="text/css" rel="stylesheet" href="/Plugins/FancyBox/jquery.fancybox-thumbs.css" />
<link type="text/css" rel="stylesheet" href="/Plugins/Third/Calendar/Calendar.css" />
<script src="/Plugins/Ueditor/ueditor.config.js"></script>
<script src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<script src="/Plugins/FancyBox/jquery.fancybox.js"></script>
<script src="/Plugins/FancyBox/jquery.fancybox-thumbs.js"></script>
<script src="/JS/Controls/Textarea.js"></script>
<title><asp:Literal runat="server" ID="Title_T"></asp:Literal></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container">
<div class="col-12 col-lg-8 offset-lg-2  platcontainer">
<div id="pcmsgdiv">
  <div class="msgop">
      <ul id="child_nav_ul" class="d-flex justify-content-start child_nav_ul">
          <li onclick="MsgTypeFunc('.tab1');"><a href="javascript:;" data-type=".tab1" class="active" title="快速分享"><i class="zi zi_sharealt"></i></a></li>
          <li onclick="MsgTypeFunc('.tab2');"><a href="javascript:;" data-type=".tab2" title="投票调查"><i class="zi zi_ticketalt"></i></a></li>
          <li><a href="javascript:B_Msg.showLong();"><i class="zi zi_arrowsalt" title="简洁长文模式"></i></a></li>
      </ul>
      <div class="clearfix"></div>
  </div>
  <table id="votetable" class="votetable tab2 sys_table">
	<tr>
	  <th class="w6rem_lg">创建标题：</th>
	  <td><asp:TextBox runat="server" ID="VoteTitle_T" class="form-control required" /></td>
	</tr>
	<tr>
	  <th>投票选项：</th>
	  <td><label class='vote_op_label'>1.</label>
		<input type="text" name="VoteOption_T1"  class='vote_op_input form-control required' /></td>
	</tr>
	<tr class='votetr'>
	  <th></th>
	  <td><label class='vote_op_label'>2.</label>
		<input type='text' name='VoteOption_T' class='vote_op_input form-control required' /></td>
	</tr>
	<tr>
	  <th></th>
	  <td><input type="button" value="添加选项" class="btn btn-info btn-sm" onclick="AddVoteOP();"/></td>
	</tr>
	<tr>
	  <th>截止时间：</th>
	  <td><asp:TextBox runat="server" ID="EndDate_T" onfocus="WdatePicker({dateFmt:'yyyy/MM/dd HH:mm'});" class="form-control required date"></asp:TextBox></td>
	</tr>
	<tr>
	  <th>匿名投票：</th>
	  <td><input type="checkbox" runat="server" id="IsAnony"/></td>
	</tr>
	<tr>
	  <th>投票结果：</th>
	  <td><input type="radio" name="IsView" value="1" checked="checked" id="IsView1" />
		<label for="IsView1">投票人可见</label></td>
	</tr>
	<tr>
	  <th></th>
	  <td><input type="radio" name="IsView" value="2" id="IsView2" />
		<label for="IsView2">发起人可见</label></td>
	</tr>
  </table>
  <textarea id="MsgContent_T" name="MsgContent_T" class="atwho msgcontent" placeholder="今天说点什么?"><%=Write %></textarea>
  <div id="uploader"><ul class="filelist"></ul></div>
  <div class="msgop msg_opdiv"><a href="javascript:;" onclick="ShowDiv('topicDiv');"><span class="spanico">#</span><span>话题</span></a>
	<div id="topicDiv" class="msgex" style="display: none;">
	  <div class="text-right"><span title="关闭" class="zi zi_times op" onclick="$('#topicDiv').hide();"></span></div>
        <ul id="topicul" class="topicul">
            <li class="dropdown-item">#插入话题#</li>
            <li class="dropdown-item">#工作交流#</li>
            <li class="dropdown-item">#更新记录#</li>
            <li class="dropdown-item">#请假申请#</li>
            <li class="dropdown-item">#每日小记#</li>
            <li class="dropdown-item">#心情分享#</li>
            <li class="dropdown-item" style="border-bottom: 1px solid #ddd;">#Bug反馈#</li>
        </ul>
	</div>
	<a href="javascript:;" onclick="ShowGroupAt();"><span class="spanico">@</span><span>AT</span>
        <iframe id="GroupAT_ifr" class="msgex"></iframe>
    </a>
      <a href="javascript:;" onclick="ShowDiv('ImgFace_Div');"><span class="zi zi_heart spanico"></span><span>表情</span>
          <div id="ImgFace_Div" class="msgex">
              <asp:HiddenField runat="server" ID="ImgFace_Hid" Value="[]" />
              <iframe src="" class="emotion_ifr" id="ImgFace_if"></iframe>
          </div>
      </a>
      <a href="javascript:;" onclick="ShowFileUP();"><span class="zi zi_paperclip spanico"></span><span>附件</span></a>
      <a href="javascript:;" onclick="ShowSign();"><span class="zi zi_mapmarkeralt spanico"></span>签到</a>
      <span class="msg_opdiv_span">
          <a href="javascript:;" id="addmsg_btn" class="tab1" style="color:#0066cc;" onclick="B_Msg.add();">分享</a>
          <a href="javascript:;" id="addmsg_wait_btn" style="width:60px;display:none;"><i class="zi zi_spinner zi_pulse" style="font-size:1.3em;"></i></a>
          <a href="javascript:;" ID="addvote_btn" onclick="B_Msg.addVote();" class="tab2" Style="color: #0066cc; display: none;">发布</a>
      </span>
	  <a href="javascript:;" class="float-right border_l" onclick="ShowDiv('viewgroup');">
	  <span class="zi zi_eye margin_l5 spanico"></span> <span id="canSee_Span">公开</span></a><!--根据其中所选-->
	<ul id="bloglist" runat="server" class="ViBoList" visible="false">
	  <li runat="server" id="sina_li" visible="false" title="同步到新浪微博"  onclick="Blog_Chk()"> <span id="weibo_icon" class="zi zi_tmWeibo blogicon" style="font-size:23px;line-height:25px;color:#999;"></span>
		<input type="checkbox" class="hidden_div"  name="sync_chk" value="sina" />
	  </li>
	  <li runat="server" id="qqblog_li" visible="false" title="同步到腾迅微博" onclick="Blog_Chk()"> <span id="qq_icon" class="zi zi_tmQq blogicon" style="font-size:20px;line-height:25px;color:#999;" ></span>
		<input type="checkbox" id="qqchk" class="hidden_div" name="sync_chk" value="qqblog" />
	  </li>
	</ul>
	<div id="noplat_div" runat="server" class="noneTitle_Title hidden-xs" visible="false"> <span>未绑定微博平台,<a style="color:#0066cc;float:none;" href="/Plat/UPCenter.aspx?Set=1">设置</a></span></div>
	
	<table class="table msgex" id="viewgroup">
	  <tr>
		<td onclick="ShowDiv('viewgroup');CanSeeFun('all');" class="cursour">公开</td>
	  </tr>
	  <asp:Repeater runat="server" ID="GroupRpt" EnableViewState="false">
		<ItemTemplate>
		  <tr>
			<td><label class="oplabel">
				<input type="checkbox" name="GroupIDS_Chk" value="<%#Eval("ID") %>" data-gname="<%#Eval("GroupName") %>" onclick="CanSeeFun('single');" />
				<%#Eval("GroupName") %></label></td>
		  </tr>
		</ItemTemplate>
	  </asp:Repeater>
        <tr><td><label class="oplabel"><input type="checkbox" name="GOnlyMe_Chk" value="0" data-gname="仅自己" onclick="CanSeeFun('onlyme');" /> 仅自己</label></td></tr>
	</table>
    <div class="clearfix"></div>
  </div>
</div>
<!--信息分区 End-->
<div runat="server" id="mobilemsgdiv" visible="true">
<a href="javascript:;" id="xs_share" class="bounceInUp_css xs_share" >+</a>
<div class="xs_share_box">
<ul class="list-unstyled">
    <li><a href="javascript:;" onclick="$('#pcmsgdiv').show();" data-type=".tab1"><span>写分享</span><i class="zi zi_sharealt"></i></a></li>
    <li><a href="javascript:;" onclick="$('#pcmsgdiv').show();MsgTypeFunc('.tab2');" data-type=".tab2"><span>发投票</span><i class="zi zi_anchor"></i></a></li>
    <li><a href="javascript:B_Msg.showLong();"><span>长文章</span><i class="zi zi_outdent"></i></a></li>
    <li><a href="/Plat/Blog/PosSign.aspx?s=mobile"><span>写签到</span><i class="zi zi_mapmarkeralt"></i></a></li>
</ul>
</div>
</div>
<div class="clearfix"></div>
<div>
    <a class="pull-right" style="height:68px;margin-right:10px;line-height:68px;" title="按日期筛选">
        <i class="zi zi_calendar r_gray" id="datef_btn" style="cursor:pointer;"></i>
    </a>
  <ul class="content_nav_ul">
	<li onclick="location='<%:GetUrl("?") %>';"><a href="javascript:;">全部</a></li>
    <li onclick="location='<%:GetUrl("?filter=atuser&liop=1") %>'">@我的</li>
	<li class="minmd_hidden" onclick="location='<%:GetUrl("?msgtype=1&liop=2") %>';"><a href="javascript:;">通知</a></li>
	<li onclick="location='<%:GetUrl("?msgtype=2&liop=3") %>';"><a href="javascript:;">投票</a></li>
	<li class="minmd_hidden" onclick="location='<%:GetUrl("?msgtype=1&liop=4") %>';"><a href="javascript:;">文章</a></li>
	<li onclick="location='<%:GetUrl("?filter=colled&liop=5") %>';"><a href="javascript::">收藏</a></li>
  </ul>
  <div class="clearfix"></div>
</div>
<div id="msglist" class="msglist"></div>
<div class="text-center" style="width: 100%;margin-bottom:10px;">
    <input type="button" id="loadMore_btn" value="加载更多" class="btn btn-info" style="width: 50%;display:none;" onclick="B_Msg.loadMore();" />
    <div id="wait_div">
        <i class="zi zi_spinner zi_pulse" style="font-size:80px;"></i>
        <i class="zi zi_tmZoomlacms" style="font-size: 40px;position:relative;left:-57px;top:-15px;"></i>
    </div>
</div>
<!--模态框区-->
<div class="hidden_div"> 
    <a href="javascript:;" data-toggle="modal" data-target="#myModal" id="Model_Btn"></a> 
    <a href="javascript:;" data-toggle="modal" data-target="#fileup_div" id="FileUP_Btn"></a>
    <a href="javascript:;" data-toggle="modal" data-target="#forward_div" id="Forward_Btn"></a>
  <asp:HiddenField runat="server" ID="UserInfo_Hid"/>
</div>
<div class="modal fade bd-example-modal-lg" id="myModal">
  <div class="modal-dialog modal-lg">
	<div class="modal-content">
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		<span class="modal-title">文件预览</span> <a href="#" id="preview_down_a" title="下载该文档">下载</a> <a href="javascript:;" id="largepre_a" target="_blank" title="全屏浏览">全屏</a> </div>
	  <div class="modal-body">
		<iframe id="preview_if" class="ifr_mid" style="width:100%; height:630px;border:none;" scrolling="no"></iframe>
	  </div>
	  <div class="modal-footer">
		<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
	  </div>
	</div>
  </div>
</div>
<div id="fileup_div" class="hidden_div">
    <input type="file" id="file_upload_1" />
    <input type="hidden" id="Attach_Hid" name="Attach_Hid" />
</div>
<div class="modal bd-example-modal-lg" id="forward_div">
  <div class="modal-dialog modal-lg">
	<div class="modal-content">
	  <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
		<span class="modal-title">内容转发</span></div>
	  <div class="modal-body">
		<div id="forward_his_div"> </div>
		<div id="forward_my_div margin_t5">
		  <asp:HiddenField runat="server" ID="Forward_ID_Hid"/>
		  <asp:TextBox runat="server" ID="ForMsg_Text" TextMode="MultiLine" CssClass="formsg_text" placeholder="说说转发理由吧!!"></asp:TextBox>
		</div>
	  </div>
	  <div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		<asp:Button runat="server" ID="Froward_Btn" OnClick="Froward_Btn_Click" Text="转发" class="btn btn-primary"/>
	  </div>
	</div>
  </div>
</div>
<!--站内邮-->
<div id="privatediv" class="modal site_mail_div bd-example-modal-lg ">
  <div class="modal-dialog modal-lg modal-dialog-centered">
	<div class="modal-content">
	  <div class="modal-body padding0">
		<div class="site_mail_title d-flex"><span>站内邮</span><span class="zi zi_times grayremind ml-auto EClose_btn" title="关闭" onclick="PrivateClose();"></span> </div>
		<table id="privatetable">
		  <tr>
			<td class="tdleft"></td>
			<td><span class="grayremind">你可以发邮件给一个或多个同事</span></td>
		  </tr>
		  <tr>
			<td class="centertd"><span class="grayremind">收信人：</span></td>
			<td><div class="input-group width100">
				<input type="text" id="ReceUser" class="form-control width100"/>
				<input type="hidden" value="ReceUser_Hid" />
				<span class="input-group-append cursour" onclick="PrivateSelUser('private');"><span class="input-group-text"><i class="zi zi_plus"></i></span></span></div></td>
		  </tr>
		  <tr>
			<td class="centertd"><span class="grayremind">内容：</span></td>
			<td><asp:TextBox CssClass="site_mail_content" runat="server" ID="MailContent" TextMode="MultiLine"/></td>
		  </tr>
		  <tr>
			<td></td>
			<td class="text-right"><input type="button" id="prvatesend_btn" value="发送" onclick="PrivateSend();" class="btn btn-outline-info" /></td>
		  </tr>
		</table>
	  </div>
	</div>
  </div>
</div>
<%=Call.GetUEditor("MailContent",1) %>
<div id="seluserdiv" class="fixifrdiv width800 hidden_div">
  <div class="panel panel-primary">
	<div class="panel-heading">
	  <h3 class="panel-title text-center pull-left">请选择用户</h3>
	  <span class="zi zi_times cursour pull-right" title="关闭" onclick="$('#seluserdiv').hide();"></span>
	  <div class="clearfix"></div>
	</div>
	<div class="panel-body">
	  <iframe runat="server" id="User_IFrame" class="ifr_mid" name="main_right" src="" frameborder="0"></iframe>
	</div>
  </div>
</div>
</div>
</div>
<div class="r_uinfo_div" id="ShowUser_Div">
    <iframe class="r_uinfo_ifr" id="ShowUser_if"></iframe>
</div>
<div class="ed_main" id="long_div" style="display:none;">
    <div class="ed_header">
        <div class="container ed_header_wrap">
           <strong>写作模式</strong>
            <p class="pull-right">
            <a href="javascript:;" class="btn btn-default save" id="save_btn" onclick="B_Msg.addLong();">发布文章</a>
            <a href="javascript:;" class="btn btn-default back" id="back_btn" onclick="B_Msg.closeLong();"><i class="zi zi_times"></i></a>
            </p>
        </div>
    </div>
    <div class="container"><textarea id="long_t" style="width: 100%; height: 600px;"></textarea></div>
</div>
<div style="position:absolute;right:10px;top:80px;" class="plat_right hidden-sm hidden-xs">
    <%--<div class="comp_body"><div class="comp_tit"><i class="zi zi_cog r_gray"></i><a class="r_gray" href="javascript:;"> 挂件自定义</a></div></div>--%>
    <div class="comp_body">
		<div class=" mt-2">
        <div class="comp_tit"><i class="zi zi_calendar" style="color:#2EA8FF;"></i> 日历</div>
        <div class="comp_content">
        <div id="CalendarMain">

        </div>
    </div>
    </div>
    </div>
    <div class="comp_body work-clock">
        <div class="comp_tit">
		<div class="d-flex mt-2">
		<i class="zi zi_clock" style="color:#51C23A;"></i> <span>考勤</span>
		<a href="/Plat/Blog/Attendance.aspx" class="more ml-auto mr-2" title="查看记录"><i class="zi zi_forRight"></i></a>
		</div>
		</div>
        <div class="comp_content">
            <div style="border-bottom:0;">
                <table>
                    <colgroup><col style="width:70px;"/><col style="width:230px;" /></colgroup>
                    <tbody>
                        <tr id="signin_tr" class="first">
                            <td class="title"><div>上班</div><span>08:30</span></td>
                            <td class="clock">
                                <span class="time"></span>
                                <span class="ip"></span>
                            </td>
                        </tr>
                        <tr id="signout_tr">
                            <td class="title"><div>下班</div><span>18:00</span></td>
                            <td class="clock">
                                <span class="time"><b></b></span>
                                <span class="ip"></span>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="attend-btn text-center p-1">
				<button id="signin_btn" onclick="sign.signin()" type="button" class="btn btn-info hidden w-100 "><i class="zi zi_signinalt"></i> 签到</button>
                <button id="signout_btn" onclick="sign.signout()" type="button" class="btn btn-info w-100"><i class="zi zi_signoutalt"></i> 签退</button>
            </div>
        </div>
    </div>
    <div class="comp_body">
        <div class="comp_tit">
		<div class="d-flex mt-2">
		<i class="zi zi_desktop" style="color:#FF8C1A"></i>
		<span>公告</span>
		<a href="/Index" target="_blank" class="more ml-auto mr-2" title="查看更多"><i class="zi zi_forRight"></i></a>
		</div>
		</div>
        <div class="comp_content">
            <asp:Repeater ID="Cate_RPT" runat="server" EnableViewState="false" OnItemDataBound="Cate_RPT_ItemDataBound">
                <ItemTemplate>
                  <%--  <div class="panel-heading">
                        <h3 class="panel-title"><%#Eval("Catename") %> <a title="在该板块发表贴子" target="_blank" href="/EditContent?ID=-1&Cid=<%#Eval("Cateid") %>"><span class="zi zi_pluscircle" style="color: #1796BF;"></span></a><span class='badge pull-right'><a target="_blank" style="color: white;" href='/PClass?id=<%#Eval("Cateid") %>'>more</a></span></h3>
                    </div>--%>
                    <ul class="list-group">
                        <asp:Repeater ID="Bar_RPT" EnableViewState="false" runat="server">
                            <ItemTemplate>
                                <li class="list-group-item"><%#getTitle() %></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </ItemTemplate>
            </asp:Repeater>
            <div runat="server" id="Cart_RPT_Empty" visible="false" class="r_gray">没有公告消息</div>
        </div>
    </div>
</div>

<asp:HiddenField runat="server" ID="myplan_hid" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/Plugins/Third/Calendar/Calendar.js"></script>
<script src="/JS/DatePicker/WdatePicker.js"></script>
<script src="/JS/jquery.validate.min.js"></script>
<script src="/JS/jquery.form.js"></script>
<script src="/JS/SelectCheckBox.js"></script>
<script src="/JS/atwho/jquery.atwho.js"></script>
<%--<script src="/Plugins/Uploadify/jquery.uploadify.js"></script>--%>
<script src="/JS/Controls/ZL_Array.js"></script>
<script src="/JS/Controls/DateHelper.js"></script>
<script src="/JS/Modal/APIResult.js"></script>
<script>
var pageSize ="<%=replyPageSize%>";
var atlist="";
$(function () {
	
    if("<%=LView%>"=="timeline"){ $("#pcmsgdiv").hide(); }
    B_Msg.loadMore();
    var liop = "<%:Request.QueryString["liop"]%>";
    if (!liop || liop == "") { $(".content_nav_ul li")[0].className = "active"; }
    else { $(".content_nav_ul li")[liop].className = "active"; }
    //$(".reply_text").autoHeight();
    $.post("/Plat/Common/Common.ashx", { action: "Plat_CompUser" }, function (data) { if (!ZL_Regex.isEmpty(data)) { atlist = JSON.parse(data); InitAt(); } })
    //话题 
    $("#topicul li").click(AddTopic);
    //博客
    Blog_StatusChk();
    //信息保存,分开绑定,避免点分享,无法清除缓存
    $("#MsgContent_T").bind("blur", function () { window.localStorage.PlatMsg = $("#MsgContent_T").val(); })
    $("#MsgContent_T").bind("paste cut", function () {//keyup paste clip
        setTimeout(function () { window.localStorage.PlatMsg = $("#MsgContent_T").val(); }, 100);
    });
    $("#MsgContent_T").keydown(function (e) {
        var event = window.event ? window.event : e;
        if (event.keyCode == "13" && event.ctrlKey) { B_Msg.add(); }
    });
    if (window.localStorage.PlatMsg) { $("#MsgContent_T").val(window.localStorage.PlatMsg); }
    //----------预览
    //$(".athumbnail_img").fancybox({ 'titlePosition': 'over', helpers: { thumbs: { width: 50, height: 50 } } });
    //----------手机下分享
    if ($("#mobilemsgdiv .xs_share_box").is(":visible")) { $("#topcontrol").hide(); }
    TextArea.init();
    sign.init();
    CalendarHandler.initialize();
});
//浏览器窗口大小改变时重加载日历
$(window).resize(function () {
    CalendarHandler.initialize();
});
/*--------Init End---------*/
var diag=new ZL_Dialog();diag.title="文章浏览";diag.width=" ";
var diag1=new ZL_Dialog();diag1.title="文件上传(最多支持5个)";diag1.content="fileup_div";diag1.width=" ";
var mbDiag=new ZL_Dialog();mbDiag.maxbtn=false;mbDiag.backdrop=true;mbDiag.width="mobilediag";
function ShowMBDiag(url, title) {
    mbDiag.url = url;
    mbDiag.title = title;
    mbDiag.ShowModal();
}
function CloseDiag() {
    CloseComDiag();
    mbDiag.CloseModal();
    diag1.CloseModal();
    diag.CloseModal();
}
function ShowSign(){ShowMBDiag("PosSign.aspx","移动签到");}
function ShowByPoint(point) {
    ShowMBDiag("MapByPoint.aspx?Point=" + JSON.stringify(point), "查看签到位置");
}
function OpenWin(type) {
    var url = "";
    switch (type) {
        case 1:
            url = "/Common/PreView/PicView.aspx?s=plat&id=" + arguments[1];
            break;
        case 2:
            url = "/Plat/UPCenter.aspx?Set=1&Remote=true";
            break;
    }
    var myWin = window.open(url, '_blank', 'height=630, width=1030,top=200,left=300,toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no');
}
/*--------Init End---------*/
//后期将其转入JS中,非事件绑定
var B_Plan = {
    list:[],
    init: function () {
        B_Plan.list = JSON.parse($("#myplan_hid").val());
        B_Plan.bind();
        
    },
    //根据数据绑定元素
    bind: function () {
        //绑定事件并更改颜色
        for (var i = 0; i < B_Plan.list.length; i++) {
            var model = B_Plan.list[i];
            model.date = DateHelper.dateToModel(model.startdate);
            model.startdate = model.startdate.split('T')[0];
            $("#CalendarMain .item:not(.lastItem)[data-day='" + model.date.day + "']").addClass("hasplan");
        }
        $("#CalendarMain .hasplan").popover({
            animation: true, placement: 'bottom',
            html: true,
            title: '<div><i class="zi zi_tasks"></i> 我的日程</div>',
            content: function () {
                var list = B_Plan.getbyday($(this).data("day"));
                var $wrap = $('<div style="padding:5px;"></div>');
                var stlp = '<div class="pitem"><span class="pname">@name</span> <span class="r_gray">@startdate</span></div>';
                var $items = JsonHelper.FillItem(stlp, list, null);
                $wrap.append($items);
                return $wrap;
            },
            trigger: "hover"
        }).click(function () {
            window.open("/BU/KE/DailyPlan.aspx");
        });
    },
    getbyday: function (day) {
        //根据日期时间过滤数据
        var data = [];
        for (var i = 0; i < B_Plan.list.length; i++) {
            var model = B_Plan.list[i];
            if (model.date.day == day) { data.push(model); }
        }
        return data;
    }
};
setTimeout(function () { B_Plan.init(); },3000);
</script>
<script src="/JS/ICMS/MainBlog.js?v=20160607"></script>
<script src="/JS/Controls/ZL_Webup.js"></script>
<script>
    var B_Msg = {
    conf: { id: "#msglist", filter: "<%:Filter%>", msgtype: "<%=MsgType%>", skey: "<%=HttpUtility.UrlEncode(Skey)%>", uids: "<%=Uids%>", page: 1, psize: "<%=PSize%>",view:"<%=LView%>", date: "", longInit: false },
    getbodyurl: function () {
        //if (ZL_Regex.isEmpty(B_Msg.conf.uids)) { return "/Plat/Blog/MsgListBody.aspx?"; }
        //else { return "/Plat/Blog/MsgListByUser.aspx?"; }
        
		if (!ZL_Regex.isEmpty(B_Msg.conf.uids) && B_Msg.conf.view == "timeline") {
		return "/Plat/Blog/MsgListByUser.aspx?view=timeline&";}
        else {
		return "/Plat/Blog/MsgListBody.aspx?";}
    },
    showWait: function () {
        $("#loadMore_btn").hide();
        $("#wait_div").show();
    },
    closeWait: function () {
        $("#loadMore_btn").show();
        $("#wait_div").hide();
    },
    add: function () {
        //添加普通分享
        var ref = this;
        if (!DataChk()) { return false; }
        $("#addmsg_btn").hide(); $("#addmsg_wait_btn").show();
        $("form").ajaxSubmit({
            url: "/Plat/Blog/Default.aspx?action=add", success: function (data) {
                ref.rowToFirst(data);
                $("#addmsg_btn").show(); $("#addmsg_wait_btn").hide();
                $("#MsgContent_T").val("");
                //附件
                $("#uploader").hide();
                $("#Attach_Hid").val("");
                $(".filelist").html("");
            }
        });
    },
    showLong: function () {
        //显示添加长文章
        var ref = this;
        if (!ref.conf.longInit) {
            ref.conf.longInit = true;
            ref.conf.longue = UE.getEditor("long_t", { elementPathEnabled: false, wordCountMsg: false, toolbars: [['Undo', 'Redo', 'Bold', 'Italic', 'NumberedList', 'BulletedList', 'Smiley', 'ShowBlocks', 'Maximize', 'underline', 'fontborder', 'strikethrough', '|', 'justifyleft', 'justifycenter', 'justifyright', 'justifyjustify', '|', 'insertimage', 'attachment', 'map']] });
        }
        setTimeout(function () { ref.conf.longue.focus(); }, 500);
        document.getElementById("long_div").style.display = "";
        $("#long_div").height(($(window).height() - 20) + "px");
    },
    closeLong: function () {
        document.getElementById("long_div").style.display = "none";
        //UE.getEditor("long_t").setContent("");
    },
    addLong: function () {
        //添加长文章
        var ref = this;
        var ue = UE.getEditor("long_t");
        if (ZL_Regex.isEmpty(ue.getContentTxt())) { alert("内容不能为空"); return false; }
        if (confirm("确定要发布吗?")) {
            var msg = ue.getContent();
            ref.closeLong();
            $.post("/Plat/Blog/Default.aspx?action=addarticle", { "msg": msg }, function (data) {
                ref.rowToFirst(data);
            });
        }
    },
    addVote: function () {
        var ref = this;
        var edate = new Date($("#EndDate_T").val());
        if (edate < new Date()) { alert("截至日期不能早于当前日期！"); return false; }
        if (!VoteCheck()) { return false; }
        $("#addvote_btn").hide(); $("#addmsg_wait_btn").show();
        $("form").ajaxSubmit({
            url: "/Plat/Blog/Default.aspx?action=addvote", success: function (data) {
                ref.rowToFirst(data);
                $("#addvote_btn").show();
                $("#addmsg_wait_btn").hide();
                $("#MsgContent_T").val("");
                //投票内容
                $("#VoteTitle_T,.vote_op_input").val("");
                //附件
                $("#uploader").hide();
                $("#Attach_Hid").val("");
                $(".filelist").html("");
            }
        });
    },
    addRead: function (ids) {//阅读量统计
        $.post("/Plat/Common/Common.ashx", { action: "AddRead", ids: ids }, function (data) { })
    },
    /*--------数据加载---------*/
    rowToFirst: function (id) {
        var ref = this;
        if (!ZL_Regex.isEmpty(id) && parseInt(id) > 0) {
            var $body = $(ref.conf.id);
            var $div = $("<div>");
            var url = ref.getbodyurl() + "ID=" + id;
            $div.load(url, {}, function () {
                var $first = $body.find(".msgitem:first");
                ref.event($div);
                if ($first.length < 1) { $body.append($div.children()); }
                else { $first.before($div.children()) }
            });
            ref.addRead(id);
        }
        else { console.log("加载失败ID=" + id); }
    },
    //用于投票等操作后,替换已有的数据
    loadVote: function (id) {//rowToRender
        console.log("loadVote");
        var ref = this;
        var $msg = $("#msgitem-" + id);
        var $div = $("<div>");
        var url = ref.getbodyurl() + "ID=" + id;
        $div.load(url, {}, function () {
            $msg.replaceWith($div.children());
        });
    },
    clear: function () {
        var ref = this;
        ref.conf.page = 1;
        $(ref.conf.id).html("");
    },
    loadMore: function () {//声明了
        var ref = this;
        var $body = $(ref.conf.id);
        var $div = $("<div>");
        ref.showWait();
        //--------------
        var url = ref.getbodyurl();
        url += "filter=" + ref.conf.filter + "&msgtype=" + ref.conf.msgtype
            + "&skey=" + ref.conf.skey + "&uids=" + ref.conf.uids + "&page=" + ref.conf.page + "&psize=" + ref.conf.psize + "&date=" + ref.conf.date;
        $div.load(url, {}, function () {
            //数据是否全部加载
            if ($div.find(".msgitem").length < ref.conf.psize) {
                var btn = document.getElementById("loadMore_btn");
                btn.disabled = true;
                btn.value = "没有更多数据了";
            }
            //须在$div放入$body前取出ids
            var ids = '';
            $div.find(".msgid").each(function (index, ele) {
                ids += ele.value + ',';
            })
            ref.event($div);
            $body.append($div.children());
            //-----------
            ref.conf.page++;
            ref.closeWait();
            //最后提交统计阅读量请求
            ref.addRead(ids.toString().trim(','));
        });
    },
    event: function ($div) {
		var $ufaces = $div.find(".uinfo");
        pop.bindEvent($ufaces);
        $div.find(".reply_text").autoHeight();
        InitAt($div);
    }
};
</script>
<script>
    //20160903EZvNKn.jpg|20160903ep2Yko.doc|
    var reply = {};
    reply.init = function () {
        reply.diag = new ZL_Dialog();
        reply.diag.title = "文件上传";
        reply.diag.reload = true;
        reply.diag.backdrop = true;
        reply.diag.maxbtn = false;
        reply.diag.width = "width1100";//Blog
        reply.diag.url = "/Plugins/WebUploader/WebUP.aspx?callback=addattach&json=" + JSON.stringify({ "ashx": "action=Blog", "pval": "" });
    }
    reply.data = [];
    reply.cur = "";
    reply.diag = null;
    reply.upfile = function (id) {
        if (!reply.data[id]) { reply.data[id] = []; }
        reply.cur = id;
        reply.diag.reload = true;
        reply.diag.ShowModal();
    }
    reply.del = function (id, rid) {
        var list = reply.data[rid];
        list.RemoveByID(id);
        $("#reply_fitem_" + id).remove();
        reply.updatehid(reply.cur,list);
    }
    reply.getmodel = function () {
        return { src: "", fname: "", ex: "", id: parseInt(Math.random() * 10), rid: reply.cur };
    }
    reply.updatehid = function (rid, list) {
        var files = "";
        for (var i = 0; i < list.length; i++) {
            files += list[i].fname + "|";
        }
        if (files.length > 0) { files = files.substr(0, (files.length - 1)); }
        $("#reply_hid_" + rid).val(files);
    }
    reply.addattach = function (file, ret, pval) {
        var src = ret._raw;
        var list = reply.data[reply.cur];
        var model = reply.getmodel();
        model.src = src;
        model.fname = GetFname(src);
        model.ex = GetExName(src);
        list.push(model);
        //-----获取到一个即附加上一个
        var opTlp = "<div class=\"text-center margin_t5\"><a href=\"javascript:;\" class=\"btn btn-xs btn-default\" onclick=\"reply.del('@id','@rid');\"><i class=\"zi zi_trashalt\"></i></a></div>";
        var imgTlp = '<div class=\"imgview\" id=\"reply_fitem_@id\"><img src="@src" />' + opTlp + "</div>";
        var fileTlp = "<div class=\"imgview\" id=\"reply_fitem_@id\"><div class=\"ext @ex\"></div>" + opTlp + "</div>"
        var $div = $("#reply_attach_" + reply.cur);
        if (IsImage(src)) { $div.append(JsonHelper.FillItem(imgTlp, model, null)); }
        else { $div.append(JsonHelper.FillItem(fileTlp, model, null)); }
        reply.diag.CloseModal();
        reply.updatehid(reply.cur,list);
    }
    reply.clear = function (id) {
        $("#reply_hid_" + id).val("");
        $("#reply_attach_" + id).html("");
    }
    reply.init();
    var upcallback = [];
    upcallback["addattach"] = reply.addattach;
    //function AddAttach(file, ret, pval) {
    //    var list = data[reply.cur];
    //    var model = { fname: "", ext: "" };
    //    list.push(model);
    //}
    //$(function () {
    //    ZL_Webup.config.json.ashx = "action=OAattach";
    //    $("#upfile_btn").click(ZL_Webup.ShowFileUP);
    //})
    //function AddAttach(file, ret, pval) { return ZL_Webup.AddAttach(file, ret, pval); }
	
	//输入框
	 $("#MsgContent_T").focus(function(){  
            $(this).animate({height:"150px"});
        });  
        $("#MsgContent_T").blur(function(){  
            $(this).animate({height:"70px"});
        }); 
		
$(function () {
//初始化日历
CalendarHandler.initialize();
//日历点击事件
$("#CalendarMain #context .item:not(.lastItem)").on("click", function (e) {
var year = $("#CalendarMain #title .selectYear").data("year");
var month = $("#CalendarMain #title .selectMonth").data("month");
var day = $(this).data("day");
window.open("/Plat/Daily/AddDaily.aspx?name=admin&Date=" + year + "-" + month + "-" + day, "main_right");
});


 //数据异步加载 此处延迟执行  
function yuraoimg(){
$(".athumbnail_img").fancybox({ 'titlePosition': 'over', helpers: { thumbs: { width: 50, height: 50 } } });
//console.log("1");
}

setInterval(yuraoimg,100);
})
</script>
</asp:Content>