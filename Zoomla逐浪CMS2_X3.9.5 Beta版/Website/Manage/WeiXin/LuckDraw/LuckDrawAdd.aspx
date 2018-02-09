<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LuckDrawAdd.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.LuckDraw.LuckDrawAdd" MasterPageFile="~/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>抽奖管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-bordered table-striped">
    <tr><td class="td_m">活动名称</td><td><ZL:TextBox runat="server" ID="Name_T" class="form-control text_300" AllowEmpty="false" /></td></tr>
    <tr><td>活动人数</td><td>
        <asp:TextBox runat="server" ID="LimitNum_T" class="form-control text_300" Text="0" />
        <div class="rd_green">为0表示不限制参与人数</div>
                     </td></tr>
    <tr><td>活动时间</td><td>
        <div class="input-group" style="width:550px;">
            <span class="input-group-addon">起始</span>
            <asp:TextBox runat="server" ID="SDate_T" class="form-control text_md" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm' })"/>
            <span class="input-group-addon">至</span>
            <span class="input-group-addon">结束</span>
            <asp:TextBox runat="server" ID="EDate_T" class="form-control text_md" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm' })"/>
        </div>
    </td></tr>
    <tr><td>奖品信息</td><td ng-app="app" ng-controller="appCtrl">
      <table class="table table-bordered table-striped" style="width:600px;">
          <thead><tr><th>奖品名称</th><th>中奖率</th><th>奖品数量</th><th>操作</th></tr></thead>
          <tbody>
              <tr ng-repeat="item in list track by $index">
                  <td><input type="text" class="form-control text_md" ng-model="item.Name"/></td>
                  <td><input type="text" class="form-control text_md" ng-model="item.Percent"/></td>
                  <td><input type="text" class="form-control text_x" ng-model="item.Count_Total"/></td>
                  <td>
                      <button type="button" class="btn btn-danger" ng-click="del(item);"><i class="fa fa-remove"></i></button>
                  </td>
              </tr>
          </tbody>
      </table>
      <div class="margin_t5">
            <button type="button" class="btn btn-info" ng-click="add();"><i class="fa fa-plus"></i>添加奖品</button>
        </div>
      <asp:HiddenField runat="server" ID="Prize_Hid" />
      </td></tr>
    <tr><td>备注</td><td><asp:TextBox runat="server" ID="Remind_T" TextMode="MultiLine" class="form-control m715-50" style="height:100px;" /></td></tr>
    <tr>
        <td></td>
        <td>
            <input type="button" value="保存信息" class="btn btn-info" onclick="scope.save(); $('#Save_Btn').click();" />
            <asp:Button runat="server" ID="Save_Btn" Text="保存信息" OnClick="Save_Btn_Click" class="btn btn-info" style="display:none;" />
            <a href="Default.aspx" class="btn btn-default">返回列表</a>
        </td>
    </tr>
</table>
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