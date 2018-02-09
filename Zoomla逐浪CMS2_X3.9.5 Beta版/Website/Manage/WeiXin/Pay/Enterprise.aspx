<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Enterprise.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.Pay.Enterprise" MasterPageFile="~/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>企业付款</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table class="table table-bordered">
    <tr><td class="td_l">付款公众号</td><td><asp:TextBox runat="server" ID="APPAlias_L" class="form-control text_300" disabled="disabled" /></td></tr>
    <tr><td>收款用户OpenID</td><td><ZL:TextBox runat="server" ID="Openid_T" class="form-control text_300"  AllowEmpty="false"/></td></tr>
    <tr><td>重复用户OpenID</td><td><ZL:TextBox runat="server" ID="Openid2_T" class="form-control text_300"  AllowEmpty="false"/></td></tr>
    <tr><td>收款用户真实姓名</td><td>
        <asp:TextBox runat="server" ID="TrueName_T" class="form-control text_300" />
        <div class="margin_t5">
            <label><input type="radio" name="name_rad" value="FORCE_CHECK"/>必须真实姓名一致</label>
            <label><input type="radio" name="name_rad" value="OPTION_CHECK" checked="checked">已实名认证的用户,必须真实姓名一致</label>
            <label><input type="radio" name="name_rad" value="NO_CHECK"/>不校验真实姓名</label>
        </div>
    </td></tr>
    <tr><td colspan="2" class="text-center"><strong>转账信息</strong></td></tr>
    <tr><td>转账金额</td><td><ZL:TextBox runat="server" ID="Amount_T" AllowEmpty="false" ValidType="FloatPostive" class="form-control text_300" autocomplete="off"/></td></tr>
    <tr><td>登录密码</td><td><ZL:TextBox runat="server" ID="AdminPwd_T" AllowEmpty="false" TextMode="Password" class="form-control text_300" /></td></tr>
    <tr><td>转账说明</td><td>
        <ZL:TextBox runat="server" ID="Remind_T" TextMode="MultiLine" AllowEmpty="false" MaxLength="100" class="m715-50 form-control" style="height:100px;" />
    </td></tr>
    <tr><td></td><td>
        <input type="button" class="btn btn-primary" value="确认付款" onclick="surePay();"  id="surebtn"/>
        <asp:Button runat="server" ID="SurePay_Btn" OnClick="SurePay_Btn_Click" style="display:none;" />
    </td></tr>
</table>
<div class="alert alert-info">
    <div>* 目标用户必须关注了公众号</div>
    <div>* 给同一个实名用户付款，单笔单日限额2W/2W</div>
    <div>* 给同一个非实名用户付款，单笔单日限额2000/2000</div>
    <div>* 付款资金将进入目标用户的零钱（微信-我-钱包-零钱)</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
    function surePay() {
        if (confirm("确定要支付笔金额吗?")) {
            //var diag = new ZL_Dialog();
            //diag.closebtn = false;
            //diag.ShowMask("正在验证支付请求");
            disBtn(document.getElementById("surebtn"),3000);
            $("#SurePay_Btn").click();
        }
    }//oQInVty7cBqGOv2iw5lui2VplKuA
</script>
</asp:Content>
