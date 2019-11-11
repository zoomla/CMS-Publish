<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SiteInfo.aspx.cs" MasterPageFile="~/Manage/I/Index.master" Inherits="ZoomLaCMS.Manage.Config.SiteInfo" ValidateRequest="false" %>
<%@ Import Namespace="ZoomLa.Components" %>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title><%=Resources.L.网站信息配置 %></title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/I/Main.aspx",Resources.L.工作台),
        new Bread("SiteInfo.aspx",Resources.L.网站配置),
        new Bread() {url="", text=Resources.L.基本配置,addon= "" }},
        Call.GetHelp(2)
        )
    %>

<div class="container-fluid pr-0">
<div class="row sysRow">
<ul class="nav nav-tabs list_choice"  role="tablist">
<li class="nav-item"> <a href="#tabs0" class="nav-link active show" id="home-tab1" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true"><%=Resources.L.网站设置 %></a></li>
<li class="nav-item"><a href="#tabs1" class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false"><%=Resources.L.PWA移动参数 %></a></li>
</ul>
<div class="tab-content col-12 table_box">
<div class="tab-pane active" id="tabs0">
  <table class="table table-bordered table-hover sys_table">
	<tr>
	  <th scope="row" class="w12rem_lg"><%=Resources.L.网站名称 %></th>
	  <td><asp:TextBox ID="SiteName_T" runat="server"  class=" form-control max20rem"></asp:TextBox></td>
	</tr>
	<tr>
	  <th scope="row"><%=Resources.L.网站标题 %></th>
	  <td><asp:TextBox ID="SiteTitle_T" runat="server"  class="form-control max20rem"></asp:TextBox></td>
	</tr>
	<tr>
	<th scope="row"><%=Resources.L.网站地址 %></th>
	  <td><asp:TextBox ID="SiteUrl_T" runat="server"  class="form-control max20rem" ></asp:TextBox>
	  <small class="text-muted"><%=Resources.L.当前网址 %> <asp:Literal ID="siteurl" runat="server"></asp:Literal>
		<asp:RequiredFieldValidator ID="RF1" runat="server" ControlToValidate="SiteUrl_T" ErrorMessage="<%$Resources:L,网站地址_notice1 %>" class="tex_color"   Display="Dynamic" />
		<asp:RegularExpressionValidator ID="RF2" ValidationExpression="^[a-zA-z]+://[^\s]*[^\d]*$" runat="server" ErrorMessage="<%$Resources:L,网站地址_notice2 %>" ControlToValidate="SiteUrl_T"  Display="Dynamic" />
		</small></td>
	</tr>
	<tr>
	<th scope="row"><%=Resources.L.后台路径 %></th>
	  <td><asp:TextBox ID="CustomPath" runat="server"  MaxLength="10" class="form-control max20rem" onkeyup="value=value.replace(/[^\w\/]/ig,'')" AutoCompleteType="None"/>
		<small class="text-muted"><%=Resources.L.后台路径_notice %>
		<asp:RequiredFieldValidator ID="CustomPath_R2" SetFocusOnError="true" runat="server" ControlToValidate="CustomPath" Display="Dynamic" ErrorMessage="<%$Resources:L,后台路径_notice1 %>" class="tex_color"></asp:RequiredFieldValidator>
		<asp:RegularExpressionValidator ID="CustomPath_R1" ControlToValidate="CustomPath"
		ValidationExpression="^[a-zA-Z0-9_\u4e00-\u9fa5\@\.]{3,10}$" SetFocusOnError="true" runat="server" Display="Dynamic" ErrorMessage="<%$Resources:L,后台路径_notice2 %>" class="tex_color"></asp:RegularExpressionValidator></small></td>
	</tr>
	<tr>
	<th scope="row">LOGO <%=Resources.L.地址 %></th>
	  <td><asp:TextBox ID="LogoUrl_T" runat="server"  class="form-control max20rem"></asp:TextBox></td>
	</tr>
	<tr>
	<th scope="row"><%=Resources.L.后台标志 %></th>
	  <td>
	  <div class="input-group">
	  <asp:TextBox ID="LogoAdmin_T" placeholder="<%$Resources:L,初始值 %>" runat="server"  class="form-control max20rem"></asp:TextBox>
	  <div class="input-group-append">
		<span class="input-group-text"  onclick="ShowComDiag('/common/icon2.html', '选择图标');" ><%=Resources.L.选择图标 %> <i id="LogoAdmin_T_icon"></i></span>
	  </div>
	  </div>
	  <small class="text-muted"><%=Resources.L.选择图标_notice %></small>
	  </td>
	</tr>
	<tr>
	<th scope="row"><%=Resources.L.后台名称 %></th>
	  <td>
          <div class="input-group">
              <asp:TextBox ID="LogoPlatName_T" runat="server" placeholder="<%$Resources:L,初始值 %>" class="form-control max20rem" />
              <div class="input-group-append">
                  <span class="input-group-text" onclick="setPlatName();"><%=Resources.L.推荐格式 %></span>
              </div>
          </div>
	</tr>
	<tr>
	<th scope="row"><%=Resources.L.官方二维码 %></th>
	  <td><asp:TextBox ID="QRCode_T" runat="server"  class="form-control max20rem"></asp:TextBox></td>
	</tr>
	<tr>
	<th scope="row"><%=Resources.L.公司名称 %></th>
	  <td><asp:TextBox ID="ComName_T"  runat="server" CssClass="form-control max20rem"></asp:TextBox></td>
	</tr>
	<tr>
	<th scope="row"><%=Resources.L.站长姓名 %></th>
	  <td><asp:TextBox ID="Webmaster_T" runat="server" class="form-control max20rem"></asp:TextBox></td>
	</tr>
	<tr>
	<th scope="row"><%=Resources.L.站长手机 %></th>
	  <td><asp:TextBox ID="MasterPhone_T" runat="server" class="form-control max20rem" />
		<asp:RegularExpressionValidator ID="REV1" Display="Dynamic" ControlToValidate="MasterPhone_T" class="tex_color" ValidationExpression="^1\d{10}$" runat="server" ErrorMessage="<%$Resources:L,站长手机_notice %>"></asp:RegularExpressionValidator></td>
	</tr>
	<tr>
	<th scope="row"><%=Resources.L.站长信箱 %></th>
	  <td><asp:TextBox ID="WebmasterEmail_T" runat="server" class="form-control max20rem" />
		<asp:RegularExpressionValidator ID="Email_Reg"  runat="server" ErrorMessage="<%$Resources:L,站长信箱_notice %>" SetFocusOnError="true" class="tex_color" ControlToValidate="WebmasterEmail_T"  Display="Dynamic" /></td>
	</tr>
	<tr>
	<th scope="row"><%=Resources.L.网站META关键词 %></th>
	  <td><asp:TextBox ID="MetaKeywords_T" runat="server" TextMode="MultiLine" class="form-control m50rem_50" ></asp:TextBox></td>
	</tr>
	<tr>
	<th scope="row"><%=Resources.L.网站META网页描述 %></th>
	  <td><asp:TextBox ID="MetaDescription_T" runat="server" TextMode="MultiLine" class="form-control m50rem_50"></asp:TextBox></td>
	</tr>
	<tr>
	<th scope="row"><%=Resources.L.版权信息 %></th>
	  <td><asp:TextBox ID="Copyright_T" runat="server" TextMode="MultiLine"  class="form-control m50rem_50 h6rem" ></asp:TextBox></td>
	</tr>
	<tr>
	<th scope="row"><%=Resources.L.站长统计脚本 %></th>
	  <td><asp:TextBox ID="allSiteJS" runat="server" TextMode="MultiLine" class="form-control m50rem_50 h6rem" /></td>
	</tr>
	<tr>
	  <td></td>
	  <td><asp:Button ID="Button1" runat="server" Text="<%$Resources:L,保存网站设置 %>" OnClick="Button1_Click" class="btn btn-outline-info" OnClientClick="disBtn(this,2000);"/>
	  </td>
	</tr>
  </table>
