<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SuitProAdd.aspx.cs" Inherits="ZoomLaCMS.BU.UserShop.SuitProAdd"  MasterPageFile="~/Common/Master/User.Master"%>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>促销组合管理</title>
<link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td class="td_m"><strong>组合名称：</strong></td>
            <td>
                <ZL:TextBox ID="Name_T" runat="server" AllowEmpty="false" CssClass="form-control text_300" />
            </td>
        </tr>
                            <tr><td class="td_m">所属店铺：</td><td><asp:DropDownList runat="server" ID="UserShop_DP" DataValueField="GeneralID" DataTextField="Title" class="form-control text_300" /></td></tr>
        <tr><td>所属模型</td><td><asp:DropDownList runat="server" ID="Model_DP" DataTextField="ModelName" DataValueField="ModelID" class="form-control text_300"></asp:DropDownList></td></tr>
        <tr><td>所属节点</td><td><asp:Label runat="server" ID="Node_L"></asp:Label></td></tr>
        <tr><td>商品图片</td><td><ZL:SFileUp runat="server" ID="SFileUp" /></td></tr>
        <tr><td>组合价格</td><td>
            <ZL:TextBox runat="server" ID="Price_T" class="form-control text_300" AllowEmpty="false" ValidType="FloatZeroPostive" />
            <span class="rd_green">组合商品的售价</span>
                         </td></tr>
        <tr><td>预订价格</td><td><ZL:TextBox runat="server" ID="BookPrice_T" class="form-control text_300" ValidType="FloatPostive" />
            <span class="rd_green">如设定了预订价,则购买时只需支付预定金额</span>
        </td></tr>
        <tr><td>库存</td>
            <td>
                <asp:TextBox runat="server" ID="Stock" class="form-control text_s" disabled="disabled"  Text="0"/>
                <input type="button" value="库存管理" class="btn btn-info" onclick="SetStock();" id="stock_btn" />
            </td>
        </tr>
        <tr>
            <td>组合商品：</td>
            <td>
                <input type="button" value="选择商品" onclick="upro.showdiag();" class="btn btn-info" runat="server" id="selpro_btn" />
                <asp:HiddenField runat="server" ID="UProIDS_Hid" Value=""/>
                <script>
                    var upro = {};
                    upro.showdiag = function () { ShowComDiag("<%:customPath2%>Shop/ProductsSelect.aspx?callback=selupro&action=suitpro", "选择商品"); }
                    function selupro(list) {
                        list = JSON.parse(list);
                        scope.merge(list);
                    }
                    //存ids与另一个字符存具体的信息
                </script>
               <table class="table table-bordered table-striped margin_t5" style="width:600px;">
                   <tr><td>ID</td><td>商品名</td><td>数量</td><td>金额</td><td>操作</td></tr>
                   <tbody ng-app="app" ng-controller="appCtrl">
                       <tr ng-repeat="item in list">
                           <td ng-bind="item.id" class="td_s"></td>
                           <td ng-bind="item.name"></td>
                           <td class="td_m"><input type="text" class="form-control" ng-model="item.suitnum" /></td>
                           <td class="td_m"><input type="text" class="form-control" ng-model="item.price" ng-change="updatePrice();"/></td>
                           <td class="td_m"><a href="javascript:;" ng-click="del(item);" /><i class="fa fa-trash-o"></i> 删除</td>
                       </tr>
                   </tbody>
               </table>
               <div class="rd_green">套装中商品的金额用于退货与返修逻辑</div>
            </td>
        </tr>
        <tr>
            <td><strong>售后设置：</strong></td>
            <td>
                <label>
                    <input type="checkbox" name="GuessXML" value="drawback" checked="checked" />
                    退货</label>
                <label>
                    <input type="checkbox" name="GuessXML" value="exchange" />
                    换货</label>
                <label>
                    <input type="checkbox" name="GuessXML" value="repair" />
                    维修</label>
                <asp:HiddenField ID="restate_hid" runat="server" />
            </td>
        </tr>
        <tr>
            <td>是否启用：</td>
            <td>
                <input type="checkbox" id="ZStatus_Chk" runat="server" class="switchChk" checked="checked" /></td>
        </tr>
        <tr>
            <td>备注信息：</td>
            <td>
                <asp:TextBox ID="Remind_T" runat="server" TextMode="MultiLine" Width="500px" Height="80px" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input type="button" value="保存信息" onclick="scope.presave();" class="btn btn-info" />
                <asp:Button ID="Save_B" runat="server" OnClick="Save_B_Click" style="display:none;" />
                <a href="SuitPro.aspx" class="btn btn-info">返回列表</a>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/SelectCheckBox.js"></script>
<script src="/JS/DatePicker/WdatePicker.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Controls/ZL_Array.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script src="/JS/Plugs/angular.min.js"></script>
<script src="/dist/js/bootstrap-switch.js"></script>
<script>
    var scope = null;
    angular.module("app", []).controller("appCtrl", function ($scope) {
        //id,name,price,suitnum,prounit
        scope = $scope;
        $scope.list = [];
        try { if (!ZL_Regex.isEmpty($("#UProIDS_Hid").val())) { $scope.list = JSON.parse($("#UProIDS_Hid").val()); } } catch (e) { $scope.list = []; }
        $scope.del = function (item) {
            for (var i = 0; i < $scope.list.length; i++) {
                if ($scope.list[i] == item) { $scope.list.splice(i, 1); return; }
            }
        }
        $scope.updatePrice = function () {
            var price = 0;
        }
        //合并,无则加入,有则忽略
        $scope.merge = function (list) {
            for (var i = 0; i < list.length; i++) {
                var model = ArrCOM.GetByID($scope.list, list[i].id, "id");
                console.log("model",model);
                if (!model) { model = list[i]; model.suitnum = 1; $scope.list.push(model); }
            }
            $scope.$digest();
        }
        $scope.presave = function () {
            var json = angular.toJson($scope.list);
            $("#UProIDS_Hid").val(json);
            $("#Save_B").click();
        }
    })
    function CloseDiag() {
        comdiag.CloseModal();
    }
    function closeDiag() { CloseComDiag(); }
    function setnode(nid) {
        $("#node_dp").val(nid);
    }
    function SetStock(pid) {
        var url = siteconf.path + "Shop/Stock/Stock.aspx?action=addpro&pid=<%:Mid%>";
        ShowComDiag(url, "库存管理");
    }
    function addStock(pronum) {
        CloseDiag();
        var num = parseInt($("#Stock").val());
        $("#Stock").val(pronum + num);
    }
    $(function () {
        if ("<%:Mid%>" == "0") { $("#stock_btn").hide(); }
    })
</script>
</asp:Content>
