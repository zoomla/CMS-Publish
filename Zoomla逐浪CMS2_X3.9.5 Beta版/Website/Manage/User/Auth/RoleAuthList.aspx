<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoleAuthList.aspx.cs" Inherits="ZoomLaCMS.Manage.User.RoleAuthList"  MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>角色权限设置</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol id="BreadNav" class="breadcrumb navbar-fixed-top">
    <li>后台管理</li>
    <li><a href="<%= CustomerPageAction.customPath2 %>User/AdminManage.aspx">管理员管理</a></li>
    <li><a href="RoleManage.aspx">角色管理</a></li>
    <li class="active">权限管理[<asp:Label runat="server" ID="RoleName_L"></asp:Label>]</li>
</ol>
<div ng-app="app" ng-controller="appCtrl" style="margin-bottom:80px;">
    <div class="modelItem" ng-repeat="model in auth.list track by $index">
        <div class="modelName">
            <span ng-click="chkModeItem(model);" title="选择全部" style="cursor:pointer;">
                <span style="width:55px;display:inline-block;">
                    <i class="{{model.icon}}"></i>
                    <span ng-bind="model.n"></span>
                </span>
                <i class="fa fa-check-circle" style="color: #0094ff;" ng-show="isAllChk(model)"></i>
                <i class="fa fa-circle-thin" ng-hide="isAllChk(model)"></i>
            </span>
        </div>
        <ul class="authUL">
            <li class="authItem" ng-class="{'check':item.checked}" ng-repeat="item in model.list track by $index" ng-click="chkAuthItem(item);">
                <div class="wrap">
                    <i class="fa fa-check-circle" style="color:#0094ff;" ng-show="item.checked"></i>
                    <i class="fa fa-circle-thin" ng-hide="item.checked"></i>
                    <input type="checkbox" name="{{model.pre}}_authChk" value="{{item.v}}" style="display:none;" ng-checked="item.checked"/>
                    <span>{{item.n}}</span>
                </div>
            </li>
        </ul>
        <div class="clearfix" style="border-bottom:1px solid #ddd;margin-bottom:5px;"></div>
    </div>
</div>
<div class="Conent_fix">
    <asp:Button runat="server" ID="Save_Btn" Text="保存信息" class="btn btn-info" OnClick="Save_Btn_Click" />
    <a href="RoleManage.aspx" class="btn btn-default">返回列表</a>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
