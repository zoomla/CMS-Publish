<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPayPlat.aspx.cs" Inherits="ZoomLaCMS.Manage.Pay.AddPayPlat" MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
<script src="/dist/js/bootstrap-switch.js"></script>
<title>编辑在线支付平台</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-bordered table-striped">
        <tr>
            <td class="td_l tdleft">支付名称：</td>
            <td id="payplat_td">
                <asp:TextBox runat="server" ID="PayPlatName_T" CssClass="form-control text_300"></asp:TextBox>
            </td>
        </tr>
        <tr><td class="tdleft">接口名称：</td><td>
            <asp:TextBox runat="server" ID="PlatName_L" class="form-control text_300" disabled="disabled"></asp:TextBox>
                                         </td></tr>
        <tr>
            <td class="tdleft">商户号：</td>
            <td>
                <asp:TextBox ID="TxtAccountID" runat="server" class="form-control text_300" />
            </td>
        </tr>
        <tbody runat="server" visible="false" id="Alipay_Instant">
            <tr>
                <td class="tdleft">MD5Key：</td>
                <td>
                    <input type="text" class="form-control text_300" name="MD5Key" value="<%=info.MD5Key %>" />
                </td>
            </tr>
        </tbody>
        <tbody runat="server" visible="false" id="Alipay_H5">
            <tr><td class="tdleft">APPID：</td><td><input type="text" name="APPID" class="form-control text_300" value="<%=info.APPID %>" /></td></tr>
        </tbody>
        <tbody runat="server" visible="false" id="default_tb">
            <tr><td class="tdleft">APPID：</td><td><input type="text" name="APPID" class="form-control text_300" value="<%=info.APPID %>" /></td></tr>
            <tr><td class="tdleft">Secret：</td><td><input type="text" name="Secret" class="form-control text_300" value="<%=info.Secret %>" /></td></tr>
            <tr><td class="tdleft">MD5Key：</td><td><input type="text" name="MD5Key" class="form-control text_300" value="<%=info.MD5Key %>" /></td></tr>
        </tbody>
        <tbody runat="server" id="cert_body" visible="false">
            <tr>
                <td class="tdleft">证书(私钥)：</td>
                <td>
                    <asp:TextBox runat="server" ID="PrivateKey_T" CssClass="form-control text_300" />
                    <span class="rd_green">(key|pem文件路径,示例:/Cert/my.key)用于签名支付表单</span></td>
            </tr>
            <tr>
                <td class="tdleft">证书(公钥)：</td>
                <td>
                    <asp:TextBox runat="server" ID="PublicKey_T" CssClass="form-control text_300" />
                    <span class="rd_green">(cer|crt|pem文件路径)</span>
                </td>
            </tr>
            <tr>
                <td class="tdleft">支付平台证书(公钥)：</td>
                <td>
                    <asp:TextBox runat="server" ID="ServerPublicKey_T" CssClass="form-control text_300"></asp:TextBox>
                    <span class="rd_green">(cer|crt|pem文件路径),支付平台公钥,用于验证回调签名</span>
                </td>
            </tr>
            <tr><td class="tdleft">证书密码：</td><td>
                <asp:TextBox runat="server" ID="PrivateKey_Pwd" class="form-control text_300" />
                <span class="rd_green">仅用于私钥证书,RSA私钥等不需要密码</span>
            </td></tr>
        </tbody>
        <tr><td colspan="2" class="text-center">信息配置</td></tr>
        <tr><td class="tdleft">手续费：</td><td>
          <div class="input-group text_s">
              <asp:TextBox runat="server" ID="Rate_T" class="form-control text_md"></asp:TextBox>
              <span class="input-group-addon">%</span>
          </div>
                        </td></tr>
        <tr>
            <td class="tdleft">启用：</td>
            <td>
                <input type="checkbox" runat="server" id="IsDisabled" checked="checked" class="switchChk" />
            </td>
        </tr>
        <tr>
            <td class="tdleft">备注：</td>
            <td>
                <asp:TextBox ID="Remind_T" runat="server" class="form-control m715-50" TextMode="MultiLine" Style="height: 100px;" />线下支付填写收款帐号。
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="EBtnSubmit" Text="保存信息" OnClick="EBtnSubmit_Click" runat="server" class="btn btn-primary" />
                <a href="PayPlatManage.aspx" class="btn btn-primary">返回列表</a>
            </td>
        </tr>
    </table>
         <%--  <script>
 $(function () {
            //微信支付跳转
            $("#DDLPayPlat [value='21']").click(function () {
                window.location.href = "../WeiXin/PayWeiXin.aspx";
            });
            $("#payplat_td input[type=radio]").click(function () {
                CertCheck(this.value);
            });
            CertCheck($("input[type=radio]:checked").val());
        });
        function CertCheck(val) {
           
            $("#trPayName,#trAccountID,#trMD5Key,#trSellerEmail").show();
            switch (val) {
                case "23":
                    $("#cert_body").show();
                    break;
                case "99"://线下支付
                    $("#trPayName,#trAccountID,#trMD5Key,#trSellerEmail").hide();
                    $("#DDLPayName,#TxtAccountID,#TxtMD5Key").each(function () {
                        if (this.value == "") { this.value = "线下支付"; }
                    });
                    break;
                default:
                    break;
            }
            if (val == "23") { $("#cert_body").show(); }
            else { $("#cert_body").hide(); }

            if (val == "99") {
                $("#trPayName,#trAccountID,#trMD5Key,#trSellerEmail").hide();
                $("#DDLPayName,#TxtAccountID,#TxtMD5Key").each(function () {
                    if (this.value == "") { this.value = "线下支付"; }
                });
            }
            else
            {
                $("#trPayName,#trAccountID,#trMD5Key,#trSellerEmail").show();
                $("#DDLPayName,#TxtAccountID,#TxtMD5Key").each(function () {
                    if (this.value == "线下支付") { this.value = ""; }
                });
            }
        }
    </script>--%>
</asp:Content>
