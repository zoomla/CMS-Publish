<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TableToExcel.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.DBTools.TableToExcel" MasterPageFile="~/Manage/I/Safe.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>数据导出</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("RunSql.aspx","开发中心"),
        new Bread() {url="/{manage}/Admin/Config/DBTools/TableToExcel.aspx", text="数据导出",addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice" ng-app="app" ng-controller="appCtrl">
    <table class="table table-bordered table-striped">
    <tr><td>表名或SQL联接查询语句</td></tr>
    <tr>
        <td>
            <textarea ng-model="source.sql" class="form-control"></textarea>
            <div class="mt-2">
                <input type="button" class="btn btn-outline-info" ng-click="executeSql();" value="执行SQL语句"/>
            </div>
        </td>
    </tr>
    <tr><td>字段与数据
        <button type="button" class="btn btn-outline-info btn-sm" ng-click="allColumn('hide');">隐藏所有列</button>
        <button type="button" class="btn btn-outline-info btn-sm" ng-click="allColumn('show');">显示所有列</button>
        <span class="ml-3">共有<span class="text-danger">{{list.length}}</span>条数据</span>
    </td>
    </tr>
    <tr>
        <td>
            <div class="hideColumns_wrap">
                <span ng-show="item.ishide" ng-repeat="item in listInfo" class="btn btn-default" title="单击还原" ng-click="showColumn(item);">
                    {{item.key}}
                </span>
            </div>
            <hr />
        </td>
    </tr>
     <tr><td>
       <%--  <input type="button" value="保存配置" ng-click="save();" class="btn btn-info" disabled="disabled"/>--%>
         <input type="button" value="导出Excel" ng-click="export();" class="btn btn-outline-info"/>
         </td></tr>
</table>

<div class="table-responsive" style="max-height:400px;overflow-y:auto;">
	<table class="table table-bordered table-striped" id="EGV">
	<tr>
		<td ng-repeat="item in listInfo" ng-hide="item.ishide">
		<div class="excel_no">
			<input type="text" ng-model="item.alias" />
		</div>
		<div class="excel_no mt-2">
			<button type="button" class="btn btn-danger btn-xs" ng-click="hideColumn(item);">
				<i class="zi zi_trashalt"></i>
			</button>
		</div>
		<div class="excel_show" ng-bind="item.alias"></div>
	</td>
	</tr>
	<tr ng-repeat="item in list">
		<td ng-hide="getColumn(info.key).ishide;" ng-repeat="info in listInfo">
			{{item[info.key]}}
		</td>
	</tr> 
	<tr style="display:none;"><td></td></tr> 
</table>
</div>


</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Plugs/angular.min.js"></script>
<script src="/JS/Plugs/base64.js"></script>
<script src="/JS/Modal/APIResult.js"></script>
<script src="/JS/Label/ZLHelper.js"></script>
<script>
    angular.module("app", []).controller("appCtrl", function ($scope,$http) {
        $scope.list = [];
        $scope.listInfo = [];
        $scope.source = { sql: "SELECT * FROM ZL_USER" };
        //执行SQL语句
        $scope.executeSql = function () {
            var postCfg = {
                headers: {
                    'X-Requested-With': "XMLHttpRequest",//标识为http ajax请求
                    'Content-Type': 'application/x-www-form-urlencoded'//使用Form传参
                },
                transformRequest: function (data) { return $.param(data); }
            }
            $http.post("?action=execute", { "sql": Base64.encode($scope.source.sql) }, postCfg)
                .success(function (retMod) {
                    $scope.list = JSON.parse(retMod.result);
                    $scope.listInfo = [];
                    for (var key in $scope.list[0]) {
                        $scope.listInfo.push({ "key": key, "alias": key, ishide: false });
                    }
                });
        }
        $scope.hideColumn = function (item) { item.ishide = true; }
        $scope.showColumn = function (item) { item.ishide = false; }
        //获取列所绑定的header
        $scope.getColumn = function (key) {
            for (var i = 0; i < $scope.listInfo.length; i++) {
                var model = $scope.listInfo[i];
                if (model.key == key) { return model; }
            }
        }
        $scope.allColumn = function (action) {
            for (var i = 0; i < $scope.listInfo.length; i++) {
                $scope.listInfo[i].ishide = (action == "hide" ? true : false);
            }
        }
        $scope.export = function () {
            //将数据整合为html,发送生成Excel
            $("#EGV td:hidden").removeClass("excel_no");
            $("#EGV td:hidden").addClass("excel_no");
            ZLHelper.ToExcelByID();
        }
    })
</script>
</asp:Content>