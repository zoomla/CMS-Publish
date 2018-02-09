<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CSSContent.aspx.cs" Inherits="ZoomLaCMS.Manage.Amazing.css.CSSContent" MasterPageFile="~/Manage/I/Default.Master" ValidateRequest="false" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>样式管理</title>
<style type="text/css">
.modal-dialog{width:80%;max-width:1024px;}
.cssitem input{width:100%;border:1px solid #ddd;padding:0 5px;min-height:30px;}
.cssitem textarea{width:100%;border:none;padding:5px;padding-bottom:0; height:70px;}
#css_text{border: none; width: 100%; height: 700px; resize: none;padding:8px 12px;}
</style>
<link href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol id="BreadNav" class="breadcrumb navbar-fixed-top">
    <li><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
    <li><a href='Default.aspx'>呈现管理</a></li>
    <li class="active"><a href="<%:Request.RawUrl %>">样式管理</a>
        <asp:Label runat="server" ID="StyleName_L"></asp:Label></li>
</ol>
<ul class="nav nav-tabs">
    <li class="tab0"><a href="#tab0" data-toggle="tab">基本设置</a></li>
    <li class="tab1"><a href="#tab1" data-toggle="tab">样式管理</a></li>
</ul>
<div class="tab-content"  ng-app="app" ng-controller="appctrl">
<div class="tab-pane tab0" id="tab0">
    <table class="table table-bordered">
       <tr><td class="td_m">文件名称</td><td><ZL:TextBox runat="server" ID="Name_T" AllowEmpty="false" MaxLength="20" class="form-control m715-50"/></td></tr>
       <tr><td>备注</td><td><asp:TextBox runat="server" ID="Remind_T" TextMode="MultiLine" class="form-control m715-50" style="height:80px;" /></td></tr>
        <tr><td>是否启用</td><td><input type="checkbox" runat="server" id="ZStatus_Chk" checked="checked" class="switchChk"/></td></tr>
       <tr><td>标签引用</td><td><asp:TextBox runat="server" ID="Quote_Label_T" class="form-control m715-50" disabled="disabled" /></td></tr>
   </table>
</div>
<div class="tab-pane tab1" id="tab1">
<div class="margin_t5b5px">
    <input type="button" class="btn btn-link pull-left margin_r5" value="+添加样式" ng-click="add();" />
    <div class="input-group pull-left" style="width: 500px;">
        <span class="input-group-addon">快速检索</span>
        <input type="text" class="form-control text_md" ng-model="sh.alias" placeholder="别名" />
        <input type="text" class="form-control text_md" ng-model="sh.filter" placeholder="选择器" />
    </div>
    <div class="clearfix"></div>
</div>
<div style="height: 500px; overflow-y: auto;" id="list_wrap">
        <table class="table table-bordered" id="css_listwrap">
            <tr>
                <td class="td_m"></td>
                <td class="td_l">别名</td>
                <td class="td_l">选择器</td>
                <td>css内容</td>
            </tr>
            <tr ng-repeat="item in list|filter:cssfilter track by $index" class="cssitem">
                <td style="line-height:50px;">
                    <button type="button" title="删除" class="btn btn-sm btn-danger" ng-click="del(item);"><i class="fa fa-trash-o"></i></button>
                    <button type="button" title="修改" class="btn btn-sm btn-info" ng-click="showEdit(item);"><i class="fa fa-pencil"></i></button>
                </td>
                <td style="padding-top:22px;">
                    <input type="text"  ng-model="item.alias" />
                </td>
                <td style="padding-top:22px;">
                    <input type="text" placeholder="选择器不能为空" ng-model="item.filter" />
                </td>
                <td>
                    <div style="width:400px;position:relative;height:100px;overflow:hidden;">
                        <div ng-style="geViewStyle(item);">演示</div>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</div>
</div>
<div class="Conent_fix text-center">
    <input type="button" class="btn btn-primary" onclick="scope.save();" value="保存信息" />
    <button type="button" class="btn btn-info" onclick="scope.viewCode();">预览代码</button>
    <button type="button" class="btn btn-default" onclick="isBack();">返回列表</button>
    <asp:Button runat="server" ID="Save_Btn" class="btn btn-info" Text="保存信息" OnClick="Save_Btn_Click" Style="display: none;" />
</div>
<div class="modal fade" id="css_modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">CSS编辑器</h4>
            </div>
            <div>
                <iframe id="cssedit_ifr" src="csseditor.aspx" style="border: none; width: 100%; height: 600px;"></iframe>
            </div>
            <div class="modal-footer" style="text-align: center;">
                <button type="button" class="btn btn-primary" onclick="saveCss();">保存修改</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭窗口</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="code_modal">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">CSS编辑器</h4>
            </div>
             <asp:TextBox runat="server" ID="css_text" TextMode="MultiLine"></asp:TextBox>
        </div>
    </div>
</div>
<asp:HiddenField runat="server" ID="csslist_hid" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/ICMS/ZL_Common.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script src="/JS/Plugs/angular.min.js"></script>
<script src="/dist/js/bootstrap-switch.js"></script>
<script>
$(function () {
    if ("<%:Mid%>" == "0") { $(".tab0").addClass("active"); }
    else { $(".tab1").addClass("active"); }
})
function isBack() {
    if (!confirm("确定要返回吗")) { return false; }
    location = "Default.aspx";
}
//当前正被编辑的组件,css与angular 模型
var cssedit = {};
var scope = null;
//将css切割为指定的字符串(初次时使用)
cssedit.cssToList = function (cssStr) {
    var cssList = cssStr.split("}");
    var list = [];
    for (var i = 0; i < cssList.length; i++) {
        if (cssList[i].indexOf("{") < 0) { continue; }
        var model = { filter: "", content: "", alias: "" };
        model.filter = cssList[i].split('{')[0];
        //@charset "utf-8"; .active
        if (model.filter.indexOf(";") > -1) { model.filter = model.filter.split(';')[1];}
        model.content = cssList[i].split('{')[1];
        list.push(model);
    }
    return list;
}
angular.module("app", []).controller("appctrl", function ($scope) {
    scope = $scope;
    $scope.list = [];
    $scope.editing = null;//正被编辑的css
    //----搜索
    $scope.sh = { filter: "", alias: "" };
    $scope.cssfilter = function (item) {
        var flag = true;
        if (!ZL_Regex.isEmpty($scope.sh.filter) && item.filter.indexOf($scope.sh.filter) == -1) { flag = false; }
        if (!ZL_Regex.isEmpty($scope.sh.alias) && item.alias.indexOf($scope.sh.alias) == -1) { flag = false; }
        return flag;
    }
//------------初始化
    if (!ZL_Regex.isEmpty($("#csslist_hid").val())) {
        $scope.list = JSON.parse($("#csslist_hid").val());
    }
    else if (!ZL_Regex.isEmpty($("#css_text").val())) {
        //第一次加载无angular数据时使用
        $scope.list = cssedit.cssToList($("#css_text").val());
    }
    //----item操作
    $scope.showEdit = function (item) {
        $scope.editing = item;
        var model = JSON.parse(angular.toJson(item));
        //ShowComDiag("CSSEditor.aspx", "CSS编辑器");
        document.getElementById("cssedit_ifr").contentWindow.initEdit(model);
        $("#css_modal").modal({});
    }
    $scope.del = function (item) {
        if (confirm("你确定要移除吗")) {
            for (var i = 0; i < $scope.list.length; i++) {
                if ($scope.list[i] == item) { $scope.list.splice(i, 1); return; }
            }
        }
    }
    $scope.add = function () {
        $scope.sh.filter = $scope.sh.alias = "";
        var model = { filter: "", content: "", alias: "" };
        $scope.list.push(model);
        //滑动到底部
        setTimeout(function () {
            var div = document.getElementById("list_wrap");
            var totalHeight = div.scrollHeight;
            var divHeight = div.clientHeight;
            if (totalHeight > divHeight) { div.scrollTop = totalHeight; }
        }, 100);
    }
    //----
    $scope.geViewStyle = function (item) {
        //需要将fixed=absoluate;
        var style = {};
        var cssArr = item.content.split(';');
        for (var i = 0; i < cssArr.length; i++) {
            var name = (cssArr[i].split(':')[0]+"").toLowerCase();
            var value = cssArr[i].split(':')[1];
            if (name == "position") { continue; }
            style[name] = value;
        }
        return style;
    }
    $scope.viewCode = function () {
        $scope.cssToCode();
        $("#code_modal").modal({});
    }
    $scope.cssToCode = function () {
        var css = "";
        $scope.list.forEach(function (item, index, array) {
            if (ZL_Regex.isEmpty(item.filter)) { return; }
            css += item.filter + "{" + item.content + "}\n";
        });
        $("#csslist_hid").val(angular.toJson($scope.list));
        $("#css_text").val(css);
    }
    $scope.updateCss = function (style) {
        $scope.editing.content = style;
        $scope.$digest();
    }
    $scope.save = function () {
        $scope.cssToCode();
        $("#Save_Btn").click();
    }
})
function saveCss() {
    var style = document.getElementById("cssedit_ifr").contentWindow.save();
    scope.updateCss(style);
    $("#css_modal").modal("hide");
}
</script>
</asp:Content>