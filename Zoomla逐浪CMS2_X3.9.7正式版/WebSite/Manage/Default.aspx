<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Manage.Default" ClientIDMode="Static"%><!DOCTYPE html>
<%@ Import Namespace="ZoomLa.Components" %>
<html>
<head>
<title><%:Call.SiteName%>_<%=Resources.L.后台管理 %></title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<link href="/dist/css/bootstrap4.min.css" rel="stylesheet"/>
<link href="/dist/css/zico.min.css" rel="stylesheet"/>
<link href="/dist/css/animate.min.css" rel="stylesheet" />
<link href="/App_Themes/V4style.css?version=<%:ZoomLa.BLL.BLLCommon.Version_JS %>" rel="stylesheet"/>
<script src="/JS/jquery.min.js" ></script>
<script src="/dist/js/popper.min.js"></script>
<script src="/JS/ICMS/FrameTab.js?version=20181220"></script>
<script src="/Plugins/ECharts/build/source/echarts.js"></script>
</head>
<body style="overflow: hidden">
<form id="form1" runat="server">
    <div class="newbody" id="newbody" style="display: none;" ondblclick="$(this).hide();">
        <div class="newbody_t">
            <div class="newbody_tl ">
                <div runat="server" id="newbody_logo1" visible="false"><span class="logo1">凵</span><span class="logo2">刂</span></div>
                <div runat="server" id="newbody_logo2" visible="false"><span class="logo3"><%=ComRE.Img_NoPic(SiteConfig.SiteInfo.LogoAdmin, "zllogo10") %></span></div>
                <span class="logo4"><%=SiteConfig.SiteInfo.LogoPlatName.Split('<')[0] %></span>
                <a href="#" onclick="javascript:$('.newbody').hide();showleft('menu1_1','{$path}Site/SiteConfig.aspx')"><%=Resources.L.门户管理 %></a>
                <a href="#" onclick="javascript:$('.newbody').hide();showleft('menu1_1','{$path}WorkFlow/OAConfig.aspx')"><%=Resources.L.办公平台 %></a>
                <a href="#" onclick="javascript:$('.newbody').hide();showleft('menu1_1','{$path}Content/ECharts/AddChart.aspx')"><%=Resources.L.数据管理 %></a>
                <a href="#" onclick="javascript:$('.newbody').hide();showleft('menu10_1','/APP/Default')"><%=Resources.L.移动开发 %></a>
                <a href="#" onclick="javascript:$('.newbody').hide();showleft('menu10_1','WeiXin/home.aspx')"><%=Resources.L.微信应用 %></a>
            </div>
            <div class="ml-auto p-3">
                <asp:LinkButton runat="server" ID="NoShow_Btn" OnClick="NoShow_Btn_Click"><i class="zi zi_timescircle"></i> Close</asp:LinkButton>
				<span><%=Resources.L.双击跳过预优化 %>...</span>
            </div>
        </div>
        <div class="newbody_c"><i class="<%:string.IsNullOrEmpty(ZoomLa.Components.SiteConfig.SiteInfo.LogoAdmin)?"zi zi_tmZ":ZoomLa.Components.SiteConfig.SiteInfo.LogoAdmin %> animated"></i> </div>
        <div class="newbody_c1">
            <div class="newbody_c1t" style="display: none;"><%:ZoomLa.Components.SiteConfig.SiteInfo.Webmaster %><span>CMS</span></div>
            <div class="newbody_clm" style="display: none;"><img src="/App_Themes/Admin/shadow.png" class="img-responsive center-block" /></div>
        </div>
        <div id="wave"></div>
        <asp:Button runat="server" ID="ShowAD_Btn" Style="display: none;" OnClick="ShowAD_Btn_Click" />
    </div>
    <!--新后台背景效果结束-->
	
	<asp:ScriptManager ID="SM1" runat="server"></asp:ScriptManager>
    <div class="sysTop">
	<div class="sysTop_logo">
		<div onclick="window.open('/');" title="首页" runat="server" id="zlogo1" visible="false" class="zlogo1">凵</div>
		<div onclick="location=location;" title="刷新" runat="server" id="zlogo2" visible="false" class="zlogo2">刂</div>
		<div onclick="window.open('/');" title="首页" runat="server" id="zlogo3" visible="false" class="zlogo3"></div>
		<div onclick="location=location;" title="刷新" runat="server" id="zlogo4" visible="false" class="zlogo4"></div>
	</div>
	
	
<nav class="navbar-expand-md navbar-dark  sysMenu sys_index_nav">
<button class="sys_mbCollapsed" id="index_mylefy_nav"  type="button" data-toggle="collapse" data-target="" aria-controls="" aria-expanded="false" aria-label="Toggle navigation">
<i class="zi zi_bars"></i>
</button>
	<div class="navbar-collapse collapse in show" id="navbarsExampleDefault" aria-expanded="false">
	<a  class="sys_index_Close" href="javascript:;" onclick="ul_hidew();"><i class="zi zi_times" zico="错号粗黑"></i> </a>
	
	<ul class="nav navbar-nav" id="nav_myTopnav">
		<li class="nav-item menu1 active" onclick="openmenu('menu1')"><a onclick="showleft('menu1_1');" data-toggle="tooltip" data-placement="top" title="<%=Resources.L.开始 %>"><span class="visible-sm"><%=Resources.L.开始 %></span><span class="max_768_none"><%=Resources.L.开始 %></span></a></li>
		<li class="nav-item menu2" onclick="openmenu('menu2')"><a onclick="ShowMain('NodeTree.ascx','');" title="<%=Resources.L.内容 %>"><span class="visible-sm"><%=Resources.L.内容 %></span><span class="max_768_none"><%=Resources.L.内容 %></span></a></li>
		<li class="nav-item menu3" onclick="openmenu('menu3')"><a onclick="ShowMain('ShopNodeTree.ascx','');" title="<%=Resources.L.商城 %>"><span class="visible-sm"><%=Resources.L.商城 %></span><span class="max_768_none"><%=Resources.L.商城 %></span></a></li>
		<li class="nav-item menu4" onclick="openmenu('menu4')"><a onclick="showleft('menu4_2');" title="<%=Resources.L.黄页 %>"><span class="visible-sm"><%=Resources.L.黄页 %></span><span class="max_768_none"><%=Resources.L.黄页 %></span></a></li>
		<li class="nav-item menu5" onclick="openmenu('menu5')"><a onclick="showleft('menu5_1');" title="<%=Resources.L.教育 %>"><span class="visible-sm"><%=Resources.L.教育 %></span><span class="max_768_none"><%=Resources.L.教育 %></span></a></li>
		<li class="nav-item menu6" onclick="openmenu('menu6')"><a onclick="ShowMain('UserGuide.ascx','');" title="<%=Resources.L.用户 %>"><span class="visible-sm"><%=Resources.L.用户 %></span><span class="max_768_none"><%=Resources.L.用户 %></span></a></li>
		<li class="nav-item menu7" onclick="openmenu('menu7')"><a onclick="showleft('menu7_1');" title="<%=Resources.L.扩展 %>"><span class="visible-sm"><%=Resources.L.扩展 %></span><span class="max_768_none"><%=Resources.L.扩展 %></span></a></li>
		<li class="nav-item menu8" onclick="openmenu('menu8')"><a onclick="showleft('menu8_1');" title="<%=Resources.L.系统 %>"><span class="visible-sm"><%=Resources.L.系统 %></span><span class="max_768_none"><%=Resources.L.系统 %></span></a></li>
		<li class="nav-item menu9" onclick="openmenu('menu9')"><a onclick="showleft('menu9_1');" title="<%=Resources.L.办公 %>"><span class="visible-sm"><%=Resources.L.办公 %></span><span class="max_768_none"><%=Resources.L.办公 %></span></a></li>
		<li class="nav-item menu10" onclick="openmenu('menu10')"><a onclick="showleft('menu10_6');" title="<%=Resources.L.移动 %>"><span class="visible-sm"><%=Resources.L.移动 %></span><span class="max_768_none"><%=Resources.L.移动 %></span></a></li>
		<li class="nav-item menu11" onclick="openmenu('menu11')"><a onclick="showleft('menu11_1');" title="<%=Resources.L.站群 %>"><span class="visible-sm"><%=Resources.L.站群 %></span><span class="max_768_none"><%=Resources.L.站群 %></span></a></li>
		<li class="nav-item menu11 sys_index_outbtn"><a href="/AdminMVC/COM/Logout"><i class="zi zi_signoutalt" zico="出口标志"></i> <%=Resources.L.退出 %></a></li>
	</ul>
	</div>	
</nav>



<div class="sysTop_right max_768_none">
<div class="float-left max_768_none" id="sysSearch">
<div class="input-group input-group-sm"><asp:TextBox runat="server" ID="keyText" class="form-control" placeholder="<%$Resources:L,快速检索 %>" onkeydown="return IsEnter(this);" style="color:#fff;"/>
<i class="zi zi_search" onclick="SearchPage();"></i> </div>
</div>

<div class="dropdown">
<a class="dropdown-toggle" id="bd-versions" aria-expanded="false" aria-haspopup="true" href="#" data-toggle="dropdown"> <span runat="server" id="nameL"></span></a>
<div class="dropdown-menu dropdown-menu-right" aria-labelledby="bd-versions">
<a class="dropdown-item" href="javascript:ShowAD();" title="<%=Resources.L.场景切换 %>"><%=Resources.L.场景切换 %></a>
<a class="dropdown-item" href="/help.html" target="_blank"><%=Resources.L.快速帮助 %></a>
<a class="dropdown-item" href="http://help.z01.com/" target="_blank"><%=Resources.L.线上支持 %></a>
<a class="dropdown-item" href="javascript:modalDialog('/Common/calc.html', 'calculator', 400, 300);"><%=Resources.L.计算器 %></a>
</div>
</div>


<a class="max_768_none" href="javascript:;" onClick="ShowManageLeft();"><i class="zi zi_bars"></i> </a>
</div>
</div>
<!--主菜单end-->


<div class="m_top_bottom nav-scroller">
	<ul class="menu1 open nav nav-underline sys_overhid">
        <li><a class="nav-link active menu1_1 " onclick="showleft('menu1_1','{$path}Profile/Worktable.aspx')"><%=Resources.L.版本信息 %></a></li>
        <li><a class="nav-link menu1_2" onclick="showleft('menu1_1','Main.aspx')"><%=Resources.L.从此开始 %></a></li>
        <li><a class="nav-link menu1_3" onclick="showleft('menu1_2','Config/SearchFunc.aspx')"><%=Resources.L.快速导航 %></a></li>
        <li><a class="nav-link menu1_5" onclick="showleft('menu1_1','Workload/FuncList.aspx')"><%=Resources.L.功能列表 %></a></li>
        <li><a class="nav-link menu1_4" onclick="showleft('menu1_3','Profile/ModifyPassword.aspx')"><%=Resources.L.修改密码 %></a></li>
      </ul>
	
	<ul class="menu2 open nav nav-underline sys_overhid">
        <li><a class="nav-link active menu2_1 " onclick="ShowMain('NodeTree.ascx','Content/ContentManage.aspx');"><%=Resources.L.按栏目管理 %></a></li>
        <li><a class="nav-link menu2_2 " onclick="ShowMain('SpecialTree.ascx?cate=0','Content/ContentManage.aspx')"><%=Resources.L.按专题管理 %></a></li>
        <li><a class="nav-link menu2_2 " onclick="ShowMain('SpecialTree.ascx','Content/SpecialManage.aspx')"><%=Resources.L.专题维护 %></a></li>
        <li><a class="nav-link menu2_3" onclick="showleft('menu2_3','Content/CommentManage.aspx')"><%=Resources.L.评论写作 %></a></li>
		<li>
			<div class="btn-group sys_posit_in menu2_4">
			<button type="button" class="btn m_top_bottom_deropLeft" onclick="showleft('menu2_4','<%=Call.PathAdmin("Pub/PubManage") %>')"><%=Resources.L.互动模块 %></button>
				<button type="button" class="btn m_top_bottom_deropRight dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="sr-only">Toggle Dropdown</span></button>
                <div class="dropdown-menu sys_inde_dropdown">
                    <a class="dropdown-item" href="javascript:;" onclick="showleft('menu2_4','<%=Call.PathAdmin("Pub/PubManage") %>')"><%=Resources.L.互动模块 %></a>
                    <a class="dropdown-item" href="javascript:;" onclick="showleft('menu2_4','Pub/FormManage.aspx')"><%=Resources.L.互动表单 %></a>
                    <a class="dropdown-item" href="javascript:;" onclick="showleft('menu2_4','Content/Model/ModelManage.aspx?ModelType=7')"><%=Resources.L.互动模型 %></a>
                    <a class="dropdown-item" href="javascript:;" onclick="showleft('menu2_4','Pub/PubRecycler.aspx')"><%=Resources.L.互动存档 %></a>
                    <a class="dropdown-item" href="javascript:;" onclick="showleft('menu2_4','Pub/PubExcel.aspx')"><%=Resources.L.Excel导出 %></a>
                </div>
			</div>
		</li>
        <li><a class="nav-link menu2_7" onclick="showleft('menu2_7','Content/CreateHtmlContent.aspx')"><%=Resources.L.生成发布 %></a></li>
        <li class="menu2_5">
			<div class="btn-group sys_posit_in">
		     <button type="button" class="btn m_top_bottom_deropLeft" onclick="showleft('menu2_5','Content/Collect/CollectionManage.aspx')"><%=Resources.L.采集检索 %></button>
				<button type="button" class="btn m_top_bottom_deropRight dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="sr-only">Toggle Dropdown</span></button>
				<div class="dropdown-menu sys_inde_dropdown">
				   <a class="dropdown-item" href="javascript:;" data-url="Content/Collect/CollectionStep1.aspx"><%=Resources.L.添加采集 %></a>
					<a class="dropdown-item" href="javascript:;" data-url="Content/Collect/CollectionManage.aspx"><%=Resources.L.采集项目 %></a>
					<a class="dropdown-item" href="javascript:;" data-url="Content/Collect/CollectionStart.aspx"><%=Resources.L.开始采集 %></a>
					<a class="dropdown-item" href="javascript:;" data-url="Content/Collect/CollectionStatus.aspx"><%=Resources.L.采集进度 %></a>
					<a class="dropdown-item" href="javascript:;" data-url="Content/Collect/CollectionList.aspx"><%=Resources.L.采集记录 %></a>
					<a class="dropdown-item" href="javascript:;" data-url="Content/Collect/InfoLog.aspx"><%=Resources.L.检索动态 %></a>
				</div>
			</div>
		</li>
        <li><a class="nav-link menu2_8" onclick="ShowMain('NodeTree.ascx?url=Content/ContentRecycle.aspx','Content/ContentRecycle.aspx');"><%=Resources.L.回收站 %></a></li>
        <li><a class="nav-link menu2_9" onclick="showleft('menu2_9','Guest/GuestCateMana.aspx?Type=1')"><%=Resources.L.百科问答贴吧 %></a></li>
        <li><a class="nav-link menu2_6" onclick="showleft('menu2_6','Content/Video/VideoList.aspx')"><%=Resources.L.视频管理 %></a></li>
      </ul>

	<ul class="menu3 nav nav-underline sys_overhid">
        <li><a class="nav-link active menu3_1 " onclick="ShowMain('ShopNodeTree.ascx','Shop/ProductManage.aspx');"><%=Resources.L.商品管理 %></a></li>
        <li><a class="nav-link active menu3_1 " onclick="ShowMain('SpecialTree.ascx?cate=1','Shop/ProductManage.aspx');"><%=Resources.L.按专题管理 %></a></li>
        <li><a class="nav-link menu3_2" onclick="showleft('menu3_2','/AdminMVC/Product/StockList')"><%=Resources.L.库存管理 %></a></li>
        <li><a class="nav-link menu3_3" onclick="showleft('menu3_3','Shop/OrderList.aspx')"><%=Resources.L.订单管理 %></a></li>
        <li><a class="nav-link menu3_4" onclick="showleft('menu3_4','Shop/BankRollList.aspx')"><%=Resources.L.明细记录 %></a></li>
        <li><a class="nav-link menu3_5" onclick="showleft('menu3_5','/AdminMVC/Sale/Index')"><%=Resources.L.销售统计 %></a></li>
        <li><a class="nav-link menu3_6" onclick="showleft('menu3_6','Shop/Arrive/PromoList.aspx')"><%=Resources.L.促销优惠 %></a></li>
        <li><a class="nav-link menu3_7" onclick="showleft('menu3_7','Shop/Addon/exp/DeliverType.aspx')"><%=Resources.L.商城配置 %></a></li>
        <li><a class="nav-link menu3_8" onclick="showleft('menu3_8','User/Promo/PromoList.aspx')"><%=Resources.L.推广中心 %></a></li>
        <li><a class="nav-link menu3_9" onclick="ShowMain('ShopRecycle.ascx','Shop/ShopRecycler.aspx');"><%=Resources.L.商品回收站 %></a></li>
