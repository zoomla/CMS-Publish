<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MsgSend.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.Msg.MsgSend" MasterPageFile="~/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>消息群发</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-bordered table-striped">
    <tr><td class="td_m">群发模式</td><td>
        <label><input type="radio" name="mode_rad" value="loop" checked="checked"/>轮循群发</label>
        <label><input type="radio" name="mode_rad" value="api"/>接口群发</label>
        <div class="rd_green">轮循群发:不消耗群发次数,多图文必须设定好内容链接,缩略图无法显示</div>
        <div class="rd_green">接口群发:通过微信接口群发,服务号每月四次,订阅号每日一次</div>
    </td></tr>
    <tr><td>公众号</td><td>
        <asp:Repeater runat="server" ID="WxApp_RPT">
            <ItemTemplate>
                <label class="wxapp_wrap"><input type="checkbox" value="<%#Eval("ID") %>" name="app_chk"/><%#Eval("Alias") %></label>
            </ItemTemplate>
        </asp:Repeater>
                    </td></tr>
    <tr><td>消息标题</td><td><asp:Label runat="server" ID="Title_L" /></td></tr>
    <tr><td>消息类型</td><td><asp:Label runat="server" ID="MsgType_L" /></td></tr>
    <tr runat="server" visible="false"><td>消息内容</td><td><asp:Label runat="server" ID="MsgContent_L" /></td></tr>
    <tr><td>发送结果</td><td>
        <table class="table table-bordered">
            <tr>
                <td>ID</td>
                <td>公众号</td>
                <td>结果</td>
                <td>备注</td>
            </tr>
            <asp:Repeater runat="server" ID="Result_RPT" EnableViewState="false">
                <ItemTemplate>
                    <tr>
                        <td class="td_s"><%#Eval("appid") %></td>
                        <td class="td_l"><%#Eval("Alias") %></td>
                        <td class="td_s"><%#Convert.ToBoolean(Eval("isok"))?ComRE.Icon_OK:ComRE.Icon_Error %></td>
                        <td style="color: red;"><%# Convert.ToBoolean(Eval("isok"))?"":Eval("result","") %></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
                     </td></tr>
    <tr><td></td><td>
        <asp:Button runat="server" ID="Send_Btn" Text="开始发送" OnClick="Send_Btn_Click" class="btn btn-info" OnClientClick="return showWait();" />
                 </td></tr>
</table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
.wxapp_wrap{font-weight:normal;display:inline-block;width:150px;}
</style>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
    function showWait() {
        var $chks = $("input[name='app_chk']:checked");
        if ($chks.length < 1) { alert("请选择需要发送的微信号"); return false;}
        comdiag.maxbtn = false; comdiag.ShowMask("正在处理中,请等待.");
        return true;
    }
</script>
</asp:Content>