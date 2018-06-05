<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LuckDrawAdd.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.LuckDraw.LuckDrawAdd" MasterPageFile="~/Manage/I/Index.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>抽奖管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("Home.aspx","移动微信"),
        new Bread("Default.aspx","抽奖列表"),
        new Bread() {url="", text="抽奖管理",addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
<table class="table table-bordered table-striped sys_table">
    <tr><th class="w12rem_lg">活动名称</th><td><ZL:TextBox runat="server" ID="Name_T" class="form-control max20rem" AllowEmpty="false" /></td></tr>
    <tr><th>活动人数</th><td>
        <asp:TextBox runat="server" ID="LimitNum_T" class="form-control max20rem" Text="0" />
        <div class="rd_green">为0表示不限制参与人数</div>
                     </td></tr>
    <tr><th>活动时间</th><td>
		<div class="input-group mb-3">
		<div class="input-group-prepend">
		<span class="input-group-text">起始</span>
		</div>
		<asp:TextBox runat="server" ID="SDate_T" class="form-control max20rem" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm' })"/>
		<div class="input-group-prepend">
		<span class="input-group-text">至 结束</span>
		</div>
		<asp:TextBox runat="server" ID="EDate_T" class="form-control max20rem" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm' })"/>
		</div>
		
    </td></tr>
    <tr><th>奖品信息</th><td ng-app="app" ng-controller="appCtrl">
      <table class="table table-bordered table-striped" >
          <thead><tr><th>奖品名称</th><th>中奖率</th><th>奖品数量</th><th>操作</th></tr></thead>
          <tbody>
              <tr ng-repeat="item in list track by $index">
                  <td><input type="text" class="form-control" ng-model="item.Name"/></td>
                  <td><input type="text" class="form-control" ng-model="item.Percent"/></td>
                  <td><input type="text" class="form-control" ng-model="item.Count_Total"/></td>
                  <td>
                      <button type="button" class="btn btn-danger" ng-click="del(item);"><i class="zi zi_times"></i></button>
                  </td>
              </tr>
          </tbody>
      </table>
      <div>
            <button type="button" class="btn btn-info" ng-click="add();"><i class="zi zi_plus"></i>添加奖品</button>
        </div>
      <asp:HiddenField runat="server" ID="Prize_Hid" />
      </td></tr>
    <tr><th>备注</th><td><asp:TextBox runat="server" ID="Remind_T" TextMode="MultiLine" class="form-control m715-50" style="height:100px;" /></td></tr>
    <tr>
        <td></td>
        <td>
            <input type="button" value="保存信息" class="btn btn-info" onclick="scope.save(); $('#Save_Btn').click();" />
            <asp:Button runat="server" ID="Save_Btn" Text="保存信息" OnClick="Save_Btn_Click" class="btn btn-outline-info" style="display:none;" />
            <a href="Default.aspx" class="btn btn-outline-info">返回列表</a>
        </td>
    </tr>
</table>
</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/DatePicker/WdatePicker.js"></script>
<script src="/JS/Plugs/angular.min.js"></script>
<script>
    var scope = null;
    angular.module("app", []).controller("appCtrl", function ($scope) {
        scope = $scope;
        $scope.list = [];
        if ($("#Prize_Hid").val() != "") { $scope.list = JSON.parse($("#Prize_Hid").val()); }
        $scope.del = function (item) {
            for (var i = 0; i < $scope.list.length; i++) {
                if ($scope.list[i] == item) { $scope.list.splice(i, 1); return; }
            }
        }
        $scope.add = function () {
            var model = { "Name": "", "Percent": 10.0, "Count_Total": -100, "Index_Start": 0.0, "Index_End": 0.0 };
            $scope.list.push(model);
        }
        $scope.save = function () {
            $("#Prize_Hid").val(angular.toJson($scope.list));
        }
    });
</script>
</asp:Content>