<%--        <li><a class="nav-link menu3_10" onclick="showleft('menu3_10','Shop/IDC/IDCOrder.aspx?OrderType=7')">IDC管理</a></li>--%>
        <li class="menu3_13">
			<div class="btn-group sys_posit_in">
				<button type="button" class="btn m_top_bottom_deropLeft" onclick="showleft('menu3_13','UserShopManage/StoreManage.aspx')"><%=Resources.L.店铺管理 %></button>
				<button type="button" class="btn m_top_bottom_deropRight dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="sr-only">Toggle Dropdown</span></button>
				<div class="dropdown-menu sys_inde_dropdown">
					<a class="dropdown-item" href="javascript:;" data-url="UserShopManage/StoreManage.aspx"><%=Resources.L.店铺审核 %></a>
					<a class="dropdown-item" href="javascript:;" data-url="UserShopManage/StoreStyle.aspx"><%=Resources.L.店铺样式 %></a>
					<a class="dropdown-item" href="javascript:;" data-url="Content/Model/ModelManage.aspx?ModelType=5"><%=Resources.L.商品模型 %></a>
					<a class="dropdown-item" href="javascript:;" data-url="Content/Model/ModelManage.aspx?ModelType=6"><%=Resources.L.申请模型 %></a>
					<a class="dropdown-item" href="javascript:ShowMain('UserShopNodeTree.ascx','Shop/ProductManage.aspx?StoreID=-1',this);"><%=Resources.L.商品管理 %></a>
				</div>
			</div>
		</li>
      </ul>	
	<ul class="menu4 nav nav-underline sys_overhid">
        <li><a class="nav-link active menu4_2 " onclick="showleft('menu4_2','/AdminMVC/Page/ApplyAudit')"><%=Resources.L.黄页管理 %></a></li>
        <li><a class="nav-link menu4_4" onclick="ShowMain('PageTree.ascx','/AdminMVC/Page/PageContent')"><%=Resources.L.内容管理 %></a></li>
        <li><a class="nav-link menu4_5" onclick="showleft('menu4_5','Content/Model/ModelManage.aspx?ModelType=10')"><%=Resources.L.模型管理 %></a></li>
        <li><a class="nav-link menu4_4" onclick="showleft('menu4_2','/AdminMVC/Page/PageTemplate?ID=-1')"><%=Resources.L.公用栏目 %></a></li>
        <li><a class="nav-link menu4_7" onclick="showleft('menu4_2','/AdminMVC/Page/PageConfig')"><%=Resources.L.黄页配置 %></a></li>
      </ul>
	  
	  <ul class="menu5 nav nav-underline sys_overhid">
        <li><a class="nav-link active menu5_1 " onclick="ShowMain('QuestGuide.ascx?url=/AdminMVC/Exam/Papers_System_Manage','/AdminMVC/Exam/Papers_System_Manage')"><%=Resources.L.试卷管理 %></a></li>
        <li><a class="nav-link menu5_9" onclick="ShowMain('QuestGuide.ascx','/AdminMVC/Exam/QuestList')"><%=Resources.L.试题管理 %></a></li>
        <li><a class="nav-link menu5_7" onclick="showleft('menu5_7','/AdminMVC/Exam/Papers_System_Manage')"><%=Resources.L.组卷配置 %></a></li>
        <li><a class="nav-link menu5_3" onclick="showleft('menu5_3','/AdminMVC/Exam/ClassRoomManage')"><%=Resources.L.班级管理 %></a></li>
        <li><a class="nav-link menu5_6" onclick="showleft('menu5_6','Shop/OrderList.aspx')"><%=Resources.L.财务管理 %></a></li>
        <li><a class="nav-link menu5_8" onclick="showleft('menu5_8','Exam/News/News.aspx')"><%=Resources.L.数字出版 %></a></li>
        <li><a class="nav-link menu5_10" onclick="showleft('menu5_10','//v.ziti163.com')"><%=Resources.L.字体大师 %></a></li>
         <!-- <li><a class="nav-link menu5_10" onclick="showleft('menu5_10','Content/Font/Default.aspx')">字体大师</a></li>-->
      </ul>

	<ul class="menu6 nav nav-underline sys_overhid">
        <li><a class="nav-link active menu6_1 " onclick="ShowMain('UserGuide.ascx','User/UserManage.aspx');"><%=Resources.L.会员管理 %></a></li>
        <li><a class="nav-link menu6_2" onclick="showleft('menu6_2','User/AdminManage.aspx')"><%=Resources.L.管理员管理 %></a></li>
        <li><a class="nav-link menu6_3" onclick="showleft('menu6_3','User/Auth/PermissionInfo.aspx')"><%=Resources.L.用户角色 %></a></a></li>
        <li><a class="nav-link menu6_4" onclick="showleft('menu6_4','User/Mail/SendMailList.aspx')"><%=Resources.L.信息发送 %></a></li>
        <li class="menu6_5">
			<div class="btn-group sys_posit_in">
				<button type="button" class="btn m_top_bottom_deropLeft" onclick="showleft('menu6_5','User/Mail/SubscriptListManage.aspx?menu=audit')"><%=Resources.L.订阅中心 %></button>
				<button type="button" class="btn m_top_bottom_deropRight dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><span class="sr-only">Toggle Dropdown</span></button>
				<div class="dropdown-menu sys_inde_dropdown">
					<a class="dropdown-item" href="javascript:;" data-url="User/Mail/SubscriptListManage.aspx?menu=all"><%=Resources.L.邮件订阅 %></a>
					<a class="dropdown-item" href="javascript:;" data-url="User/Mail/MailSysTlp.aspx"><%=Resources.L.邮件模板 %></a>
					<a class="dropdown-item" href="javascript:;" data-url="User/Mail/SendSubMail.aspx"><%=Resources.L.发送邮件 %></a>
					<a class="dropdown-item" href="javascript:;" data-url="User/Mail/MailIdiographList.aspx"><%=Resources.L.签名管理 %></a>
				</div>
			</div>
		</li>
        <li><a class="nav-link menu6_6" onclick="showleft('menu6_6','User/Job/Jobsconfig.aspx')"><%=Resources.L.人才招聘 %></a></li>
        <li><a class="nav-link menu6_7" onclick="showleft('menu6_7','Zone/ZoneConfig.aspx')"><%=Resources.L.SNS社区 %></a></li>
        <li><a class="nav-link menu6_8" onclick="showleft('menu6_8','APP/WSApi.aspx')"><%=Resources.L.整合接口 %></a></li>
        <li><a class="nav-link menu9_8" onclick="showleft('menu6_9','User/Addon/UserGraph.aspx')"><%=Resources.L.用户画像 %></a></li>
      </ul>
	
	<ul class="menu7 nav nav-underline sys_overhid">
        <li><a class="nav-link active menu7_1" onclick="showleft('menu7_1','Config/DBTools/Default.aspx')"><%=Resources.L.开发中心 %></a></li>
        <li><a class="nav-link menu7_2" onclick="showleft('menu7_2','Plus/ADZoneManage.aspx')"><%=Resources.L.广告管理 %></a></li>
        <li><a class="nav-link menu7_3" onclick="showleft('menu7_3','Counter/Counter.aspx')"><%=Resources.L.访问统计 %></a></li>
        <li><a class="nav-link menu7_4" onclick="showleft('menu7_4','Plus/SurveyManage.aspx')"><%=Resources.L.问卷调查 %></a></li>
        <li><a class="nav-link menu7_5" onclick="showleft('menu7_5','File/FtpAll.aspx')"><%=Resources.L.文件管理 %></a></li>
        <li><a class="nav-link menu7_6" onclick="showleft('menu7_6','Addon/DictionaryManage.aspx')"><%=Resources.L.数据字典 %></a></li>
        <li><a class="nav-link menu7_8" onclick="showleft('menu7_8','Copyright/Config.aspx')"><%=Resources.L.版权中心 %></a></li>
        <li><a class="nav-link menu9_8" onclick="showleft('menu9_8','Plus/Log/LogManage.aspx?LogType=4')"><%=Resources.L.日志管理 %></a></li>
      </ul>
	
	<ul class="menu8 nav nav-underline sys_overhid">
        <li><a class="nav-link active menu8_1 " onclick="showleft('menu8_1','Config/SiteInfo.aspx')"><%=Resources.L.网站配置 %></a></li>
        <li><a class="nav-link menu8_2" onclick="showleft('menu8_2','Content/Model/ModelManage.aspx?ModelType=1')"><%=Resources.L.模型管理 %></a></li>
        <li><a class="nav-link menu8_3" onclick="showleft('menu8_3','Content/Node/NodeManage.aspx')"><%=Resources.L.节点管理 %></a></a></li>
        <li><a class="nav-link menu8_4" onclick="showleft('menu8_4','Content/Flow/FlowManager.aspx')"><%=Resources.L.流程管理 %></a></li>
        <li><a class="nav-link menu8_5" onclick="showleft('menu8_5','Content/SpecialManage.aspx')"><%=Resources.L.专题管理 %></a></li>
        <li><a class="nav-link menu8_6" onclick="ShowMain('LabelGuide.ascx','Template/TemplateSet.aspx')"><%=Resources.L.模板风格 %></a></li>
        <li><a class="nav-link menu8_7" onclick="ShowMain('LabelGuide.ascx','Template/LabelManage.aspx')"><%=Resources.L.标签管理 %></a></li>
        <li><a class="nav-link menu10_7" onclick="showleft('menu10_7','Amazing/css/Default.aspx')"><%=Resources.L.百变微站 %></a></li>
        <li><a class="nav-link menu8_9" onclick="showleft('menu10_7','Addon/FontIcon/Default.aspx')"><%=Resources.L.字库与图标 %></a></li>
        <li><a class="nav-link menu8_8" onclick="showleft('menu8_8','Pay/PayPlatManage.aspx')"><%=Resources.L.支付中心 %></a></li>
      </ul>
	  
	  <ul class="menu9 nav nav-underline sys_overhid">
        <li><a class="nav-link active menu9_1 " onclick="showleft('menu9_1','WorkFlow/OAConfig.aspx')">OA<%=Resources.L.办公 %></a></li>
        <li><a class="nav-link menu9_2" onclick="showleft('menu9_12','AddOn/StructByTree.aspx')"><%=Resources.L.组织结构 %></a></li>
        <li><a class="nav-link menu9_9" onclick="showleft('menu9_9','Plat/PlatInfoManage.aspx')"><%=Resources.L.能力中心 %></a></li>
        <li><a class="nav-link menu9_3" onclick="showleft('menu9_3','AddOn/Project/Projects.aspx')"><%=Resources.L.项目管理 %></a></li>
        <li><a class="nav-link menu9_4" onclick="showleft('menu9_4','/AdminMVC/CRM/Index')"><%=Resources.L.CRM管理 %></a></li>
        <li><a class="nav-link menu9_5" onclick="showleft('menu9_5','iServer/BiServer.aspx?num=1')"><%=Resources.L.有问必答 %></a></li>
        <li><a class="nav-link menu9_11" onclick="showleft('menu9_11','Content/ECharts/AddChart.aspx')"><%=Resources.L.智慧图表 %></a></li>
        <li><a class="nav-link menu9_10" onclick="ShowMain('SenTree.ascx','Sentiment/Default.aspx')"><%=Resources.L.舆情监测 %></a></li>
        <li><a class="nav-link menu9_6" onclick="showleft('menu9_6','User/Service/ServiceSeat.aspx')"><%=Resources.L.客服通 %></a></li>
        <li><a class="nav-link menu9_7" onclick="showleft('menu9_7','Workload/WorkCount.aspx')"><%=Resources.L.工作统计 %></a></li>
      </ul>
	  
	  <ul class="menu10 nav nav-underline sys_overhid">
        <li><a class="nav-link active menu10_6 " onclick="showleft('menu10_6','Design/SceneList.aspx')"><%=Resources.L.H5创作 %></a></li>
        <li><a class="nav-link menu10_1" onclick="showleft('menu10_1','WeiXin/home.aspx')"><%=Resources.L.移动应用 %></a></li>
        <li><a class="nav-link menu10_2" onclick="ShowMain('Weixin.ascx','WeiXin/home.aspx');"><%=Resources.L.微信应用 %></a>></li>
        <li><a class="nav-link menu10_5" onclick="showleft('menu10_5','TouTiao/TouTiaoContent.aspx');"><%=Resources.L.头条管理 %></a></li>
        <li><a class="nav-link menu10_3" onclick="showleft('menu10_1','/Tools/Mobile.aspx')"><%=Resources.L.移动浏览器 %></a></li>
        <li><a class="nav-link menu10_4" onclick="showleft('menu10_3','Shop/Printer/ListDevice.aspx')"><%=Resources.L.智能硬件 %></a></li>
        <li><a class="nav-link menu10_5" onclick="showleft('menu10_4','Mobile/Push/APIList.aspx')"><%=Resources.L.消息推送 %></a></li>
      </ul>
	
	<ul class="menu11 nav nav-underline sys_overhid">
        <li><a class="nav-link active menu11_1 " onclick="showleft('menu11_1','Site/SiteConfig.aspx')"><%=Resources.L.全局配置 %></a></li>
        <li><a class="nav-link menu11_2" onclick="showleft('menu11_1','Site/ServerClusterConfig.aspx')"><%=Resources.L.服务器集群 %></a></li>
        <li><a class="nav-link menu11_3" onclick="showleft('menu11_1','Site/DBManage.aspx')"><%=Resources.L.数据库管理 %></a></li>
        <li><a class="nav-link menu11_4" onclick="showleft('menu11_1','Site/Default.aspx')"><%=Resources.L.IIS站点 %></a></li>
        <li><a class="nav-link menu11_5" onclick="showleft('menu11_1','Site/SitePool.aspx')"><%=Resources.L.应用程序池 %></a></li>
        <li><a class="nav-link menu11_6" onclick="showleft('menu11_1','Template/TemplateSetOfficial.aspx')"><%=Resources.L.模板云台 %></a></li>
        <li><a class="nav-link menu11_7" onclick="showleft('menu11_1','Site/SiteCloudSetup.aspx')"><%=Resources.L.快云安装 %></a></li>
        <li><a class="nav-link menu11_8" onclick="showleft('menu11_1','Site/SiteDataCenter.aspx')"><%=Resources.L.智能采集 %></a></li>
        <li><a class="nav-link menu11_9" onclick="showleft('menu11_2','Site/DomName.aspx')"><%=Resources.L.域名注册 %></a></li>
        <li><a class="nav-link menu11_10" onclick="showleft('menu11_10','design/SiteList.aspx')"><%=Resources.L.动力设计 %></a></li>
      </ul>	
