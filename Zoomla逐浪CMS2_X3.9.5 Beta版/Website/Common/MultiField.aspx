<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MultiField.aspx.cs" Inherits="ZoomLaCMS.Common.MultiField" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title></title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div ng-app="APP" ng-controller="ZLCtrl" style="width:490px;">
        <div ng-repeat="item in list track by $index" class="input-group margin_t5">
            <span class="input-group-addon">属性</span>
            <input type="text" class="form-control text_md" ng-model="item.name" disabled="disabled"/>
            <span class="input-group-addon">值</span>
            <input type="text" class="form-control text_300" ng-model="item.value" ng-blur="save();"/>
        </div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script src="/JS/Plugs/angular.min.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script>
    var options = "<%:Content%>".split('||');
    function getHid() { return $(parent.document).find("#txt_<%:FieldName%>"); }
    angular.module("APP", []).controller("ZLCtrl", function ($scope) {
        if (!parent) { return; }
        $scope.list = [];
        var value = getHid().val();
        if (!ZL_Regex.isEmpty(value) && (value.indexOf("[") == 0 || value.indexOf("{") == 0)) { $scope.list = JSON.parse(value); }
        else
        {
            //2008款|2008款$0||2009款|2009款$0
            for (var i = 0; i < options.length; i++) {
                var name = options[i].split('|')[0];
                var value = options[i].split('|')[1].split('$')[0];
                if (ZL_Regex.isEmpty(name)) { continue; }
                $scope.list.push({ "name": name, value: value });
            }
        }
        $scope.save = function () {
            var $hid = getHid();
            $hid.val(angular.toJson($scope.list));
        }
    })
</script>
</asp:Content>