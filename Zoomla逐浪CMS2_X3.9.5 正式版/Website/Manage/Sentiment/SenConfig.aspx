<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SenConfig.aspx.cs" Inherits="ZoomLaCMS.Manage.Sentiment.SenConfig" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>监测维度</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/Default.aspx","企业办公"),
        new Bread("Default.aspx","舆情监测"),
        new Bread("TaskList.aspx","监测任务"),
        new Bread() {url="", text="新建任务",addon="" }}
		)
    %>
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice">
    <table class="table table-bordered table-striped sys_table">
        <tr><th class="w12rem_lg">签名标记</th>
            <td>
                <asp:TextBox runat="server" ID="Sign_T" CssClass="form-control max20rem"></asp:TextBox>
            </td></tr>
        <tr><th>报告频率</th>
            <td>
                <label><input name="fre_rad" type="radio" value="day" checked="checked"/>每天</label>
                <label><input name="fre_rad" type="radio" value="week" />每周</label>
                <label><input name="fre_rad" type="radio" value="month" />按月</label>
                <label><input name="fre_rad" type="radio" value="year" />按年</label>
            </td></tr> 
        <tr><th>存档格式</th>
            <td>
                <label><input name="save_rad" type="radio" value="word" checked="checked" />Word</label>
                <label><input name="save_rad" type="radio" value="text" disabled="disabled" />文本</label> 
                <label><input name="save_rad" type="radio" value="excel" disabled="disabled"/>Excel</label>
            </td></tr>
        <tr><th></th><td><asp:Button runat="server" ID="Save_Btn" Text="保存" OnClick="Save_Btn_Click" CssClass="btn btn-outline-info" /></td></tr>
    </table>
	</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>