<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateTable.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.CreateTable" MasterPageFile="~/Manage/I/Safe.master" %>
<%@ Register Src="~/Manage/I/ASCX/SPwd.ascx" TagPrefix="uc1" TagName="SPwd" %>

<asp:Content runat="server" ContentPlaceHolderID="head"><title>快速建表</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("DatalistProfile.aspx","扩展功能 "),				
        new Bread("RunSql.aspx","开发中心 "),				
        new Bread() {url="CreateTable.aspx", text="快速建表",addon="" }}
		)
    %>
        <div class="list_choice" ng-controller="ZLCtrl">
            <div class="top_opbar">
				<div class="input-group mb-3">
				  <div class="input-group-prepend">
					<span class="input-group-text">ZL_</span>
				  </div>
				  <asp:TextBox ID="txtTabName" runat="server" CssClass="form-control max20rem" placeholder="请输入表名,只允许英文和数字" MaxLength="20"/>
				  <div class="input-group-append">
					<input type="button" class="btn btn-outline-info" value="添加字段" ng-click="addrow();" />
					<input type="button" value="创建数据表" class="btn btn-outline-info" ng-click="preSave()" />
				  </div>
				</div>
				
                <asp:Button ID="CreateBtn" Style="display: none;" runat="server" OnClick="CreateBtn_Click" />
                <asp:RequiredFieldValidator runat="server" ID="R1" ControlToValidate="txtTabName" Display="Dynamic" ForeColor="Red" ErrorMessage="表名不能为空" />
                <asp:RegularExpressionValidator runat="server" ID="REV2" ControlToValidate="txtTabName" Display="Dynamic" ForeColor="Red" ErrorMessage="仅允许英文与数字" ValidationExpression="^[A-Za-z0-9]*$" />
            </div>
			<div class="container-fluid pr-0">
			<div class="row sysRow table-responsive-md">
            <table class="table table-striped table-bordered">
                <tr>
                    <th scope="col">序号</th>
                    <th scope="col">字段名</th>
                    <th scope="col">类型</th>
          <%--          <td>长度</th>--%>
                    <th scope="col">默认值</th>
                    <th scope="col">主键</th>
                    <th scope="col">可否为空</th>
                    <th scope="col">操作</th>
                </tr>
                <tr ng-repeat="item in list">
                    <td>{{$index+1}}</td>
                    <td>
                        <input type="text" class="form-control" ng-model="item.fieldName" placeholder="字段名" /></td>
                    <td>
                        <select class="form-control" ng-option="item.fieldType" ng-model="item.fieldType">
                            <option value="int">int(整型)</option>
                            <option value="float">float(浮点型)</option>
                            <option value="decimal">decimal(精确数值)</option>
                            <option value="money">money(货币)</option>
                            <option value="nvarchar">nvarchar(Unincode字符串)</option>
                            <option value="ntext">ntext(Unincode字符串)</option>
                            <option value="datetime">datetime(日期时间)</option>
                            <option value="varbinary">varbinary(二进制)</option>
                            <option value="image">image(二进制,最大2G)</option>
                            <option value="Uniqueidentifier">Uniqueidentifier(全局标识)</option>
                            <option value="timestamp">timestamp(时间戳)</option>
                        </select></td>
<%--                    <td class="td_m">
                        <input type="text" class="form-control" ng-model="item.fieldLen" /></td>--%>
                    <td >
                        <input type="text" class="form-control" ng-model="item.defval" /></td>
                    <td >
                        <input type="radio" ng-click="setpk(item);" name="ispk_rad"/>
                    </td>
                    <td >
                        <input type="checkbox" ng-checked="item.isnull" ng-model="item.isnull" /></td>
                    <td>
                        <a href="javascript:;" ng-show="$index>0" ng-click="delrow($index)" class="btn btn-info"><i class="zi zi_minus"></i></a></td>
                </tr>
            </table>
			</div>
			</div>
        </div>
    <div runat="server" id="remind_div" visible="false" class="alert alert-info"></div>
    <asp:HiddenField runat="server" ID="Data_Hid" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Plugs/angular.min.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script>
    var app = angular.module('app', []).controller('ZLCtrl', function ($scope) {
        $scope.addrow = function () {
            $scope.list.push($scope.getModel());
        }
        $scope.delrow = function (item) {
            $scope.list.splice(item, 1);
        }
        $scope.getModel = function () { return { fieldName: "", fieldType: "int", fieldLen: "4", defval: "", ispk: false, isnull: true }; }
        $scope.list = [];
        var data = $("#Data_Hid").val();
        if (!ZL_Regex.isEmpty(data)) { $scope.list = JSON.parse(data); }
        else { $scope.list.push($scope.getModel()); }
        $scope.preSave = function () {
            if (!confirm("确定要创建数据表吗")) { return false; }
            var result = true;
            var array = new Array();
            for (var i = 0; i < $scope.list.length; i++) {
                var data = $scope.list[i];
                if (ZL_Regex.isEmpty(data["fieldName"])) {
                    alert("字段名不能为空!"); return false;
                    return;
                }
                if (array.indexOf(data["fieldName"]) > -1) {
                    alert(data["fieldName"] + "字段名不能重复!");
                    return false;
                    return;
                } else { array.push(data["fieldName"]) }
            }
            $("#Data_Hid").val(angular.toJson($scope.list));
            $("#CreateBtn").click();
        }
        $scope.setpk = function (item) {
            angular.forEach($scope.list, function (item) {
                item.ispk = false;
            })
            item.ispk = true;
        }
    });
</script>
</asp:Content>
