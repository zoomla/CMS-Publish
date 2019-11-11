<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Install.aspx.cs" Inherits="ZoomLaCMS.BU.Front.Install" ClientIDMode="Static" ValidateRequest="false"%>
<html>
<head>
<meta charset="utf-8" />
<title><%=Resources.L.安装界面Title %></title>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="renderer" content="webkit" />
<link href="/dist/css/bootstrap4.min.css" rel="stylesheet"/>
<link href="/dist/css/zico.min.css" rel="stylesheet" />
<link href="/App_Themes/V4.css" rel="stylesheet"/>
<script src="/JS/jquery.min.js"></script>
<script src="/dist/js/bootstrap4.min.js"></script>
</head>
<body>
<form id="form1" runat="server">
<div id="instbox" class="instbox">
<div class="navbar u_menu fixed-top">
<div class="navbar navbar-fixed-top" role="navigation">
<button type="button" class="btn btn-default" id="mimenu_btn">
<span class="icon-bar"></span>
<span class="icon-bar"></span>
<span class="icon-bar"></span>
</button>
<div class="u_menu_left">
<ul class="list-unstyled">
	<li><a href="/help.html" target="_blank"><%=Resources.L.快速帮助 %></a></li>
	<li><a href="http://help.z01.com" target="_blank"><%=Resources.L.使用手册 %></a></li>
	<li><a href="http://www.z01.com/mtv" target="_blank"><%=Resources.L.视频教程 %></a></li>
	<li><a href="http://help.z01.com/Database" target="_blank"><%=Resources.L.数据字典 %></a></li>
	<li><a href="http://www.z01.com/shop" target="_blank"><%=Resources.L.商业授权 %></a></li>
	<li><a href="http://www.z01.com/corp" target="_blank"><%=Resources.L.关于逐浪 %></a></li>
	<li><a href="http://www.z01.com/y10" target="_blank"><%=Resources.L.十年辉煌 %></a></li>
</ul>
</div>
</div>
</div>
<asp:Wizard runat="server" class="Install_main" ID="Install_Wzd" ActiveStepIndex="0" DisplaySideBar="False" DisplayCancelButton="false">
<WizardSteps>
<asp:WizardStep runat="server" ID="WizardStep1" StepType="Start">
<div class="instcon ins1">
<h1><%=Resources.L.安装1Title %></h1>
<div class="install_welcome" ><%=Resources.L.欢迎安装ZoomlaCMS %></div>
		<div class="ins_body">
			<div class="lic_btn" onclick="showlic();"><%=Resources.L.安装显示许可 %></div>
			<div class="lic_content" id="lic_content" style="display: none;" ondblclick="hidelic();">
				<div class="lic_head" onclick="hidelic();"><%=Resources.L.安装点击此次 %> </div>
				<div class="text-left">
					<asp:Literal runat="server" ID="Licence_Lit"></asp:Literal>
				</div>
			</div>
		</div>
<div class="insbox_txt ins_bottom_btns">
	<label>
		<input type="checkbox" id="hasRead_chk" onclick="sureLicense();" />
		<%=Resources.L.我已阅读并同意协议 %></label>
	<asp:Button ID="Stpe1_Next_Btn" runat="server" disabled="disabled" CssClass="btn btn-primary" CommandName="MoveNext" Text="<%$Resources:L,下一步 %>" OnClick="Stpe1_Next_Btn_Click" />
</div>
</div>
</asp:WizardStep>
<asp:WizardStep runat="server" ID="WizardStep2" Title="">
<div class="instcon">
<h1><%=Resources.L.运行环境检测 %></h1>
<table class="container ins_body" >
	<tr>
		<td>
			<asp:Label runat="server" ID="Check_Basic_L" EnableViewState="false" CssClass="insbox_txt"></asp:Label></td>
		<td >
			<asp:Label runat="server" ID="Check_File_L" EnableViewState="false" CssClass="insbox_txt"></asp:Label></td>
		<td>
			<asp:Label runat="server" ID="Check_File2_L" EnableViewState="false" CssClass="insbox_txt"></asp:Label></td>
	</tr>
