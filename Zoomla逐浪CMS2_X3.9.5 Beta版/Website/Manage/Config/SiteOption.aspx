<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SiteOption.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.SiteOption" MasterPageFile="~/Manage/I/Index.master" ValidateRequest="false" %>
<%@ Register Src="~/Manage/I/ASCX/TlpDP.ascx" TagPrefix="ZL" TagName="TlpDown" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title><%=Resources.L.网站参数配置 %></title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("SiteInfo.aspx","系统设置"),
        new Bread("SiteInfo.aspx","网站配置"),
        new Bread() {url="", text="网站参数配置",addon="" }},
		Call.GetHelp(3)
		)
		
    %>
<div class="container-fluid pr-0">
<div class="row sysRow">	
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <ul class="nav nav-tabs list_choice" role="tablist">
        <li class="nav-item"><a class="nav-link active show" href="#Tabs0" data-toggle="tab"><%=Resources.L.全局设置 %></a></li>
        <li class="nav-item"><a class="nav-link" href="#Tabs1" data-toggle="tab"><%=Resources.L.风格参数 %></a></li>
        <li class="nav-item"><a class="nav-link" href="#Tabs2" data-toggle="tab"><%=Resources.L.安全设置 %></a></li>
        <li class="nav-item"><a class="nav-link" href="#Tabs3" data-toggle="tab"><%=Resources.L.上传控制 %></a></li>
        <li class="nav-item"><a class="nav-link" href="#Tabs4" data-toggle="tab"><%=Resources.L.商城配置 %></a></li>
    </ul>