</div>
<!--子菜单end-->

<main class="sysMain">
<div class="sysLeft max_768_none" id="left">
<div id="left_ul_div">
<div id="menu1" class="m_left_ul open">
	<ul id="menu1_1" class="m_left_ulin open">
		<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.便捷菜单 %> </li>
		<li id="menu1_1_0"><a onclick="ShowMain('NodeTree.ascx','Content/ContentManage.aspx');"><%=Resources.L.内容管理 %></a></li>
		<li id="menu1_1_1"><a onclick="ShowMain('ShopNodeTree.ascx','Shop/ProductManage.aspx');"><%=Resources.L.商品管理 %></a></li>
		<li id="menu1_1_2"><a onclick="showleft('menu3_3','Shop/OrderList.aspx')"><%=Resources.L.订单管理 %></a></li>
		<li id="menu1_1_3"><a onclick="showleft('menu8_2','Content/Model/ModelManage.aspx?ModelType=1')"><%=Resources.L.模型管理 %></a></li>
		<li id="menu1_1_4"><a onclick="showleft('menu8_3','Content/Node/NodeManage.aspx')"><%=Resources.L.节点管理 %></a></li>
		<li id="menu1_1_5"><a onclick="ShowMain('LabelGuide.ascx','Template/TemplateSet.aspx')"><%=Resources.L.模版管理 %></a></li>
		<li id="menu1_1_6"><a onclick="ShowMain('LabelGuide.ascx','Template/LabelManage.aspx')"><%=Resources.L.标签管理 %></a></li>
		<li id="menu1_1_7"><a onclick="ShowMain('UserGuide.ascx','User/UserManage.aspx');"><%=Resources.L.会员管理 %></a></li>
		<li id="menu1_1_8"><a onclick="showleft('menu2_7','Content/CreateHtmlContent.aspx')"><%=Resources.L.生成发布 %></a></li>
		<li id="menu1_1_9"><a onclick="showleft('menu8_1','Config/SiteInfo.aspx')"><%=Resources.L.网站配置 %></a></li>
		<li id="menu1_1_10"><a onclick="showleft('menu3_10','Shop/IDC/IDCOrder.aspx?OrderType=7')"><%=Resources.L.IDC管理 %></a></li>
	</ul>
	<ul id="menu1_2" class="m_left_ulin">
		<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.便捷导航 %> </li>
		<div class="input-group">
		 <input type="text" id="searchkeyword" class="form-control" onkeydown="return ASCX.OnEnterSearch('Guest/AllSearch.aspx?keyWord=',this);" placeholder="<%=Resources.L.导航标题 %>" />
		  <div class="input-group-append">
		  <button class="input-group-text" type="button" onclick="ASCX.Search('Config/FuncSearch.aspx?keyWord=','searchkeyword');"><i class="zi zi_search"></i>
		  </div>
		</div>
		<li id="menu1_2_1"><a href="javascript:;" data-url="Config/SearchFunc.aspx"><%=Resources.L.管理导航 %></a></li>
					<li id="menu1_2_2"><a href="javascript:;" data-url="Config/UserFunc.aspx?EliteLevel=1"><%=Resources.L.会员导航 %></a></li>
				</ul>
				<ul id="menu1_3" class="m_left_ulin">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.修改密码 %> </li>
					<li id="menu1_3_1"><a href="javascript:;" data-url="Profile/ModifyPassword.aspx"><%=Resources.L.修改密码 %></a></li>
				</ul>
				<ul id="menu1_4" class="m_left_ulin">
					<li id="menu1_4_1"><a href="/AdminMVC/COM/Logout"><%=Resources.L.安全退出 %></a></li>
				</ul>
			</div>
			<div id="menu2" class="m_left_ul">
				<ul class="m_left_ulin" id="menu2_1"></ul>
				<ul class="m_left_ulin" id="menu2_2">
					<li id="menu2_2_1"><a href="javascript:ShowMain('','Content/SpecContent.aspx');"><%=Resources.L.网站专题 %></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu2_3">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.评论管理 %> </li>
					<li id="menu2_3_1"><a href="javascript:;" data-url="Content/CommentManage.aspx"><%=Resources.L.评论管理 %></a></li>
					<li id="menu2_3_4"><a href="javascript:;" data-url="/AdminMVC/Content/MarkDown"><%=Resources.L.MarkDown写作 %></a></li>
                    <li id="menu2_3_2"><a href="javascript:;" data-url="Content/SohuChatManage.aspx"><%=Resources.L.畅言评论管理 %></a></li>
					<li id="menu2_3_3"><a href="javascript:;" data-url="Content/SohuChatManage.aspx?show=2"><%=Resources.L.畅言评论配置 %></a></li>
				</ul>
				
				<ul class="m_left_ulin" id="menu2_4">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.互动模块 %></li>
					<li id="menu2_4_2"><a href="javascript:;" data-url="<%=Call.PathAdmin("Pub/PubManage") %>"><%=Resources.L.互动模块 %></a></li>
					<li id="menu2_4_1"><a href="javascript:;" data-url="Pub/FormManage.aspx"><%=Resources.L.互动表单 %></a></li>
					<li id="menu2_4_4"><a href="javascript:;" data-url="Content/Model/ModelManage.aspx?ModelType=7"><%=Resources.L.互动模型 %></a></li>
					<li id="menu2_4_5"><a href="javascript:;" data-url="Pub/PubRecycler.aspx"><%=Resources.L.互动存档 %></a></li>
					<li id="menu2_4_6"><a href="javascript:;" data-url="Pub/PubExcel.aspx"><%=Resources.L.Excel导出 %></a></li>
				</ul>
				  
				<ul class="m_left_ulin" id="menu2_5">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.采集检索 %></li>
					<li id="menu2_5_1"><a href="javascript:;" data-url="Content/Collect/CollectionManage.aspx"><%=Resources.L.采集项目 %></a></li>
					<li id="menu2_5_3"><a href="javascript:;" data-url="Content/Collect/CollectionStart.aspx"><%=Resources.L.开始采集 %></a></li>
					<li id="menu2_5_4"><a href="javascript:;" data-url="Content/Collect/CollectionStatus.aspx"><%=Resources.L.采集进度 %></a></li>
					<li id="menu2_5_5"><a href="javascript:;" data-url="Content/Collect/CollectionList.aspx"><%=Resources.L.采集记录 %></a></li>
					<li id="menu2_5_6"><a href="javascript:;" data-url="Content/Collect/CollSite.aspx"><%=Resources.L.统一检索 %></a></li>
					<li id="menu2_5_7"><a href="javascript:;" data-url="Content/Collect/InfoLog.aspx"><%=Resources.L.检索动态 %></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu2_6">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.视频管理 %></li>
					<li id="menu2_6_2"><a href="javascript:;" data-url="Content/Video/VideoList.aspx"><%=Resources.L.视频列表 %></a></li>
					<li id="menu2_6_3"><a href="javascript:;" data-url="Content/Video/VideoConfig.aspx"><%=Resources.L.视频配置 %></a></li>
					<li id="menu2_6_4"><a href="javascript:;" data-url="Content/Video/VideoPath.aspx"><%=Resources.L.视频路径 %></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu2_7">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.生成发布 %></li>
					<li id="menu2_7_1"><a href="javascript:;" data-url="Content/CreateHtmlContent.aspx"><%=Resources.L.生成发布 %></a></li>
					<li id="menu2_7_3"><a href="javascript:;" data-url="Content/ListHtmlContent.aspx"><%=Resources.L.生成管理 %></a></li>
					<li id="menu2_7_4"><a href="javascript:;" data-url="Content/SiteMap.aspx"><%=Resources.L.站点地图 %></a></li>
					<!-- <li id="menu2_7_5"><a href="javascript:;" data-url="Content/ManageJsContent.aspx"><%=Resources.L.JS生成管理 %></a></li> -->
				</ul>
				<ul class="m_left_ulin" id="menu2_8">
					<li id="menu2_8_1"><a href="javascript:;" data-url="Content/ContentRecycle.aspx"><%=Resources.L.节点栏目导航 %></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu2_9">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.百科问答 %></li>
					<li class="pl-0"><p class="menu_tit laybtn below"><i class="zi zi_circleDownBold"></i>   <%=Resources.L.论坛留言 %></p>
						<ul>
							<li id="menu2_9_6"><a href="javascript:;" data-url="Guest/GuestCateMana.aspx?Type=1"><%=Resources.L.贴吧版面 %></a></li>
							<li id="menu2_9_1"><a href="javascript:;" data-url="Guest/GuestManage.aspx"><%=Resources.L.留言分类 %></a></li>
						</ul>
					</li>
					<li class="pl-0"><p class="menu_tit laybtn below"><i class="zi zi_circleDownBold"></i>   <%=Resources.L.问答管理 %></p>
						<ul>
							<li id="menu2_9_4"><a href="javascript:;" data-url="Guest/WdCheck.aspx"><%=Resources.L.问答管理 %></a></li>
							<li id="menu2_9_5"><a href="javascript:;" data-url="AddOn/GradeOption.aspx?CateID=2"><%=Resources.L.问答分类 %></a></li>
							<li id="menu2_9_7"><a href="javascript:;" data-url="Guest/WDConfig.aspx"><%=Resources.L.问答配置 %></a></li>
						</ul>
					</li>
					<li class="pl-0"><p class="menu_tit laybtn below"><i class="zi zi_circleDownBold"></i>   <%=Resources.L.百科管理 %></p>
						<ul>
							<li id="menu2_9_9"><a href="javascript:;" data-url="Guest/BKVersionList.aspx?Status=-100"><%=Resources.L.词条版本 %></a></li>
							<li id="menu2_9_2"><a href="javascript:;" data-url="Guest/BkCheck.aspx"><%=Resources.L.百科词条 %></a></li>
							<li id="menu2_9_3"><a href="javascript:;" data-url="AddOn/GradeOption.aspx?CateID=3"><%=Resources.L.百科分类 %></a></li>
							<li id="menu2_9_8"><a href="javascript:;" data-url="Guest/BKConfig.aspx"><%=Resources.L.百科设置 %></a></li>
						</ul>
					</li>
					<div class="input-group">
						<input type="text" id="tiekeyword" class="form-control" onkeydown="return ASCX.OnEnterSearch('Guest/AllSearch.aspx?keyWord=',this);" placeholder="<%=Resources.L.贴吧 %>,<%=Resources.L.百科 %>,<%=Resources.L.留言标题 %>" />
						<div class="input-group-append">
							<button class="input-group-text" type="button" onclick="ASCX.Search('Guest/AllSearch.aspx?keyWord=','tiekeyword');"><i class="zi zi_search"></i></button>
						</div>
					</div>
				</ul>
				<ul class="m_left_ulin" id="menu2_10">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.内容参数 %></li>
					<li id="menu2_10_1"><a href="javascript:;" data-url="AddOn/SourceManage.aspx"><%=Resources.L.来源管理 %></a></li>
					<li id="menu2_10_2"><a href="javascript:;" data-url="AddOn/AuthorManage.aspx"><%=Resources.L.作者管理 %></a></li>
					<li id="menu2_10_3"><a href="javascript:;" data-url="AddOn/KeyWordManage.aspx"><%=Resources.L.关键字集 %></a></li>
				</ul>
			</div>
			<div id="menu3" class="m_left_ul">
				<ul class="m_left_ulin" id="menu3_1">
				</ul>
				<ul id="menu3_2" class="m_left_ulin">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.库存管理 %></li>
					<li id="menu3_2_1"><a href="javascript:;" data-url="/AdminMVC/Product/StockList"><%=Resources.L.库存管理 %></a></li>
				</ul>
				<ul id="menu3_3" class="m_left_ulin">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.订单管理 %></li>
					<li id="menu3_3_2"><a href="javascript:;" data-url="Shop/OrderList.aspx"><%=Resources.L.订单列表 %></a></li>
					<li id="menu3_3_6" role="presentation" class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-expanded="false"><%=Resources.L.其它扩展 %> <span class="caret"></span>
						</a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="javascript:;" data-url="Shop/OrderList.aspx?OrderType=10"><%=Resources.L.代购订单 %></a></li>
							<li><a href="javascript:;" data-url="Shop/OrderList.aspx?OrderType=1"><%=Resources.L.酒店订单 %></a></li>
							<li><a href="javascript:;" data-url="Shop/OrderList.aspx?OrderType=2"><%=Resources.L.机票订单 %></a></li>
							<li><a href="javascript:;" data-url="Shop/OrderList.aspx?OrderType=3"><%=Resources.L.旅游订单 %></a></li>
							<li><a href="javascript:;" data-url="Shop/OrderList.aspx?OrderType=5"><%=Resources.L.域名订单 %></a></li>
							<li><a href="javascript:;" data-url="Shop/OrderList.aspx?OrderType=11"><%=Resources.L.捐赠订单 %></a></li>
						</ul>
					</li>
					<li id="menu3_3_21"><a href="javascript:;" data-url="Shop/Addon/ProOrder/Default.aspx"><%=Resources.L.申购订单 %></a></li>
					<li id="menu3_3_19"><a href="javascript:;" data-url="Shop/OrderRepairAudit.aspx"><%=Resources.L.返修退货 %></a></li>
					<li id="menu3_3_20"><a href="javascript:;" data-url="Shop/Addon/After/SettleList.aspx"><%=Resources.L.订单结算 %></a></li>
					<li id="menu3_3_11"><a href="javascript:;" data-url="Shop/FillOrder.aspx"><%=Resources.L.补录订单 %></a></li>
					<li id="menu3_3_5"><a href="javascript:;" data-url="Shop/OrderSql.aspx"><%=Resources.L.账单管理 %></a></li>
					<li id="menu3_3_15"><a href="javascript:;" data-url="Shop/SystemOrderModel.aspx?Type=0"><%=Resources.L.订单模型 %></a></li>
					<li id="menu3_3_14"><a href="javascript:;" data-url="Shop/Printer/MessageList.aspx"><%=Resources.L.打印流水 %></a></li>
					<li id="menu3_3_1"><a href="javascript:;" data-url="Shop/CartManage.aspx"><%=Resources.L.购物车记录 %></a></li>
					<li id="menu3_3_16"><a href="javascript:;" data-url="Shop/SystemOrderModel.aspx?Type=1"><%=Resources.L.购物车模型 %></a></li>
				</ul>
				<ul id="menu3_4" class="m_left_ulin">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.明细记录 %></li>
					<li id="menu3_4_1"><a href="javascript:;" data-url="Shop/BankRollList.aspx"><%=Resources.L.资金明细 %></a></li>
					<li id="menu3_4_2"><a href="javascript:;" data-url="Shop/SaleReport/SaleByProduct.aspx"><%=Resources.L.销售明细 %></a></li>
					<li id="menu3_4_3"><a href="javascript:;" data-url="Shop/PayList.aspx"><%=Resources.L.支付明细 %></a></li>
					<li id="menu3_4_5"><a href="javascript:;" data-url="Shop/Addon/exp/DeliverList.aspx"><%=Resources.L.退货明细 %></a></li>
				</ul>
				<ul id="menu3_5" class="m_left_ulin">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.销售统计 %></li>
