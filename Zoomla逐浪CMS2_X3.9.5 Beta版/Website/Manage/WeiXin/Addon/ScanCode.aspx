<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScanCode.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.Addon.ScanCode" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>微信扫码</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<h1>条码扫码模型测试</h1>
<div class="container">
    <div>
        <input type="button" value="发起扫描" class="btn btn-info" onclick="scan();" />
    </div>
    <div class="margin_t10">
        <table class="table table-bordered">
            <tr>
                <td>条形码值</td>
                <td>
                    <label id="result_l"></label>
                </td>
            </tr>
            <tr>
                <td>扫描次数</td>
                <td>
                    <label id="count_l"><%:count %></label></td>
            </tr>
        </table>
    </div>
    <div class="alert alert-info">
        *注：点“发起扫描”识别条码，并会记录次数，进一步的分析可以用于分成等功能。
    </div>
</div>
<div class="container text-center" runat="server" visible="false" id="qrcode_div">
    <img src="/common/common.ashx?url=<%=url%>" style="width: 200px; height: 200px; margin: 0 auto;" />
    <div class="alert alert-warning margin_t10">该功能必须在微信下使用</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<style type="text/css">
.container{margin-top:30px;}
</style>
<script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
<script src="/JS/Mobile/vconsole.min.js"></script>
<script>
 wx.config({
            debug: true,
           <%=GetSign()%>,
            jsApiList: [
                'checkJsApi',
               'scanQRCode'
            ]
 });
            function scan() {
    wx.scanQRCode({
        needResult: 1,
        scanType: ["barCode"],
        success: function (res) {
            //var result = res.resultStr; 
            $("#result_l").text(res.resultStr);
            $.post("",{},function(data){
                $("#count_l").text(data);
            })
        }
    });
}
</script>
</asp:Content>