<div class="tab-content col-12 table_box">
<div class="tab-pane active" id="Tabs0">
<table class="table table-striped table-bordered table-hover sys_table">
	<tbody>
		<tr runat="server" id="Tr5">
			<th class="w12rem_lg" scope="row"><%=Resources.L.选择默认语言 %></th>
			<td>
				<asp:DropDownList ID="languages" CssClass="form-control max20rem"  runat="server" OnSelectedIndexChanged="languages_SelectedIndexChanged" AutoPostBack="true">
					<asp:ListItem Text="中国 - 简体中文" Value="ZH-CN"></asp:ListItem>
					<asp:ListItem Text="United States - English" Value="EN-US"></asp:ListItem>
					<asp:ListItem Text="France - Français" Value="fr-FR"></asp:ListItem>
					<asp:ListItem Text="Россия - Русский" Value="ba-RU"></asp:ListItem>
					<asp:ListItem Text="Deutschland" Value="de-DE"></asp:ListItem>
					<asp:ListItem Text="Italia - Italiano" Value="it-IT"></asp:ListItem>
					<asp:ListItem Text="日本 - 日本語" Value="ja-JP"></asp:ListItem>
				</asp:DropDownList>
				<asp:Label runat="server" ID="Prompt_L" class="tex_color"></asp:Label>
			</td>
		</tr>
		<tr>
			<th scope="row">超级管理按钮</th>
			<td>
				<input type="checkbox" runat="server" id="UAgent" class="switchChk" />
			</td>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.启用系统帮助 %></th>
			<td>
				<input type="checkbox" runat="server" id="IsOpenHelp" class="switchChk" />
			</td>
		</tr>
        <tr><th scope="row">关闭动力模块</th>
            <td>
                <input type="checkbox" runat="server" id="DesignIsClose" class="switchChk" checked="checked" />
            </td>
        </tr>
		<tr>
			<th scope="row"><%=Resources.L.开启域名路由 %></th>
			<td>
                <input type="checkbox" runat="server" id="DomainRoute_chk" class="switchChk" checked="checked" />
				<small class="text-muted"><%=Resources.L.修改后 %>,<%=Resources.L.必须重启站点才能生效 %></small>
			</td>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.内容标题查重 %></th>
			<td>
				<%--<input type="checkbox" runat="server" id="IsRepet" class="switchChk" />--%>
				<asp:TextBox runat="server" ID="DupTitleNum_T" CssClass="form-control max20rem" Text="6" />
				<small class="text-muted"><%=Resources.L.标题字数多少字符以上才检测 %>,<%=Resources.L.零为不检测 %></small>
			</td>
		</tr>
		<%--<tr>
			<th scope="row"><%=Resources.L.保留日志数量 %></th>
			<td>
				<asp:TextBox ID="Savanumlog" runat="server"  CssClass="form-control max20rem" />
				<small class="text-muted">条 (0-<%=Resources.L.不限制 %>)</small>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.保留日志天数 %></th>
			<td>
				<asp:TextBox ID="Savadaylog"  runat="server" CssClass="form-control max20rem" />
				<small class="text-muted">天 (0-<%=Resources.L.不限制 %>)</small>
			</td>
		</tr>--%>
		<tr runat="server" id="Tr1">
			<th scope="row"><%=Resources.L.视频服务器源 %></th>
			<td><asp:TextBox ID="Videourl" runat="server" CssClass="form-control max20rem" /></td>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.评论积分赠送 %></th>
			<td>
				<div class="input-group">
					<asp:TextBox ID="CommentRule"  runat="server" CssClass="form-control max20rem form-control" />
				  	<div class="input-group-append">
					<span class="input-group-text">分</span>
				  	</div>
				</div>
			</td>
		</tr>
		<tr>
			<th scope="row" "><%=Resources.L.生成PDF目录 %></th>
			<td>
				<asp:TextBox ID="txtPdf" runat="server"  CssClass="form-control max20rem" />
				<small class="text-muted"><%=Resources.L.目录名前后不要加斜杠 %>"/"</small>
			</td>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.广告存储目录 %><br />
			</th>
			<td>
				<asp:TextBox ID="txtAdvertisementDir"  runat="server" CssClass="form-control max20rem" />
				<small id="txtAdvertisementDir" class="text-muted"><%=Resources.L.为防止广告拦截软件影响广告展示 %>，<%=Resources.L.您可以修改广告JS存放目录 %>(<%=Resources.L.默认为AD %>)</small>
			</td>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.链接地址方式 %></th>
			<td>
				<asp:RadioButton ID="rdoIapTrue" runat="server" GroupName="IsAbsoluatePath" TabIndex="1" Text="<%$Resources:L,相对路径 %>" />
				<asp:RadioButton ID="rdoIapFalse" runat="server" GroupName="IsAbsoluatePath" TabIndex="2" Text="<%$Resources:L,绝对路径 %>" /></td>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.首页生成后缀 %></th>
			<td class="sys_table_none">
				<asp:RadioButtonList ID="IndexEx" runat="server" RepeatDirection="Horizontal">
					<asp:ListItem Selected="True" Value="0">.html</asp:ListItem>
					<asp:ListItem Value="1">.htm</asp:ListItem>
					<asp:ListItem Value="2">.shtml</asp:ListItem>
					<asp:ListItem Value="3" Text="<%$Resources:L,aspx不生成静态 %>"></asp:ListItem>
				</asp:RadioButtonList>
			</td>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.生成静态目录 %></th>
			<td>
				<asp:TextBox ID="txtCatalog" runat="server"  CssClass="form-control max20rem" />
				<small class="text-muted"><%=Resources.L.目录名前后不要加斜杠 %>"/"</small>
			</td>
		</tr>
	</tbody>
</table>
</div>
<div class="tab-pane" id="Tabs1">
<table class="table table-striped table-bordered table-hover sys_table">
	<tbody>
		<tr>
			<th class="w12rem_lg" scope="row"><%=Resources.L.是否开启个人空间 %></th>
			<td>
				<input type="checkbox" runat="server" id="IsZone"  class="switchChk"  /></td>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.云盘共享空间权限 %></th>
			<td class="sys_table_none">
				<asp:CheckBoxList runat="server" ID="cloud_ChkList" RepeatDirection="Horizontal">
					<asp:ListItem Value="read" Text="<%$Resources:L,读取 %>"></asp:ListItem>
					<asp:ListItem Value="del" Text="<%$Resources:L,删除 %>"></asp:ListItem>
					<asp:ListItem Value="up" Text="<%$Resources:L,上传 %>"></asp:ListItem>
				</asp:CheckBoxList>
			</td>
		</tr>
