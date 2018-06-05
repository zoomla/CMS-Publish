<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Survey.aspx.cs" Inherits="ZoomLaCMS.Manage.Plus.Survey" MasterPageFile="~/Manage/I/Index.master" ValidateRequest="false" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<link type="text/css" href="/dist/css/bootstrap-switch.min.css"  rel="stylesheet"/>
<script src="/dist/js/bootstrap-switch.js"></script>
<script src="/Plugins/Ueditor/ueditor.config.js"></script>
<script src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<title>编辑问卷投票</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("SurveyManage.aspx","问卷投票列表 "),	
        new Bread() {url="Survey.aspx", text="问卷投票管理",addon="" }}
		)
    %>
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice table-responsive-md">
    <table class="table table-striped table-bordered table-hover sys_table">
        <tr>
            <th scope="col" class="w12rem_lg">问卷投票名称</th>
            <td scope="col">
                <ZL:TextBox ID="Title_T" class="form-control max20rem" runat="server" MaxLength="80" ToolTip="标题最大长度为80个字符" AllowEmpty="false" />
            </td>
        </tr>
        <tr>
            <th scope="col">类型</th>
            <td scope="col">
                <asp:RadioButtonList ID="ZType_Rad" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="1">投票</asp:ListItem>
                    <asp:ListItem Value="2">问卷</asp:ListItem>
                    <asp:ListItem Value="3" Selected="True">报名系统</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <th scope="col">起止时间</th>
            <td scope="col">
				<div class="input-group mb-3">
				  <ZL:TextBox AllowEmpty="false" ID="StartDate" class="form-control max20rem" runat="server" onfocus="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss'});"></ZL:TextBox>
				  <div class="input-group-append">
					<span class="input-group-text">--</span>
				  </div>
				  <ZL:TextBox AllowEmpty="false" ID="EndDate" class="form-control max20rem" runat="server" onfocus="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss'});"></ZL:TextBox>
				</div>
            </td>
        </tr>
        <tr>
            <th scope="col">IP投票间隔</th>
            <td scope="col">
				<div class="input-group ">
				  <asp:TextBox ID="IPInterval_T" class="form-control max20rem" runat="server" Text="0" />
				  <div id="port_btns" class="input-group-append timesp">
				   <button type="button" class="btn btn-outline-info">秒</button>
					<button type="button" class="btn btn-outline-info" data-inter="86400">1天</button>
					<button type="button" class="btn btn-outline-info" data-inter="3600">1小时</button>
					<button type="button" class="btn btn-outline-info" data-inter="600">10分钟</button>
				  </div>
		  		</div>
				
				<small class="text-muted">同一IP需要隔多长时间才可再投票,0则不限制</small>
				
            </td>
        </tr>
        <tr>
            <th scope="col">IP最大可提交次数</th>
            <td scope="col">
				<div class="input-group mb-3">
				  <asp:TextBox ID="IsIPLimit" class="form-control max20rem" runat="server" Text="1" />
				  <div class="input-group-append">
					<span class="input-group-text">次</span>
				  </div>
				</div>
				<small class="text-muted">每日同一IP可提交的次数,0则不限制</small>
				</td>
        </tr>
        <tr>
            <th scope="col">是否需登录</th>
            <td scope="col">
                <input runat="server" type="checkbox" id="IsNeedLogin" class="switchChk" />
            </td>
        </tr>
        <tr>
            <th>是否启用</th>
            <td>
                 <input runat="server" type="checkbox" id="ZStatus" class="switchChk" />
            </td>
        </tr>
        <tr>
            <th scope="col">是否启用验证码</th>
            <td scope="col">
                <input runat="server" type="checkbox" id="IsEnableVCode" class="switchChk" />
            </td>
        </tr>
        <tr>
            <th scope="col">是否启用结果前台预览</th>
            <td scope="col">
                <input runat="server" type="checkbox" id="IsShowResult" class="switchChk" />
            </td>
        </tr>
        <tr>
            <th scope="col">简介</th>
            <td scope="col">
                <asp:TextBox ID="Remind" runat="server" TextMode="MultiLine" Width="90%" Height="200px" />
                <%=Call.GetUEditor("Remind",2) %>
            </td>
        </tr>
        <tr>
            <td scope="col"></td>
            <td scope="col">
                <asp:Button ID="EBtnSubmit" Text="保存信息" OnClick="EBtnSubmit_Click" runat="server" class="btn btn-info" />
                <a href="SurveyManage.aspx" class="btn btn-outline-info">返回列表</a>
            </td>
        </tr>
    </table>
	</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
<script>
    $(function () {
        $(".timesp .btn").click(function () {
            var inter = $(this).data("inter");
            $("#IPInterval_T").val(inter);
        });
    })
</script>
</asp:Content>
