<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FreeProNext.aspx.cs" Inherits="ZoomLaCMS.MIS.OA.FreeFlow.FreeProNext" MasterPageFile="~/Common/Master/UserEmpty.master"  ValidateRequest="false"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
<style type="text/css">#AllID_Chk {display:none;}</style>
<title>选择主办人</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ul class="nav nav-tabs">
    <li class="active"><a href="#Free_Div" data-toggle="tab">选择主办人</a></li>
    <li><a href="#StepList_Div" data-toggle="tab">流程步骤</a></li>
</ul>
<div style="min-height:550px;">
    <div class="tab-content">
    <div id="StepList_Div" class="panel panel-primary tab-pane" style="border-radius:0px;">
        <div class="panel-heading">
            <h3 class="panel-title text-center" style="font-weight:bolder;">已有流程(已执行的流程不允许更改)</h3>
        </div>
        <div class="panel-body">
            <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20" EnableTheming="False" 
                CssClass="table table-bordered table-striped table-condensed" OnPageIndexChanging="EGV_PageIndexChanging" DataKeyNames="ID" AllowUserToOrder="true"
                EmptyDataText="尚未指定流程步骤!!">
                <Columns>
                    <asp:BoundField HeaderText="序号" DataField="StepNum" />
                    <asp:BoundField HeaderText="步骤名" DataField="StepName" />
                    <asp:TemplateField HeaderText="经办人">
                        <ItemTemplate>
                            <%#GetUserInfo(Eval("ReferUser","{0}"),Eval("ReferGroup","{0}")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="抄送人">
                        <ItemTemplate>
                            <%# GetUserInfo(Eval("CCUser","{0}"),Eval("CCGroup","{0}")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="会签">
                        <ItemTemplate>
                            <%#OACommon.GetHQoption(Eval("HQoption","")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="强制转交">
                        <ItemTemplate>
                            <%#OACommon.GetQzzjoption(Eval("Qzzjoption","")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="回退">
                        <ItemTemplate>
                            <%#OACommon.GetHToption(Eval("HToption","")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="备注" DataField="Remind" />
             <%--       <asp:TemplateField HeaderText="操作">
                        <ItemTemplate>
                            <%#GetEditLink(Eval("ID"),Eval("StepNum")) %>
                        </ItemTemplate>
                    </asp:TemplateField>--%>
                </Columns>
            </ZL:ExGridView>
        </div>
    </div>
    <div id="Free_Div" runat="server" class="panel panel-default tab-pane active" style="border-radius:0px;">
        <div class="panel-heading">
            <h3 class="panel-title text-center" style="font-weight:bolder;">请为[<asp:Label runat="server" ID="StepName_L" ForeColor="#337ab7"/>]步骤选择需要投递的用户</h3>
        </div>
        <div>
            <table class="table table-bordered table-striped">
                <tr>
                    <td class="text-right" style="width:120px;">
                        <button type="button" name="selruser" id="selruser" class="btn btn-info" onclick="ShowSelUser('ReferUser');" runat="server">主办人</button>
                    </td>
                    <td style="word-wrap: break-word;">
                        <asp:Label runat="server" ID="ReferUser_T" Style="height: 60px; word-wrap: break-word;"/><asp:HiddenField runat="server" ID="ReferUser_Hid" />
                    </td>
                </tr>
                <tr runat="server" id="CCUser_Tr">
                    <td class="text-right">
                        <button type="button" name="selcuser" id="selcuser" class="btn btn-info" onclick="ShowSelUser('CCUser');" runat="server">协办人</button>
                    </td>
                    <td style="word-wrap: break-word;">
                        <asp:Label runat="server" ID="CCUser_T" Style="height: 60px; word-wrap: break-word;"/><asp:HiddenField runat="server" ID="CCUser_Hid" />
                    </td>
                </tr>
                <tr runat="server" id="HelpUser_Tr"><td class="text-right">
                     <button type="button" name="selcuser" id="selhelpuser" class="btn btn-info" onclick="ShowSelUser('HelpUser');"  runat="server">辅办人</button>
                    </td>
                    <td style="word-wrap: break-word;">
                        <asp:Label runat="server" ID="HelpUser_T" Style="height: 60px; word-wrap: break-word;"/><asp:HiddenField runat="server" ID="HelpUser_Hid" />
                    </td>
                </tr>
                <tr runat="server" visible="false">
                    <td class="text-right">短信通知：</td>
                    <td>
                        <asp:CheckBox runat="server" ID="SmsToRefer_Chk" Text="主办人" />
                        <asp:CheckBox runat="server" ID="SmsToCCUser_Chk" Text="协办人" />
                    </td>
                </tr>
                <tr>
                    <td class="text-right">操作：</td>
                    <td>
                        <asp:Button runat="server" ID="return_Btn" class="btn btn-primary" Style="margin-left: 5px;" OnClick="return_Btn_Click" OnClientClick="return confirm('确定返回吗?');" Text="返回" Visible="false" />
                        <asp:Button runat="server" ID="Free_Sure_Btn" class="btn btn-primary" Style="margin-left: 5px;" OnClick="Free_Sure_Btn_Click" OnClientClick="return FreeCheck();" Text="保存信息" />
                        <span runat="server" id="remind" style="color: green; font-size: 14px; font-family: 'Microsoft YaHei';"></span>
                    </td>
                </tr>
            </table>
        </div>
        <div class="panel-body" style="display: none;" id="select">
            <iframe id="User_IFrame" style="visibility: inherit; overflow: auto; overflow-x: hidden; width: 1000px; height: 300px;" name="main_right" src="/Common/Dialog/SelStructure.aspx?Type=AllInfo" frameborder="0"></iframe>
        </div>
    </div>
</div>
</div>
<span runat="server" visible="false" id="remind2" style="color: green; font-size: 16px; margin-top: 10px;">已为自由流程创建步骤,你可以修改最新创建的流程,或关闭本页面!!!</span>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script src="/JS/ICMS/ZL_Common.js"></script>
<script>
$(function () {
    if ($("#remind2").length > 0) {
        //选择过主办人之后,不再显示选择界面
        $("#Free_Div").removeClass("active");
        $("#StepList_Div").addClass("active");
        $(".nav").hide();
    }
})
function PaerntUrl(url) {
    if (parent) { parent.location = url; }
}
function UserFunc(json, select) {
    Def_UserFunc(json, select);
    $("#select").hide();
}
function FreeCheck() {
    if ($("ReferUser_Hid").val() == "") {
        alert("尚未选定主办人!!!");
        return false;
    }
    return true;
}
function ShowSelUser(select) {
    $("#User_IFrame").attr("src", "/Common/Dialog/SelStructure.aspx?Type=AllInfo#" + select);
    $("#User_IFrame")[0].contentWindow.ClearChk();
    $("#select").show();
}
</script>
</asp:Content>


