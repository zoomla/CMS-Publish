<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JobsConfig.aspx.cs" Inherits="ZoomLaCMS.Manage.User.JobsConfig"  MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>招聘模块配置</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/I/Main.aspx","工作台"),
	new Bread("../UserManage.aspx","用户管理"),
	new Bread("Jobsconfig.aspx","人才招聘"),
	new Bread() {url="", text="人才模版配置",addon= "" }}
	)
%>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
  <table class="table table-striped table-bordered table-hover sys_table">
    <tbody id="Tabss">
      <tr class="tdbg">
        <th class="text-center" height="24" align="center" class="title" colspan="2"><asp:Label ID="Lbtitle" runat="server" Text="招聘模块配置"></asp:Label></th>
      </tr>
      <tr>
        <th class="w12rem_lg"><strong> 启用模块</strong></th>
        <td><asp:RadioButtonList ID="Isuse" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="1">启用</asp:ListItem>
            <asp:ListItem Value="0">停用</asp:ListItem>
          </asp:RadioButtonList></td>
      </tr>
      <tr>
        <th class="tdleft"> <strong>个人会员组</strong></th>
        <td>
          <asp:DropDownList ID="userlist" runat="server" CssClass="form-control max20rem"> </asp:DropDownList></td>
      </tr>
      <tr>
        <th class="tdleft"> <strong>企业会员组</strong></th>
        <td>
          <asp:DropDownList ID="comlist" runat="server" CssClass="form-control max20rem"> </asp:DropDownList></td>
      </tr>
      <tr>
        <th class="tdleft"> <strong>个人会员简历模型</strong></th>
        <td>
          <asp:DropDownList ID="Resume" runat="server" CssClass="form-control max20rem"> </asp:DropDownList>
		  <small class="text-danger">用于判断用户信息是否是简历</small>
		  </td>
      </tr>
      <tr>
        <th class="tdleft"> <strong>企业信息模型</strong></th>
        <td>
          <asp:DropDownList ID="Company" runat="server" OnSelectedIndexChanged="Company_SelectedIndexChanged" AutoPostBack="True" CssClass="form-control max20rem"> </asp:DropDownList>
		  <small class="text-danger">用于判断用户信息是否是企业信息</small>
		  </td>
      </tr>
      <tr>
        <th class="tdleft"><strong> 企业信息显示字段</strong></th>
        <td>
          <asp:DropDownList ID="CompanyField" runat="server" CssClass="form-control max20rem"> </asp:DropDownList>
		  <small class="text-danger">用于显示企业信息的名称</small>
		  </td>
      </tr>
      <tr>
        <th class="tdleft"><strong> 招聘信息模型</strong></th>
        <td>
          <asp:DropDownList ID="CompanyJobs" runat="server" OnSelectedIndexChanged="CompanyJobs_SelectedIndexChanged" AutoPostBack="True" CssClass="form-control max20rem"> </asp:DropDownList>
		  <small class="text-danger">用于判断用户信息是否是企业信息招聘信息</small>
		  </td>
      </tr>
      <tr>
        <th class="tdleft"> <strong>招聘信息职位字段</strong></th>
        <td>
          <asp:DropDownList ID="JobsField" runat="server" CssClass="form-control max20rem"> </asp:DropDownList>
		  <small class="text-danger">用于显示工作岗位名称显示</small>
		  </td>
      </tr>
      <tr>
        <th class="tdleft"><strong> 企业会员查看简历消费点数</strong></th>
        <td> 
		  <div class="input-group">
			  <div class="input-group-prepend">
				<span class="input-group-text">每次查看新的简历收费</span>
			  </div>
			  <asp:TextBox ID="TxtConsumePoint" runat="server" Columns="5" class="form-control max20rem" >0</asp:TextBox>
			  <div class="input-group-append">
				<span class="input-group-text ">点</span>
			  </div>
			</div>
		  <small class="text-muted">(只在查看点数消费设置是消费点数时起作用)</small>
		  </td>
      </tr>
      <tr>
        <th class="tdleft"><strong> 企业会员查看简历消费设置</strong></th>
        <td><asp:RadioButtonList ID="ConsumeType" runat="server">
            <asp:ListItem Value="0" Selected="True">不启用消费</asp:ListItem>
            <asp:ListItem Value="1">使用点数查看简历</asp:ListItem>
            <asp:ListItem Value="2">在有效期内可以查看所有简历</asp:ListItem>
            <asp:ListItem Value="3">以上2种都启用</asp:ListItem>
          </asp:RadioButtonList></td>
      </tr>
      <tr>
          <td></td>
        <td>
          <asp:Button ID="Button1" runat="server" Text="提　交" OnClick="Button1_Click" class="btn btn-outline-info"/></td>
      </tr>
    </tbody>
  </table>
</div>
</div>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
</asp:Content>
