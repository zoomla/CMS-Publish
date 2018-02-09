<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FuncList.aspx.cs" Inherits="ZoomLaCMS.Manage.Workload.FuncList" MasterPageFile="/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<style type="text/css">
.panel-body{min-height:502px;}
#navHolder{display:none;}
</style>
<title>功能清单</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container-fulid" style="overflow-x: hidden;">
<div class="row ">
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 padding5">
	<div class="panel panel-default ">
		<div class="panel-heading">
			<div class="pull-right">
				<div class="btn-group">
					<button type="button" class="btn btn-default panel-collapse"><i class="fa fa-caret-up"></i></button>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-default panel-maxible"><i class="fa fa-expand" aria-hidden="true"></i></button>
				</div>
			</div>
			<h4 class="margin-none"><i class="fa fa-bell fa-fw"></i>内容</h4>
		</div>
		
		<div class="panel-body">
			<div class="list-group">
				<div data-toggle="tooltip" data-placement="top" title="按栏目管理的内容介绍" class="list-group-item">按栏目管理<a onclick="ShowMain('NodeTree.ascx','Content/ContentManage.aspx');" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="按专题管理的内容介绍" class="list-group-item">按专题管理<a onclick="ShowMain('NodeTree.ascx','Content/SpecialManage.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="评论管理的内容介绍" class="list-group-item">评论管理<a onclick="showleft('menu2_3','Content/CommentManage.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="互动模块的内容介绍" class="list-group-item ">互动模块<a onclick="showleft('menu2_4','Pub/PubManage.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="生成发布的内容介绍" class="list-group-item">生成发布<a onclick="showleft('menu2_7','Content/CreateHtmlContent.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="采集检索的内容介绍" class="list-group-item">采集检索<a onclick="showleft('menu2_5','Content/Collect/CollectionManage.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="回收站的内容介绍" class="list-group-item">回收站<a onclick="ShowMain('NodeTree.ascx?url=Content/ContentRecycle.aspx','Content/ContentRecycle.aspx');" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="百度问答贴吧的内容介绍" class="list-group-item">百科问答贴吧<a onclick="showleft('menu2_9','Guest/GuestCateMana.aspx?Type=1')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容参数的内容介绍" class="list-group-item">内容参数<a onclick="showleft('menu2_10','AddOn/SourceManage.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="视频管理的内容介绍" class="list-group-item">视频管理<a onclick="showleft('menu2_6','Content/Video/VideoList.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="字体管理的内容介绍" class="list-group-item">字体管理<a onclick="showleft('menu2_11','Content/Font/Default.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
			</div>

		</div>

	</div>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 padding5 ">
	<div class="panel panel-default ">
		<div class="panel-heading">
			<div class="pull-right">
				<div class="btn-group">
					<button type="button" class="btn btn-default panel-collapse"><i class="fa fa-caret-up"></i></button>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-default panel-maxible"><i class="fa fa-expand" aria-hidden="true"></i></button>
				</div>
			</div>
			<h4 class="margin-none"><i class="fa fa-bell fa-fw"></i>商城</h4>
		</div>
		
		<div class="panel-body">
			<div class="list-group">
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">商品管理<a onclick="ShowMain('ShopNodeTree.ascx','Shop/ProductManage.aspx');" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">库存管理<a onclick="showleft('menu3_2','/AdminMVC/Product/StockList')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">订单管理<a onclick="showleft('menu3_3','Shop/OrderList.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">明细记录<a onclick="showleft('menu3_4','Shop/BankRollList.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">销售统计<a onclick="showleft('menu3_5','Shop/SaleReport/SaleByDay.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">促销优惠<a onclick="showleft('menu3_6','Shop/Arrive/PromoList.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">商场配置<a onclick="showleft('menu3_7','Shop/Addon/exp/DeliverType.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">推广中心<a onclick="showleft('menu3_8','User/Promo/PromoList.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">商品回收站<a onclick="ShowMain('ShopRecycle.ascx','Shop/ShopRecycler.aspx');" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">IDC管理<a onclick="showleft('menu3_10','Shop/IDC/IDCOrder.aspx?OrderType=7')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
			</div>

		</div>

	</div>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 padding5 ">
	<div class="panel panel-default ">
		<div class="panel-heading">
			<div class="pull-right">
				<div class="btn-group">
					<button type="button" class="btn btn-default panel-collapse"><i class="fa fa-caret-up"></i></button>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-default panel-maxible"><i class="fa fa-expand" aria-hidden="true"></i></button>
				</div>
			</div>
			<h4 class="margin-none"><i class="fa fa-bell fa-fw"></i>黄页</h4>
		</div>
		
		<div class="panel-body">
			<div class="list-group">
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">黄页管理<a onclick="showleft('menu4_2','/AdminMVC/Page/ApplyAudit')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">内容管理<a onclick="ShowMain('PageTree.ascx','/AdminMVC/Page/PageContent')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">模型管理<a onclick="showleft('menu4_5','Content/Model/ModelManage.aspx?ModelType=10')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item ">公用栏目<a onclick="showleft('menu4_2','/AdminMVC/Page/PageTemplate?ID=-1')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">黄页配置<a onclick="showleft('menu4_2','/AdminMVC/Page/PageConfig')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
			</div>

		</div>

	</div>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 padding5">
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="pull-right">
				<div class="btn-group">
					<button type="button" class="btn btn-default panel-collapse"><i class="fa fa-caret-up"></i></button>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-default panel-maxible"><i class="fa fa-expand" aria-hidden="true"></i></button>
				</div>
			</div>
			<h4 class="margin-none"><i class="fa fa-bell fa-fw"></i>教育</h4>
		</div>
		
		<div class="panel-body">
			<div class="list-group">
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">试卷管理<a onclick="ShowMain('QuestGuide.ascx?url=/AdminMVC/Exam/Papers_System_Manage','/AdminMVC/Exam/Papers_System_Manage')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">试题管理<a onclick="ShowMain('QuestGuide.ascx','/AdminMVC/Exam/QuestList')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">组卷配置<a onclick="showleft('menu5_7','/AdminMVC/Exam/Papers_System_Manage')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">班级管理<a onclick="showleft('menu5_3','/AdminMVC/Exam/ClassRoomManage')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">财务管理<a onclick="showleft('menu5_6','Shop/OrderList.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">数字出版<a onclick="showleft('menu5_8','Exam/News/News.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
			</div>

		</div>

	</div>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 padding5">
	<div class="panel panel-default ">
		<div class="panel-heading">
			<div class="pull-right">
				<div class="btn-group">
					<button type="button" class="btn btn-default panel-collapse"><i class="fa fa-caret-up"></i></button>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-default panel-maxible"><i class="fa fa-expand" aria-hidden="true"></i></button>
				</div>
			</div>
			<h4 class="margin-none"><i class="fa fa-bell fa-fw"></i>用户</h4>
		</div>
		
		<div class="panel-body">
			<div class="list-group">
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">会员管理<a onclick="ShowMain('UserGuide.ascx','User/UserManage.aspx');" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">管理员管理<a onclick="showleft('menu6_2','User/AdminManage.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">用户角色<a onclick="showleft('menu6_3','User/Auth/PermissionInfo.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">信息发送<a onclick="showleft('menu6_4','User/Mail/SendMailList.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">订阅中心<a onclick="showleft('menu6_5','User/Mail/SubscriptListManage.aspx?menu=audit')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">人才招聘<a onclick="showleft('menu6_6','User/Job/Jobsconfig.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">SNS社区<a onclick="showleft('menu6_7','Zone/ZoneConfig.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">整合接口<a onclick="showleft('menu6_8','APP/WSApi.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
			</div>

		</div>

	</div>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 padding5">
	<div class="panel panel-default ">
		<div class="panel-heading">
			<div class="pull-right">
				<div class="btn-group">
					<button type="button" class="btn btn-default panel-collapse"><i class="fa fa-caret-up"></i></button>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-default panel-maxible"><i class="fa fa-expand" aria-hidden="true"></i></button>
				</div>
			</div>
			<h4 class="margin-none"><i class="fa fa-bell fa-fw"></i>扩展</h4>
		</div>
		
		<div class="panel-body">
			<div class="list-group">
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">开发中心<a onclick="showleft('menu7_1','Config/DBTools/Default.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">广告管理<a onclick="showleft('menu7_2','Plus/ADZoneManage.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">访问统计<a onclick="showleft('menu7_3','Counter/Counter.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">问卷调查<a onclick="showleft('menu7_4','Plus/SurveyManage.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">文件管理<a onclick="showleft('menu7_5','File/UploadFile.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">数据字典<a onclick="showleft('menu7_6','Addon/DictionaryManage.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">版权中心<a onclick="showleft('menu7_8','Copyright/Config.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">插件管理<a onclick="showleft('menu8_10','Addon/Plugins/Default.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">日志管理<a onclick="showleft('menu9_8','Plus/LogManage.aspx?LogType=4')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
			</div>

		</div>

	</div>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 padding5">
	<div class="panel panel-default ">
		<div class="panel-heading">
			<div class="pull-right">
				<div class="btn-group">
					<button type="button" class="btn btn-default panel-collapse"><i class="fa fa-caret-up"></i></button>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-default panel-maxible"><i class="fa fa-expand" aria-hidden="true"></i></button>
				</div>
			</div>
			<h4 class="margin-none"><i class="fa fa-bell fa-fw"></i>系统</h4>
		</div>
		
		<div class="panel-body">
			<div class="list-group">
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">网站配置<a onclick="showleft('menu8_1','Config/SiteInfo.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">模型管理<a onclick="showleft('menu8_2','Content/Model/ModelManage.aspx?ModelType=1')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">节点管理<a onclick="showleft('menu8_3','Content/Node/NodeManage.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">流程管理<a onclick="showleft('menu8_4','Content/Flow/FlowManager.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">专题管理<a onclick="showleft('menu8_5','Content/SpecialManage.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">模板风格<a onclick="ShowMain('LabelGuide.ascx','Template/TemplateSet.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">标签管理<a onclick="ShowMain('LabelGuide.ascx','Template/LabelManage.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">百变微站<a onclick="showleft('menu10_7','Amazing/css/Default.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">字体与图库<a onclick="showleft('menu10_7','Addon/FontIcon/Default.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">支付中心<a onclick="showleft('menu8_8','Pay/PayPlatManage.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
			</div>

		</div>

	</div>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 padding5">
	<div class="panel panel-default ">
		<div class="panel-heading">
			<div class="pull-right">
				<div class="btn-group">
					<button type="button" class="btn btn-default panel-collapse"><i class="fa fa-caret-up"></i></button>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-default panel-maxible"><i class="fa fa-expand" aria-hidden="true"></i></button>
				</div>
			</div>
			<h4 class="margin-none"><i class="fa fa-bell fa-fw"></i>办公</h4>
		</div>
		
		<div class="panel-body">
			<div class="list-group">
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">OA办公<a onclick="showleft('menu9_1','WorkFlow/OAConfig.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">组织结构<a onclick="ShowMain('StructTree.ascx','AddOn/StructList.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">能力中心<a onclick="showleft('menu9_9','Plat/PlatInfoManage.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">项目管理<a onclick="showleft('menu9_3','AddOn/Project/Projects.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">CRM管理<a onclick="showleft('menu9_4','AddCRM/CustomerList.aspx?&modelid=48&usertype=0')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">有问必答<a onclick="showleft('menu9_5','iServer/BiServer.aspx?num=-3')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">智慧图表<a onclick="showleft('menu9_11','Content/ECharts/AddChart.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">舆情监测<a onclick="ShowMain('SenTree.ascx','Sentiment/Default.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">客服通<a onclick="showleft('menu9_6','User/Service/ServiceSeat.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">工作统计<a onclick="showleft('menu9_7','Workload/WorkCount.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
			</div>

		</div>

	</div>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 padding5">
	<div class="panel panel-default ">
		<div class="panel-heading">
			<div class="pull-right">
				<div class="btn-group">
					<button type="button" class="btn btn-default panel-collapse"><i class="fa fa-caret-up"></i></button>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-default panel-maxible"><i class="fa fa-expand" aria-hidden="true"></i></button>
				</div>
			</div>
			<h4 class="margin-none"><i class="fa fa-bell fa-fw"></i>移动</h4>
		</div>
		
		<div class="panel-body">
			<div class="list-group">
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">H5创作<a onclick="showleft('menu10_6','Design/SceneList.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">移动应用<a onclick="showleft('menu10_1','WeiXin/home.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">微信应用<a onclick="ShowMain('Weixin.ascx','WeiXin/home.aspx');" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">头条管理<a onclick="showleft('menu10_5','TouTiao/TouTiaoContent.aspx');" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">移动浏览器<a onclick="showleft('menu10_1','/Tools/Mobile.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">智能硬件<a onclick="showleft('menu10_3','Shop/Printer/ListDevice.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">消息推送<a onclick="showleft('menu10_4','Mobile/Push/APIList.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
			</div>

		</div>

	</div>
</div>
<div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 padding5">
	<div class="panel panel-default ">
		<div class="panel-heading">
			<div class="pull-right">
				<div class="btn-group">
					<button type="button" class="btn btn-default panel-collapse"><i class="fa fa-caret-up"></i></button>
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-default panel-maxible"><i class="fa fa-expand" aria-hidden="true"></i></button>
				</div>
			</div>
			<h4 class="margin-none"><i class="fa fa-bell fa-fw"></i>站群</h4>
		</div>
		
		<div class="panel-body">
			<div class="list-group">
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">全局配置<a onclick="showleft('menu11_1','Site/SiteConfig.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">服务器集群<a onclick="showleft('menu11_1','Site/ServerClusterConfig.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">数据库管理<a onclick="showleft('menu11_1','Site/DBManage.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">IIS站点<a onclick="showleft('menu11_1','Site/Default.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">应用程序池<a onclick="showleft('menu11_1','Site/SitePool.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">模板云台<a onclick="showleft('menu11_1','Template/CloudLead.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">快云安装<a onclick="showleft('menu11_1','Site/SiteCloudSetup.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">智能采集<a onclick="showleft('menu11_1','Site/SiteDataCenter.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">域名注册<a onclick="showleft('menu11_2','Site/DomName.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
				<div data-toggle="tooltip" data-placement="top" title="内容介绍" class="list-group-item">动力设计<a onclick="showleft('menu11_10','design/SiteList.aspx')" class="btn btn-info pull-right"><i class="fa fa-link" aria-hidden="true"></i></a></div>
			</div>

		</div>

	</div>
</div>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style>
.list-group .list-group-item a {line-height: 9px; padding-bottom: 1px;}
</style>
<script>
//$(function () { $("[data-toggle='tooltip']").tooltip(); });
//显示隐藏面板
$('.panel').on('click', '.panel-collapse', function () {
var $panel = $(this).closest('.panel')
$('.panel-heading .panel-collapse i', $panel).toggleClass('fa-caret-down').toggleClass('fa-caret-up')
$('.panel-body', $panel).toggleClass('hidden')
})
//放大恢复面板
$('.panel').on('click', '.panel-maxible', function () {
var $panel = $(this).closest('.panel')
$('.panel-heading .panel-maxible i', $panel).toggleClass('fa-compress').toggleClass('fa-expand')
$panel.parent().toggleClass('col-lg-12 col-md-12 col-sm-12 col-xs-12').toggleClass('col-lg-6 col-md-6 col-sm-6 col-xs-12')
})
</script>
</asp:Content>