<%--					<li id="menu3_5_1"><a href="javascript:;" data-url="/AdminMVC/Sale/SaleByDay">按日统计</a></li>
					<li id="menu3_5_2"><a href="javascript:;" data-url="/AdminMVC/Sale/SaleByDay">按月统计</a></li>
					<li id="menu3_5_3"><a href="javascript:;" data-url="Shop/SaleReport/SaleByClass.aspx">按类统计</a></li>
					<li id="menu3_5_4"><a href="javascript:;" data-url="Shop/SaleReport/SaleByProduct.aspx">销售详情</a></li>--%>
				</ul>
				<ul id="menu3_6" class="m_left_ulin">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.促销优惠 %></li>
					<li id="menu3_6_1"><a href="javascript:;" data-url="Shop/Arrive/GroupPro.aspx"><%=Resources.L.单品组合 %></a></li>
					<li id="menu3_6_2"><a href="javascript:;" data-url="Shop/Arrive/SuitPro.aspx"><%=Resources.L.促销组合 %></a></li>
					<li id="menu3_6_4"><a href="javascript:;" data-url="Shop/Arrive/PromoList.aspx"><%=Resources.L.促销列表 %></a></li>
					<li id="menu3_6_5"><a href="javascript:;" data-url="Shop/Arrive/ArriveManage.aspx"><%=Resources.L.优惠券管理 %></a></li>
					<li id="menu3_6_6"><a href="javascript:;" data-url="Shop/Arrive/AddArrive.aspx?menu=add"><%=Resources.L.新增优惠券 %></a></li>
				</ul>
				<ul id="menu3_7" class="m_left_ulin">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.商城配置 %></li>
					<li id="menu3_7_1"><a href="javascript:;" data-url="Shop/Addon/exp/DeliverType.aspx"><%=Resources.L.运费模板 %></a></li>
					<li id="menu3_7_2"><a href="javascript:;" data-url="Shop/AddOn/ExpSenderManage.aspx"><%=Resources.L.发件信息 %></a></li>
					<li id="menu3_7_3"><a href="javascript:;" data-url="Shop/ProducerManage.aspx"><%=Resources.L.厂商管理 %></a></li>
					<li id="menu3_7_4"><a href="javascript:;" data-url="Shop/TrademarkManage.aspx"><%=Resources.L.品牌管理 %></a></li>
					<li id="menu3_7_9"><a href="javascript:;" data-url="Shop/MoneyManage.aspx"><%=Resources.L.货币管理 %></a></li>
					<li id="menu3_7_8"><a href="javascript:;" data-url="Shop/Addon/Material/Default.aspx"><%=Resources.L.原料管理 %></a></li>
				</ul>
				<ul id="menu3_8" class="m_left_ulin">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.推广中心 %></li>
					<li id="menu3_8_1"><a href="javascript:;" data-url="User/Promo/PromoChart.aspx"><%=Resources.L.图表分析 %></a></li>
					<li id="menu3_8_2"><a href="javascript:;" data-url="User/Promo/PromoList.aspx"><%=Resources.L.用户明细 %></a></li>
					<li id="menu3_8_3"><a href="javascript:;" data-url="User/Promo/PromoUserList.aspx"><%=Resources.L.用户流水 %></a></li>
					<li id="menu3_8_5"><a href="javascript:;" data-url="User/UnitMain.aspx"><%=Resources.L.管理奖金 %></a></li>
					<li id="menu3_8_6"><a href="javascript:;" data-url="User/DepositManage.aspx"><%=Resources.L.用户提现 %></a></li>
					<li id="menu3_8_9"><a href="javascript:;" data-url="Shop/PVManager.aspx"><%=Resources.L.订单提成 %></a></li>
				</ul>
				<ul id="menu3_9" class="m_left_ulin">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.商品回收站 %></li>
					<li id="menu3_9_1"><a href="javascript:;" data-url="Shop/ShopRecycler.aspx"><%=Resources.L.商品回收站 %></a></li>
				</ul>
				<ul id="menu3_10" class="m_left_ulin">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i><%=Resources.L.IDC管理 %></li>     
					<li id="menu3_12_1"><a href="javascript:;" data-url="Shop/IDC/IDCOrder.aspx"><%=Resources.L.IDC订单 %></a></li>
					<li id="menu3_12_2"><a href="javascript:;" data-url="Shop/OrderList.aspx?OrderType=9"><%=Resources.L.IDC续费 %></a></li>
				</ul>
				<ul id="menu3_13" class="m_left_ulin">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.店铺管理 %></li>
					<li id="menu3_13_1"><a href="javascript:;" data-url="UserShopManage/StoreManage.aspx"><%=Resources.L.店铺管理 %></a></li>
					<li id="menu3_13_2"><a href="javascript:;" data-url="UserShopManage/StoreStyle.aspx"><%=Resources.L.店铺样式 %></a></li>
					<li id="menu3_13_3"><a href="javascript:ShowMain('UserShopNodeTree.ascx','Shop/ProductManage.aspx?StoreID=-1',this);"><%=Resources.L.店铺商品 %></a></li>
					<li id="menu3_13_4"><a href="javascript:;" data-url="Content/Model/ModelManage.aspx?ModelType=6"><%=Resources.L.申请模型 %></a></li>
					<li id="menu3_13_5"><a href="javascript:;" data-url="UserShopManage/ShopMailConfig.aspx"><%=Resources.L.邮件管理 %></a></li>
					<li id="menu3_13_6"><a href="javascript:;" data-url="UserShopManage/DeliveryMan.aspx"><%=Resources.L.送货员 %></a></li>
				</ul>
			</div>
			<div id="menu4" class="m_left_ul">
				<ul class="m_left_ulin" id="menu4_2">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.黄页管理 %></li>
					<li id="menu4_2_1"><a href="javascript:;" data-url="/AdminMVC/Page/ApplyAudit"><%=Resources.L.黄页审核 %></a></li>
					<li id="menu4_2_3"><a href="javascript:;" data-url="/AdminMVC/Page/PageStyle"><%=Resources.L.黄页样式 %></a></li>
					<li id="menu4_2_5"><a href="javascript:;" data-url="/AdminMVC/Page/PageConfig"><%=Resources.L.黄页配置 %></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu4_5">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.黄页模型管理 %></li>
					<li id="menu4_5_2"><a href="javascript:;" data-url="Content/Model/ModelManage.aspx?ModelType=10"><%=Resources.L.黄页申请模型 %></a></li>
					<li id="menu4_5_1"><a href="javascript:;" data-url="Content/Model/ModelManage.aspx?ModelType=4"><%=Resources.L.黄页内容模型 %></a></li>
				</ul>
			</div>
			<div id="menu5" class="m_left_ul">
				<ul class="m_left_ulin" id="menu5_1">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.考试管理 %></li>
					<li id="menu5_1_2"><a href="javascript:;" data-url="/AdminMVC/Exam/CourseManage"><%=Resources.L.课程管理 %></a></li>
					<li id="menu5_1_4"><a href="javascript:;" data-url="/AdminMVC/Exam/Question_Class_Manage"><%=Resources.L.科目管理 %></a></li>
					<li id="menu5_1_5"><a href="javascript:;" data-url="/AdminMVC/Exam/ExamPointManage"><%=Resources.L.考点管理 %> </a></li>
					<li id="menu5_1_3"><a href="javascript:;" data-url="/AdminMVC/Exam/ToScore"><%=Resources.L.阅卷中心 %> </a></li>
				</ul>
				<ul class="m_left_ulin" id="menu5_3">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.排课管理 %></li>
					<li id="menu5_3_1"><a href="javascript:;" data-url="/AdminMVC/Exam/SchoolManage"><%=Resources.L.学校管理%></a></li>
					<li id="menu5_3_2"><a href="javascript:;" data-url="/AdminMVC/Exam/ClassRoomManage"><%=Resources.L.班级管理 %></a></li>
					<li id="menu5_3_3"><a href="javascript:;" data-url="/AdminMVC/Exam/ExTeacherManage"><%=Resources.L.教师管理 %></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu5_6">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.财务管理 %></li>
					<li id="menu5_6_1"><a href="javascript:;" data-url="Shop/OrderList.aspx"><%=Resources.L.所有订单 %></a></li>
					<li id="menu5_6_2"><a href="javascript:;" data-url="Shop/BankRollList.aspx"><%=Resources.L.销售明细 %></a></li>
					<li id="menu5_6_4"><a href="javascript:;" data-url="Shop/CartManage.aspx"><%=Resources.L.购物车记录 %></a></li>
					<li id="menu5_6_5"><a href="javascript:;" data-url="Shop/PayList.aspx"><%=Resources.L.支付明细 %></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu5_7">
				<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.组卷配置 %></li>

				<div class="input-group ">
				<input type="text" placeholder="<%=Resources.L.试题名 %>" class="form-control" id="question_text" />
				<div class="input-group-append">
					<a href="javascript:;" data-url="" onclick="$(this).attr('data-url','Exam/QuestionManage.aspx?KeyWord='+$('#question_text').val());" class="input-group-text"><i class="zi zi_search"></i></a>
				</div>
				</div>
					<li id="menu5_7_3 "><a href="javascript:;" data-url="/AdminMVC/Exam/Setting"><%=Resources.L.配置中心 %></a></li>
					<li id="menu5_7_2"><a href="javascript:;" data-url="/AdminMVC/Exam/Question_Class_Manage"><%=Resources.L.试题科目 %></a></li>
					<li id="menu5_7_4"><a href="javascript:;" data-url="/AdminMVC/Exam/QuestGrade?cate=6"><%=Resources.L.年级管理 %></a></li>
					<li id="menu5_7_5"><a href="javascript:;" data-url="/AdminMVC/Exam/VersionList"><%=Resources.L.教材版本 %></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu5_10">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.字体管理 %></li>
					<li id="menu5_10_1"><a href="javascript:;" data-url="Content/Font/Default.aspx"><%=Resources.L.字库列表 %></a></li>
				</ul>
			</div>
			<div id="menu6" class="m_left_ul">
				<ul class="m_left_ulin" id="menu6_1">test</ul>
				<ul class="m_left_ulin" id="menu6_2">			
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.管理员管理 %></li>
					<div class="input-group">
						<input type="text" id="keyWordss" class="form-control" placeholder="<%=Resources.L.搜索管理员名称 %>" onkeydown="return ASCX.OnEnterSearch('User/AdminManage.aspx?keyWordss=',this);" />
						<div class="input-group-append">
							<button id="Ok" class="input-group-text" type="button" onclick="ASCX.Search('User/AdminManage.aspx?keyWordss=','keyWordss');"><i class="zi zi_search"></i></button>
						</div>
					</div>
                    <li id="menu6_2_1"><a href="javascript:;" data-url="User/AdminManage.aspx"><%=Resources.L.管理员管理 %></a></li>
					<li id="menu6_2_2"><a href="javascript:;" data-url="User/Auth/RoleManage.aspx"><%=Resources.L.管理员角色 %></a></li>
					<li id="menu6_2_3"><a href="javascript:;" data-url="User/SetAdminKey.aspx"><%=Resources.L.手机口令器 %></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu6_3">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.用户角色 %></li>
					<li id="menu6_3_1"><a href="javascript:;" data-url="User/Auth/PermissionInfo.aspx"><%=Resources.L.角色管理 %></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu6_4">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.信息发送 %></li>
					<li id="menu6_4_1"><a href="javascript:;" data-url="User/MessageSend.aspx"><%=Resources.L.发送短消息 %></a></li>
					<li id="menu6_4_2"><a href="javascript:;" data-url="User/Message.aspx"><%=Resources.L.短消息列表 %></a></li>
					<li id="menu6_4_3"><a href="javascript:;" data-url="User/MobileMsg.aspx"><%=Resources.L.手机信息 %></a></li>
					<li id="menu6_4_4"><a href="javascript:;" data-url="User/Mail/SendMailList.aspx"><%=Resources.L.订阅管理 %></a></li>
					<li id="menu6_4_7"><a href="javascript:;" data-url="User/Mail/MailList.aspx"><%=Resources.L.邮件发送 %></a></li>
					<li id="menu6_4_8"><a href="javascript:;" data-url="User/Mail/MailTemplist.aspx"><%=Resources.L.邮件模板 %></a></li>
					<li id="menu6_4_6"><a href="javascript:;" data-url="User/Mail/MailIdiographList.aspx"><%=Resources.L.邮件签名 %></a></li>
					<li id="menu6_4_9"><a href="javascript:;" data-url="User/Mail/MailSysTlp.aspx"><%=Resources.L.系统邮件模板 %></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu6_5">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.订阅中心 %></li>
					<li id="menu6_5_1"><a href="javascript:;" data-url="User/Mail/SubscriptListManage.aspx?menu=all"><%=Resources.L.邮件订阅 %></a></li>
					<li id="menu6_5_4"><a href="javascript:;" data-url="User/Mail/MailSysTlp.aspx"><%=Resources.L.邮件模板 %></a></li>
					<li id="menu6_5_5"><a href="javascript:;" data-url="User/Mail/SendSubMail.aspx"><%=Resources.L.发送邮件 %></a></li>
					<li id="menu6_5_8"><a href="javascript:;" data-url="User/Mail/MailIdiographList.aspx"><%=Resources.L.签名管理 %></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu6_6">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.人才招聘 %></li>
					<li id="menu6_6_1"><a href="javascript:;" data-url="User/Job/Jobsconfig.aspx"><%=Resources.L.人才模板 %></a></li>
					<li id="menu6_6_2"><a href="javascript:;" data-url="User/Job/Jobsinfos.aspx?modeid=qiye"><%=Resources.L.招聘企业 %></a></li>
					<li id="menu6_6_3"><a href="javascript:;" data-url="User/Job/Jobsinfos.aspx?modeid=zhappin"><%=Resources.L.职位信息 %></a></li>
					<li id="menu6_6_4"><a href="javascript:;" data-url="User/Job/Jobsinfos.aspx?modeid=geren"><%=Resources.L.用户简历 %></a></li>
					<li id="menu6_6_5"><a href="javascript:;" data-url="User/Job/JobsRecycler.aspx?modeid=qiye"><%=Resources.L.招聘回收站 %></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu6_7">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.SNS社区模块 %></li>
					<li id="menu6_7_1"><a href="javascript:;" data-url="Zone/ZoneConfig.aspx"><%=Resources.L.空间配置 %></a></li>
					<li id="menu6_7_4"><a href="javascript:;" data-url="Zone/ZoneStyleManage.aspx"><%=Resources.L.模板管理 %></a></li>
					<li id="menu6_7_9"><a href="javascript:;" data-url="Zone/GSManage.aspx"><%=Resources.L.回收站%></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu6_8">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.整合接口%></li>
					<li class="menu6_8_1"><a href="javascript:;" data-url="User/UserApi.aspx"><%=Resources.L.整合配置%></a></li>
					<li class="menu6_8_0"><a href="javascript:;" data-url="User/SiteManage.aspx"><%=Resources.L.子站管理%></a></li>
					<li class="menu6_8_3"><a href="javascript:;" data-url="APP/Suppliers.aspx"><%=Resources.L.社会登录%></a></li>
					<li class="menu6_8_4"><a href="javascript:;" data-url="APP/Ucenter.aspx"><%=Resources.L.跨站接入%>1.0</a></li>
					<li class="menu6_8_5"><a href="javascript:;" data-url="APP/WSApi.aspx"><%=Resources.L.跨站接入%>2.0</a></li>
					<li class="menu6_8_7"><a href="javascript:;" data-url="APP/JsonPManage.aspx"><%=Resources.L.移动接口%></a></li>
					<li class="menu6_8_8"><a href="javascript:;" data-url="Config/Third/PlatInfoList.aspx"><%=Resources.L.平台接口%></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu6_9">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.用户画像%></li>
					<li class="menu6_9_1"><a href="javascript:;" data-url="User/Addon/UserGraph.aspx"><%=Resources.L.概览%></a></li>
				</ul>
			</div>
			<div id="menu7" class="m_left_ul">
				<ul class="m_left_ulin" id="menu7_1">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.开发中心%></li>
					<li id="menu7_1_12"><a href="javascript:;" data-url="Config/DBTools/Default.aspx"><%=Resources.L.数据管理维护%></a></li>
					<li id="menu7_1_1"><a href="javascript:;" data-url="Config/DBTools/CreateTable.aspx"><%=Resources.L.快速智能建表%></a></li>
					<li id="menu7_1_14"><a href="javascript:;" data-url="Config/DBTools/TableToExcel.aspx"><%=Resources.L.数据导出Excel%></a></li>
					<li id="menu7_1_2"><a href="javascript:;" data-url="Config/DBTools/ViewList.aspx"><%=Resources.L.主库视图管理%></a></li>
					<li id="menu7_1_3"><a href="javascript:;" data-url="Config/DatalistProfile.aspx"><%=Resources.L.系统全库概况%></a></li>
					<li id="menu7_1_4"><a href="javascript:;" data-url="Config/BackupRestore.aspx"><%=Resources.L.备份还原数据%></a></li>
					<li id="menu7_1_5"><a href="javascript:;" data-url="Config/Optimization.aspx"><%=Resources.L.数据索引优化%></a></li>
					<li id="menu7_1_6"><a href="javascript:;" data-url="Config/DBTools/DataSearch.aspx"><%=Resources.L.全库数据检索%></a></li>
					<li id="menu7_1_7"><a href="javascript:;" data-url="Config/DBTools/RunSql.aspx"><%=Resources.L.执行SQL语句%></a></li>
					<li id="menu7_1_9"><a href="javascript:;" data-url="Config/EmptyData.aspx"><%=Resources.L.清空测试数据%></a></li>
					<li id="menu7_1_11"><a href="javascript:;" data-url="Content/Schedule/Default.aspx"><%=Resources.L.网站计划任务%></a></li>
					<li id="menu7_1_10"><a href="javascript:;" data-url="Common/SystemFinger.aspx"><%=Resources.L.主机信息总览%></a></li>
					<li id="menu7_1_13"><a href="javascript:;" data-url="AddOn/FileseeManage.aspx"><%=Resources.L.比较所有文件%></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu7_2">
				<li class="pl-0"><p class="menu_tit laybtn below"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.广告管理%></p>
					<ul>
                        <li id="menu7_2_9"><a href="javascript:;" data-url="Plus/AD/Banner.aspx"><%=Resources.L.Banner管理%></a></li>
                        <li id="menu7_2_1"><a href="javascript:;" data-url="Plus/ADZoneManage.aspx"><%=Resources.L.广告版位%></a></li>
                        <li id="menu7_2_2"><a href="javascript:;" data-url="Plus/ADManage.aspx"><%=Resources.L.广告内容%></a></li>
                        <li id="menu7_2_3"><a href="javascript:;" data-url="Plus/ADAdbuy.aspx"><%=Resources.L.广告申请%></a></li>
					<li id="menu7_2_4"><a href="javascript:;" data-url="Content/ECharts/Default.aspx"><%=Resources.L.图表管理%></a></li>
					</ul>
					</li>
                    <li class="pl-0">
                        <p class="menu_tit laybtn below"><i class="zi zi_forDown" zico="下指"></i><%=Resources.L.名片设计%></p>
                        <ul>
                            <li id="menu7_2_7"><a href="javascript:;" data-url="Plus/Logo/IconList.aspx"><%=Resources.L.图标管理%></a></li>
                            <li id="menu7_2_5"><a href="javascript:;" data-url="Plus/Logo/DesTlpList.aspx"><%=Resources.L.名片模板%></a></li>
                            <li id="menu7_2_6"><a href="javascript:;" data-url="Plus/Logo/DesList.aspx"><%=Resources.L.用户作品%></a></li>
                        </ul>
                    </li>
				</ul>
				<ul class="m_left_ulin" id="menu7_3">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.访问统计%></li>
					<li id="menu7_3_8"><a href="javascript:;" data-url="Counter/StatisticalCode.aspx"><%=Resources.L.统计代码%></a></li>
					<li id="menu7_3_1"><a href="javascript:;" data-url="Counter/Counter.aspx"><%=Resources.L.统计导航%></a></li>
					<li id="menu7_3_2"><a href="javascript:;" data-url="Counter/Ip.aspx"><%=Resources.L.全站统计%></a></li>
					<li id="menu7_3_3"><a href="javascript:;" data-url="Counter/Month.aspx"><%=Resources.L.每日统计%></a></li>
					<li id="menu7_3_4"><a href="javascript:;" data-url="Counter/Year.aspx"><%=Resources.L.每月统计%></a></li>
					<li id="menu7_3_5"><a href="javascript:;" data-url="Counter/Local.aspx"><%=Resources.L.地区数据%></a></li>
					<li id="menu7_3_6"><a href="javascript:;" data-url="Counter/Browser.aspx"><%=Resources.L.浏览信息%></a></li>
					<li id="menu7_3_7"><a href="javascript:;" data-url="Counter/Os.aspx"><%=Resources.L.操作系统%></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu7_4">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.问卷调查%></li>
					<li id="menu7_4_1"><a href="javascript:;" data-url="Plus/SurveyManage.aspx"><%=Resources.L.问卷调查管理%></a></li>
					<li id="menu7_4_2"><a href="javascript:;" data-url="Plus/Survey.aspx"><%=Resources.L.添加问卷投票%></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu7_5">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.文件管理%></li>
					<li id="menu7_5_2"><a href="javascript:;" data-url="File/FtpAll.aspx"><%=Resources.L.云端存储%></a></li>
					<li id="menu7_5_3"><a href="javascript:;" data-url="File/DownServerManage.aspx"><%=Resources.L.下载服务器%></a></li>
					<li id="menu7_5_4"><a href="javascript:;" data-url="File/BackupManage.aspx"><%=Resources.L.文件备份%></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu7_6">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.数据字典%></li>
					<li id="menu7_6_1"><a href="javascript:;" data-url="Addon/DictionaryManage.aspx"><%=Resources.L.单级数据字典管理%></a></li>
					<li id="menu7_6_2"><a href="javascript:;" data-url="Addon/GradeCateManage.aspx"><%=Resources.L.多级数据字典管理%></a></li>
					<li id="menu7_6_3"><a href="javascript:;" data-url="Config/CitizenXmlConfig.aspx"><%=Resources.L.国籍数据字典管理%></a></li>
					<li id="menu7_6_4"><a href="javascript:;" data-url="Addon/KeyWordManage.aspx"><%=Resources.L.搜索关键词库%></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu7_8">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.版权中心%></li>
					<li id="menu7_8_1"><a href="javascript:;" data-url="Copyright/Config.aspx"><%=Resources.L.版权配置%></a></li>
					<li id="menu7_8_2"><a href="javascript:;" data-url="Copyright/AddWorks.aspx"><%=Resources.L.添加作品%></a></li>
					<li id="menu7_8_3"><a href="javascript:;" data-url="Copyright/WorksList.aspx"><%=Resources.L.作品列表%></a></li>
					<li id="menu7_8_4"><a href="javascript:;" data-url="Copyright/LocalWorks.aspx"><%=Resources.L.作品镜像%></a></li>
					<li id="menu7_8_5"><a href="javascript:;" data-url="Copyright/Authorized.aspx"><%=Resources.L.我的授权%></a></li>
					<li id="menu7_8_6"><a href="javascript:;" data-url="Copyright/Royalty.aspx"><%=Resources.L.搜索关键词库%></a></li>
				</ul>
			</div>
			<div id="menu8" class="m_left_ul">
				<ul class="m_left_ulin" id="menu8_1">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.网站配置%></li>
					<li id="menu8_1_1"><a href="javascript:;" data-url="Config/SiteInfo.aspx"><%=Resources.L.基本信息%></a></li>
					<li id="menu8_1_2"><a href="javascript:;" data-url="Config/SiteOption.aspx"><%=Resources.L.进阶信息%></a></li>
					<li id="menu8_1_10"><a href="javascript:;" data-url="Config/SetOrderStatus.aspx"><%=Resources.L.订单配置%></a></li>
					<li id="menu8_1_3"><a href="javascript:;" data-url="Config/MobileMsgConfig.aspx"><%=Resources.L.短信配置%></a></li>
					<li id="menu8_1_4"><a href="javascript:;" data-url="Config/MailConfig.aspx"><%=Resources.L.邮件参数%></a></li>
					<li id="menu8_1_5"><a href="javascript:;" data-url="Config/ThumbConfig.aspx"><%=Resources.L.水印缩图%></a></li>
					<li id="menu8_1_7"><a href="javascript:;" data-url="Config/AppConfig.aspx"><%=Resources.L.维护中心%></a></li>
					<li id="menu8_1_8"><a href="javascript:;" data-url="Config/Sensitivity.aspx"><%=Resources.L.敏感过滤%></a></li>
					<li id="menu8_1_9"><a href="javascript:;" data-url="Config/CreateMap.aspx"><%=Resources.L.快速索引%></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu8_2">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.模型管理%></li>
					<li id="menu8_2_1"><a href="javascript:;" data-url="Content/Model/ModelManage.aspx?ModelType=1"><%=Resources.L.内容模型%></a></li>
					<li id="menu8_2_2"><a href="javascript:;" data-url="Content/Model/ModelManage.aspx?ModelType=2"><%=Resources.L.商城模型%></a></li>
					<li id="menu8_2_3"><a href="javascript:;" data-url="Content/Model/ModelManage.aspx?ModelType=5"><%=Resources.L.店铺模型%></a></li>
					<li id="menu8_2_4"><a href="javascript:;" data-url="Content/Model/ModelManage.aspx?ModelType=3"><%=Resources.L.用户模型%></a></li>
					<li id="menu8_2_5"><a href="javascript:;" data-url="Content/Model/ModelManage.aspx?ModelType=4"><%=Resources.L.黄页模型%></a></li>
					<li id="menu8_2_6"><a href="javascript:;" data-url="Shop/SystemOrderModel.aspx?Type=0"><%=Resources.L.订单模型%></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu8_3">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.节点管理%></li>
					<li id="menu8_3_1"><a href="javascript:;" data-url="Content/Node/NodeManage.aspx"><%=Resources.L.节点管理%></a></li>
					<li id="menu8_3_2"><a href="javascript:;" data-url="Content/Node/BatchNode.aspx"><%=Resources.L.批量设置%></a></li>
					<li id="menu8_3_3"><a href="javascript:;" data-url="Content/Node/UnionNode.aspx"><%=Resources.L.合并迁移%></a></li>
					<li id="menu8_3_4"><a href="javascript:;" data-url="Config/Route/RouteConfig.aspx"><%=Resources.L.站点路由%></a></li>
					<li id="menu8_3_6"><a href="javascript:;" data-url="Content/Addon/SToS.aspx"><%=Resources.L.站站迁移%></a></li>
					<div class="input-group">
						<input type="text" id="NodeSkey_t" class="form-control" placeholder="<%=Resources.L.节点ID或名称%>" onkeydown="return ASCX.OnEnterSearch('Content/Node/NodeSearch.aspx?NodeID=',this);" />
						<div class="input-group-append">
							<button id="NodeBtn" class="input-group-text" type="button" onclick="ASCX.Search('Content/Node/NodeSearch.aspx?NodeID=','NodeSkey_t');"><i class="zi zi_search"></i></button>
						</div>
					</div>
				</ul>
				<ul class="m_left_ulin" id="menu8_4">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.流程管理%></li>
					<li id="menu8_4_1"><a href="javascript:;" data-url="Content/Flow/FlowManager.aspx"><%=Resources.L.流程管理%></a></li>
					<li id="menu8_4_2"><a href="javascript:;" data-url="Content/Flow/AuditingState.aspx"><%=Resources.L.状态编码%></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu8_5">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.专题管理%></li>
					<li id="menu8_5_1"><a href="javascript:;" data-url="Content/SpecialManage.aspx"><%=Resources.L.专题列表%></a></li>
					<li id="menu8_5_2"><a href="javascript:;" data-url="Content/MoveSpec.aspx"><%=Resources.L.专题迁移%></a></li>
					<div class="input-group">
						<input type="text" id="SpecKey_t" class="form-control" placeholder="专题ID或名称" onkeydown="return ASCX.OnEnterSearch('Content/SpecialManage.aspx?skey=',this);" />
						<div class="input-group-append">
							<button id="Spec_btn" class="input-group-text" type="button" onclick="ASCX.Search('Content/SpecialManage.aspx?skey=','SpecKey_t');"><i class="zi zi_search"></i></button>
						</div>
					</div>
				</ul>
				<ul class="m_left_ulin" id="menu8_6">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.模板风格%></li>
					<li id="menu8_6_1"><a href="javascript:;" data-url="Template/TemplateSet.aspx"><%=Resources.L.方案列表%></a></li>
					<li id="menu8_6_2"><a href="javascript:;" data-url="Template/TemplateManage.aspx"><%=Resources.L.模板中心%></a></li>
					<li id="menu8_6_3"><a href="javascript:;" data-url="Template/CSSManage.aspx"><%=Resources.L.风格管理%></a></li>
					<li id="menu8_6_4"><a href="javascript:;" data-url="Template/TemplateSetOfficial.aspx"><%=Resources.L.云端模板%></a></li>
					<li id="menu8_6_5"><a href="javascript:;" data-url="Template/ExternDS/DSList.aspx"><%=Resources.L.外部数据库源%></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu8_7"></ul>
				<ul class="m_left_ulin" id="menu8_8">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.在线支付%></li>
					<li id="menu8_8_1"><a href="javascript:;" data-url="Pay/PayPlatManage.aspx"><%=Resources.L.支付平台管理%></a></li>
					<li id="menu8_8_2"><a href="javascript:;" data-url="Pay/AlipayBank.aspx"><%=Resources.L.支付宝单网银%></a></li>
					<li id="menu8_8_6"><a href="javascript:;" data-url="WeiXin/PayWeiXin.aspx"><%=Resources.L.PC端微信支付%></a></li>
					<li id="menu8_8_7"><a href="javascript:;" data-url="WeiXin/PayWeiXinAPP.aspx"><%=Resources.L.APP微信支付%></a></li>
					<li id="menu8_8_9"><a href="javascript:;" data-url="Pay/PaypalManage.aspx"><%=Resources.L.PayPal国际支付%></a></li>
					<li id="menu8_8_4"><a href="javascript:;" data-url="Pay/PaymentList.aspx"><%=Resources.L.充值信息管理%></a></li>
					<li id="menu8_8_8"><a href="javascript:;" data-url="User/Addon/RegularList.aspx"><%=Resources.L.充值赠送%></a></li>
				</ul>
			</div>
			<div id="menu9" class="m_left_ul">
				<ul class="m_left_ulin" id="menu9_1">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.OA配置%></li>
					<li id="menu9_1_1"><a href="javascript:;" data-url="Content/Model/ModelManage.aspx?ModelType=12"><%=Resources.L.办公模型%></a></li>
					<li id="menu9_1_2"><a href="javascript:;" data-url="WorkFlow/Default.aspx"><%=Resources.L.流程管理%></a></li>
					<li id="menu9_1_3"><a href="javascript:;" data-url="WorkFlow/FlowTypeList.aspx"><%=Resources.L.类型管理%></a></li>
					<li id="menu9_1_6"><a href="javascript:;" data-url="WorkFlow/ApplyManage.aspx"><%=Resources.L.公文管理%></a></li>
					<li id="menu9_1_4"><a href="javascript:;" data-url="WorkFlow/MisModelManage.aspx"><%=Resources.L.套红管理%></a></li>
					<li id="menu9_1_5"><a href="javascript:;" data-url="WorkFlow/SignManage.aspx"><%=Resources.L.签章管理%></a></li>
					<li id="menu9_1_7"><a href="javascript:;" data-url="WorkFlow/OAConfig.aspx"><%=Resources.L.系统配置%></a></li>
					<li id="menu9_1_10"><a href="javascript:;" data-url="WorkFlow/MailManage.aspx"><%=Resources.L.邮箱管理%></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu9_2">
				</ul>
				<ul class="m_left_ulin" id="menu9_3">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.项目管理%></li>
					<li id="menu9_3_4"><a href="javascript:;" data-url="AddOn/Project/ProjectsType.aspx"><%=Resources.L.项目配置%></a></li>
					<li id="menu9_3_1"><a href="javascript:;" data-url="AddOn/Project/ManageProjects.aspx"><%=Resources.L.项目管理%></a></li>
					<li id="menu9_3_3"><a href="javascript:;" data-url="AddOn/Project/WorkManage.aspx"><%=Resources.L.流程管理%></a></li>
					<li id="menu9_3_5"><a href="javascript:;" data-url="Content/Model/ModelField.aspx?ModelID=25&ModelType=10"><%=Resources.L.项目模型%></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu9_4">
                    <li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i><%=Resources.L.CRM管理%></li>
                    <li id="menu9_4_1"><a href="javascript:;" data-url="/AdminMVC/CRM/ClientList"><%=Resources.L.客户档案%></a></li>
                    <li id="menu9_4_3"><a href="javascript:;" data-url="/AdminMVC/CRM/CType"><%=Resources.L.类别字典%></a></li>
					<li id="menu9_4_4"><a href="javascript:;" data-url="Content/Model/ModelField.aspx?ModelID=48&ModelType=11"><%=Resources.L.扩展字段%></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu9_5">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.有问必答%></li>
					<li id="menu9_5_1"><a href="javascript:;" data-url="iServer/BiServer.aspx?num=1"><%=Resources.L.有问必答%></a></li>
					<li id="menu9_5_3"><a href="javascript:;" data-url="iServer/AddQuestionRecord.aspx"><%=Resources.L.创建问题%></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu9_6">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.客服通%></li>
					<li><a href="javascript:;" data-url="User/Service/ServiceSeat.aspx"><%=Resources.L.客服席位%></a></li>
					<li><a href="javascript:;" data-url="User/Service/CodeList.aspx"><%=Resources.L.引用管理%></a></li>
					<li><a href="javascript:;" data-url="User/Service/MsgEx.aspx"><%=Resources.L.聊天记录%></a></li>
					<li><a href="javascript:;" data-url="User/Addon/UAction.aspx"><%=Resources.L.行为跟踪%></a></li>
					<%--	<li><a href="javascript:;" data-url="User/UserGroup.aspx"><%=Resources.L.用户组管理%></a></li>--%>
				</ul>
				<ul class="m_left_ulin" id="menu9_7">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.工作统计%></li>
					<li id="menu9_7_1"><a href="javascript:;" data-url="Workload/ContentRank.aspx"><%=Resources.L.排行榜%></a></li>
					<li id="menu9_7_3"><a href="javascript:;" data-url="Workload/WorkCount.aspx"><%=Resources.L.时间统计%></a></li>
					<li id="menu9_7_2"><a href="javascript:;" data-url="Workload/Subject.aspx?Type=manager"><%=Resources.L.编辑统计%></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu9_8">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.日志管理%></li>
					<li id="menu9_8_1"><a href="javascript:;" data-url="Plus/Log/LogManage.aspx?LogType=4"><%=Resources.L.管理登录%></a></li>
					<li id="menu9_8_2"><a href="javascript:;" data-url="Plus/Log/LogManage.aspx?LogType=0"><%=Resources.L.内容管理%></a></li>
					<li id="menu9_8_3"><a href="javascript:;" data-url="Plus/Log/TxtLog.aspx?LogType=safe"><%=Resources.L.安全日志%></a></li>
					<li id="menu9_8_4"><a href="javascript:;" data-url="Plus/Log/TxtLog.aspx?LogType=fileup"><%=Resources.L.上传日志%></a></li>
					<li id="menu9_8_5"><a href="javascript:;" data-url="Plus/Log/TxtLog.aspx?LogType=exception"><%=Resources.L.异常日志%></a></li>
					<li id="menu9_8_6"><a href="javascript:;" data-url="Plus/Log/TxtLog.aspx?LogType=labelex"><%=Resources.L.标签异常%></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu9_9">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.能力中心%></li>
					<li id="menu9_9_1"><a href="javascript:;" data-url="Plat/PlatInfoManage.aspx"><%=Resources.L.信息管理%></a></li>
					<li id="menu9_9_3"><a href="javascript:;" data-url="Plat/CompList.aspx"><%=Resources.L.公司管理%></a></li>
					<li id="menu9_9_4"><a href="javascript:;" data-url="Plat/TopicList.aspx"><%=Resources.L.话题管理%></a></li>
					<li id="menu9_9_7"><a href="javascript:;" data-url="Plat/AuditApply.aspx"><%=Resources.L.申请管理%></a></li>
					<li id="menu9_9_5"><a href="javascript:;" data-url="Plat/AuditComp.aspx"><%=Resources.L.公司认证%></a></li>
					<li id="menu9_9_6"><a href="javascript:;" data-url="Plat/CreateComp.aspx"><%=Resources.L.创建企业%></a></li>
				</ul>
                	<ul class="m_left_ulin" id="menu9_12">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.组织结构%></li>
					<li id="menu9_12_1"><a href="javascript:;" data-url="Addon/StructList.aspx"><%=Resources.L.部门列表%></a></li>
					<li id="menu9_12_2"><a href="javascript:;" data-url="Addon/StructChart.aspx"><%=Resources.L.部门图表%></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu9_11">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.智慧图表%></li>
					<li id="menu9_11_1"><a href="javascript:;" data-url="Content/ECharts/AddChart.aspx"><%=Resources.L.创建图表%></a></li>
					<li id="menu9_11_2"><a href="javascript:;" data-url="Content/ECharts/Default.aspx"><%=Resources.L.图表列表%></a></li>
				</ul>
			</div>
			<div id="menu10" class="m_left_ul">
				<ul class="m_left_ulin" id="menu10_1">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.移动应用%></li>
					<li id="menu10_1_2"><a href="javascript:;" data-url="/APP/Default"><%=Resources.L.网站APP%></a></li>
					<li id="menu10_1_6"><a href="javascript:;" data-url="/APP/Default?APKMode=1"><%=Resources.L.云打包APP%></a></li>
					<li id="menu10_1_1"><a href="javascript:;" data-url="WeiXin/home.aspx"><%=Resources.L.应用列表%></a></li>
					<li id="menu10_1_4"><a href="javascript:;" data-url="/APP/CLList"><%=Resources.L.APP颁发%></a></li>
					<li id="menu10_1_8"><a href="javascript:;" data-url="App/AppTlpOnline.aspx"><%=Resources.L.我的模板%></a></li>
					<li id="menu10_1_9"><a href="javascript:;" data-url="/APP/APPList"><%=Resources.L.我的APP%></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu10_2"></ul>
				<ul class="m_left_ulin" id="menu10_3">
					<li class="pl-0"><p class="menu_tit laybtn below"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.智能硬件%></p>
						<ul>
							<li id="menu10_3_1"><a href="javascript:;" data-url="Shop/Printer/ListDevice.aspx"><%=Resources.L.设备列表%></a></li>
							<li id="menu10_3_2"><a href="javascript:;" data-url="Shop/Printer/MessageList.aspx"><%=Resources.L.打印流水%></a></li>
							<li id="menu10_3_3"><a href="javascript:;" data-url="Shop/Printer/QuickPrint.aspx"><%=Resources.L.模板管理%></a></li>
							<li id="menu10_3_5"><a href="javascript:;" data-url="Shop/Printer/OrderPrint.aspx"><%=Resources.L.订单输出%></a></li>
							<li id="menu10_3_4"><a href="javascript:;" data-url="Shop/Printer/TestPrint.aspx"><%=Resources.L.模拟打印%></a></li>
						</ul>
					</li>
					<li class="pl-0"><p class="menu_tit laybtn below"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.在线监控%></p>
						<ul>
							<li id="menu10_3_6"><a href="javascript:;" data-url="Device/Monitor/Default.aspx"><%=Resources.L.设备列表%></a></li>
							<li id="menu10_3_7"><a href="javascript:;" data-url="Device/Monitor/MonitorAdd.aspx"><%=Resources.L.添加设备%></a></li>
						</ul>
					</li>
				</ul>
				<ul class="m_left_ulin" id="menu10_4">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.消息推送%></li>
					<li id="menu10_4_1"><a href="javascript:;" data-url="Mobile/Push/APIList.aspx"><%=Resources.L.API列表%></a></li>
					<li id="menu10_4_2"><a href="javascript:;" data-url="Mobile/Push/PushMsg.aspx"><%=Resources.L.消息推送%></a></li>
					<li id="menu10_4_3"><a href="javascript:;" data-url="Mobile/Push/Default.aspx"><%=Resources.L.历史推送%></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu10_5">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.头条管理%></li>
					<li id="menu10_5_1"><a href="javascript:;" data-url="TouTiao/TouTiaoConfig.aspx"><%=Resources.L.头条配置%></a></li>
					<li id="menu10_5_3"><a href="javascript:;" data-url="TouTiao/TouTiaoContent.aspx"><%=Resources.L.内容管理%></a></li>
					<li id="menu10_5_2"><a href="javascript:;" data-url="TouTiao/AddTouTiaoContent.aspx"><%=Resources.L.发布文章%></a></li>
					<li id="menu10_5_4"><a href="javascript:;" data-url="TouTiao/AddTouTiaoVideo.aspx"><%=Resources.L.发布视频%></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu10_7">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.百变微站%></li>
					<li id="menu10_7_1"><a href="javascript:;" data-url="Amazing/css/default.aspx"><%=Resources.L.呈现管理%></a></li>
					<li id="menu10_7_2"><a href="javascript:;" data-url="Amazing/css/csscontent.aspx"><%=Resources.L.新建样式%></a></li>
					<li id="menu10_7_3"><a href="javascript:;" data-url="Template/SPage/Default.aspx"><%=Resources.L.可视设计%></a></li>
					<li id="menu10_7_4"><a href="javascript:;" data-url="Template/TemplateSetOfficial.aspx"><%=Resources.L.云端模板%></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu10_6">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.H5场景%></li>
					<div class="input-group">
						<input type="text" placeholder="<%=Resources.L.场景名称或用户名%>" class="form-control" id="scence_text" />
						<div class="input-group-append">
							<button class="input-group-text" type="button" onclick="ASCX.Search('design/SceneList.aspx?KeyWord=','scence_text');" ><i class="zi zi_search"></i></button>
						</div>
					</div>
					<li id="menu11_11_2"><a href="javascript:;" data-url="design/SceneList.aspx"><%=Resources.L.场景列表%></a></li>
					<li id="menu11_11_1"><a href="javascript:;" data-url="design/TlpList.aspx?type=1"><%=Resources.L.场景模板%></a></li>
					<li id="menu11_11_5"><a href="javascript:;" data-url="design/AlbumList.aspx"><%=Resources.L.智能相册%></a></li>
					<li id="menu11_11_4"><a href="javascript:;" data-url="design/PubList.aspx"><%=Resources.L.互动信息%></a></li>
					<li id="menu11_11_3"><a href="javascript:;" data-url="design/Addon/VisitCount.aspx"><%=Resources.L.访问统计%></a></li>
					<li class="pl-0"><p class="menu_tit laybtn below"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.动力问券%></p>
						<ul>
							<li id="menu11_11_6"><a href="javascript:;" data-url="design/ask/asklist.aspx"><%=Resources.L.问券列表%></a></li>
							<li id="menu11_11_7"><a href="javascript:;" data-url="design/ask/anslist.aspx"><%=Resources.L.回答列表%></a></li>
						</ul>
					</li>
				</ul>
			</div>
			<div id="menu11" class="m_left_ul">
				<ul class="m_left_ulin" id="menu11_1">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.站群管理%></li>
					<li id="menu11_1_1"><a href="javascript:;" data-url="Site/SiteConfig.aspx"><%=Resources.L.全局配置%></a></li>
					<li id="menu11_1_2"><a href="javascript:;" data-url="Site/ServerClusterConfig.aspx"><%=Resources.L.服务器群%></a></li>
					<li id="menu11_1_3"><a href="javascript:;" data-url="Site/DBManage.aspx"><%=Resources.L.数据管理%></a></li>
					<li id="menu11_1_4"><a href="javascript:;" data-url="Site/Default.aspx"><%=Resources.L.站点列表%></a></li>
					<li id="menu11_1_5"><a href="javascript:;" data-url="Site/SitePool.aspx"><%=Resources.L.应用程序池%></a></li>
					<li id="menu11_1_6"><a href="javascript:;" data-url="Template/TemplateSetOfficial.aspx"><%=Resources.L.模板云台%></a></li>
					<li id="menu11_1_7"><a href="javascript:;" data-url="Site/SiteCloudSetup.aspx"><%=Resources.L.快云安装%></a></li>
					<li id="menu11_1_8"><a href="javascript:;" data-url="Site/SiteDataCenter.aspx"><%=Resources.L.智能采集%></a></li>
					<li id="menu11_1_9"><a href="javascript:;" data-url="Site/HostList.aspx"><%=Resources.L.FTP管理%></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu11_2">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.域名注册%></li>
					<li id="menu11_2_1"><a href="javascript:;" data-url="Site/DomPrice.aspx"><%=Resources.L.域名定价%></a></li>
					<li id="menu11_2_2"><a href="javascript:;" data-url="Site/DomManage.aspx"><%=Resources.L.域名管理%></a></li>
					<li id="menu11_2_3"><a href="javascript:;" data-url="Site/DNSManage.aspx">DNS<%=Resources.L.管理%></a></li>
					<%--<li id="menu11_2_4"><a href="javascript:;" data-url="Site/SiteDataCenter.aspx"><%=Resources.L.智能采集%></a></li>--%>
					<%--<li id="menu11_2_5"><a href="javascript:;" data-url="Site/ProductManage.aspx"><%=Resources.L.域名定价%></a></li>--%>
					<li id="menu11_2_6"><a href="javascript:;" data-url="Site/SiteConfig.aspx?remote=true"><%=Resources.L.全局配置%></a></li>
				</ul>
				<ul class="m_left_ulin" id="menu11_10">
					<li class="menu_tit"><i class="zi zi_forDown" zico="下指"></i> <%=Resources.L.动力设计%></li>
						<div class="input-group ">
							<input type="text" placeholder="站点名称或用户名" class="form-control" id="site_text" />
							<div class="input-group-append">
								<button class="input-group-text" type="button" onclick="ASCX.Search('design/SiteList.aspx?KeyWord=','site_text');"><i class="zi zi_search"></i></button>
							</div>
						</div>
					<li id="menu11_10_1"><a href="javascript:;" data-url="design/SiteList.aspx"><%=Resources.L.站点列表%></a></li>
					<li id="menu11_10_2"><a href="javascript:;" data-url="design/TlpList.aspx?type=0"><%=Resources.L.动力模板%></a></li>
					<li id="menu11_10_3"><a href="javascript:;" data-url="design/TlpClass.aspx"><%=Resources.L.模板类别%></a></li>
					<li id="menu11_10_4"><a href="javascript:;" data-url="design/ResList.aspx"><%=Resources.L.资源管理%></a></li>
					<li id="menu11_10_5"><a href="javascript:;" data-url="design/Config.aspx"><%=Resources.L.动力配置%></a></li>
					<li id="menu11_10-6"><a href="javascript:;" data-url="design/MBSiteList.aspx"><%=Resources.L.微建站%></a></li>
				</ul>
			</div>
		</div>
		<asp:UpdatePanel ID="LeftPanel" runat="server" EnableViewState="false">
			<ContentTemplate>
				<div runat="server" id="left_Div" style="overflow-y: auto; position: relative;"></div>
				<asp:Button runat="server" ID="leftSwitch_Btn" OnClick="leftSwitch_Btn_Click" Style="display: none;" />
				<asp:HiddenField runat="server" ID="left_Hid" />
			</ContentTemplate>
		</asp:UpdatePanel>