</div>
<div class="tab-pane" id="tabs1">
  <table class="table table-bordered table-hover sys_table">
	<tr>
	<th scope="row" class="w12rem_lg"><%=Resources.L.应用名称 %></th>
	  <td><ZL:TextBox runat="server" ID="ShortName_T" AllowEmpty="false" class="form-control max20rem" MaxLength="6" ValidationGroup="pwa"/></td>
	</tr>
	<tr>
	<th scope="row"><%=Resources.L.应用全名 %></th>
	  <td><ZL:TextBox runat="server" ID="Name_T" AllowEmpty="false" class="form-control max20rem" MaxLength="15"  ValidationGroup="pwa"/></td>
	</tr>
	<tr>
	<th scope="row"><%=Resources.L.启动页面 %></th>
	  <td><ZL:TextBox runat="server" ID="StartUrl_T"  AllowEmpty="false" class="form-control max20rem" placeholder="/Default.aspx"  ValidationGroup="pwa"/></td>
	</tr>
	<tr>
	<th scope="row"><%=Resources.L.启动背景 %></th>
	  <td>
	  <div id="pwacolor" class="input-group colorpicker-component" title="Using format option">
	  <asp:TextBox runat="server" ID="BKColor_T" class="form-control input-lg max20rem"  value="#305AA2" />
		<div class="input-group-append">
	 <span class="btn btn-info input-group-addon"><i></i></span>
	</div>
   </div> 
   <small class="text-muted"><%=Resources.L.启动背景_notice %></small>
	</td>
	</tr>
	<tr>
	<th scope="row"><%=Resources.L.APP图标 %></th>
	  <td><ZL:SFileUp runat="server" ID="SFileUp" FType="Img" />
		  <small id="pwaiconfile" class="text-muted"><%=Resources.L.APP图标_notice %></small></td>
	</tr>
	<tr>
	<th scope="row"><%=Resources.L.内容引用 %></th>
	  <td><asp:TextBox runat="server" ID="QuoteContent_T" class="form-control" Rows="10" TextMode="MultiLine"/></td>
	</tr>
	<tr>
		<th scope="row"><%=Resources.L.效果呈现 %></th>
	  <td ><div class="pwa_view_wrap">
			<div class="item">
				<img src="/manage/mobile/pwa_assets/desktop.jpg" alt="desktop" />
				<div class="pwa_view_item1">
				 <img src="<%=SiteConfig.SiteOption.PWA_Icon %>" onerror="shownopic(this);" alt="desktop_ico"/>                    
				<span><%=SiteConfig.SiteOption.PWA_ShortName %></span>
				</div>
			</div>
			<div class="item">
				<img src="/manage/mobile/pwa_assets/splash.jpg?v=1" />
				<div class="pwa_view_item2">
				<img src="<%=SiteConfig.SiteOption.PWA_Icon %>" onerror="shownopic(this);" alt="splash_ico"/>
				<div class="pwa_view_item2_name"><%=SiteConfig.SiteOption.PWA_ShortName %></div>
				</div>
			</div>
			<div class="item">
				<img src="/manage/mobile/pwa_assets/setup.jpg?v=3"/>
				<div class="pwa_view_item3">
				<strong><%=SiteConfig.SiteOption.PWA_ShortName %></strong>
				<div class="pwa_view_item3_bar d-flex flex-row">
				<img src="<%=SiteConfig.SiteOption.PWA_Icon %>" onerror="shownopic(this);" alt="shortico"/>
				<p><span><%=SiteConfig.SiteOption.PWA_Name %></span>
				<%=SiteConfig.SiteInfo.SiteUrl %></p>
				</div>
				</div>
			</div>
		</div></td>
	</tr>
	<tr>
	  <td></td>
	  <td><asp:Button runat="server" ID="Save_Btn" class="btn btn-outline-info" OnClick="Save_Btn_Click" Text="<%$Resources:L,保存PWA移动配置 %>"  ValidationGroup="pwa"/>	  
	      <a href="#" class="btn btn-link" id="copy_btn"><%=Resources.L.引用 %>{$PWAMainfirst/}<%=Resources.L.标签 %></a>
	  </td>
	</tr>
  </table>	  
 <div class="alert alert-info alert-dismissible fade show" role="alert"> 
	 <strong><%=Resources.L.关于PWA移动 %> ：</strong><%=Resources.L.关于PWA移动_notice %><a href="http://help.z01.com/pwa" target="_blank"> <%=Resources.L.开发文档 %></a>。
	 <button type="button" class="close" data-dismiss="alert" aria-label="Close"> <span aria-hidden="true">×</span> </button>