<%--		<tr>
			<th scope="row"><%=Resources.L.是否开启多用户网店功能 %></th>
			<td>
				 <input type="checkbox" runat="server" id="IsMall"  class="switchChk" />
			</td>
		</tr> --%>        
		<tr>
			<th scope="row"><%=Resources.L.开启云台提示 %></th>
			<td>
				 <input type="checkbox" runat="server" id="cloudLeadTips" class="switchChk" />
			</td>
		</tr>
		<tr>
            <th scope="row"><%=Resources.L.简洁界面模式 %></th>
            <td>
                <input type="checkbox" runat="server" id="SiteManageMode_Chk" class="switchChk" />
				<small class="text-muted"><%=Resources.L.开启后 %>,<%=Resources.L.会员与管理员登录将不加载背景图 %></small>
            </td>
		</tr>
        <tr>
            <th scope="row">用户登录跳转</th>
            <td>
                <asp:TextBox ID="LoggedUrl_T" runat="server" CssClass="form-control max20rem" />
				<small class="text-muted">用户登录后,将会跳转至页面</small>
        </tr>
		<tr>
			<th scope="row"><%=Resources.L.系统云台 %></th>
			<td>
				<asp:TextBox ID="txtProjectServer" runat="server" CssClass="form-control max20rem" />
				<small class="text-muted"><%=Resources.L.支持从远程云端下载功能与模板界面 %>，<%=Resources.L.官方服务器地址 %>：http://update.z01.com</small>
				</td>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.网站首页模板 %></th>
			<td>
                <%=PageCommon.GetTlpDP("IndexTemplate_DP") %>
                <asp:HiddenField ID="IndexTemplate_DP_hid" runat="server" />
			  <%--  <asp:TextBox ID="TxtIndexTemplate"  runat="server" CssClass="form-control pull-left"  />--%>
				<%--<asp:DropDownList runat="server" ID="IndexTemplate_DP" CssClass="form-control max20rem" DataTextField="rname" DataValueField="rname" EnableViewState="false" ></asp:DropDownList>
				<input type="button"  value="<%=Resources.L.选择模板 %>" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('TxtIndexTemplate') + '&FilesDir=', 650, 480)" class="btn btn-light btn-sm" />
			--%></td>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.店铺首页模板 %></th>
			<td>
                <%=PageCommon.GetTlpDP("ShopTemplate_DP")%>
                <asp:HiddenField ID="ShopTemplate_DP_hid" runat="server" />
				<%--<asp:DropDownList runat="server" ID="ShopTemplate_DP" CssClass="form-control max20rem" DataTextField="rname" DataValueField="rname" EnableViewState="false" ></asp:DropDownList>
				<input type="button"  value="<%=Resources.L.选择模板 %>" onclick="WinOpenDialog('../Template/TemplateList.aspx?OpenerText=' + escape('txtShopTemplate') + '&FilesDir=', 650, 480)" class="btn btn-light btn-sm" />
			--%></td>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.模板方案 %></th>
			<td>
				<div id="DivtemplateDir">
					<asp:UpdatePanel ID="UpdatePanel1" runat="server"></asp:UpdatePanel>
					<asp:DropDownList ID="DropTemplateDir" runat="server" onchange="cc()" CssClass="form-control max20rem"></asp:DropDownList>
				</div>
			</td>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.风格路径 %></th>
			<td>
				<div id="DivCssDir">
					<asp:TextBox ID="txtCssDir" runat="server" CssClass="form-control max20rem"  />
					<small class="text-muted">*<%=Resources.L.为保证风格能够与云端结合使用 %>，<%=Resources.L.请继承上一项模板目录 %></small>
				</div>
			</td>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.默认风格 %></th>
			<td><asp:TextBox ID="txtStylePath" runat="server" CssClass="form-control max20rem" /></td>
		</tr>
	</tbody>
