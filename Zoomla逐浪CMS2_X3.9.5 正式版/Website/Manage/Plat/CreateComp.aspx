<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateComp.aspx.cs" Inherits="ZoomLaCMS.Manage.Plat.CreateComp" MasterPageFile="~/Manage/I/Index.master" %>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>创建企业</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/Plat/PlatInfoManage.aspx","能力中心"),
        new Bread("PlatInfoManage.aspx","信息管理"),
        new Bread() {url="/{manage}/Plat/CreateComp.aspx", text="创建企业",addon="" }}
		)
    %>
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice table-responsive-md">
<table class="table table-bordered table-striped sys_table">
    <tr><th scope="col" class="w12rem_lg">企业用户</th><td scope="col">
        <div class="input-group">
			<div class="input-group ">
			  <asp:TextBox runat="server" ID="User_T" CssClass="form-control max20rem" />
			  <div id="port_btns" class="input-group-append">
				  <input type="button" value="选择用户" onclick="user.sel('User', 'user', 'noplat|1')" class="btn btn-info" />
			  </div>
		  </div>
        </div>
        <asp:HiddenField runat="server" ID="User_Hid" />
    </td></tr>
    <tr><th scope="col">企业名称</th><td scope="col"><ZL:TextBox runat="server" ID="CompName_T" CssClass="form-control max20rem" AllowEmpty="false" /></td></tr>
    <tr><th>企业Logo</th><td>
	<ZL:SFileUp runat="server" ID="SFileUp" FType="Img" cssclass="max20rem" />
	</td>
	</tr>
    <tr><th>权限分配</th><td>
        <table class="table table-bordered" ng-app="app" ng-controller="APPCtrl">
            <tr><td>部门</td><td>会员名</td><td>真名</td><td><a href="javascript:;" class="btn btn-info" ng-click="add();"><i class="zi zi_plus"></i></a></td></tr>
            <tr ng-repeat="item in list track by $index">
                <td class="td_l"><input type="text" class="form-control" ng-model="item.gname"/></td>
                <td><input type="text" class="form-control" ng-model="item.uname" /></td>
                <td><input type="text" class="form-control" ng-model="item.honey" /></td>
                <td><a href="javascript:;" class="btn btn-info" ng-click="del(item);"><i class="zi zi_minus"></i></a></td>
            </tr>
        </table>
        <asp:HiddenField runat="server" ID="PreFix_Hid" />
        <asp:HiddenField runat="server" ID="UserInfo_Hid" />
    </td></tr>
    <tr><td></td><td>
        <input type="button" value="创建企业" class="btn btn-info" onclick="subcheck();"  />
        <asp:Button runat="server" ID="Submit_Btn"  OnClick="Submit_Btn_Click" style="display:none;" />
        <a href="CompList.aspx" class="btn btn-outline-info">返回列表</a>
    </td></tr>
</table>
</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Plugs/angular.min.js"></script>
<script src="/JS/Modal/APIResult.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script>
    var wait = new ZL_Dialog();
    user.hook["User"] = userdeal;
    function userdeal(list, select) {
        $("#" + select + "_T").val(list[0].UserName);
        $("#" + select + "_Hid").val(list[0].UserID);
        if (comdiag != null) { CloseComDiag(); }
    }
    var scope = null;
    angular.module("app", []).controller("APPCtrl", function ($scope) {
        scope = $scope;
        var gnames = "证照管理,行政人事,经营管理,项目管理,财务部".split(',');
        var prefix = $("#PreFix_Hid").val() + "_0";
        $scope.list = [];
        for (var i = 0; i < gnames.length; i++) {
            $scope.list.push({ "gname": gnames[i], "uname": prefix + i, honey: "" });
        }
        $scope.max = $scope.list.length;
        $scope.add = function () { $scope.list.push({ "gname": "", "uname": prefix + $scope.max, honey: "" }); $scope.max++; }
        $scope.del = function (item) {
            for (var i = 0; i < $scope.list.length; i++) {
                if ($scope.list[i] == item) { $scope.list.splice(i, 1); return; }
            }
        }
    })
    function subcheck() {
        if (ZL_Regex.isEmpty($("#User_Hid").val())) { alert("请选择用户"); return; }
        if (ZL_Regex.isEmpty($("#CompName_T").val())) { alert("公司名称不能为空"); return; }
        if (scope.list.length > 0) {
            //也可不添加其他默认用户
            for (var i = 0; i < scope.list.length; i++) {
                var model=scope.list[i];
                if (ZL_Regex.isEmpty(model.gname) || ZL_Regex.isEmpty(model.uname)) { alert("部门名和用户名不能为空"); return; }
            }
            wait.ShowMask("正在校验数据");
            var list = angular.toJson(scope.list);
            $.post("", { "list": list }, function (data) {
                APIResult.ifok(data, function (result) {
                    $("#UserInfo_Hid").val(list);
                    $("#Submit_Btn").click();
                    wait.CloseModal();
                }, function (data) {
                    var model = APIResult.getModel(data);
                    alert(model.retmsg);
                    wait.CloseModal();
                })
            })
        }
    }
</script>
</asp:Content>