<div id="leftSwitch" onclick="hideleft();">
<i class="zi zi_forLeft" zico="左指"></i>
</div>
</div>
 <!--left ned-->
 
<div class="" id="right">	
    
<div class="m_tabs">
    <!-- tabs begin -->
<style type="text/css">
.FrameTab_nav{margin-bottom:.2em;height:40px;line-height:40px}
.FrameTabs_bg{margin-bottom:8px}

#Frame_UL{border-radius:4px;overflow:hidden;margin-top:2px;padding-left:0;width:100%;list-style-type:none;text-decoration:none}
#Frame_UL>li{width:120px;min-height:44px; padding:0 20px;background:#fff;float:left;border-top:1px solid #ddd;border-bottom:1px solid #ddd;border-left:1px solid #ddd;text-overflow:ellipsis;cursor:pointer;position:relative;}
#Frame_UL>li:hover{background:#d2dff2;}
#Frame_UL li:hover .closeTab{color:#ccc;opacity:1}
#Frame_UL a{text-decoration:none;font-size:.92rem}
#Frame_UL .active{background:rgba(0,118,222,.6)}
#Frame_UL .active a{color:#fff}
#Frame_UL .active .closeTab{display:inline-block}
#Frame_UL .addTab{width:55px;}
#Frame_UL .addTab:hover {background: rgba(0, 118, 222, 0.92); }
#Frame_UL .addTab:hover a {color: white; }

