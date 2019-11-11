<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSche.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Schedule.AddSche" MasterPageFile="~/Manage/I/Index.master" %>
<%@ Register Src="~/Manage/I/ASCX/SPwd.ascx" TagPrefix="uc1" TagName="SPwd" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>添加任务</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("Default.aspx","计划任务"),
        new Bread() {url="", text="任务管理",addon="" }}
		)
    %>
	<div class="list_choice">
<uc1:SPwd runat="server" ID="SPwd" Visible="false" />
<div id="maindiv" runat="server" visible="false" class="container-fluid pr-0">
<div class="row sysRow table-responsive-md">
<table class="table table-bordered table-striped sys_table">
    <tr><th class="w12rem_lg">任务名称</th><td><ZL:TextBox runat="server" ID="TaskName_T" CssClass="form-control max20rem" AllowEmpty="false" ValidType="String" /></td></tr>
    <tr><th>任务类型</th><td>
        <label><input type="radio" name="taskType_rad" checked="checked" value="1" />SQL</label>
        <label><input type="radio" name="taskType_rad" value="4" />C#代码</label>
        <label><input type="radio" name="taskType_rad" value="2" disabled="disabled" />生成发布(系统)</label>
        <label><input type="radio" name="taskType_rad" value="3" disabled="disabled"/>内容审核(系统)</label>
    </td></tr>
    <tr><th>执行计划</th><td>
        <label><input type="radio" name="executeType_rad" value="0" checked="checked" />仅一次</label>
        <label><input type="radio" name="executeType_rad" value="1" />每日</label>
        <label><input type="radio" name="executeType_rad" value="2" />循环(每隔指定时间)</label>
        <label><input type="radio" name="executeType_rad" value="3" />被动</label>
        <label><input type="radio" name="executeType_rad" value="4" />每月</label>
    </td></tr>
    <tr id="date_tr1" class="time_tr"><th>执行时间</th><td><asp:TextBox runat="server" ID="ExecuteTime_T1" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });" CssClass="form-control max20rem"/></td></tr>
    <tr id="date_tr2" class="time_tr"><th>执行时间</th><td><asp:TextBox runat="server" ID="ExecuteTime_T2" onclick="WdatePicker({ dateFmt: 'HH:mm:ss' });" CssClass="form-control max20rem"/></td></tr>
    <tr id="interval_tr" class="time_tr"><th>间隔时间</th><td>
        <div class="input-group max20rem">
            <ZL:TextBox runat="server" ID="Interval_T" CssClass="form-control max20rem" ValidType="IntPostive" />
            <span class="input-group-addon">分钟</span>
        </div>
    </td></tr>
    <tr id="state_tr"><th>任务状态</th>
       <td>
           <label><input type="radio" name="status_rad" value="0" checked="checked" />正常</label>
           <label><input type="radio" name="status_rad" value="-1" />停用</label>
           <label><input type="radio" name="status_rad" value="100" />已完成</label>
       </td>
    </tr>
    <tr><th id="conTr">任务内容</th><td>
        <ZL:TextBox runat="server" TextMode="MultiLine" ID="TaskContent_T" CssClass="form-control m50rem_50" AllowEmpty="false"/>
        <br />
        <span class="info sqlinfo hidden text-primary">*可执行sql脚本(脚本路径须为以'/'开头的虚拟路径)，脚本不能以GO开头,内中脚本必须以GO切割</span>
        <span class="info pageinfo hidden text-primary">请填入方法名称,目标方法必须在ZoomLa.Sns.TaskCode中</span>
        </td></tr>
    <tr><th>备注</th><td><asp:TextBox runat="server" ID="Remind_T" CssClass="form-control m50rem_50"/></td></tr>
    <tr><td></td><td>
        <asp:Button runat="server" ID="Save_Btn" Text="创建任务" OnClientClick="return checkTime();" OnClick="Save_Btn_Click" CssClass="btn btn-info" />
        <a href="Default.aspx" class="btn btn-outline-info">返回列表</a>
                 </td></tr>
</table>
</div>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/DatePicker/WdatePicker.js"></script>
<script src="/JS/SelectCheckBox.js"></script>
<style type="text/css">
.time_tr {display:none;}
</style>
<script>
function ShowTimeTr()
{
    $(".time_tr").hide();
    $("#state_tr").show();
    var value = $("input[name=executeType_rad]:checked").val();
    if (value == 2) { $("#interval_tr").show(); }
    else if (value == 0 || value == 4) { $("#date_tr1").show(); }
    else if (value == 1) { $("#date_tr2").show(); }
    else { $("#state_tr").hide(); }
}
function changeConTitle()
{
    $(".info").addClass("hidden");
    var value = $("input[name='taskType_rad']:checked").val();
    switch (value) {
        case "1":
            $("#conTr").html("SQL脚本");
            $(".sqlinfo").removeClass("hidden");
            break;
        case "4":
            $("#conTr").html("C#方法名");
            $(".pageinfo").removeClass("hidden");
            break;
        default:
            $("#conTr").html("任务内容");
            break;
    }
}
function DisTaskTypeRad()
{
    $("input[name=taskType_rad]").attr("disabled", "disabled");
}
function checkTime()
{
    var val = $("input[name=executeType_rad]:checked").val();
    if (val == 0 && $("#ExecuteTime_T1").val() == "") { alert("请指定执行时间!"); return false; }
    if (val == 1 && $("#ExecuteTime_T2").val() == "") { alert("请指定执行时间!"); return false; }
    if (val == 2 && $("#Interval_T").val() == "") { alert("请指定间隔时间"); return false; }
}
$(function () {
    ShowTimeTr();
    changeConTitle();
    $("input[name=executeType_rad]").click(ShowTimeTr);
    $("input[name=taskType_rad]").click(changeConTitle);
})
</script>
</asp:Content>