</table>
</div>
<div class="tab-pane" id="Tabs2">
<table class="table table-striped table-bordered table-hover sys_table">
	<tbody>
        <tr>
            <th class="w12rem_lg" scope="row"><%=Resources.L.HTTPS全站SSL加密 %></th>
            <td>
               <input type="checkbox" runat="server" class="switchChk" id="safeDomain_Chk" />
			   <small class="text-muted">访问行为由http变更为https</small>
            </td>
        </tr>
        <tr>
            <th scope="row">统一域名归集访问</th>
            <td>
                <div><input type="checkbox" runat="server" id="DomainMerge_Chk" class="switchChk" />
				<small class="text-muted">多域名绑定302跳到SiteUrl唯一地址</small>
				</div>
                <div class="input-group margin_t5 group_box"><span class="group_input cRadius_right">PC端</span><asp:TextBox runat="server" ID="Domain_PC_T" class="form-control max20rem" placeholder="http://网址"/></div>
                <div class="input-group margin_t5 group_box"><span class="group_input cRadius_right">手 机</span><asp:TextBox runat="server" ID="Domain_Mobile_T" class="form-control max20rem" placeholder="http://网址"/></div>
                <div class="input-group margin_t5 group_box"><span class="group_input cRadius_right">微 信</span><asp:TextBox runat="server" ID="Domain_Wechat_T" class="form-control max20rem" placeholder="http://网址"/></div>
            </td>
        </tr>
        <tr>
            <th scope="row">验证码类型</th>
            <td>
               <label><input type="radio" value="0" name="VerifyType_rad"/>验证码</label>
               <label><input type="radio" value="1" name="VerifyType_rad"/>点触科技 [<a href="Third/TouClickAdd.aspx">前往配置</a>]</label>
            </td>
        </tr>
        <tr><th scope="row">验证码长度</th>
            <td>
                <ZL:TextBox runat="server" ID="VerifyLen_T" class="form-control max20rem" MaxLength="1" ValidType="IntPostive" />
				<small class="text-muted">长度推荐为2-9个字符之间</small>
            </td>
        </tr>
        <tr>
            <th scope="row">验证码组成</th>
            <td>
                <label><input type="radio" value="4"  name="VerifyForm_rad" checked="checked"/>数字+英文</label>
                <label><input type="radio" value="2" name="VerifyForm_rad"/>仅数字</label>
                <label><input type="radio" value="3" name="VerifyForm_rad"/>仅英文</label>
            </td>
        </tr>
		<tr>
			<th scope="row"><%=Resources.L.是否启用后台管理认证码 %></th>
			<td>
				 <input type="checkbox" runat="server" id="EnableSiteManageCod" class="switchChk" />
			</td>
		</tr>
		<tr>
			<th scope="row" ><%=Resources.L.是否使用软键盘输入密码 %></th>
			<td>
				 <input type="checkbox" runat="server" id="EnableSoftKey" class="switchChk" />
			</td>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.是否启用发送短信 %></th>
			<td>
				<input type="checkbox" runat="server" id="OpenSendMessage" class="switchChk" />
			</td>
		</tr>
        <tr>
			<th scope="row"><%=Resources.L.留言本是否需要登录 %></th>
			<td>
				<input type="checkbox" runat="server" id="OpenMessage" class="switchChk" checked="checked" />
			</td>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.留言显示是否需要审核 %></th>
			<td>
				<input type="checkbox" runat="server" id="OpenAudit" class="switchChk" checked="checked" />
			</td>
		</tr>
		<tr>
			<th scope="row" ><strong><%=Resources.L.是否过滤敏感词汇 %></th>
			<td>
				<input type="checkbox" runat="server" id="rdoIsSensitivity" class="switchChk" checked="checked" />
			</td>
		</tr>
		<tr class="dis_none">
			<th scope="row" ><%=Resources.L.过滤敏感词汇 %></th>
			<td>
				<asp:TextBox ID="TxtSensitivity" runat="server" Rows="6" TextMode="MultiLine" CssClass="form-control m50rem_50" />
				<small class="text-muted"><%=Resources.L.提示 %>：<%=Resources.L.敏感词汇请用逗号分隔 %> </small>
				</td>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.黄页是否需要审核 %></th>
			<td>
				<input type="checkbox" runat="server" id="rdoBtnLSh" class="switchChk" checked="checked" />
			</td>
		</tr>
		<tr>
			<th scope="row" ><%=Resources.L.有问必答是否支持匿名提交 %></th>
			<td>
				<input type="checkbox" runat="server" id="MailPermission" class="switchChk" checked="checked" />
			</td>
		</tr>
        
        <tr>
			<th scope="row" ><%=Resources.L.后台管理认证码 %></th>
			<td>
				<asp:TextBox ID="txtSiteManageCode" runat="server" CssClass="form-control max20rem" /></td>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.站群采集密码 %></th>
			<td>
				<asp:TextBox runat="server" ID="SiteCollKey_T" CssClass="form-control max20rem" />
				<small class="text-muted"><%=Resources.L.为空则不允许被采集 %><a href="javascript:;">[子站设置]</a></small>
			</td>
		</tr>
		<tr runat="server" id="Tr2">
			<th scope="row">Flex Api(<%=Resources.L.试戴密匙 %>)</th>
			<td>
				<asp:TextBox ID="FlexKey" runat="server" CssClass="form-control max20rem" />
			</td>
		</tr>
        <tr><th scope="row">APP<%=Resources.L.授权码 %></th><td><asp:TextBox runat="server" ID="APPAuth_T" CssClass="form-control max20rem" /></td></tr>
        <%--<tr>
            <th scope="row"><%=Resources.L.是否开启管理员申请 %></th>
            <td>
				<input type="checkbox" runat="server" id="IsManageReg" class="switchChk" checked="checked" />                
            </td>
        </tr>--%>
		<asp:HiddenField ID="HiddenUrlWrite" runat="server" />
	</tbody>