#Frame_UL li:first-child{border-bottom-left-radius:4px;border-top-left-radius:4px}
#Frame_UL li:last-child{border-right:1px solid #ddd;border-top-right-radius:4px;border-bottom-right-radius:4px}
#Frame_UL .closeTab{position:absolute;right:8px;color:#0072bc;}

</style>
<div class="FrameTabs_bg">
		<div class="FrameTab_nav">
			<div id="FrameTabs" style="overflow: hidden; width: 100%;">
				<div class="tab-strip-wrap">
					<ul class="tab-strip" id="Frame_UL">
						<li class="FrameTab" id="FrameTab0" data-id="0" onclick="FrameTab.switchTab(this);"><a href="javascript:"><span class="FrameTabTitle"><%=Resources.L.新选项卡%></span></a><a class="closeTab" title="关闭" onclick="FrameTab.del(this);"><span class="zi zi_times"></span></a></li>
						<li class="addTab" id="newFrameTab" onclick="FrameTab.add(this);"><a title="<%=Resources.L.新选项卡%>" href="javascript:"><i class="zi zi_plus"></i></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- tabs end -->
	<div class="thumbnail">
		<div id="main_right_frame">
			<iframe id="main_right" class="FrameIframe" data-id="0" onload="FrameTab.setTitle(this)" style="z-index: 2; background: #fff; visibility: inherit; overflow: auto; overflow-x: hidden; width: 100%;" frameborder="0"></iframe>
			<div class="clearfix"></div>
		</div>
	</div>
