<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SuitPro.aspx.cs" Inherits="ZoomLaCMS.Common.Comp.SuitPro" EnableViewState="false" MasterPageFile="~/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div runat="server" id="data_div" visible="false">
<table class="table table-bordered table-striped margin_t5" style="width:560px;">
    <tr><td>ID</td><td>商品名</td><td>数量</td><td>金额</td></tr>
    <tbody ng-app="app" ng-controller="appCtrl">
        <tr ng-repeat="item in list">
            <td ng-bind="item.id" class="td_s"></td>
            <td ng-bind="item.name"></td>
            <td class="td_m"><input type="text" class="form-control" ng-model="item.suitnum" /></td>
            <td class="td_m"><input type="text" class="form-control" ng-model="item.price" ng-change="updatePrice();"/></td>
        </tr>
    </tbody>
</table>
<div class="text-center">
    <input type="button" value="保存信息" onclick="scope.presave();" class="btn btn-info" />
    <asp:Button ID="Save_B" runat="server" OnClick="Save_B_Click" CssClass="hidden" />
</div>
<asp:HiddenField runat="server" ID="UProIDS_Hid"/>
</div>
<div class="alert alert-info" runat="server" id="empty_div"></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/ZL_Regex.js"></script>
<script src="/JS/Plugs/angular.min.js"></script>
<script>
    var scope = null;
    angular.module("app", []).controller("appCtrl", function ($scope) {
        //id,name,price,suitnum,prounit
        scope = $scope;
        $scope.list = [];
        if (!ZL_Regex.isEmpty($("#UProIDS_Hid").val())) { $scope.list = JSON.parse($("#UProIDS_Hid").val()); }
        $scope.updatePrice = function () {
            var price = 0;
        }
        $scope.presave = function () {
            var json = angular.toJson($scope.list);
            $("#UProIDS_Hid").val(json);
            $("#Save_B").click();
        }
    })
</script>
</asp:Content>
