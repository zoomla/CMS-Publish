<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddPayPlat.aspx.cs" Inherits="ZoomLaCMS.Manage.Pay.AddPayPlat" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
<script src="/dist/js/bootstrap-switch.js"></script>
<title>编辑在线支付平台</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/Config/SiteInfo.aspx","系统设置"),		
        new Bread("PayPlatManage.aspx","在线支付平台"),		
        new Bread() {url="/{manage}/Pay/PayPlatManage.aspx", text=PlatName_L.Text,addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
    <table class="table table-bordered table-striped sys_table">
        <tr>
            <th class="w12rem_lg">支付名称</th>
            <td id="payplat_td">
                <asp:TextBox runat="server" ID="PayPlatName_T" CssClass="form-control max20rem"></asp:TextBox>
            </td>
        </tr>
        <tr><th>接口名称</th><td>
            <asp:TextBox runat="server" ID="PlatName_L" class="form-control max20rem" disabled="disabled"></asp:TextBox>
                                         </td></tr>
        <tr>
            <th>商户号</th>
            <td>
                <asp:TextBox ID="TxtAccountID" runat="server" class="form-control max20rem" />
            </td>
        </tr>
        <tbody runat="server" visible="false" id="Alipay_Instant">
            <tr>
                <th>MD5Key</th>
                <td>
                    <input type="text" class="form-control max20rem" name="MD5Key" value="<%=info.MD5Key %>" />
                </td>
            </tr>
        </tbody>
        <tbody runat="server" visible="false" id="Alipay_H5">
            <tr><th>APPID</td><td><input type="text" name="APPID" class="form-control max20rem" value="<%=info.APPID %>" /></th></tr>
        </tbody>
        <tbody runat="server" visible="false" id="default_tb">
            <tr><th>APPID</td><td><input type="text" name="APPID" class="form-control max20rem" value="<%=info.APPID %>" /></th></tr>
            <tr><th>Secret</td><td><input type="text" name="Secret" class="form-control max20rem" value="<%=info.Secret %>" /></th></tr>
            <tr><th>MD5Key</td><td><input type="text" name="MD5Key" class="form-control max20rem" value="<%=info.MD5Key %>" /></th></tr>
        </tbody>
        <tbody runat="server" id="cert_body" visible="false">
            <tr>
                <th class="tdleft">证书(私钥)</th>
                <td>
                    <asp:TextBox runat="server" ID="PrivateKey_T" CssClass="form-control max20rem" />
                    <span class="rd_green">(key|pem文件路径,示例:/Cert/my.key)用于签名支付表单</span></td>
            </tr>
            <tr>
                <th class="tdleft">证书(公钥)</th>
                <td>
                    <asp:TextBox runat="server" ID="PublicKey_T" CssClass="form-control max20rem" />
                    <span class="rd_green">(cer|crt|pem文件路径)</span>
                </td>
            </tr>
            <tr>
                <th class="tdleft">支付平台证书(公钥)</th>
                <td>
                    <asp:TextBox runat="server" ID="ServerPublicKey_T" CssClass="form-control max20rem"></asp:TextBox>
                    <span class="rd_green">(cer|crt|pem文件路径),支付平台公钥,用于验证回调签名</span>
                </td>
            </tr>
            <tr><th class="tdleft">证书密码</th><td>
                <asp:TextBox runat="server" ID="PrivateKey_Pwd" class="form-control max20rem" />
                <span class="rd_green">仅用于私钥证书,RSA私钥等不需要密码</span>
            </td></tr>
        </tbody>
        <tr><td colspan="2" class="text-center">信息配置</td></tr>
        <tr><th>手续费</th><td>
		  <div class="input-group">
			<asp:TextBox runat="server" ID="Rate_T" class="form-control max20rem"></asp:TextBox>
			  <div class="input-group-append">
				<span class="input-group-text">%</span>
			  </div>
			</div>
			</td></tr>
        <tr>
            <th>启用</th>
            <td>
                <input type="checkbox" runat="server" id="IsDisabled" checked="checked" class="switchChk" />
            </td>
        </tr>
        <tr>
            <th>备注</th>
            <td>
                <asp:TextBox ID="Remind_T" runat="server" class="form-control m50rem_50" TextMode="MultiLine" />
				<small class="text-muted">线下支付填写收款帐号。</small>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="EBtnSubmit" Text="保存信息" OnClick="EBtnSubmit_Click" runat="server" class="btn btn-info" />
                <a href="PayPlatManage.aspx" class="btn btn-outline-info">返回列表</a>
            </td>
        </tr>
    </table>
	</div></div>
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
