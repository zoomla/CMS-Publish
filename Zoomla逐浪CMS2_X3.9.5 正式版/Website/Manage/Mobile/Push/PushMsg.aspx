<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PushMsg.aspx.cs" Inherits="ZoomLaCMS.Manage.Mobile.Push.PushMsg" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>推送消息</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("Default.aspx","消息推送"),
        new Bread() {url="", text="推送消息",addon="" }}
		)
    %>
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice">
<table class="table table-bordered table-striped sys_table">
<tr><th class="w12rem_lg">应用名称</th><td>
    <asp:DropDownList runat="server" ID="APPList_DP" CssClass="form-control max20rem" DataTextField="Alias" DataValueField="ID"></asp:DropDownList>
</td></tr>
<%--<tr><th>接口</th><td><label><input type="radio" checked="checked" />极光推送</label></td></tr>--%>
<tr><th>类型</th><td>
<label><input type="radio" name="pushtype_rad" value="alert" checked="checked" />通知</label>
<label><input type="radio" name="pushtype_rad" value="sms" />SMS(会产生相关短信费用)</label>
</td></tr>
<tr><th>内容</th><td>
    <asp:TextBox runat="server" TextMode="MultiLine" CssClass="form-control m50rem_50"  ID="MsgContent_T" MaxLength="72"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" ID="R1" ControlToValidate="MsgContent_T" ForeColor="Red" ErrorMessage="内容不能为空" />
	<small class="text-muted">可输入最多72个汉字</small>
</td></tr>
<tr><td></td><td>
   <asp:Button runat="server" ID="Push_Btn" CssClass="btn btn-info" OnClick="Push_Btn_Click" Text="推送" />
    <a href="Default.aspx" class="btn btn-outline-info">返回</a>
             </td></tr>
</table>
</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>