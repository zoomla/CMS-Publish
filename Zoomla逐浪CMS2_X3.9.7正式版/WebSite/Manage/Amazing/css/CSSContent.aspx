<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CSSContent.aspx.cs" Inherits="ZoomLaCMS.Manage.Amazing.css.CSSContent" MasterPageFile="~/Manage/I/Index.Master" ValidateRequest="false" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>样式管理</title>
<link href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("Default.aspx","呈现管理"),
        new Bread() {url="/{manage}/Amazing/css/CSSContent.aspx", text="样式管理",addon="" }}
		)
    %>
	<div class="list_choice">
<ul class="nav nav-tabs">
    <li class="nav-item"><a class="nav-link active" href="#tab0" data-toggle="tab">基本设置</a></li>
    <li class="nav-item"><a class="nav-link" href="#tab1" data-toggle="tab">样式管理</a></li>
</ul>
<div class="tab-content"  ng-app="app" ng-controller="appctrl">
<div class="tab-pane tab0" id="tab0">
    <table class="table table-bordered table-hover sys_table">
       <tr><th class="w12rem_lg">样式名称</th><td><ZL:TextBox runat="server" ID="Name_T" AllowEmpty="false" MaxLength="20" class="form-control max20rem"/></td></tr>
       <tr><th>备注说明</th><td><asp:TextBox runat="server" ID="Remind_T" TextMode="MultiLine" class="form-control m50rem_50" /></td></tr>
       <tr><th>是否启用</th><td><input type="checkbox" runat="server" id="ZStatus_Chk" checked="checked" class="switchChk"/></td></tr>
       <tr><th>引用标签</th><td><asp:TextBox runat="server" ID="Quote_Label_T" class="form-control m50rem_50" disabled="disabled" /></td></tr>
   </table>
</div>
<div class="tab-pane tab1" id="tab1">
<div class="d-flex flex-row">
	<div class="input-group mb-3" style="margin-top:3px;">
        <div class="input-group-prepend">
            <span class="input-group-text">快速检索</span>
        </div>
        <input type="text" class="form-control max20rem" ng-model="sh.alias" placeholder="别名" />
        <input type="text" class="form-control max20rem" ng-model="sh.filter" placeholder="选择器" />
            <input type="button" class="btn btn-link" value="+添加样式" ng-click="add();" />

	</div>
</div>
<div class="" id="list_wrap">

        <table class="table table-bordered" id="css_listwrap">
            <tr>
                <td scope="col"></td>
                <td scope="col">别名</td>
                <td scope="col">选择器</td>
                <td scope="col">css内容</td>
            </tr>
            <tr ng-repeat="item in list|filter:cssfilter track by $index" class="cssitem">
                <td>
                    <button type="button" title="删除" class="btn btn-sm btn-danger" ng-click="del(item);"><i class="zi zi_trashalt"></i></button>
                    <button type="button" title="修改" class="btn btn-sm btn-info" ng-click="showEdit(item);"><i class="zi zi_pencilalt"></i></button>
                </td>
                <td  class="mt-2">
                    <input type="text"  ng-model="item.alias" />
                </td>
                <td class="pt-3">
                    <input type="text"  ng-model="item.filter" />
                </td>
                <td ng-bind="item.style">
                </td>
            </tr>
        </table>
    </div>
</div>
</div>
<div class="Conent_fix text-center">
<input type="button" class="btn btn-outline-info" onclick="scope.save();" value="保存信息" />
<button type="button" class="btn btn-outline-info" onclick="scope.viewCode();">预览代码</button>
<button type="button" class="btn btn-outline-info" onclick="isBack();">返回列表</button>
<asp:Button runat="server" ID="Save_Btn" Text="保存信息" OnClick="Save_Btn_Click" style="display:none;"/>
</div>
<div class="modal fade" id="css_modal">
    <div class="modal-dialog">
        <div class="modal-content" style="width:1110px;">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            </div>
            <div>
                <iframe id="cssedit_ifr" src="/Plugins/CSSEditor/Default.aspx?v=1" style="border: none; width: 100%; height: 780px;"></iframe>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-info" onclick="saveCss();">保存修改</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭窗口</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="code_modal">
<div class="modal-dialog modal-dialog-centered">
	<div class="modal-content">
		<div class="modal-header">
			<h5 class="modal-title">预览样式表</h5>
			 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		</div>
		 <asp:TextBox runat="server" ID="css_text" TextMode="MultiLine"></asp:TextBox>
	</div>
</div>
</div>
<asp:HiddenField runat="server" ID="csslist_hid" />
</div>
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
        console.log(document.getElementById("cssedit_ifr").contentWindow.amazing);
        document.getElementById("cssedit_ifr").contentWindow.amazing.init(model);
       
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
        //value为csseditor中的值
        var model = { alias: "助记名称", filter: ".className", value: {}, style: "" };
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
    //$scope.geViewStyle = function (item) {
    //    //需要将fixed=absoluate;
    //    var style = {};
    //    var cssArr = item.content.split(';');
    //    for (var i = 0; i < cssArr.length; i++) {
    //        var name = (cssArr[i].split(':')[0]+"").toLowerCase();
    //        var value = cssArr[i].split(':')[1];
    //        if (name == "position") { continue; }
    //        style[name] = value;
    //    }
    //    return style;
    //}
    $scope.viewCode = function () {
        $scope.cssToCode();
        $("#code_modal").modal({});
    }
    //将各个模型的字符串整理为一个文件,并保存自身
    $scope.cssToCode = function () {
        var css = "";
        $scope.list.forEach(function (item, index, array) {
            if (ZL_Regex.isEmpty(item.filter)) { return; }
            css += item.filter + "{" + item.style + "}\n";
        });
        $("#csslist_hid").val(angular.toJson($scope.list));
        $("#css_text").val(css);
        console.log(css,$("#csslist_hid").val());
    }
    //$scope.updateCss = function (style) {
    //    $scope.editing.content = style;
    //    $scope.$digest();
    //}
    $scope.save = function () {
        $scope.cssToCode();
        $("#Save_Btn").click();
    }
})
function saveCss() {
    var model = document.getElementById("cssedit_ifr").contentWindow.amazing.save();
    //scope.updateCss(style);
    var style = model.style;
    //delete model.style;
    scope.editing.value = model;
    scope.editing.style = model.style;
    scope.$digest();
    $("#css_modal").modal("hide");
}
</script>
</asp:Content>