</div>
</div>
<script>$(function () { ShowMain('','<%=SiteConfig.SiteOption.Admin_StartUrl %>'); })</script>
<!--right ned-->
</main>

<div style="position: absolute; left: 0px; top: 0px; z-index: 10001; text-align: center;" id="infoDiv"></div>
<!--锁屏-->
<div style="position: absolute; display: none; left: 0px; top: 0px; height: 100%; z-index: 10000; background: #1c6297;" id="tranDiv" class="insbox">
	<div style="position: absolute; left: 0px; top: 0px; width: 100%; height: 100%; filter: alpha(Opacity=20)" id="tranDivBack"></div>
</div>
<div class="manage_mobilemenu_bg" style="display:none;"></div>
<div class="manage_mobilemenu">
	<div class="manage_mobilemenu_close"><a href="javascript:;" onclick="HideManageLeft();"><i class="zi zi_timescircle" zico="错号圆标"></i> </a></div>
	<div class="manage_mobilemenu_c">
		<ul>
			<li><a href="/" target="_blank" title="<%=Resources.L.网站首页%>"><i class="zi zi_home" zico="家"></i> <%=Resources.L.网站首页%></a></li>
			<li><a href="/user/" target="_target" title="ALT+U<%=Resources.L.进入会员中心 %>"><i class="zi zi_user" zico="用户标志"></i> <%=Resources.L.会员中心%></a></li>
			<li><a href="javascript:void(0)" style="cursor: pointer;" title='Alt+Q<%=Resources.L.锁定屏幕 %>' onclick="showWindow('Lockin.aspx',900,460);"><i class="zi zi_lock" zico="锁定"></i> <%=Resources.L.锁定屏幕 %></a></li>
			<li><a href="/AdminMVC/COM/Logout" title="退出系统"><i class="zi zi_signoutalt" zico="出口标志"></i> <%=Resources.L.退出系统%></a></li>
		</ul>
	</div>