</table>
<div class="ins_bottom_btns ins_click_mb">
	<asp:Button ID="Step2_Pre_Btn" runat="server" OnClick="Step2_Pre_Btn_Click" Text="<%$Resources:L,上一步 %>" CssClass="btn btn-primary" UseSubmitBehavior="false" CausesValidation="false" />
	<asp:Button ID="Step2_Next_Btn" runat="server" CommandName="MoveNext" Text="<%$Resources:L,下一步 %>" CssClass="btn btn-primary" OnClick="Step2_Next_Btn_Click" />
</div>
</div>
</asp:WizardStep>
<asp:WizardStep runat="server" ID="WizardStep3" Title="">
<div class="instcon">
<h1><%=Resources.L.配置数据库连接 %></h1>
<div class="container ins_body ins_db">
<asp:DropDownList ID="SqlVersion_DP" onchange="sqlselect()" runat="server" class="form-control">
<asp:ListItem Selected="True" Value="" Text="请选择数据库类型"></asp:ListItem>
<asp:ListItem Value="MSSql" Text="<%$Resources:L,SqlServer2005及更高版本 %>"></asp:ListItem>
<asp:ListItem Value="Local" Text="<%$Resources:L,本地数据库 %>"></asp:ListItem>
<asp:ListItem Value="Oracle">Oracle</asp:ListItem>
</asp:DropDownList>
<small class="text-muted">默认为SQL server数据库,<a href="//www.z01.com/Item/2977.aspx" target="_blank">新手敬请移步查阅教程</a></small>
<div class="input-group">
<div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon1">数据源地址</span>
  </div>
  <asp:TextBox ID="TxtDataSource" runat="server" class="form-control w_20rem" data-enter="0" Text="(local)" />
</div>
<small class="text-muted"><%=Resources.L.如local或远程主机名 %></small>					
	<asp:RequiredFieldValidator ID="ValrDataSource" runat="server" Display="Dynamic" ForeColor="Red" ControlToValidate="TxtDataSource" ErrorMessage="<%$Resources:L,数据源不能为空 %>" />
<div class="input-group">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon2">数据库名称</span>
  </div>
  <asp:TextBox ID="TxtDataBase" runat="server" Text="ZoomlaCMS" data-enter="1" class="form-control w_20rem" autofocus="autofocus" />
</div>
<small class="text-muted"><asp:RequiredFieldValidator ID="ValrDataBase" runat="server" ForeColor="Red" ControlToValidate="TxtDataBase" ErrorMessage="<%$Resources:L,数据库名称不能为空 %>" /></small>
<div class="input-group">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon3">数据库用户</span>
  </div>
  <asp:TextBox ID="TxtUserID" runat="server" data-enter="2" class="form-control w_20rem" Text="ZoomlaCMS" />
</div>
<small class="text-muted"><asp:RequiredFieldValidator ID="ValrUserID" runat="server" ForeColor="Red" ControlToValidate="TxtUserID" ErrorMessage="<%$Resources:L,用户名不能为空 %>" Display="Dynamic" />
<%=Resources.L.有权限访问该数据库的用户名 %>!</small>
<div class="input-group">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon4">数据库口令</span>
  </div>
  <asp:TextBox ID="TxtPassword" runat="server" TextMode="Password" data-enter="3" CssClass="form-control w_20rem" />
</div>
<small class="text-muted"><asp:HiddenField runat="server" ID="TxtPassword_Hid" />
<asp:RequiredFieldValidator ID="ValrPassword" runat="server" ForeColor="Red" ControlToValidate="TxtPassWord" ErrorMessage="<%$Resources:L,用户口令不能为空%>" />
</small>
<div class="form-group">
	<span class="text-center">
		<label>
			<input type="checkbox" runat="server" id="ignoreSql_chk" />
			<%=Resources.L.重置安装 %></label>
	</span>
</div>
<div class="ins_bottom_btns ins_click_mb">
<asp:Button ID="Step3_Pre_Btn" runat="server" OnClick="Step3_Pre_Btn_Click" Text="<%$Resources:L,上一步 %>" CssClass="btn btn-primary" UseSubmitBehavior="false" CausesValidation="false" />
<asp:Button ID="Step3_Next_Btn" runat="server" data-enter="4" Text="<%$Resources:L,下一步 %>" CssClass="btn btn-primary" OnClick="Step3_Next_Btn_Click" />
</div>
</div>
</div>
	</asp:WizardStep>
	<asp:WizardStep runat="server" ID="WizardStep4" Title="">
		<div class="instcon">
			<h1><%=Resources.L.配置网站信息 %></h1>
			<div class="container ins_body ins_site" >