</table>
</div>
<div class="tab-pane" id="Tabs3">
<table class="table table-striped table-bordered table-hover sys_table">
	<tbody>
<%--		<tr>
			<th scope="row"><%=Resources.L.默认编辑器 %></th>
			<td>
				<asp:RadioButtonList ID="EditVer" runat="server" RepeatDirection="Horizontal">
					<asp:ListItem Selected="True" Value="3">Ueditor</asp:ListItem>
					<asp:ListItem Value="1">Ckeditor</asp:ListItem>
				</asp:RadioButtonList></td>
		</tr>--%>
		<tr>
			<th class="w12rem_lg" scope="row"><%=Resources.L.是否允许上传文件 %></th>
			<td>
				<input type="checkbox" runat="server" id="EnableUploadFiles" class="switchChk" />
			</td>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.IIS可支持最大文件上传 %></th>
			<td>
				<div class="input-group">
				  <asp:TextBox ID="txtUploadFileMaxSize" Text="30" runat="server" CssClass="form-control max20rem" />
				  <asp:RegularExpressionValidator ID="RegularExpressionValidator13" runat="server" ControlToValidate="txtUploadFileMaxSize" ForeColor="Red" ErrorMessage="必须输入数字!" ValidationExpression="\d+" Display="Dynamic" SetFocusOnError="True" />
				  <div class="input-group-append">
					<span class="input-group-text">M</span>
				  </div>
				</div>
				<small class="text-muted"><%=Resources.L.提示 %>：<%=Resources.L.默认为 %>30M，<%=Resources.L.您可以填写允许的最大值 %>4096M（4G），<%=Resources.L.为0代表继承系统设置 %></small>
		   </td>
				
		</tr>
		<%--  <tr>
		<th scope="row">编辑器是否保存远程图片</th>
		<td>
			<asp:RadioButton ID="IsSaveRemoteImageFalse" runat="server" GroupName="IsSaveRemoteImage" TabIndex="2" Text="不启用" />
			<asp:RadioButton ID="IsSaveRemoteImageTrue" runat="server" GroupName="IsSaveRemoteImage" TabIndex="1" Text="启用" />  *仅针对Ckeditor
		</td>
		</tr>--%>
		<tr>
			<th scope="row"><%=Resources.L.媒体文件最大值 %></th>
			<td>
				<div class="input-group">
				  <asp:TextBox ID="TxtUpMediaSize" runat="server" CssClass="form-control max20rem" />
				  <div class="input-group-append">
					<span class="input-group-text">KB</span>
				  </div>
				</div>
				<small class="text-muted"><%=Resources.L.提示 %>：1 KB = 1024 Byte，1 MB = 1024 KB</small>
			</td>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.Flash等媒体文件大小 %></th>
			<td>
				<div class="input-group">
				  <asp:TextBox ID="TxtUpFlashSize" runat="server" CssClass="form-control max20rem" />
				  <div class="input-group-append">
					<span class="input-group-text">KB</span>
				  </div>
				</div>
				<small class="text-muted"><%=Resources.L.提示 %>：1 KB = 1024 Byte，1 MB = 1024 KB</small>
			</td>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.网站上传目录 %></th>
			<td>
				<asp:TextBox ID="txtUploadDir" runat="server" CssClass="form-control max20rem pull-left" /></td>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.文件保存路径 %></th>
			<td>
				<select id="FileRJ" class="form-control max20rem" runat="server">
					<option value="0">节点/文件类型</option>
					<option value="1">文件类型/年月</option>
					<option value="2">文件类型/年/月</option>
					<option value="3">文件类型/节点/年/月</option>
					<option value="4">节点/年/月</option>
				</select>
			</td>
		</tr>
		<tr>
			<th scope="row"><%:lang.LF("文件命名规则") %></th>
			<td>
				<select id="FileN" runat="server"  class="form-control max20rem">
					<option value="0">随机数</option>
					<option value="1">年月日时分秒</option>
					<option value="2">时分秒</option>
					<option value="3">原文件名</option>
				</select>
			</td>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.附件类型限制 %></th>
			<td><asp:TextBox ID="txtUploadFileExts"  runat="server" CssClass=" form-control m50rem_50" TextMode="MultiLine" Rows="3" Columns="60" /></td>
		</tr>
		
		<tr>
			<th scope="row"><%=Resources.L.编辑器上传图片类型限制 %></th>
			<td>
				<asp:TextBox ID="TxtUpPicExt" runat="server"  CssClass="form-control m50rem_50" TextMode="MultiLine" Rows="3" Columns="60" /></td>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.可上传图片最大值 %></th>
			<td>
				<div class="input-group">
				  <asp:TextBox ID="TxtUpPicSize" runat="server"  CssClass="form-control max20rem" />
				  <div class="input-group-append">
					<span class="input-group-text" >KB</span>
				  </div>
				</div>
				<small class="text-muted">提示：1 KB = 1024 Byte，1 MB = 1024 KB</small>
			</td>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.媒体文件类型限制 %></th>
			<td><asp:TextBox ID="TxtUpMediaExt" runat="server" CssClass="form-control m50rem_50" TextMode="MultiLine" Rows="3" Columns="60" /></td>
		</tr>
	</tbody>