</div>
</div>
</div>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<link href="/dist/css/bootstrap-colorpicker.min.css" rel="stylesheet">
<script src="/dist/js/bootstrap-colorpicker.min.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
    $(function () {
        if ("<%:Request["action"]%>" == "top") { top.location = siteconf.path + "Default"; }
    });
    //更新配置前检测
    function CheckInfo() {
        var a = document.getElementById("<%=CustomPath.ClientID%>").value;
        if (a.length < 3) {
            alert("个性化路径最少三位");
            document.getElementById("<%=CustomPath.ClientID%>").focus();
            return false;
        }
        else if (a.toLowerCase() == "user") {
            alert("不允许使用已有目录名user");
            document.getElementById("<%=CustomPath.ClientID%>").focus();
            return false;
        }
    disBtn("Button1", 3000);
    return true;
}
function setPlatName() {
    var tlp = "国际互联<span>智能门户管理系统</span>";
    $("#LogoPlatName_T").val(tlp);
}
var zlicon = { text: "" };
zlicon.back = function (icon) {
    if (!icon) { return; }
    $(zlicon.text).val(icon);
    $(zlicon.text + "_icon").attr("class", icon);
    CloseComDiag();
}
zlicon.init = function (text) {
    zlicon.text = text;
    zlicon.back($(text).val());
}
zlicon.init("#LogoAdmin_T");

//标签复制
var clipboard = new ClipboardJS('#copy_btn', {
	text: function() {
		return '{$PWAMainfirst/}';
	}

});
clipboard.on('success', function(e) {
	//console.log(e);
	alert("复制完成-使用Ctrl+V粘贴在模板head区即可！");
});

//PWA选色器
$(function () {
	$('#pwacolor').colorpicker({
	  format: "rgba"
	});
  });
</script>
</asp:Content>