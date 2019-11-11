<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MailConfig.aspx.cs" MasterPageFile="~/Manage/I/Index.Master" Inherits="ZoomLaCMS.Manage.Config.MailConfig" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>邮件参数配置</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/I/Main.aspx","工作台"),
		new Bread("SiteInfo.aspx","系统设置"),
        new Bread("SiteInfo.aspx","网站配置"),
        new Bread() {url="", text="邮件参数配置",addon="" }},
		Call.GetHelp(5)
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
<table class="table table-bordered table-hover  sys_table">
	<tr>
	  <th class="w12rem_lg" scope="row">发件邮箱</th>
	  <td><asp:TextBox ID="MailName_T" runat="server" class="form-control "/></td>
	</tr>
	<tr><th scope="row">邮箱密码</th><td><asp:TextBox runat="server" TextMode="Password" ID="MailPwd_T" CssClass="form-control "/></td></tr>
	<tr >
	  <th scope="row"><%:lang.LF("发送邮件服务器(SMTP)") %></th>
	<td>
		<div class="input-group">
			<asp:TextBox runat="server" ID="SMTP_T" class="form-control" />
			<div id="smtp_btns" class="input-group-append">
				<input type="button" class="btn btn-outline-info" data-value="smtp.exmail.qq.com" value="QQ企业邮箱">
				<input type="button" class="btn btn-outline-info" data-value="smtp.live.com" value="Live">
				<input type="button" class="btn btn-outline-info" data-value="smtp.gmail.com" value="Gmail">
				<input type="button" class="btn btn-outline-info" data-value="smtp.163.com" value="163">
				<input type="button" class="btn btn-outline-info" data-value="smtp.sina.cn" value="新浪">
				<input type="button" class="btn btn-outline-info" data-value="smtp.139.com" value="139">
			</div>
		</div>
	</td>
	</tr>
	<tr>
	  <th scope="row">邮件协议</th>
	  <td>
		  <div class="input-group ">
			  <asp:TextBox ID="MailPort_T" runat="server" class="form-control " />
			  <div id="port_btns" class="input-group-append">
				  <input type="button" class="btn btn-outline-info" data-value="25" value="SMTP(25)" />
				  <input type="button" class="btn btn-outline-info" data-value="465" value="SSL(465)" />
			  </div>
		  </div>
	  </td>
	</tr>
   <%-- <tr >
	  <th scope="row"><%:lang.LF("身份验证方式") %></th>
	  <td><asp:RadioButton ID="RadioButton1" runat="server" GroupName="AuthenticationType"/>
		无<br />
		<asp:RadioButton ID="RadioButton2" runat="server" GroupName="AuthenticationType"/>
		基本<br />
		如果您的电子邮件服务器要求在发送电子邮件时显式传入用户名和密码，请选择此选项。 <br />
		<span class="pull-left" style="line-height:32px;">发件人的用户名：</span>
		<asp:TextBox ID="TextBox5" runat="server" Columns="30" class="form-control pull-left" Width="200" />
		<div class="clearfix"></div>
		<span class="pull-left" style="line-height:32px;">发件人的密&nbsp;&nbsp;&nbsp;码：</span>
		<asp:TextBox ID="TextBox6" TextMode="Password" Width="200" runat="server" Columns="30" CssClass="form-control"/>
		<asp:RadioButton ID="RadioButton3" runat="server" GroupName="AuthenticationType" />
		NTLM (Windows 身份验证) <br/>
		如果您的电子邮件服务器位于局域网上，并且您使用 Windows 凭据连接到该服务器，请选择此选项。 </td>
	</tr>--%>
	<tr >
	  <th scope="row"><%:lang.LF("系统邮件接收地址") %></th>
	  <td>
		  <asp:TextBox ID="TextBox4" runat="server" class="form-control " />
		  <small class="text-muted">用于接收系统运行、商务等邮件，多个地址用逗号分隔。</small>
	  </td>
	</tr>
	<tr><td></td><td><asp:Button ID="Save_Btn" runat="server" Text="保存设置" OnClick="Save_Btn_Click" class="btn btn-outline-info" /></td></tr>
</table>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        $(function () {
            $("#smtp_btns .btn").click(function () { $("#SMTP_T").val($(this).data("value")); });
            $("#port_btns .btn").click(function () { $("#MailPort_T").val($(this).data("value")); });
        })
    </script>
</asp:Content>