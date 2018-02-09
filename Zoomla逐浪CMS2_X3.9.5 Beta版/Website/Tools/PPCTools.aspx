<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PPCTools.aspx.cs" Inherits="ZoomLaCMS.Tools.PPCTools" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>PCC省市县字典维护工具</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container" ng-app="APP" ng-controller="ZLCtrl">
    <div class="class_box">
        <div class="sort_box">
            <button type="button" class="btn btn-default" title="上移" ng-click="up('province');"><i class="fa fa-arrow-up"></i></button>
            <button type="button" class="btn btn-default" title="下移" ng-click="down('province');"><i class="fa fa-arrow-down"></i></button>
            <button type="button" class="btn btn-default" title="删除" ng-click="del('province');"><i class="fa fa-trash"></i></button>
        </div>
        <select class="form-control text_md" style="height: 500px;"  ng-change="loadcity();" ng-model="seled.province" size="100">
            <option ng-repeat="node in area track by $index| filter:{Grade:1}" ng-bind="node.Name" value="{{node.ID}}"></option>
        </select>
    </div>
    <div class="class_box">
        <div class="sort_box">
            <button type="button" class="btn btn-default" title="上移" ng-click="up('city');"><i class="fa fa-arrow-up"></i></button>
            <button type="button" class="btn btn-default" title="下移" ng-click="down('city');"><i class="fa fa-arrow-down"></i></button>
            <button type="button" class="btn btn-default" title="删除" ng-click="del('city');"><i class="fa fa-trash"></i></button>
        </div>
        <select class="form-control text_md class_box" style="height: 500px;" ng-change="loadcounty();" ng-model="seled.city" size="100">
            <option ng-repeat="node in cityList track by $index" ng-bind="node.Name" value="{{node.ID}}"></option>
        </select>
    </div>
    <div class="class_box">
        <div class="sort_box">
            <button type="button" class="btn btn-default" title="上移" ng-click="up('county');"><i class="fa fa-arrow-up"></i></button>
            <button type="button" class="btn btn-default" title="下移" ng-click="down('county');"><i class="fa fa-arrow-down"></i></button>
            <button type="button" class="btn btn-default" title="删除" ng-click="del('county');"><i class="fa fa-trash"></i></button>
        </div>
        <select class="form-control text_md class_box" style="height: 500px;" ng-change="loadnext('county');" ng-model="seled.county" size="100">
            <option ng-repeat="node in countyList track by $index" ng-bind="node.Name" value="{{node.ID}}"></option>
        </select>
    </div>
    <div class="margin_t10">
        <div class="input-group" style="width:700px;margin-left:150px;">
            <span class="input-group-addon">当前省</span>
            <input type="text" class="form-control text_md" ng-model="seled.proMod.Name" />
            <span class="input-group-addon">当前市</span>
            <input type="text" class="form-control text_md" ng-model="seled.cityMod.Name"  />
            <span class="input-group-addon">当前县</span>
            <input type="text" class="form-control text_md" ng-model="seled.countyMod.Name" />
        </div>
        <div class="margin_t10" style="width:700px;margin-left:150px;">
            <input type="text" id="name_t" class="form-control text_md" />
            <input type="button" class="btn btn-info" ng-click="add('province');" value="添加为省份" />
            <input type="button" class="btn btn-info" ng-click="add('city');" value="添加为城市" />
            <input type="button" class="btn btn-info" ng-click="add('county');" value="添加为县区" />
            <input type="button" class="btn btn-primary" ng-click="save();" value="保存至数据文件"/>
        </div>
    </div>
</div>
<asp:HiddenField runat="server" ID="Area_Hid" />
<asp:Button runat="server" ID="Save_Btn" style="display:none;" OnClick="Save_Btn_Click" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<style type="text/css">
    .sort_box{width:50px;display:inline-block;position:absolute;top:30%;}
    .sort_box .btn{margin-top:10px;}
    .class_box { display: inline-block; width: 300px; margin-right: 30px;margin-top:10px;position:relative;}
    .class_box select{margin-left:55px;}