<div class="input-group">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon5"><%=Resources.L.网站名称 %></span>
  </div>
  <asp:TextBox ID="TxtSiteName" runat="server" Text="<%$Resources:L,逐浪CMS %>" data-enter="0" class="form-control" />

</div>	
 <small class="text-muted">用于标识平台名称<asp:RequiredFieldValidator runat="server" ID="RS1" Display="Dynamic" ForeColor="Red" ControlToValidate="TxtSiteName" ErrorMessage="<%$Resources:L,网站名称不能为空 %>" /></small>
<div class="input-group">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon6"><%=Resources.L.网站标题 %></span>
  </div>
  <asp:TextBox ID="TxtSiteTitle" runat="server" Text="<%$Resources:L,逐浪CMS %>" data-enter="1" class="form-control" />
</div>	
 <small class="text-muted">平台的标题定义<asp:RequiredFieldValidator runat="server" ID="RS2" Display="Dynamic" ForeColor="Red" ControlToValidate="TxtSiteTitle" ErrorMessage="<%$Resources:L,网站标题不能为空 %>" /></small>
<div class="input-group">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon7"><%=Resources.L.网站地址 %></span>
  </div>
  <asp:TextBox ID="TxtSiteUrl" runat="server" data-enter="2" class="form-control" />
</div>
 <small class="text-muted">用http://或https://开头<asp:RequiredFieldValidator runat="server" ID="RS3" Display="Dynamic" ForeColor="Red" ControlToValidate="TxtSiteUrl" ErrorMessage="<%$Resources:L,网站地址不能为空 %>" /></small>
<div class="input-group">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon8">电子邮箱</span>
  </div>
<asp:TextBox ID="TxtEmail" runat="server" data-enter="3" class="form-control" Text="web@z01.com" />
</div>
<small class="text-muted">定义E-amil用于平台邮件收发<asp:RequiredFieldValidator ID="RS4" runat="server" ForeColor="Red" ControlToValidate="TxtEmail" ErrorMessage="<%$Resources:L,Email不能为空 %>" Display="Dynamic" />
<asp:RegularExpressionValidator ID="RS5" runat="server" ForeColor="Red" ErrorMessage="<%$Resources:L,Email格式不正确 %>" ControlToValidate="TxtEmail" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" /></small>
<div class="input-group">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon9"><%=Resources.L.管理员名称 %></span>
  </div>
  <asp:TextBox CssClass="form-control tw_20rem" ID="TxtAdminName" runat="server" Enabled="False">admin</asp:TextBox>
</div>
<small  class="text-muted">如库中有重名管理员覆盖并重置为最高管理员权限、密码，否则创建之。</small>
<div class="input-group">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon10"><%=Resources.L.管理员密码 %></span>
  </div>
  <ZL:TextBox ID="TxtAdminPassword" runat="server" TextMode="Password" data-enter="4" class="form-control" autofocus="autofocus" />
</div>
<small class="text-muted"><%=Resources.L.不少于6位字母数字组合 %><asp:RegularExpressionValidator runat="server" ID="RS6" ForeColor="Red" ControlToValidate="TxtAdminPassword" ValidationExpression="^[^\s]{6,20}$" Display="Dynamic" ErrorMessage="密码少于六位" />
<asp:RequiredFieldValidator runat="server" ID="ValrAdminPassword" ForeColor="Red" ControlToValidate="TxtAdminPassword" Display="Dynamic" ErrorMessage="<%$Resources:L,密码不能为空 %>" />
</small>
<div class="input-group">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon11"><%=Resources.L.确认密码 %></span>
  </div>
  <asp:TextBox ID="TxtAdminPasswordAgain" runat="server" data-enter="5" TextMode="Password" class="form-control" />
