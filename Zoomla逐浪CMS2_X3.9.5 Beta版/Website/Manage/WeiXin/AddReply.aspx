<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddReply.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.AddReply"  MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>自动回复</title>
<style>.td_md{width:100px;line-height:30px !important;}</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr>
            <td>关键词</td>
            <td><asp:TextBox ID="filter_T" runat="server" CssClass="form-control text_300" />
                 <asp:RequiredFieldValidator ID="p0" runat="server" ControlToValidate="filter_T" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="关键词不能为空!" />
            </td>
        </tr>
        <tr><td>类型</td><td>
            <label><input type="radio" value="1" name="msgtype_rad" checked="checked" />图文</label>
            <label><input type="radio" value="0" name="msgtype_rad" />文本</label>
            <label><input type="radio" value="5" name="msgtype_rad" />图片</label>
        </td></tr>
        <tr><td>标题</td><td><asp:TextBox runat="server" ID="Title_T" CssClass="form-control text_300" />
                       </td></tr>
        <tr><td>内容</td><td><asp:TextBox runat="server" TextMode="MultiLine" ID="Content_T" CssClass="form-control text_300" />
                       </td></tr>
        <tr><td>图片</td><td>
            <asp:TextBox runat="server" ID="PicUrl_T" CssClass="form-control text_300"/>
            <div class="rd_green">1.图片消息需先上传为微信的素材,再填入media_id,示例:P4zZGc5Q0p_fiAB2BuQABkS9XdXmADDdjB-w5l8FPYY</div>
            <div class="rd_green">2.图文消息则使用http地址链接,示例:http://demo.z01.com/pic.jpg</div>
                       </td></tr>
        <tr><td>链接</td><td><asp:TextBox runat="server" ID="Url_T" CssClass="form-control text_300" /><span class="rd_green">点击图文消息跳转链接</span></td></tr>
        <tr>
            <td>默认</td>
            <td>
                <input type="checkbox" runat="server" id="IsDefault_Chk" class="switchChk" />
                <div class="rd_green">如关键词未匹配,是否返回该信息(每个公众号仅可设一条)</div>
            </td>
        </tr>
        <tr>
            <td></td><td >
                <asp:Button ID="Save_B" runat="server" CssClass="btn btn-primary" OnClick="Save_B_Click" Text="提交保存" />
                <a href="ReplyList.aspx?appid=<%=AppId %>" class="btn btn-primary">返回列表</a></td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<link href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
<script src="/dist/js/bootstrap-switch.js"></script>
<script src="/JS/SelectCheckBox.js"></script>
</asp:Content>


