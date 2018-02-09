<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyItem.aspx.cs" Inherits="ZoomLaCMS.Manage.Plus.SurveyItem" ValidateRequest="false" MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>问卷投票问题</title>
<script src="/Plugins/Ueditor/ueditor.config.js"></script>
<script src="/Plugins/Ueditor/ueditor.all.js"></script>
<script src="/JS/Plugs/angular.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered">
        <tr>
            <td class="td_m">标题：</td>
            <td>
                <asp:TextBox ID="QTitle" class="form-control m715-50" runat="server" MaxLength="80" ToolTip="标题最大长度为80个字符" />
                <span class="rd_red">*</span>
                <asp:RequiredFieldValidator ID="R1" runat="server" ErrorMessage="问题标题不能为空" ForeColor="Red" ControlToValidate="QTitle" Display="Dynamic" />
            </td>
        </tr>
        <tr>
            <td>类型：</td>
            <td>
                <label><input type="radio" name="QType" value="radio" checked="checked"/>单选</label>
                <label><input type="radio" name="QType" value="checkbox" checked="checked"/>多选</label>
                <label><input type="radio" name="QType" value="blank"/>问答</label>
            </td>
        </tr>
        <tr>
            <td>是否必填：</td>
            <td>
                 <label><input type="radio" name="Required" value="True" checked="checked"/>必填</label>
                 <label><input type="radio" name="Required" value="False" />可不填</label>
            </td>
        </tr>
        <tr><td colspan="2">
            <asp:TextBox runat="server" ID="QContent" TextMode="MultiLine" style="height:150px;margin:0 auto;width:960px;"></asp:TextBox>
            <%=Call.GetUEditor("QContent",2) %></td></tr>
        <tbody class="quest_wrap radio checkbox">
            <tr><td>类型：</td><td> 
                <label><input type="radio" name="select_type" value="radio" checked="checked" />单选</label>
                <label><input type="radio" name="select_type" value="select" />下拉</label></td></tr>
            <tr><td>排列：</td><td>
                <div class="input-group">
                    <span class="input-group-addon">每行显示</span>
                    <select name="select_num" class="form-control text_x">
                        <option value="1">1列</option>
                        <option value="2">2列</option>
                        <option value="3">3列</option>
                        <option value="4">4列</option>
                        <option value="5">5列</option>
                        <option value="6">6列</option>
                        <option value="7">7列</option>
                        <option value="8">8列</option>
                        <option value="9">9列</option>
                        <option value="10">10列</option>
                        <option value="11">11列</option>
                        <option value="12">12列</option>
                        <option value="15">15列</option>
                        <option value="20">20列</option>
                        <option value="30">30列</option>
                    </select>
                </div>
               </td></tr>
            <tr><td>选项：</td><td>
                <ul ng-app="app" ng-controller="ZLCtrl">
                    <li ng-repeat="item in list track by $index">
                        <input type="text" class="form-control text_300" ng-model="item.text" />
                        <button type="button" class="btn btn-default" ng-if="$index==0" ng-click="add();"><i class="fa fa-plus"></i></button>
                        <button type="button" class="btn btn-default"ng-if="$index!=0" ng-click="del(item);"><i class="fa fa-minus"></i></button>
                    </li>
                </ul>
            </td></tr>
        </tbody>
        <tbody class="quest_wrap blank">
            <tr>
                <td>类型：</td>
                <td>
                    <label><input type="radio" name="text_type" value="text" checked="checked" />单行</label>
                    <label><input type="radio" name="text_type" value="textarea" />多行</label></td>
            </tr>
            <tr>
                <td>规则：</td>
                <td>
                    <select name="text_regex" class="form-control text_md">
                        <option value="" selected="selected">不限制</option>
                        <option value="date">日期</option>
                        <option value="mobile">手机</option>
                        <option value="email">Email</option>
                    </select></td>
            </tr>
        </tbody>
        <tr><td>操作：</td>
            <td>
                <input type="button" value="保存信息" class="btn btn-primary" onclick="save();"/>
                <asp:Button ID="EBtnSubmit" OnClick="Button_Click" runat="server" style="display:none;"/>
                <a href="SurveyItemList.aspx?SID=<%:Sid %>" class="btn btn-primary">返回列表</a>
            </td>
        </tr>
    </table>
    <asp:HiddenField runat="server" ID="Option_Hid" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/SelectCheckBox.js"></script>
<style type="text/css">
.quest_wrap {display:none;}
</style>
<script>
    var scope = null;
    $(function () {
        $("input[name='QType']").click(function () {
            $(".quest_wrap").hide();
            $(".quest_wrap." + this.value).show();
        });
        $("input[name='QType']:checked").click();
    })
    function save() {
        scope.save();
        $("#EBtnSubmit").click();
    }
    angular.module("app", []).controller("ZLCtrl", function ($scope) {
        scope = $scope;
        $scope.newOption = function (text) {
            return { "text": text, value: parseInt(Math.random() * 10000), checked: false };
        }
        $scope.del = function (item) {
            for (var i = 0; i < $scope.list.length; i++) {
                if ($scope.list[i] == item) { $scope.list.splice(i, 1); return; }
            }
        }
        $scope.add = function () { $scope.list.push($scope.newOption("新选项")); }
        $scope.save = function () {
            $("#Option_Hid").val(angular.toJson($scope.list));
        }
        $scope.init = function () {
            var val = $("#Option_Hid").val();
            if (val != "") {
                $scope.list = JSON.parse(val);
            }
            else {
                $scope.list.push($scope.newOption("选项1"));
                $scope.list.push($scope.newOption("选项2"));
                $scope.list.push($scope.newOption("选项3"));
            }
        }
        //-------------------------------------
        $scope.list = [];
        $scope.init();
    })
</script>

</asp:Content>