</div>
<small class="text-muted">再输一次相同密码<asp:RequiredFieldValidator runat="server" ID="RS7" ForeColor="Red" ErrorMessage="<%$Resources:L,确认密码不能为空 %>" ControlToValidate="TxtAdminPasswordAgain" Display="Dynamic" />
<asp:CompareValidator runat="server" ID="RS8" Display="Dynamic" ForeColor="Red" ErrorMessage="<%$Resources:L,两次密码不相同 %>" ControlToCompare="TxtAdminPassword" ControlToValidate="TxtAdminPasswordAgain" /></small>
<div class="input-group">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon12"><%=Resources.L.后台路径 %></span>
  </div>
  <asp:TextBox ID="TxtCustomPath" runat="server" data-enter="6" class="form-control " Text="Admin" MaxLength="10" onkeyup="value=value.replace(/[^\w]/ig,'');" Title="<%$Resources:L,请输入最少三到十位英文数字组合 %>" />
</div>
<small class="text-muted"><%=Resources.L.安装完成后可在后台进行配置 %>
<asp:RequiredFieldValidator runat="server" ID="RS9" ForeColor="Red" ControlToValidate="TxtCustomPath" Display="None" ErrorMessage="<%$Resources:L,后台路径不能为空 %>!" />
<asp:RegularExpressionValidator runat="server" ID="RS10" ForeColor="Red" ControlToValidate="TxtCustomPath" ValidationExpression="^[a-zA-Z0-9_\u4e00-\u9fa5\@\.]{3,10}$" Display="Dynamic" ErrorMessage="<%$Resources:L,后台路径不能少于三位 %>" />
</small>
<div class="input-group">
  <div class="input-group-prepend">
    <span class="input-group-text" id="basic-addon13"><%=Resources.L.管理认证码 %></span>
  </div>
  <asp:TextBox ID="TxtSiteManageCode" runat="server" Text="8888" data-enter="7" class="form-control w_20rem" />
</div>
<small class="text-muted"><%=Resources.L.初始为不开通管理认证码功能 %>

<asp:RequiredFieldValidator ID="ValrSiteManageCode" runat="server" ControlToValidate="TxtSiteManageCode" Display="None" ErrorMessage="<%$Resources:L,后台管理认证码不能为空 %>" />
</small>
<div class="ins_bottom_btns ins_click_mb">
<asp:Button ID="Step4_Pre_Btn" runat="server" OnClick="Step4_Pre_Btn_Click" Text="<%$Resources:L,上一步 %>" CssClass="btn btn-primary" UseSubmitBehavior="false" CausesValidation="false" />
<asp:Button ID="Step4_Next_Btn" data-enter="8" runat="server" Text="<%$Resources:L,下一步 %>" CssClass="btn btn-primary" OnClick="Step4_Next_Btn_Click" />
</div>
</div>
</div>
</asp:WizardStep>
<asp:WizardStep runat="server" ID="WizardStep5">
<div class="instcon">
<h1><%=Resources.L.完成安装 %></h1>
<div class="container ins_body insok">
<h2><a class="btn btn-primary btn-lg" href="/Default.aspx"><i class="zi zi_check"></i> <%=Resources.L.已经成功安装点此进入首页 %></a></h2>
<small class="text-muted"><%=Resources.L.重装请新定义配置文件 %></small>
</div>
</div>
</asp:WizardStep>
</WizardSteps>
<StepNavigationTemplate></StepNavigationTemplate>
<StartNavigationTemplate></StartNavigationTemplate>
<FinishNavigationTemplate></FinishNavigationTemplate>
</asp:Wizard>
<!--蓝色框结束-->
<div class="instside">
<ul id="carousel_step">
	<li data-slide-to="1">
		<div class="step_circle"></div>
		<span><%=Resources.L.安装协议 %></span>
	</li>
	<li data-slide-to="2">
		<div class="step_circle"></div>
		<span><%=Resources.L.环境检测 %></span>
	</li>
	<li data-slide-to="3">
		<div class="step_circle"></div>
		<span><%=Resources.L.数据连接 %></span>
	</li>
	<li data-slide-to="4">
		<div class="step_circle"></div>
		<span><%=Resources.L.配置信息 %></span>
	</li>
	<li data-slide-to="5">
		<div class="step_circle"></div>
		<span>完成安装</span>
	</li>
