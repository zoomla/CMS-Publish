<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProOrderAdd.aspx.cs" Inherits="ZoomLaCMS.BU.Order.ProOrder.ProOrderAdd" MasterPageFile="~/Common/Master/User.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>订单信息</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="shop" data-ban="store"></div>
<div class="container" ng-app="app" ng-controller="appCtrl">
<div class="margin_t5">
    <ol class="breadcrumb">
        <li><a title="会员中心" href="/User/">会员中心</a></li>
        <li><a href="/User/UserShop/OrderList">店铺订单</a></li>
        <li><a href="Default.aspx">申购单列表</a></li>
        <li  class="active"><a href="<%=ZoomLa.BLL.SafeSC.RawUrl %>">订单信息</a></li>
        <div class="clearfix"></div>
    </ol>
</div>
<div class="panel panel-default">
    <div class="panel-heading"><i class="fa fa-product-hunt"></i>商品列表</div>
    <div class="panel-body">
        <div class="pronode_wrap">
            <button ng-repeat="item in nodeList track by $index" ng-class="nodeID==item.NodeID?'active':''" type="button" class="btn btn-info item" ng-bind="item.NodeName" ng-click="setNid(item.NodeID);"></button>
        </div>
            <ul class="product_ul">
                <li class="item" ng-repeat="item in proList|filter:nodeFilter">
                    <img ng-src="item.Clearimg" style="width: 150px;height:150px;" onerror="shownopic(this);" />
                    <div ng-bind="item.Proname"></div>
                    <div><span class="r_red">{{item.LinPrice}}</span> /{{item.ProUnit}}</div>
                    <div>
                        <input type="text" ng-model="item.Pronum" />
                    </div>
                </li>
            </ul>
       <div class="clearfix"></div>
    </div>
<div class="panel panel-info">
    <div class="panel-heading"><i class="fa fa-list"></i>已选购商品</div>
    <div class="panel-body">
        <table class="table table-bordered table-striped">
            <thead><tr><td>商品名</td><td>单价</td><td>数量</td><td>金额</td></tr></thead>
            <tr ng-repeat="item in proList|filter:cartFilter">
                <td ng-bind="item.Proname" class="td_l"></td>
                <td ng-bind="item.LinPrice"></td>
                <td class="td_md"><input type="text" ng-model="item.Pronum" /></td>
                <td ng-bind="calcMoney(item);"></td>
            </tr>
        </table>
        <asp:TextBox runat="server" ID="OrderMessage_T" TextMode="MultiLine" class="form-control margin_t10" style="height:100px;" placeholder="请输入订单备注,200字以内" MaxLength="200"></asp:TextBox>
    </div>
    <div class="panel-footer">
        <span>金额总计：</span><span ng-bind="calcAllMoney();" class="r_red_mid"></span>
        <input type="button" value="提交订单" ng-click="save();" class="pull-right btn btn-info"/>
        <asp:Button runat="server" ID="Save_Btn" style="display:none;" OnClick="Save_Btn_Click" />
        <div class="clearfix"></div>
    </div>
</div>
<asp:HiddenField runat="server" ID="ProNode_Hid" />
<asp:HiddenField runat="server" ID="Product_Hid" />
<asp:HiddenField runat="server" ID="Cart_Hid" />
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
.pronode_wrap .item{width:150px;text-align:center;height:50px;line-height:30px;font-size:20px;margin-left:5px;margin-bottom:5px;}
.pronode_wrap .item.active{background-color:#0094ff;}
.product_ul{margin-top:5px;}
.product_ul li{float:left;margin:5px;}
</style>
<script src="/JS/Plugs/angular.min.js"></script>
<script src="/JS/ICMS/ZL_Common.js"></script>
<script>
    angular.module("app", []).controller("appCtrl", function ($scope) {
        $scope.nodeList = JSON.parse($("#ProNode_Hid").val());
        $scope.proList = JSON.parse($("#Product_Hid").val());
        $scope.nodeID = $scope.nodeList[0].NodeID;
        $scope.nodeFilter = function (item) { return item.NodeID ==$scope.nodeID; }
        $scope.cartFilter = function (item) { return ConverToInt(item.Pronum) > 0; }
        $scope.setNid = function (nid) { $scope.nodeID = nid; }
        //金额小计
        $scope.calcMoney = function (item) {
            return (item.LinPrice * item.Pronum).toFixed(2);
        }
        //金额统计
        $scope.calcAllMoney = function () {
            var money = 0;
            $scope.proList.forEach(function (item, index, list) {
                if (ConverToInt(item.Pronum) < 1) { return; }
                money += (item.LinPrice * item.Pronum);
            })
            return money.toFixed(2);
        }
        $scope.save = function () {
            var cartList = [];
            $scope.proList.forEach(function (item) {
                if (ConverToInt(item.Pronum) > 0) { cartList.push(item); }
            })
            if (cartList.length < 1) { alert("你尚未选择商品"); return false; }
            $("#Cart_Hid").val(angular.toJson(cartList));
            $("#Save_Btn").click();
        }
    });
</script>
</asp:Content>