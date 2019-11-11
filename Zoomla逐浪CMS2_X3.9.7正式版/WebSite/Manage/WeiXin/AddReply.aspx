<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddReply.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.AddReply"  MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>自动回复</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<asp:Label runat="server" ID="Bread_L"></asp:Label>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
    <table class="table table-striped table-bordered table-hover sys_table">
        <tr>
            <th class="w12rem_lg">关键词</th>
            <td><asp:TextBox ID="filter_T" runat="server" CssClass="form-control max20rem" />
                 <asp:RequiredFieldValidator ID="p0" runat="server" ControlToValidate="filter_T" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="关键词不能为空!" />
            </td>
        </tr>
        <tr><th>类型</th><td>
            <label><input type="radio" value="1" name="msgtype_rad" checked="checked" />图文</label>
            <label><input type="radio" value="0" name="msgtype_rad" />文本</label>
            <label><input type="radio" value="5" name="msgtype_rad" />图片</label>
        </td></tr>
        <tr><th>标题</th><td><asp:TextBox runat="server" ID="Title_T" CssClass="form-control max20rem" />
                       </td></tr>
        <tr><th>内容</th><td><asp:TextBox runat="server" TextMode="MultiLine" ID="Content_T" CssClass="form-control max20rem" />
                       </td></tr>
        <tr><th>图片</th><td>
            <asp:TextBox runat="server" ID="PicUrl_T" CssClass="form-control max20rem"/><br>
            <small class="text-muted">1.图片消息需先上传为微信的素材,再填入media_id,示例:P4zZGc5Q0p_fiAB2BuQABkS9XdXmADDdjB-w5l8FPYY</small><br>
            <small class="text-muted">2.图文消息则使用http地址链接,示例:http://demo.z01.com/pic.jpg</small>
                       </td></tr>
        <tr><th>链接</th><td><asp:TextBox runat="server" ID="Url_T" CssClass="form-control max20rem" /><br>
		<small class="text-muted">点击图文消息跳转链接</small>
		</td></tr>
        <tr>
            <th>默认</th>
            <td>
                <input type="checkbox" runat="server" id="IsDefault_Chk" class="switchChk" /><br>
                <small class="text-muted">如关键词未匹配,是否返回该信息(每个公众号仅可设一条)</small>
            </td>
        </tr>
        <tr>
            <td></td><td >
                <asp:Button ID="Save_B" runat="server" CssClass="btn btn-info" OnClick="Save_B_Click" Text="提交保存" />
                <a href="ReplyList.aspx?appid=<%=AppId %>" class="btn btn-outline-info">返回列表</a></td>
        </tr>
    </table>
	</div>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<link href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
<script src="/dist/js/bootstrap-switch.js"></script>
<script src="/JS/SelectCheckBox.js"></script>
</asp:Content>