.modelItem{margin-bottom:10px;}
.modelName{border:1px solid #ddd;padding:5px;margin-bottom:5px;background-color:#f5f5f5;padding:10px 15px;}
.authUL{padding:10px;padding-bottom:20px;}
.authUL li{float:left;margin-right:5px;margin-bottom:5px;}
.authItem .wrap{border:1px solid #ddd;border-radius:4px; text-align:center;padding:5px 8px;color:#333;font-weight:normal;cursor:pointer;}
.authItem.check .wrap{border:1px solid #26a2fb;}
</style>
<script src="/JS/Plugs/angular.min.js"></script>
<script type="text/javascript">
    //manage==基本
    angular.module("app", []).controller("appCtrl", function ($scope) {
        $scope.auth = { list: [] };
        $scope.auth.get = function (modelName) {
            var model = null;
            for (var i = 0; i < $scope.auth.list.length; i++) {
                if ($scope.auth.list[i].n == modelName) { model = $scope.auth.list[i]; break; }
            }
            return model;
        }
        $scope.auth.fill = function (modelName, auths,list) {
            var model = $scope.auth.get(modelName);
            var isExist = function (v, auths) {
                if (!auths || auths.replace == ",") { return false; }
                else if (auths.indexOf(v) > -1) { return true; }
                else { return false; }
            }
            for (var i = 0; i < list.length; i++) {
                //list[i].v = auth.pre + "_" + list[i].v;
                list[i].checked = isExist(list[i].v, auths);
            }
            model.list = list;
        }
        $scope.auth.list = [
            { n: "模型", pre: "model", list: [],icon:"fa fa-cubes" },
            { n: "内容", pre: "content", list: [], icon: "fa fa-pencil" },
            { n: "商城", pre: "shop", list: [], icon: "fa fa-shopping-bag" },
            { n: "黄页", pre: "page", list: [], icon: "fa fa-leaf" },
            { n: "教育", pre: "exam", list: [], icon: "fa fa-book" },
            { n: "用户", pre: "user", list: [], icon: "fa fa-user" },
            { n: "扩展", pre: "extend", list: [], icon: "fa fa-desktop" },
            { n: "系统", pre: "system", list: [], icon: "fa fa-windows" },
            { n: "办公", pre: "office", list: [], icon: "fa fa-envelope" },
            { n: "移动", pre: "portable", list: [], icon: "fa fa-coffee" },
            { n: "站群", pre: "sites", list: [], icon: "fa fa-database" },
            //{ n: "其它", pre: "other", list: [], icon: "fa fa-code-fork" }
        ];
        //权限粒度暂时只到功能模块,不到页面与按钮
        $scope.auth.fill("模型","<%=authMod.model%>", [
            { n: "模型管理", v: "manage" },
        ]);
        $scope.auth.fill("内容","<%=authMod.content%>", [
            { n: "内容管理", v: "manage" },
            { n: "专题管理", v: "special" },
            { n: "评论管理", v: "comment" },
            { n: "互动模块", v: "pub" },
            { n: "生成发布", v: "create" },
            { n: "采集检索", v: "collect" },
            { n: "回收站", v: "recycle" },
            { n: "问答管理", v: "ask" },
            { n: "百科管理", v: "baike" },
            { n: "贴吧管理", v: "bar" },
        ]);
        $scope.auth.fill("商城", "<%=authMod.shop%>", [
              { n: "商品管理", v: "product" },
              { n: "库存管理", v: "stock" },
              { n: "订单管理", v: "order" },
              { n: "明细记录", v: "detail" },
              { n: "采集检索", v: "collect" },
              { n: "销售统计", v: "sales" },
              { n: "促销优惠", v: "arrive" },
              { n: "商城配置", v: "shopcfg" },
              { n: "推广中心", v: "promo" },
              //{ n: "商品回收站", v: "product" },
              { n: "IDC管理", v: "idc" },
              { n: "店铺管理", v: "store" }
        ]);
        $scope.auth.fill("黄页","<%=authMod.page%>", [
         { n: "黄页管理", v: "manage" },
         //{ n: "内容管理", v: "content" },
         //{ n: "模型管理", v: "model" },
         //{ n: "公用栏目", v: "node" },
         //{ n: "黄页配置", v: "config" }
        ]);
        $scope.auth.fill("教育","<%=authMod.exam%>", [
          { n: "试卷管理", v: "paper" },
          //{ n: "试题管理", v: "question" },
          //{ n: "组卷配置", v: "paper" },
          { n: "班级管理", v: "class" },
          { n: "财务管理", v: "pay" },
          { n: "数字出版", v: "publish" }
        ]);
        $scope.auth.fill("用户","<%=authMod.user%>", [
         { n: "会员管理", v: "manage" },
         { n: "管理员管理", v: "admin" },
         { n: "用户角色", v: "urole" },
         { n: "信息发送", v: "message" },
         { n: "订阅中心", v: "subscript" },
         { n: "人才招聘", v: "job" },
         { n: "SNS社区", v: "sns" },
         { n: "整合接口", v: "api" }
        ]);
        $scope.auth.fill("扩展","<%=authMod.extend%>" ,[
         //{ n: "开发中心", v: "manage" },
         { n: "广告管理", v: "ad" },
         { n: "访问统计", v: "accesslog" },
         { n: "问卷调查", v: "ask" },
         { n: "文件管理", v: "file" },
         { n: "数据字典", v: "dbdic" },
         { n: "版权中心", v: "bqy" },
         { n: "插件管理", v: "plugin" },
         { n: "日志管理", v: "log" }
        ]);
        $scope.auth.fill("系统","<%=authMod.system%>", [
         { n: "网络配置", v: "config" },
         //{ n: "模型管理", v: "model" },
         { n: "节点管理", v: "node" },
         { n: "流程管理", v: "flow" },
         { n: "专题管理", v: "special" },
         { n: "模板风格", v: "tlp" },
         { n: "标签管理", v: "label" },
         { n: "百变微站", v: "amaze" },
         //{ n: "字库与图标", v: "font" },
         { n: "支付中心", v: "pay" }
        ]);
        $scope.auth.fill("办公","<%=authMod.office%>", [
         { n: "OA办公", v: "oa" },
         { n: "组织结构", v: "struct" },
         { n: "能力中心", v: "plat" },
         { n: "项目管理", v: "project" },
         { n: "CRM管理", v: "crm" },
         { n: "有问必答", v: "ask" },
         { n: "智慧图表", v: "echart" },
         { n: "舆情监测", v: "sentiment" },
         { n: "客服通", v: "client" },
         { n: "工作统计", v: "work" }
        ]);
        $scope.auth.fill("移动","<%=authMod.portable%>", [
         { n: "H5创作", v: "h5" },
         { n: "移动应用", v: "mobile" },
         { n: "微信应用", v: "wechat" },
         { n: "头条管理", v: "config" },
         { n: "移动浏览器", v: "config" },
         { n: "智能硬件", v: "device" },
         { n: "消息推送", v: "push" }
        ]);
        $scope.auth.fill("站群","<%=authMod.sites%>", [
         { n: "站群管理", v: "manage" },
         { n: "数据库管理", v: "dbmanage" },
         { n: "IIS站点", v: "create" },
         { n: "应用程序池", v: "pool" },
         { n: "模板云台", v: "cloud" },
         { n: "快云安装", v: "setup" },
         { n: "智能采集", v: "collect" },
         { n: "域名注册", v: "domain" },
         { n: "动力设计", v: "design" }
        ]);
        //------------------
        $scope.chkAuthItem = function (item) {
            item.checked = !item.checked;
        }
        $scope.chkModeItem = function (item) {
            var flag = !$scope.isAllChk(item);//取反
            item.list.forEach(function (item, index, list) {
                item.checked = flag;
            })
        }
        //模型下的权限是否全部选择了
        $scope.isAllChk = function (item) {
            var flag = true;
            for (var i = 0; i < item.list.length; i++) {
                if (item.list[i].checked == false) { flag = false; break; }
            }
            return flag;
        }
    });
</script>
</asp:Content>