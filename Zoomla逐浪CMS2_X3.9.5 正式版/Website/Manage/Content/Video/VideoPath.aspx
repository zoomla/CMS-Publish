<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="VideoPath.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Video.VideoPath" MasterPageFile="~/Manage/I/Index.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head"><title>路径配置</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("../ContentManage.aspx","内容管理"),
        new Bread() {url="", text="视频路径",addon="" }}
		)
    %>
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice">
    <table class="table table-bordered table-striped table-responsive-md">
        <tr>
            <th class="w12rem_lg">启用云端服务器</th>
            <td>
                <label> <input type="radio" name="openftp_rad" value="1" checked="checked" />默认路径</label>
                <label> <input type="radio" name="openftp_rad" value="2" />启用云端服务器</label>
                <label> <input type="radio" name="openftp_rad" value="3" />云端存储模式(例如:百度云,Azure云)</label>
                <a href="<%=CustomerPageAction.customPath2+"File/FtpAll.aspx" %>">(添加云端服务器)</a>
            </td>
        </tr>
        <tr><th>操作</th>
            <td>
                <asp:Button runat="server" ID="Save_Btn" Text="保存" OnClick="Save_Btn_Click" CssClass="btn btn-outline-info" />
            </td>
            </tr>
    </table>
	</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/SelectCheckBox.js"></script>
</asp:Content>