</style>
<script src="/JS/ZL_Regex.js"></script>
<script src="/JS/ICMS/area.js?v=<%=DateTime.Now.ToString("yyyyMMddHHmmss") %>"></script>
<script src="/JS/Plugs/angular.min.js"></script>
<script src="/JS/Modal/APIResult.js"></script>
<script src="/JS/Controls/ZL_Array.js"></script>
<script>
    /*
    1,添加|移除|修改省市县信息
    2,修改省市县排序位置

    ID:是相对于当前层级的,如北京从1开始,所有省份也是从1开始(省份之间不能有重复)
    */
    //example
    //var model = { "Grade": 1, ID: 1, "CityList": [{ "Grade": 2, CountyList: [{ "Grade": 3, "ID": 2035, "Name": "青云谱", "Pid": 231 }], Name: "", Pid: 1 }], Name: "", Pid: 0 };
    var helper = {};
    var scope = null;
    angular.module("APP", []).controller("ZLCtrl", function ($scope) {
        scope = $scope;
        $scope.area = AreaMod;
        $scope.cityList = null;
        $scope.countyList = null;
        $scope.seled = { province: "", city: "", county: "", proMod: null, cityMod: null, countyMod: null };
        //-------------------
        var curIndex = 0;
        $scope.add = function (type) {
            var name = $("#name_t").val().replace(/ /g, "");
            if (ZL_Regex.isEmpty(name)) { alert("名称不能为空"); return; }
            var newProMod = { "Grade": 1, ID: 0, CityList: [], Name: name, Pid: 0 };
            var newCityMod = { "Grade": 2, ID: 0, CountyList: [], Name: name, Pid: 0 };
            var newCountyMod = { "Grade": 3, ID: 0, Name: name, Pid: 0 };
            switch (type)
            {
                case "province":
                    newProMod.ID = $scope.area.GetByMax("ID").ID + 1;
                    $scope.area.push(newProMod);
                    break;
                case "city":
                    if ($scope.cityList == null) { alert("尚未选定省份"); return; }
                    if ($scope.cityList.length < 1) { newCityMod.ID = 1; }
                    else { newCityMod.ID = $scope.cityList.GetByMax("ID").ID + 1; }
                    newCityMod.Pid = $scope.seled.proMod.ID;
                    $scope.cityList.push(newCityMod);
                    break;
                case "county":
                    if ($scope.countyList == null) { alert("尚未选定城市"); return; }
                    if ($scope.countyList.length < 1) { newCountyMod.ID = 1; }
                    else { newCountyMod.ID = $scope.countyList.GetByMax("ID").ID + 1; }
                    newCountyMod.Pid = $scope.seled.cityMod.ID;
                    $scope.countyList.push(newCountyMod);
                    break;
            }
            console.log(newProMod);
            $("#name_t").val("");
        }
        $scope.del = function (type) {
            //var item = $scope.get(type);
            var model = $scope.get(type);
            switch (type)
            {
                case "province":
                    angular.forEach($scope.area, function (data, index, arr) {
                        if (data == model) { $scope.area.splice(index, 1); }
                    })
                    break;
                case "city":
                    angular.forEach($scope.cityList, function (data, index, arr) {
                        if (data == model) { $scope.cityList.splice(index, 1); }
                    })
                    break;
                case "county":
                    angular.forEach($scope.countyList, function (data, index, arr) {
                        if (data == model) { $scope.countyList.splice(index, 1); }
                    })
                    break;
            }
            //for (var i = 0; i < $scope.list.length; i++) {
            //    if ($scope.list[i] == item) { $scope.list.splice(i, 1); return; }
            //}

        }
        $scope.get = function (type, nid) {
            var model = null;
            switch (type)
            {
                case "province":
                    if (!nid) { nid = $scope.seled.province; }
                    for (var i = 0; i < AreaMod.length; i++) {
                        if (AreaMod[i].ID == nid) { model = AreaMod[i]; curIndex = i; break; }
                    }
                    break;
                case "city":
                    if (!nid) { nid = $scope.seled.city; }
                    for (var i = 0; i < scope.cityList.length; i++) {
                        if (scope.cityList[i].ID == nid) { model = scope.cityList[i]; curIndex = i; break; }
                    }
                    break;
                case "county":
                    if (!nid) { nid = $scope.seled.county; }
                    for (var i = 0; i < scope.countyList.length; i++) {
                        if (scope.countyList[i].ID == nid) { model = scope.countyList[i]; curIndex = i; break; }
                    }
                    break;
            }
            return model;
        }
        $scope.up = function (type) {
            var model = $scope.get(type);
            switch (type) {
                case "province":
                    $scope.upRecord($scope.area, curIndex);
                    break;
                case "city":
                    $scope.upRecord($scope.cityList, curIndex);
                    break;
                case "county":
                    $scope.upRecord($scope.countyList, curIndex);
                    break;
            }
        }
        $scope.down = function (type) {
            var model = $scope.get(type);
            switch (type) {
                case "province":
                    $scope.downRecord($scope.area, curIndex);
                    break;
                case "city":
                    $scope.downRecord($scope.cityList, curIndex);
                    break;
                case "county":
                    $scope.downRecord($scope.countyList, curIndex);
                    break;
            }
        }
        $scope.save = function () {
            if (!confirm("确定要保存吗,将会更新地址文件")) { return; }
            var json = angular.toJson($scope.area);
            $("#Area_Hid").val(json);
            $("#Save_Btn").click();
        }
        //------------------------------------
        // 上移
        $scope.upRecord = function (arr, $index) {
            if ($index == 0) {
                return;
            }
            swapItems(arr, $index, $index - 1);
        };
        // 下移
        $scope.downRecord = function (arr, $index) {
            if ($index == arr.length - 1) {
                return;
            }
            swapItems(arr, $index, $index + 1);
        };
        //------------------------------------
        $scope.loadcity = function () {
            var model = $scope.get("province");
            scope.cityList = model.CityList;
            scope.seled.proMod = model;
            scope.seled.cityMod = null;
            scope.seled.countyMod = null;
            scope.countyList = [];
        }
        $scope.loadcounty = function () {
            var model = $scope.get("city");
            scope.countyList = model.CountyList;
            scope.seled.cityMod = model;
            scope.seled.countyMod = null;
            console.log(scope.countyList);
        }
        $scope.loadnext = function () {
            var model = $scope.get("county");
            scope.seled.countyMod = model;
        }
    });
    var swapItems = function (arr, index1, index2) {
        arr[index1] = arr.splice(index2, 1, arr[index1])[0];
        return arr;
    };
</script>
</asp:Content>