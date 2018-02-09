<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddDeliverType.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.AddDeliverType" MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
<script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
<style type="text/css">
    .exdiv{display:none;}
</style>
<title>运费模板</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-bordered table-striped">
        <tr><td class="td_l">模板名称:</td><td>
            <ZL:TextBox runat="server" ID="TlpName_T" CssClass="form-control text_300" MaxLength="100" AllowEmpty="false" /></td></tr>
        <tr><td>计价方式:</td><td>
           <label><input type="radio" value="1" name="pricemod_rad" checked="checked" />按件数</label>
     <%--      <label><input type="radio" value="2" name="pricemod_rad"/>按重量</label></td>--%>
        </tr>
        <tr><td>设置运费:</td><td>
            <div ng-app="app" ng-controller="appCtrl">
       <%--         <div style="border-bottom:1px solid #ddd;padding-bottom:5px;">
                    <input type="button" value="添加新物流方式" ng-click="add();" />
                </div>--%>
                <div ng-repeat="item in list track by $index" class="margin_t5">
                    
                  <%--  <input type="button" value="移除" ng-click="del(item);" />--%>
                 <%--   <input type="text" ng-model="item.name" class="text_xs" placeholder="标识"/>--%>
                    <label style="min-width:45px;"><input type="checkbox" ng-model="item.enabled" />{{item.name}}</label>
                    <span>运费：<input type="text" class="text_xs num" ng-model="item.price" /> 元,每超过一件需加运费<input type="text" class="text_xs num" ng-model="item.plus" />元</span>
                    <select ng-model="item.free_sel">
                        <option value="0">不包邮</option>
                        <option value="1">计件包邮</option>
                        <option value="2">金额包邮</option>
                        <option value="3">件数+金额</option>
                    </select>
                    <span ng-show="item.free_sel==1||item.free_sel==3">满 <input type="text" class="text_xs" ng-model="item.free_num"/>件</span>
                    <span ng-show="item.free_sel==2||item.free_sel==3">满 <input type="text" class="text_xs" ng-model="item.free_money"/>金额</span>
                </div>
            </div>
         </td></tr>
        <tr><td>备注(买家可见):</td><td><asp:TextBox runat="server" ID="Remind_T" TextMode="MultiLine" CssClass="form-control text_300" /></td></tr>
        <tr><td>备注(仅卖家可见):</td><td><asp:TextBox runat="server" ID="Remind2_T" TextMode="MultiLine" CssClass="form-control text_300"/></td></tr>
        <tr><td></td><td><asp:Button runat="server" ID="Save_Btn"  Text="保存信息" OnClientClick="return scope.save();" OnClick="Save_Btn_Click" CssClass="btn btn-primary"/></td></tr>
    </table>
    <asp:HiddenField runat="server" ID="Fare_Hid" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Plugs/angular.min.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script type="text/javascript">
    var scope = null;
    angular.module("app", []).controller("appCtrl", function ($scope) {
        scope = $scope;
        $scope.newModel = function (name) {
            //快递名,计价方式,初始价,续价,包邮方式,多少件包邮,多少钱包邮
            return { "name": name, mode: 1, enabled: true, price: 10, plus: 1, free_sel: 0, free_num: 0, free_money: 0 };
        }
        $scope.add = function () {
            $scope.list.push($scope.newModel("",""));
        }
        $scope.del = function (item) {
            for (var i = 0; i < $scope.list.length; i++) {
                if ($scope.list[i] == item) { $scope.list.splice(i, 1); return; }
            }
        }
        $scope.save = function () {
            if (ZL_Regex.isEmpty($("#TlpName_T").val())) { alert("未指定模板名称"); return false; }
            for (var i = 0; i < $scope.list.length; i++) {
                var model = $scope.list[i];
                if (ZL_Regex.isEmpty(model.name)) { alert("快递名不能为空"); return false; }
            }
            $("#Fare_Hid").val(angular.toJson($scope.list));
            return true;
        }
        //----------------------------------------------
        $scope.list = [];
        if (ZL_Regex.isEmpty($("#Fare_Hid").val())) {
            var expnames = "<%=ZoomLa.Components.SiteConfig.ShopConfig.ExpNames%>".split('|');
            for (var i = 0; i < expnames.length; i++) {
                if (ZL_Regex.isEmpty(expnames[i])) { continue; }
                $scope.list.push($scope.newModel(expnames[i]));
            }
        }
        else {
            $scope.list = JSON.parse($("#Fare_Hid").val());
        }
    })
</script>
</asp:Content>