</div>
<script src="/dist/js/bootstrap4.min.js"></script>
<script src="/JS/Plugs/transtool.js"></script>
<script src="/JS/ICMS/ascx.js?ver=20170424"></script>
<script src="/JS/ICMS/alt.js?v=<%:ZoomLa.BLL.BLLCommon.Version_JS %>"></script>
<script src="/JS/ICMS/Main.js?v=<%:ZoomLa.BLL.BLLCommon.Version_JS %>"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
    var Path = '<%=CustomerPageAction.customPath2%>';
    var adDiag = new ZL_Dialog();
    $(function () {
         <%=Call.PreLoadPage()%>
        $("li a[data-url]").click(function () {
            ShowMain('', $(this).attr("data-url"), this);
        });
        //$("#tab_ul").sortable({ containment: 'parent' });
        BindLayerUL();
        //锁屏
        if (getCookie("SetLock") == "1") {
            showWindow('Lockin.aspx', 900, 460);
        }
        //小屏下菜单显示 
        $(".mb_nav .navbar-nav li a").click(function (e) {
            var snav = $(this).attr("data-label");
            $(".mb_nav .navbar-nav a").removeClass("active");
            $(this).addClass("active");
            $(".sub_nav").slideDown();
            $(".sub_nav").html("");
            $(".sub_nav").append($("ul." + snav).html());
            $(".sub_nav li a").removeAttr("onclick");
            $(".sub_nav li a").click(function (e) {
                showThiNav(this);
            })
        });
        $('.popover-dismiss').popover({
            trigger: 'toggle'
        });
        //顶部按钮
        $(".sysMenu").find("ul li").click(function () {
            $(this).siblings("li").removeClass("active");
            $(this).addClass("active");
        });
        $(".m_top_bottom").find("ul li").click(function () {
            $(this).siblings("li").removeClass("active");
            $(this).addClass("active");
        })
    });
    window.onresize = setLayout;
    document.body.scroll = "no";
    function setLayout() {
        //document.getElementById("main_right_frame").style.width = document.documentElement.clientWidth;
        //document.getElementById("main_right").height = document.documentElement.clientHeight - 140;
        //----边栏切换按钮
        if ($(window).width() < 768) {
            $("#leftSwitch").hide();
        }
        else {
            LeftBarInit();
        }
        //----边栏滚动条高度
        $("#left_Div").css("height", $(window).height() - 150 + "px");
    }
    setLayout();
    function IsEnter(obj) {
        if (event.keyCode == 13) {
            SearchPage(); return false;
        }
    }
    //搜索
    function SearchPage() {
        var key = $("#keyText").val();
        if (!key || key == "") return;
        ShowMain('', Path + 'Main.aspx?key=' + key);
    }
    function DivCache(url) {
        myFrame.AddTabJson(currentFrameTabId, url, $("#left_Div").html());
    }
    function ShowAD() {
        adDiag.title = "选择工作环境";
        adDiag.url = "Scence.aspx?source=admin";
        adDiag.maxbtn = false;
        adDiag.height = 675;
        adDiag.ShowModal();
    }
    function ShowStartScreen() {
        $('#newbody').show();
        setTimeout(function () { $('#newbody').hide(); }, 20 * 1000);
    }
    function PrePageInit() {
        var ver = Math.random();
        var pages = "Content/ContentManage,Content/AddContent,Content/EditContent,Content/Node/NodeManage,";
        pages += "Shop/ProductManage,Shop/AddProduct,Template/LabelManage,";
        pages += "User/UserManage,";
        pages += "Config/SiteOption";
        var pageArr = pages.split(',');
        for (var i = 0; i < pageArr.length; i++) {
            $.post(Path + pageArr[i] + ".aspx?v=" + ver);
        }
        $.post("/User/Default?v=" + ver);
    }
    //关闭云模板提示
    function cloud_close() {
        $(".toCloud").fadeOut();
    }
    function showThiNav(obj) {
        $(".sub_nav a").removeClass("active");
        $(obj).addClass("active");
        var tnav = $(obj).parent().attr("class");
        $(".thi_nav").slideDown();
        $(".thi_nav").html("");
        $(".thi_nav").append($("ul#" + tnav).html());
        $(".thi_nav li a").click(function (e) {
            showA(this);
        })
    }
    function showA(obj) {
        $(".thi_nav a").removeClass("active");
        $(obj).addClass("active");
        $(".mb_nav button").click();
        $("#main_right").attr("src", $(obj).attr("data-url"));
    }
    $(function (e) {
        drawCanvasOne();
        $(".newbody_c").animate(
            {
                "opacity": "0"
            }, 3000, function () {
                $(".newbody_c").remove();
                $(".newbody_c1t").show().addClass("animated").css("-webkit-animation-name", "fadeIn").css("animation-name", "fadeIn").css("-webkit-animation-duration", "3s").css("animation-duration", "3s").css("-webkit-animation-fill-mode", "both").css("animation-fill-mode", "both");
                $(".newbody_clm").show().addClass("animated").css("-webkit-animation-name", "fadeIn").css("animation-name", "fadeIn").css("-webkit-animation-duration", "3s").css("animation-duration", "3s").css("-webkit-animation-fill-mode", "both").css("animation-fill-mode", "both");;
            });
    });
    function drawCanvasOne() {
        var t = document.getElementById("wave"),
            e = echarts.init(t),
            i = e.getZr(),
            a = e.getWidth(),
            c = e.getHeight(),
            o = new echarts.graphic.Group;
        i.add(o);
        var n = 3;
        800 > a && (n = 2);
        for (var r = 0; 3 > r; r++) {
            for (var s = [], l = 0; n + 1 >= l; l++) {
                var h = c / 10 * r + c / 6,
                    d = Math.random() * c / 8 + h,
                    g = c - Math.random() * c / 8 - h,
                    m = [
                        [2 * l * a / n / 2, r % 2 ? d : g],
                        [(2 * l + 1) * a / n / 2, r % 2 ? g : d]
                    ];
                s.push(m[0], m[1])
            }
            var u = new echarts.graphic.Polyline({
                shape: {
                    points: s,
                    smooth: .4
                },
                style: {
                    stroke: "#fff",
                    opacity: 1 / (r + 1),
                    lineWidth: 1.2 / (r + 1) + .8
                },
                silent: !0,
                position: [-r * a / 8, 35 * -(r - .5)]
            }),
                y = new echarts.graphic.Rect({
                    shape: {
                        x: 0,
                        y: 0,
                        width: 0,
                        height: c
                    },
                    position: [r * a / 8, 0]
                });
            o.add(u), y.animateTo({
                shape: {
                    width: a
                }
            }, 5e3, 800 * Math.random()), u.setClipPath(y), n += 1
        }
        $(window).on("resize", function () {
            var t = e.getWidth(),
                i = e.getHeight();
            e.resize();
            var a = e.getWidth(),
                c = e.getHeight();
            y.setShape({
                width: a,
                height: c
            });
            var n = a / t,
                r = c / i;
            o.eachChild(function (t) {
                t.position[0] *= n, t.position[1] *= r, t.shape.points.forEach(function (t) {
                    t[0] *= n, t[1] *= r
                }), t.dirty(!0)
            })
        })
    }
    function SetConfig(config, model) {
        $.post("Default.aspx", { action: "Theme", config: config, model: model  }, function (data) {
            if (data) { top.location = top.location; }
        });
    }
 //微信应用菜单JS
    function wxclick(li) {
        var $this = $(li);
        $("#wx_menu li").removeClass('SelectedA');
        $this.addClass('SelectedA');
        if ($this.hasClass('wx_item')) {
            var $menu = $this.next('.downmenu');
            if (!$menu.hasClass('d-none')) { $menu.addClass('d-none'); }
            else {
                $("#wx_menu .downmenu").addClass('d-none');
                $menu.removeClass('d-none');
            }
            
        }
    }
function ShowManageLeft(){
	$(".manage_mobilemenu_bg").fadeIn();;
	$(".manage_mobilemenu").addClass("active");
	$(".manage_mobilemenu_bg").click(function(){
		$(".manage_mobilemenu_bg").fadeOut();
		$(".manage_mobilemenu").removeClass("active");
	});
}

function HideManageLeft(){
	$(".manage_mobilemenu_bg").fadeOut();
	$(".manage_mobilemenu").removeClass("active");
}
$("#navbarsExampleDefault ul li").click(function(){
$("#navbarsExampleDefault").animate({right:"-240px"});
})
function ul_hidew(){
$("#navbarsExampleDefault").animate({right:"-240px"});
}

$("#index_mylefy_nav").click(function(){
$("#navbarsExampleDefault").animate({right:"0"});
})
//顶部导航 点击后的选中状态
$("#nav_myTopnav li").click(function(){
$("#nav_myTopnav li").removeClass("active");
$(this).addClass("active");
})
</script>
</form>
<div class="notify_div" id="notify_div"></div>
<audio id="notify_vdo" src="/Common/Luckdraw/images/Shake/shake_match.mp3"></audio>
<style type="text/css">
.notify_div  {border: 1px solid #ddd; display: none; background-color: white; width: 320px; height: 120px; position: fixed; bottom: 20px; right: 10px;cursor:pointer;
    box-shadow: rgba(0, 0, 0, 0.0980392) 0px 2px 5px 0px, rgba(0, 0, 0, 0.0784314) 0px 2px 10px 0px;border-radius:5px;
    font-family:'Microsoft YaHei';
}
.notify_left {width: 70px;height:120px;line-height:120px; display:inline-block; border-right:1px solid #ddd;text-align:center;}
.notify_right {width: 248px;height:120px; float: right; overflow-x:hidden;overflow-y:auto;}
.notify_right #notify_title { border-bottom:1px solid #ddd;padding:3px;position:relative;}
.notify_right #notify_title .zi_times{color:#337ab7;float:right;margin-right:5px;}
.notify_right #notify_body{padding:3px;}
.notify_right .noitfy_item {height:20px;cursor:pointer;border:1px solid #fff;}
.notify_right .noitfy_item:hover {border:1px solid #337ab7;}
.notify_icon_div {height:40px;line-height:40px;color:#fff;}
</style>
<script src="/JS/Modal/APIResult.js"></script>
<script src="/JS/DesktopNotify.js"></script>
<script src="/JS/Controls/ZL_Array.js"></script>
<script>
    var notifyHtml = "<div class=\"notify_left\"><i class=\"zi zi_bell zi_4x\" style=\"color: #337ab7;\"></i></div>"
+ "<div class=\"notify_right\">"
+ "<div id=\"notify_title\"><strong>@Title</strong><i title=\"关闭提示\" class=\"zi zi_times\"  onclick=\"$('#notify_div').hide();\"></i></div>"
+ "<div id=\"notify_body\">@Content</div>"
+ "</div>"
+ "<div class=\"clearfix\"></div>";


function showNotify(data) {
    var model = APIResult.getModel(data);
    if (APIResult.isok(model)) {
        if (model.result.length < 1) { return; }
        document.getElementById("notify_vdo").play();
        $div = $("#notify_div"); $div.html("");
        var $items = JsonHelper.FillItem(notifyHtml, model.result);
        $div.append($items);
        $div.show();
    }
}

    var nfy = new Notify();
    nfy.Init({ url: "/common/api/notify.ashx?action=admin", interval: 10000, deskNotify: true, callback: showNotify });
    nfy.GetNotify();
    </script>
</body>
</html>