</ul>
</div>
</div>
<div class="d-none">
<asp:Button runat="server" ID="InstallDB_Btn" OnClick="InstallDB_Btn_Click" />
<asp:HiddenField runat="server" ID="CurStep_Hid" Value="1" />
<img class="d-none" id="bkpic_img" onerror="updateDefImg();"  />
</div>
<script src="/JS/ICMS/ZL_Common.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Controls/Control.js"></script>
    <script>
        $("#mimenu_btn").click(function (e) {
            if ($(".u_menu_left").width() > 0) {
                $(".u_menu_left ul").fadeOut(100);
                $(".u_menu_left").animate({ width: 0 }, 200);
            }
            else {
                $(".u_menu_left").animate({ width: 150 }, 300);
                $(".u_menu_left ul").fadeIn();
            }
        });
        //会员菜单更多显示/隐藏
        $("#more_btn").click(function (e) {
            if ($(".user_menu_sub").css("display") == "none") {
                $(".user_menu_sub").slideDown();
                $(this).find("i").removeClass("fa-angle-double-down");
                $(this).find("i").addClass("fa-angle-double-up");
            }
            else {
                $(".user_menu_sub").slideUp(200);
                $(this).find("i").removeClass("fa-angle-double-up");
                $(this).find("i").addClass("fa-angle-double-down");
            }
        });

        //脚本执行
        $(function () {
            updateStepFlag();
            Control.EnableEnter();
            $('[data-toggle="popover"]').popover();
        })
        function sureLicense() {
            var chk = document.getElementById("hasRead_chk");
            if (chk.checked) {  $("#Stpe1_Next_Btn").removeAttr('disabled'); }
            else { $("#Stpe1_Next_Btn").attr("disabled", "disabled"); }
        }
        function showlic() {
            var lic = document.getElementById("lic_content");
            lic.style.display = '';
            lic.focus();
        }
        function hidelic() { var lic = document.getElementById("lic_content"); lic.style.display = "none"; }
        //-----step2
        function installDB() {
            var waitDiag = new ZL_Dialog();
            waitDiag.closebtn = false;
            waitDiag.ShowMask("<%=Resources.L.正在执行SQL脚本请等待 %>");
    $("#InstallDB_Btn").click();
}
//-----step3
function sqlselect() {
    var sel = $("#SqlVersion_DP").val().toLowerCase();
    switch (sel) {
        case "oracle":
            alert('<%=Resources.L.该版本仅对商业用户开放 %>');
            window.open('//www.z01.com/corp/about/83.shtml', '', '');
            break;
        case "local":
            $("#TxtDataSource").val("(localdb)\\v11.0");
            $("#TxtDataBase").val("localdb");
            $("#TxtUserID").val("localdb");
            $("#TxtPassword").val("localdb");
            break;
        default:
            $("#TxtDataSource").val("(local)");
            $("#TxtDataBase").val("ZoomlaCMS");
            $("#TxtUserID").val("ZoomlaCMS");
            $("#TxtPassword").val("");
            break;
    }
}
//-----step4
<%--function check(obj) {
    if (obj.value.length > 9 || obj.value.length < 4) {
        Remind1.style.color = "red";
        Remind1.innerText = "<%=Resources.L.三到十位英文数字组合 %>";
    }
    else {
        Remind1.style.color = "#BFDFFF"
        Remind1.innerText = "*<%=Resources.L.安装完成后可在后台进行配置 %>";
    }
}
function check2(obj) {
    if (obj.value.length < 1) {
        Remind2.style.color = "red";
        Remind2.innerText = "<%=Resources.L.后台管理认证码不能为空 %>";
    }
    else {
        Remind2.style.color = "#BFDFFF"
        Remind2.innerText = "*<%=Resources.L.初始为不开通管理认证码功能 %>";
    }
}--%>
//-----common
function updateStepFlag() {
    var step = ConverToInt($("#CurStep_Hid").val(), 1);
    $("#carousel_step li[data-slide-to=" + step + "]").find(".step_circle").addClass("active");
    //更换背景图
    var imgurl = "//code.z01.com/img/2016instbg_0" + step + ".jpg";
    $("#instbox").css("background-image", "url(" + imgurl + ")")
    $("#bkpic_img").attr("src", imgurl);
}
function updateDefImg() {
    var defurl = "/UploadFiles/demo/ad2.jpg";
    $("#instbox").css("background-image", "url(" + defurl + ")");
}
function showAlert(str) { alert(decodeURI(str)); }
    </script>
</form>
</body>
</html>