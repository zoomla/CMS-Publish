<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Mis.OA.Default" MasterPageFile="~/Common/Master/Empty.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>OA办公系统</title>
<meta name="renderer" content="ie-comp" />
<link href="/dist/css/zico.min.css" rel="stylesheet" />
<script src="/JS/calendar-brown.js"></script>
<script src="/JS/ICMS/OAMain.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="m_OAtop d-flex" id="OAtop">
	<div id="OAtop_l"  class="OAtop_l d-flex flex-wrap">
		<div id="logo" class="OA_logo"><a href="/Office/">OA办公系统</a></div>
		<div class="logo_tip"><span><asp:Label runat="server" ID="UName_L"></asp:Label></span>,欢迎回来!</div>
	</div>            
	<div class="ml-auto m_OAtop_r" id="OAtop_r">
	<ul class="list-unstyled">
	<li class="o_ion_list"><a href="/Plat/Blog/" target="_blank"><i class="zi zi_universalaccess workflowicon"></i><br />工作流</a></li>
	<li><a href="/User/Cloud/" target="_blank"><span class="zi_tmStackoverflow fa-lg"><i class="zi zi_circlenotch"></i><i class="zi zi_clouduploadalt"></i></span><br />网络云盘</a></li>
	<li><a href="#"><span class="zi_tmStackoverflow fa-lg"><i class="zi zi_circlenotch"></i><i class="zi zi_speaker"></i></span><br />会议通知</a></li>
	<li><a href="javascript:;" onclick="ShowMain('','/Office/Flow/ApplyList.aspx')"><span class="zi_tmStackoverflow fa-lg"><i class="zi zi_circlenotch"></i><i class="zi zi_listalt "></i></span><br />信息管理</a></li>
	<li><a href="/ask" target="_blank"><span class="zi_tmStackoverflow fa-lg"><i class="zi zi_circlenotch"></i><i class="zi zi_sitemap"></i></span><br />问答中心</a></li>
	<li><a href="/User/"><span class="zi_tmStackoverflow fa-lg"><i class="zi zi_circlenotch"></i><i class="zi zi_useralt"></i></span><br />会员中心</a></li>
	</ul>
	</div>
</div>
<div class="naver">
<div id="nav" class="m_Oheader_nav clearfix d-flex flex-wrap">
<ul class="m_Oheader_nav_l">
<li><a href="javascript:;" onclick="ShowMain('#userinfo_ul','/Office/Main.aspx');">OA首页</a></li>
<li><a href="javascript:;" onclick="ShowMain('','/Office/Flow/ApplyList.aspx?view=1');">待办事宜</a></li>
<li><a href="javascript:;" onclick="ShowMain('/Office/Mail/MailManage.aspx','/Office/Mail/MessageOutbox.aspx');">邮箱</a></li>
<li><a href="javascript:;" onclick="ShowMain('','/Office/Other/UserConfig.aspx');">配置</a></li> 
<li><a href="http://code.z01.com/webOffice.rar">组件下载</a></li>              
</ul>
<ul class="m_Oheader_nav_r">
<li><a href="/Office/" title="首页"><i class="zi zi_home"></i></a></li> 
<li><a href="javascript:;" onclick="ShowMain('','/Office/Other/StructList.aspx?action=struct&value=2');" title="组织结构"><i class="zi zi_userfriends"></i></a></li>        
<li><a href="javascript:;" onclick="ShowMain('','/Office/Other/UserConfig.aspx');" title="设置"><i class="zi zi_cog"></i></a></li>  
<li title="退出"><a href="/User/User/Logout?url=/Office/" title="退出"><i class="zi zi_toggleoff"></i></a></li> 
</ul>
</div>
</div>
<div class="oamain">
	<table class="w-100" cellpadding="0" cellspacing="0">
		<tr>
			<td id="toolbar1" style="width: 260px;" valign="top">
				<div class="oamain_left">
                    <iframe id="main_left" style="z-index: 2;  width: 100%;height:700px;" name="main_left" src="/Office/Menu/LeftMenu.aspx?leftul=userinfo_ul" frameborder="0"></iframe>			
                    <div class="clearfix"></div>
				</div>
			</td>
			<td class="switchPoint" style="width: 10px; background: #ececff;" onclick="hiddendiv()">
				<img id="switchPoint" src="/App_Themes/Admin/butClose.gif" alt="关闭左栏" />
			</td>
			<td valign="top">
				<iframe id="main_right" style="z-index: 2; width: 100%;" name="main_right" src="/Office/Main.aspx" frameborder="0" onload="IfrAutoHeight(this);"></iframe>
			</td>
		</tr>
	</table>
	<div id="TimeDiv" class="pop_box panel panel-primary " style="display: none; height: 200px; width: 300px; margin-top: -30px; margin-bottom: 0; position: fixed; _position: absolute; _bottom: auto; _top: expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight-this.offsetHeight-(parseInt(this.currentStyle.marginTop,10)||0)-(parseInt(this.currentStyle.marginBottom,10)||0))); right: 0px; bottom: -200px;">
		<div class="panel-heading"><span class="m_close" onclick="HideDiv('TimeDiv')" title="关闭"></span><%=Call.SiteName%>_OA助手提示</div>
		<div class="panel-body" style="height: 165px;">
			<div id="warnContent" style="padding-left: 20px; padding-top: 30px;">
				<div id="contentDiv"></div>
			</div>
		</div>
	</div>
</div>



	

<!--日历插件-->
<script src="/Plugins/Third/Calendar/Calendar.js"></script>
<script type="text/javascript">
    function hiddendiv() {
        $("#toolbar1").toggle("fast");
        var obj = document.getElementById("switchPoint");
        if (obj.alt == "关闭左栏") {
            obj.alt = "打开左栏";
            obj.src = "/App_Themes/Admin/butOpen.gif";
        }
        else {
            obj.alt = "关闭左栏";
            obj.src = "/App_Themes/Admin/butClose.gif";
        }
    }
    function hiddendiv1() {
        $("#toolbar1").css("display", "none");
        var obj = document.getElementById("switchPoint");
        obj.alt = "打开左栏";
        obj.src = "/App_Themes/Admin/butOpen.gif";
    }
    function IfrAutoHeight(ifr) {
        var $ifr = $(ifr); $ifr.height($ifr.contents().height());
        $("html,body").animate({ scrollTop:100 }, 300);
    }
    $(function () {
        $("#user_left").hide();
        $("#user_right").css({ width: '100%' });
    })
</script>

<script type="text/javascript">
    //-------未读邮件
    function GetUnreadMail() {
        //a = "GetUnreadMail";
        //$.ajax({
        //    type: "Post",
        //    url: "/Office/OAajax.ashx",
        //    dataType: "json",
        //    data: { action: a },
        //    success: function (data) {
        //        if (data != 0) {///Office/Mail/Message.aspx?view=1
        //            var str = "你当前有" + data.num + "封邮件未读,<a href='javascript:;' onclick='showMain(\"/Office/Mail/Message.aspx?view=1\");'>点击阅读</a>";
        //            $("#contentDiv").append(str);
        //            ShowDiv('TimeDiv');
        //        }
        //    },
        //    error: function (data) { }
        //});
    }
    setTimeout('GetUnreadMail()', 30000);
</script>
</asp:Content>
