<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TableToExcel.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.DBTools.TableToExcel" MasterPageFile="~/Manage/I/Safe.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>数据导出</title>
<style type="text/css">
.hideColumns_wrap{margin-bottom:5px;max-height:120px;overflow-y:auto;}
.hideColumns_wrap span{margin-right:5px;margin-bottom:5px;}
.excel_show{display:none;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div ng-app="app" ng-controller="appCtrl">
    <table class="table table-bordered table-striped">
    <tr><td>表名或SQL联接查询语句</td></tr>
    <tr>
        <td>
            <textarea ng-model="source.sql" class="form-control" style="height:200px;"></textarea>
            <div style="margin-top:5px;">
                <input type="button" class="btn btn-primary" ng-click="executeSql();" value="执行SQL语句"/>
            </div>
        </td>
    </tr>
    <tr><td>字段与数据
        <button type="button" class="btn btn-info btn-sm" ng-click="allColumn('hide');">隐藏所有列</button>
        <button type="button" class="btn btn-info btn-sm" ng-click="allColumn('show');">显示所有列</button>
        <span style="margin-left:15px;">共有<span class="rd_red">{{list.length}}</span>条数据</span>
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
            <div style="max-height:400px;overflow-y:auto;">
                <table class="table table-bordered table-striped" id="EGV">
                <tr>
                    <td ng-repeat="item in listInfo" ng-hide="item.ishide">
                        <div class="excel_no">
                            <input type="text" ng-model="item.alias" />
                        </div>
                        <div class="excel_no" style="margin-top:5px;">
                            <button type="button" class="btn btn-danger btn-xs" ng-click="hideColumn(item);">
                                <i class="fa fa-trash-o"></i>
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
            
        </td>
    </tr>
     <tr><td>
       <%--  <input type="button" value="保存配置" ng-click="save();" class="btn btn-info" disabled="disabled"/>--%>
         <input type="button" value="导出Excel" ng-click="export();" class="btn btn-info"/>
         </td></tr>
</table>
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