</table>
</div>
<div class="tab-pane" id="Tabs4">
<table class="table table-striped table-bordered table-hover sys_table">
	<tbody>
		<tr>
			<th class="w12rem_lg" scope="row" class="td_l">允许虚拟币支付</th>
			<td>
				<label><input type="checkbox" name="PayType" value="purse" /><%=Resources.L.余额 %></label>
				<label><input type="checkbox" name="PayType" value="sicon" /><%=Resources.L.银币 %></label>
				<label><input type="checkbox" name="PayType" value="point" /><%=Resources.L.积分 %></label>
				<asp:HiddenField ID="PayType_Hid" runat="server" />
			</td>
		</tr>
        <tr>
            <th scope="row">积分金额抵扣比率</th>
            <td>
                <div class="input-group text_s">
                    <asp:TextBox ID="PointRatio_T" class="form-control max20rem float" runat="server" />
                    <span class="group_input cRadius_left">%</span>
                </div>
				<small class="text-muted">(0或100视为关闭积分兑换)</small>
            </td>
        </tr>
        <tr>
            <th scope="row">积分货币兑换比率</th>
            <td>
                <div class="input-group text_md max20rem">
                    <span class="group_input">1积分=</span>
                    <asp:TextBox ID="PointRate_T" CssClass="form-control float" runat="server" />
                    <span class="group_input cRadius_left">元</span>
                </div>
				<small class="text-muted">((0为关闭积分兑换)</small>
            </td>
        </tr>
       <%-- <tr><th scope="row"><%=Resources.L.使用外币结算 %>(<a href="../Shop/MoneyManage.aspx"><%=Resources.L.前往设置 %></a>)</th><td>
            <input type="checkbox" runat="server" id="OpenMoneySel_Chk" class="switchChk" />
            <span class="rd_green"><%=Resources.L.开启后支付金额将会自动乘与你设定的外币汇率 %></span></td></tr>--%>
        <tr><th scope="row"><strong>快递方式</strong></th><td>
            <asp:TextBox runat="server" ID="ExpNames_T" class="form-control max20rem"/>
			<small class="text-muted">示例格式:快递|平邮|EMS</small>
        </td></tr>
        <tr>
            <th scope="row">订单确认后才可付款</th>
            <td> <input type="checkbox" runat="server" id="IsCheckPay" class="switchChk" /></td>
        </tr>
        <tr>
            <th scope="row"><%=Resources.L.订单过期时间 %></th>
            <td><asp:TextBox ID="OrderExpired_T" runat="server" CssClass="form-control max20rem" />
				<small class="text-muted"><%=Resources.L.以小时为单位 %>,<%=Resources.L.零则为不限时间 %></small>
			</td>
        </tr>
         <tr>
			<th scope="row"><%=Resources.L.商品编号生成规则 %></th>
			<td><asp:TextBox ID="ItemRegular_T" runat="server" CssClass="form-control max20rem" /></td></tr>
		<tr>
			<th><%=Resources.L.订单结算最低限制 %></th>
			<td><asp:TextBox ID="txtSetPrice" runat="server" CssClass="form-control max20rem" />
				<small class="text-muted"><%=Resources.L.提示 %>：<%=Resources.L.零为不检测 %></small>
			</td>
		</tr>
        <tr>
            <th scope="row"><%=Resources.L.快递实时跟踪 %>API</th>
            <td>
                <asp:TextBox ID="KDKey_T" runat="server" CssClass="form-control max20rem" />
				<small class="text-muted">提示：<%=Resources.L.用于商城网店查询订单 %>,<a class="tex_color a_Jump" href="http://www.kuaidi100.com/openapi/" target="_blank"><%=Resources.L.点此申请快递100集成密钥 %></a>。</small>
            </td>
        </tr>
        <tr>
            <th scope="row"><%=Resources.L.退货日期时限 %></th>
            <td>
                <asp:TextBox ID="ReturnDate_T" runat="server" CssClass="form-control max20rem" Text="10" />
				<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="ReturnDate_T" ForeColor="Red" ErrorMessage="必须输入数字!" ValidationExpression="\d+" Display="Dynamic" SetFocusOnError="True" />
				<small class="text-muted"><%=Resources.L.提示 %>：<%=Resources.L.零为不检测 %></small>
            </td>
        </tr>
		<tr><th scope="row"><%=Resources.L.顾客短信提醒 %></th><td class="sys_table_none">
			<asp:CheckBoxList runat="server" ID="OrderMsg_Chk" RepeatDirection="Horizontal">
				<asp:ListItem Value="ordered" Text="<%$Resources:L,下单后 %>"></asp:ListItem>
				<asp:ListItem Value="payed" Text="<%$Resources:L,付款后 %>"></asp:ListItem>
			</asp:CheckBoxList></td></tr>
		<tr runat="server" id="OrderMsg_Tr">
			<th scope="row"><%=Resources.L.顾客短信模板 %></th>
			<td>
				<asp:TextBox runat="server" ID="OrderMsg_ordered_T" TextMode="MultiLine" CssClass="form-control  m50rem_50 m-1 textbox_mid" Height="120" placeholder="<%$Resources:L,下单后后内容模板 %>" />
				<asp:TextBox runat="server" ID="OrderMsg_payed_T" TextMode="MultiLine" CssClass="form-control m50rem_50 m-1 textbox_mid" Height="120" placeholder="<%$Resources:L,付款后内容模板 %>" />
			</td>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.管理员订单短信 %></th>
			<td class="sys_table_none">
				<asp:CheckBoxList runat="server" ID="OrderMasterMsg_Chk" RepeatDirection="Horizontal">
					<asp:ListItem Value="ordered" Text="<%$Resources:L,下单后 %>"></asp:ListItem>
					<asp:ListItem Value="payed" Text="<%$Resources:L,付款后 %>"></asp:ListItem>
				</asp:CheckBoxList></td>
		</tr>
		<tr runat="server" id="Tr6">
			<th scope="row"><%=Resources.L.管理员短信模板 %></th>
			<td>
				<asp:TextBox runat="server" ID="OrderMasterMsg_ordered_Tlp" TextMode="MultiLine" CssClass="form-control m50rem_50 m-1 textbox_mid" Height="120" placeholder="<%$Resources:L,下单后后内容模板 %>" />
				<asp:TextBox runat="server" ID="OrderMasterMsg_payed_Tlp" TextMode="MultiLine" CssClass="form-control m50rem_50 m-1 textbox_mid" Height="120" placeholder="<%$Resources:L,付款后内容模板 %>" />
			</td>
		</tr>
		<tr>
			<th scope="row"><%=Resources.L.管理员订单邮件 %></th>
			<td class="sys_table_none">
				<asp:CheckBoxList runat="server" ID="OrderMasterEmail_Chk" RepeatDirection="Horizontal">
					<asp:ListItem Value="ordered" Text="<%$Resources:L,下单后 %>"></asp:ListItem>
					<asp:ListItem Value="payed" Text="<%$Resources:L,付款后 %>"></asp:ListItem>
				</asp:CheckBoxList></td>
		</tr>
		<tr runat="server" id="Tr7">
			<th scope="row"><%=Resources.L.管理员邮件模板 %></th>
			<td class="sys_table_none">
				<asp:TextBox runat="server" ID="OrderMasterEmail_ordered_Tlp" TextMode="MultiLine" CssClass="form-control m50rem_50 m-1 textbox_mid" Height="120" placeholder="<%$Resources:L,下单后后内容模板 %>" />
				<asp:TextBox runat="server" ID="OrderMasterEmail_payed_Tlp" TextMode="MultiLine" CssClass="form-control m50rem_50 m-1 textbox_mid" Height="120" placeholder="<%$Resources:L,付款后内容模板 %>" />
			</td>
		</tr>
		
	</tbody>
</table>
</div>
<div class="text-left panel_footers" >
	<div class="w12rem_lg dib"></div>
    <asp:Button ID="Button1" runat="server" Text="<%$Resources:L,保存设置 %>" OnClick="Button1_Click" CssClass="btn btn-outline-info" OnClientClick="setTimeout(function () { document.getElementById('Button1').disabled = true;},50)" />
    <asp:Button ID="btnReset" runat="server" CssClass="btn btn-outline-info" Text="<%$Resources:L,重置 %>" OnClientClick="return confirm('重置后所有信息都需重新设置,确定要重置吗?')" OnClick="btnReset_Click" />
</div>

</div>
</div>

<ZL:TlpDown runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/ZL_Regex.js"></script>
<script src="/JS/SelectCheckBox.js"></script>
<script src="/dist/js/bootstrap-switch.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script type="text/javascript">
    function DisApi() {
        $("#Api").toggle();
    }
    var tab = '<%= Request.QueryString["tab"]%>';
$(function () {
    $("li a[href='#Tabs" + tab + "']").parent().addClass("active").siblings("li").removeClass("active");
    $("#Tabs" + tab).addClass("active").siblings("div").removeClass("active");
    var paytypes = $("#PayType_Hid").val().split(',');
    $(paytypes).each(function (i, d) {
        $("input[value='" + d + "']")[0].checked = true;
    });
    Tlp_initTemp();
    ZL_Regex.B_Float(".float");
    //积分抵扣比率范围限制
    ZL_Regex.B_Value("#PointRatio_T", {
        min: 0, max: 100, overmin: null, overmax: null
    });
})
var obj1 = document.getElementById("DropTemplateDir");
var obj2 = document.getElementById("txtCssDir");
function cc() {
    obj2.value = obj1.value + "/style";
};
function WinOpenDialog(url, w, h) {
    open(url, window, 'Width=' + w + ',Height=' + h + ',center=yes,status=no,help=no');
}
function showconfig(n) {
    $(".nav-tabs").find("li").removeClass("active");
    $(".nav-tabs").find("li a[href=#Tabs" + n + "]").parent().addClass("active");
    $(".tab-content").find(".tab-pane").removeClass("active");
    $(".tab-content").find("#Tabs" + n).addClass("active");
}
</script>
</asp:Content>