<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddModelField.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.AddModelField" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content ContentPlaceHolderID="head" runat="Server">
<link rel="stylesheet" type="text/css" href="/dist/css/bootstrap-switch.min.css"/>
<link rel="stylesheet" type="text/css" href="/Design/JS/Plugs/color/bootstrap.colorpickersliders.min.css?v=1" />
<script src="/Design/JS/Plugs/color/tinycolor-min.js"></script>
<script src="/Design/JS/Plugs/color/bootstrap.colorpickersliders.min.js?v=1"></script>
<title>字段管理</title>
<style type="text/css">
.ftype{border-radius:5px; border:1px solid #ddd;padding:5px 8px;width:200px;margin-right:5px;cursor:pointer;}
.ftype:hover{border:1px solid #0094ff;}
</style>
</asp:Content>
<asp:Content  ContentPlaceHolderID="Content" runat="Server">
<ol class="breadcrumb fixed-top" >
<li class="breadcrumb-item"><a href="<%=customPath2 %>I/Main.aspx">工作台</a></li>
<li class="breadcrumb-item"><a href="<%=customPath2 %>Config/SiteOption.aspx">系统设置</a></li>
<li class="breadcrumb-item"><a href="ModelManage.aspx?ModelType=<%:ModelType %>"><asp:Label runat="server" ID="ModelType_L"></asp:Label></a></li>
<li class="breadcrumb-item"><a href="<%=ShowReturnUrl() %>">字段列表</a></li>
<li class="breadcrumb-item"><asp:Label ID="lblModel" runat="server"></asp:Label> 当前表:[<asp:Label CssClass="text-danger" ID="CurTableName_L" runat="server"></asp:Label>]</li>
<%= Call.GetHelp(64) %>
</ol>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
<table class="table table-striped table-bordered sys_table">
<tr>
	<th scope="col" class="w12rem_lg">
		<strong>字段别名 <span class="tips text-danger">*</span></strong>
	</th>
	<th scope="col">
		<asp:TextBox ID="Alias_T" runat="server" CssClass="form-control max20rem" MaxLength="20" onkeyup="mfield.getpy('Alias_T','Name_T')"/>
		<small class="text-muted">如：文章标题</small>
	</th>
</tr>
<tr>
	<th>
		<strong>字段名称 <span class="tips text-danger">*</span></strong>
	</th>
	<td>
		<asp:TextBox ID="Name_T" MaxLength="50" CssClass="form-control max20rem" runat="server" />
		<small class="text-muted">字段名由字母、数字、下划线组成，不接受空格</small>
	</td>
</tr>
<tr>
	<th>
		<strong>字段提示</strong>
	</th>
	<td>
		<asp:TextBox ID="FieldTips" CssClass="form-control max20rem" MaxLength="50" runat="server" />
		<small class="text-muted">显示在字段别名下方作为重要提示的文字</small>
	</td>
</tr>
<tr>
	<th>
		<strong>字段描述</strong>
	</th>
	<td>
		<asp:TextBox ID="Description"  CssClass="form-control m50rem_50" runat="server" TextMode="MultiLine" />
	</td>
</tr>
  <tr>
	<th><strong>是否启用</strong></th>
    <td>
        <input type="checkbox" runat="server" id="IsCopy" class="switchChk" checked="checked" />
		<small class="text-muted">如果您暂时不需要使用此字段，可设为禁用从而避免录入</small>
    </td>
</tr>
<tr>
    <th>
        <strong>后台显示</strong>
    </th>
    <td>
        <input type="checkbox" runat="server" id="IsChain" class="switchChk" checked="checked"/>
    </td>
</tr>
<tr>
	<th><strong>前台显示</strong></th>
    <td>
        <input type="checkbox" runat="server" id="IsShow" class="switchChk" checked="checked" />
		<small class="text-muted">选择“否”可作为相关隐藏识别符而不能输出在前台(仅能后台录入)</small>
    </td>
</tr>
<tr>
	<th><strong>是否必填</strong></th>
	<td><input type="checkbox" runat="server" id="IsNotNull" class="switchChk" /></td>
</tr>
<tr>
	<th>
		<strong>是否批量添加</strong>
	</th>
	<td>
		<div>
			 <input type="checkbox" runat="server" id="Islotsize" class="switchChk" />
			 <small class="text-muted">字段类型只允许文本类型</small>
		</div>
	</td>
</tr>
<tr>
	<th><strong>是否在搜索表单显示</strong></th>
	<td><input type="checkbox" runat="server" id="IsSearchForm" class="switchChk" /></td>
</tr>
<tr id="ftype_tr">
	<th>
		<strong>字段类型</strong>
	</th>
	<td id="ftype_wrap" onclick="mfield.switch();">
        <asp:Repeater runat="server" ID="Type_RPT">
            <ItemTemplate>
             <label class="ftype"><input type="radio" name="type_rad" value="<%#Eval("value") %>"/><%#Eval("name") %></label>
            </ItemTemplate>
        </asp:Repeater>
	</td>
</tr>
<!--  单行文本   -->
<tbody id="DivTextType" runat="server" class="mfield_body">
	<tr>
		<th class="w12rem_lg" scope="col"><strong>显示的宽度</strong></th>
		<td>
            <div class="input-group">
                <asp:TextBox ID="TitleSize" CssClass="form-control max20rem" runat="server" MaxLength="3">100</asp:TextBox>
                <div class="input-group-append">
                    <span class="input-group-text">%</span>
                </div>
            </div>
		</td>
	</tr>
	<tr>
		<th scope="col"><strong>是否为密码</strong></th>
		<td><input type="checkbox" runat="server" id="IsPassword" class="switchChk" /></td>
	</tr>
	<tr>
		<th><strong>默认值</strong></th>
		<td>
			<asp:TextBox ID="TextType_DefaultValue" CssClass="form-control max20rem" runat="server" Text="{nowuser}|匿名|本站作者" />
			<small class="text-muted">以|号分隔</small>
		</td>
	</tr>
    <tr><th><strong>扩展选项：</strong></th><td>
        <asp:CheckBox runat="server" ID="Text_SelVideo_Chk" Text="选择视频" />
        <asp:CheckBox runat="server" ID="Text_SelIcon_Chk" Text="zico图标" /></td></tr>
</tbody>
<!--  多行文本(不支持Html)-->
<tbody runat="server" id="DivMultipleTextType" class="mfield_body">
	<tr>
		<th><strong>显示的宽度</strong></th>
		<td>
            <div class="input-group td_m">
                <asp:TextBox ID="MultipleTextType_Width" class="form-control" runat="server" MaxLength="3" Text="100" />
                <span class="input-group-append">
                    <span class="input-group-text">%</span>
                </span>
            </div>
		</td>
	</tr>
	<tr>
		<th><strong>显示的高度</strong></th>
		<td>
            <div class="input-group td_m">
                <asp:TextBox ID="MultipleTextType_Height" class="form-control" runat="server" MaxLength="4" Text="200" />
                <span class="input-group-append">
                    <span class="input-group-text">px</span>
                </span>
            </div>
		</td>
	</tr>
    <tr><th><strong>扩展功能</strong></th>
        <td>
            <asp:CheckBox runat="server" id="MText_SelUser_Chk" Text="选择用户" />
            <asp:CheckBox runat="server" ID="MText_Down_Chk" Text="Json下载模式" />
        </td>
    </tr>
</tbody>
<!--  多行文本(支持Html)    -->
<tbody runat="server" id="DivMultipleHtmlType" class="mfield_body">
	<tr>
		<th class="w12rem_lg">
			<strong>编辑器类型</strong>
		</th>
		<td>
			<asp:DropDownList ID="IsEditor" CssClass="form-control text_md" runat="server">
				<asp:ListItem Value="1">简洁型编辑器</asp:ListItem>
				<asp:ListItem Value="4">简单型编辑器</asp:ListItem>
				<asp:ListItem Value="2">标准型编辑器</asp:ListItem>
				<asp:ListItem Value="3">增强型编辑器</asp:ListItem>
			</asp:DropDownList>
		</td>
	</tr>
    <tr><th scope="col"><strong>扩展图片</strong></th>
        <td>
            <input type="checkbox" id="Topimg_Chk" runat="server" class="switchChk" />
            <input type="text" value="Topimg" disabled="disabled" class="form-control text_md" />
			<small class="text-muted">字段名必须为TopImg,编辑界面显示为"主编辑器扩展图",只能唯一</small>
        </td>
    </tr>
	<tr>
		<th scope="col"><strong>允许Word转换</strong></th>
		<td><input type="checkbox" id="AllowWord_Chk" runat="server" checked="checked" class="switchChk" /></td>
	</tr>
	<tr>
		<th scope="col">
			<strong>显示的宽度</strong>
		</th>
		<td>
            <div class="input-group td_m">
                <asp:TextBox ID="MultipleHtmlType_Width" class="form-control" runat="server" MaxLength="3" Text="100" />
                <span class="input-group-append">
                    <span class="input-group-text">%</span>
                </span>
            </div>
		</td>
	</tr>
	<tr>
		<th>
			<strong>显示的高度</strong>
		</th>
		<td>
             <div class="input-group td_m">
                <asp:TextBox ID="MultipleHtmlType_Height" class="form-control" runat="server" MaxLength="4" Text="300" />
                <span class="input-group-append">
                    <span class="input-group-text">px</span>
                </span>
            </div>
		</td>
	</tr>
</tbody>
<!--  单选项    -->
<tbody id="DivOptionType" runat="server" class="mfield_body">
	<tr>
		<th>
			<strong>分行键入每个选项</strong>
		</th>
		<td>
              <div class="input-group" style="width:647px;">
                <input type="text" class="form-control text_md mfield_key" placeholder="选项名" />
                <input type="text" class="form-control text_md mfield_val" placeholder="选项值" />
                <span class="input-group-append">
                    <input type="button" class="btn btn-info" value="添加数据字段" onclick="mfield.addOption(this);" />
                    <input type="button" class="btn btn-primary" value="从数据字典中导入" onclick="mfield.opendic('RadioType_Content');" />
                </span>
            </div>
			<asp:TextBox ID="RadioType_Content"  runat="server" TextMode="MultiLine" class="form-control mfield_txt" Rows="6" style="margin-top:5px;width:647px;" />
		</td>
	</tr>
	<tr>
		<th>
			<strong>默认值</strong>
		</th>
		<td>
			<asp:TextBox ID="RadioType_Default" CssClass="form-control max20rem"  runat="server" />
			<span class="tips" style="color: #808000">注：没有数据录入的默认值，与前台显示无关.</span>
		</td>
	</tr>
	<tr>
		<th>
			<strong>显示选项</strong>
		</th>
		<td>
			<asp:RadioButtonList ID="RadioType_Type" runat="server" RepeatColumns="2">
				<asp:ListItem Selected="True" Value="1">单选下拉列表框</asp:ListItem>
				<asp:ListItem Value="2">单选按钮</asp:ListItem>
			</asp:RadioButtonList>
		</td>
	</tr>
	<tr>
		<th>
			<strong>是否设置属性值</strong>
		</th>
		<td>
        <input type="checkbox" id="RadioType_Property" runat="server" checked="checked" class="switchChk" />			 
		</td>
	</tr>
</tbody>
<!--  多选项    -->
<tbody runat="server" id="DivListBoxType" class="mfield_body">
	<tr>
		<th>
			<strong>分行键入每个选项</strong>
		</th>
		<td>
            <div class="input-group" style="width:647px;">
                <input type="text" class="form-control text_md mfield_key" placeholder="选项名" />
                <input type="text" class="form-control text_md mfield_val" placeholder="选项值" />
                <span class="input-group-append">
                    <input type="button" class="btn btn-info" value="添加数据字段" onclick="mfield.addOption(this);" />
                    <input type="button" class="btn btn-primary" value="从数据字典中导入" onclick="mfield.opendic('ListBoxType_Content');" />
                </span>
            </div>
			<asp:TextBox ID="ListBoxType_Content" runat="server" TextMode="MultiLine" class="form-control mfield_txt" Rows="6" style="margin-top:5px;width:647px;" />
		</td>
	</tr>
	<tr>
		<th>
			<strong>显示选项</strong>
		</th>
		<td>
			<asp:RadioButtonList ID="ListBoxType_Type" runat="server" RepeatColumns="3">
				<asp:ListItem Selected="True" Value="1">复选框</asp:ListItem>
				<asp:ListItem Value="2">多选列表框</asp:ListItem>
				<asp:ListItem Value="3">多填选项框</asp:ListItem>
			</asp:RadioButtonList>
		</td>
	</tr>
</tbody>
<!--  日期型    -->
<tbody runat="server" id="DivDateType"  class="mfield_body">
	<tr>
		<th scope="col">
			<strong>日期数据</strong>
		</th>
		<td>
			<label class="btn btn-secondary">
                <input type="radio" value="0" name="date_value_rad" checked="checked"/>默认为空
			</label>
            <label class="btn btn-secondary">
                 <input type="radio" value="1" name="date_value_rad"/>当前时间
            </label>
		</td>
	</tr>
    <tr>
        <td>时间限定</td>
        <td>
            <div class="input-group" style="width:600px;">
                <span class="input-group-prepend"><span class="input-group-text">最小日期</span></span>
                <asp:TextBox runat="server" ID="Date_SDate_T" class="form-control" onclick="WdatePicker({dateFmt:'yyyy/MM/dd'});" placeholder="为空则不限定"/>
                <span class="input-group-prepend"><span class="input-group-text">最大日期</span></span>
                <asp:TextBox runat="server" ID="Date_EDate_T" class="form-control" onclick="WdatePicker({dateFmt:'yyyy/MM/dd'});" placeholder="为空则不限定"/>
            </div>
        </td>
    </tr>
    <tr>
        <th>日期格式</th>
        <td>
            <div class="input-group" style="width:600px;">
                <asp:TextBox runat="server" ID="Date_Format_T" class="form-control" value="yyyy/MM/dd HH:mm" />
                <span class="input-group-append" id="date_format_btns">
                    <button type="button" class="btn btn-info" data-format="yyyy/MM/dd HH:mm">年月日时分</button>
                    <button type="button" class="btn btn-info" data-format="yyyy/MM/dd">年月日</button>
                    <button type="button" class="btn btn-info" data-format="yyyy/MM">年月</button>
                    <button type="button" class="btn btn-info" data-format="HH:mm:ss">时分秒</button>
                </span>
            </div>
            <script>
                $("#date_format_btns .btn").click(function () {
                    $("#Date_Format_T").val($(this).data("format"));
                });
            </script>
        </td>
    </tr>
</tbody>
<!--  图片类型    -->
<tbody runat="server" id="DivPicType" class="mfield_body">
	<tr>
		<th class="w12rem_lg" scope="col"><strong>图片是否加水印</strong></th>
		<td>
        	<input runat="server" type="checkbox" id="Pic_Water_Chk" class="switchChk" />		 
		</td>
	</tr>
	<tr>
		<th scope="col"><strong>开启选择已上传文件</strong></th>
		<td>
            <input type="checkbox" runat="server" id="Pic_SelUpFile_Chk" class="switchChk"/>
		</td>
	</tr>
    <tr><th><strong>图片是否压缩</strong></th>
        <td><input runat="server" type="checkbox" id="Pic_Compress_Chk" class="switchChk"/></td>
    </tr>
	<tr>
		<th><strong>允许上传的图片大小</strong></th>
		<td>
			<asp:TextBox ID="MaxPicSize_T" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="5" Text="1024" />
			<span class="tips">KB</span>
			<span class="tips" style="color: blue">提示：1 KB = 1024 Byte，1 MB = 1024 KB</span>
			<span class="tips" style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<th>
			<strong>允许上传的图片类型</strong>
		</th>
		<td>
			<asp:TextBox ID="PicFileExt_T" CssClass="form-control text_md" Text="jpg|png|gif|bmp|jpeg" runat="server"/>
			<span class="tips" style="color: red">*</span><span class="tips" style="color: Blue">注：允许多个类型请用“|”号分割，如：jpg|gif|bmp等等</span>
		</td>
	</tr>
</tbody>
<!--组图-->
<tbody id="DivImages" class="mfield_body">
        <tr><th><strong>图片数量</strong></th><td><asp:TextBox runat="server" ID="images_maxcount_t" class="form-control max20rem" Text="5" /><span class="rd_green">最多可上传图片数</span></td></tr>
        <tr><th><strong>上传方式</strong></th><td>
            <label><input type="radio" name="images_type_rad" value="pc" checked="checked" />PC传统样式</label>
            <label><input type="radio" name="images_type_rad" value="mobile" />微信移动样式</label>
                         </td></tr>
        <tr>
            <th><strong>是否开启水印</strong></th>
            <td>
                <input type="checkbox" id="IsWater_Images" class="switchChk" runat="server" />
            </td>
        </tr>
    </tbody>
<!--  多图片    -->
<tbody runat="server" id="DivMultiPicType" class="mfield_body">
	<tr>
		<th class="w12rem_lg"><strong>缩略图选项</strong></th>
		<td>
			<span class="tips" style="float: left; margin-left: 0;">
				<asp:CheckBox ID="ChkThumb" runat="server" Text="是否保存缩略图地址" />保存缩略图地址字段：</span>
			<asp:TextBox ID="TxtThumb" CssClass="form-control text_md" runat="server" />
			<span style="color: Red; display: none;">保存缩略图地址字段名不能与主字段名重复！</span>
		</td>
	</tr>
	<tr>
		<th><strong>图片是否加水印</strong></th>
		<td>
        <input type="checkbox" id="RBLWaterMark" runat="server" checked="checked" class="switchChk" />			 
		</td>
	</tr>
	<tr>
		<th><strong>允许上传的图片大小</strong></th>
		<td>
			<asp:TextBox ID="TxtPicSize" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="5" Text="1024" />
			<span class="tips">KB</span>
			<span class="tips" style="color: blue">提示：1 KB = 1024 Byte，1 MB = 1024 KB</span>
			<span class="tips" style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<th><strong>允许上传的图片类型</strong></th>
		<td>
			<asp:TextBox ID="TextImageType" CssClass="form-control pull-left" Text="jpg|png|gif|bmp|jpeg" Style="max-width: 200px;" runat="server" Columns="30" />
			<span class="tips" style="color: red">*</span><span class="tips" style="color: Blue">注：允许多个类型请用“|”号分割，如：jpg|gif|bmp等等</span>
		</td>
	</tr>
</tbody>
<!--  图片入库    -->
<tbody runat="server" id="DivSqlType" class="mfield_body">
	<tr>
		<th class="w12rem_lg"><strong>允许上传的图片大小</strong></th>
		<td>
			<asp:TextBox ID="TxtMaxPicSize" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="5" Text="1024" />
			<span class="tips">KB</span>
			<span class="tips" style="color: blue">提示：仅支持2005及更高SQL Server版本</span>
			<span class="tips" style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<th><strong>允许上传的图片类型</strong></th>
		<td>
			<asp:TextBox ID="TxtPicSqlType" CssClass="form-control pull-left" Style="max-width: 200px;" Text="jpg|png|gif|bmp|jpeg" runat="server" Columns="30" />
			<span class="tips" style="color: red">*</span><span class="tips" style="color: Blue">注：允许多个类型请用“|”号分割，如：jpg|gif|bmp等等</span>
		</td>
	</tr>
</tbody>
<!--  文件入库    -->
<tbody runat="server" id="DivSqlFile" class="mfield_body">
	<tr>
		<th class="w12rem_lg"><strong>允许上传的文件大小</strong></th>
		<td>
			<asp:TextBox ID="TxtMSqlFileSize" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="5" Text="1024" />
			<span class="tips">KB</span>
			<span class="tips" style="color: blue">提示：仅支持2005及更高SQL Server版本</span>
			<span class="tips" style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<th>
			<strong>允许上传的文件类型</strong>
		</th>
		<td>
			<asp:TextBox ID="TxtSqlFiletext" CssClass="form-control pull-left" Style="max-width: 200px;" Text="rar|zip|docx|pdf" runat="server" Columns="30" />
			<span class="tips" style="color: red">*</span><span class="tips" style="color: Blue">注：允许多个类型请用“|”号分割，如：rar|zip|doc|docx等等</span>
		</td>
	</tr>
</tbody>
<!--  文件类型    -->
<tbody runat="server" id="DivSmallFileType" class="mfield_body">
	<tr>
		<th class="w12rem_lg"><strong>允许上传的文件大小</strong></th>
		<td>
			<asp:TextBox ID="TxtMaxFileSizes" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="5" Text="1024" />
			<span class="tips">KB</span>
			<span class="tips" style="color: blue">提示：1 KB = 1024 Byte，1 MB = 1024 KB</span>
			<span class="tips" style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<th>
			<strong>开启选择已上传文件</strong>
		</th>
		<td>
            <input id="rblSelUploadFile" type="checkbox" class="switchChk" runat="server" />
		</td>
	</tr>
	<tr>
		<th>
			<strong>允许上传的文件类型</strong>
		</th>
		<td>
			<asp:TextBox ID="TxtUploadFileTypes" CssClass="form-control pull-left" Style="max-width: 200px;" Text="rar|zip|docx|pdf" runat="server" Columns="30" />
			<span class="tips" style="color: red">*</span><span class="tips" style="color: Blue">注：允许多个类型请用“|”号分割，如：rar|jpg|gif|bmp等等</span>
		</td>
	</tr>
    <tr>
        <th>
            <strong>大文件上传</strong>
        </th>
        <td>
            <input id="isBigFile" type="checkbox" class="switchChk" runat="server" />
        </td>
    </tr>
</tbody>
<!--  下拉文件类型    -->
<tbody runat="server" id="DivPullFileType" class="mfield_body">
	<tr>
		<th class="w12rem_lg">
			<strong>文件路径</strong>
		</th>
		<td>
			<asp:TextBox ID="PullFileText" CssClass="form-control pull-left" Style="max-width: 200px;" runat="server" />
			<span class="tips" style="color: Blue">填写图片存储的路径如：UploadFiles/demo</span>
		</td>
	</tr>
</tbody>
<!--  多文件类型    -->
<tbody runat="server" id="DivFileType" class="mfield_body">
	<tr>
		<th class="w12rem_lg">
			<strong>保存文件大小设置</strong>
		</th>
		<td>
			<span style="float: left; line-height: 32px;">
				<asp:CheckBox ID="ChkFileSize" runat="server" Text="是否保存文件大小" Checked="false" /><strong style="margin-left: 5px;">保存文件大小字段名：</strong></span>
			<asp:TextBox ID="TxtFileSizeField" CssClass="form-control pull-left" Style="max-width: 200px;" runat="server" Columns="20" />
			<span style="color: Red; display: none;">注：字段名由字母、数字、下划线组成，并且仅能字母开头，不以下划线结尾。不能与已有字段名重复</span>
		</td>
	</tr>
</tbody>
<!--  单选 多选    -->
<tbody runat="server" id="DivOperatingType" class="mfield_body">
	<tr>
		<th class="w12rem_lg">
			<strong>分行键入</strong><br />
			每个平台选项
		</th>
		<td>
			<asp:TextBox ID="TxtOperatingOption" CssClass="form-control pull-left" runat="server" TextMode="MultiLine" Style="max-width: 300px;" Columns="40" Rows="6" />
			<span style="color: red">*</span> <span style="color: blue">注：一行一个默认项</span>
		</td>
	</tr>
	<tr>
		<th>
			<strong>文本框长度</strong>
		</th>
		<td>
			<asp:TextBox ID="OperatingType_TitleSize" CssClass="form-control pull-left" runat="server" Style="max-width: 80px;" Columns="10" MaxLength="4">35</asp:TextBox>
			<span class="tips">px</span>
		</td>
	</tr>
	<tr>
		<th>
			<strong>默认值</strong>
		</th>
		<td>
			<asp:TextBox ID="OperatingType_DefaultValue" Text="Win2000|XP|Win2003" Style="max-width: 200px;" CssClass="form-control pull-left" runat="server" Columns="30" />
			<span class="tips" style="color: green">例：Win2000|XP|Win2003</span>
		</td>
	</tr>
</tbody>
<!--  超链接    -->
<tbody runat="server" id="DivSuperLinkType" class="mfield_body">
	<tr>
		<th class="w12rem_lg">
			<strong>文本框长度</strong>
		</th>
		<td>
			<asp:TextBox ID="SuperLinkType_TitleSize" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="10" MaxLength="4">50</asp:TextBox>
			<span class="tips">px</span>
		</td>
	</tr>
	<tr>
		<th>
			<strong>默认值</strong>
		</th>
		<td>
			<asp:TextBox ID="SuperLinkType_DefaultValue" runat="server" Columns="30" Style="max-width: 200px;" CssClass="form-control pull-left" />
			<span class="tips" style="color: green">例：http://127.0.0.1/</span>
		</td>
	</tr>
</tbody>
<!--  多级选项    -->
<tbody runat="server" id="DivGradeOptionType" class="mfield_body">
	<tr>
		<th class="w12rem_lg">
			<strong>选择分级数据分类</strong>
		</th>
		<td>
			<asp:DropDownList ID="GradeOptionType_Cate" CssClass="form-control" runat="server" Style="max-width: 200px;"></asp:DropDownList>
		</td>
	</tr>
	<tr>
		<th>
			<strong>选项下拉框排列格式化</strong>
		</th>
		<td>
			<asp:RadioButtonList ID="GradeOptionType_Direction" runat="server" RepeatDirection="Horizontal">
				<asp:ListItem Value="0" Selected="True">一行横排</asp:ListItem>
				<asp:ListItem Value="1">多行竖排</asp:ListItem>
			</asp:RadioButtonList>
		</td>
	</tr>
</tbody>
<!--  数字类型    -->
<tbody runat="server" id="DivNumType" class="mfield_body">
	<tr>
		<th class="w12rem_lg">
			<strong>文本框长度</strong>
		</th>
		<td>
			<asp:TextBox ID="NumberType_TitleSize" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="10" MaxLength="4">35</asp:TextBox>
			<span class="tips">px</span>
		</td>
	</tr>
	<tr>
		<th>
			<strong>数字类型</strong>
		</th>
		<td>
			<asp:RadioButtonList ID="NumberType_Style" runat="server" RepeatDirection="Horizontal">
				<asp:ListItem Selected="True" Value="1">整数</asp:ListItem>
				<asp:ListItem Value="2">小数</asp:ListItem>
			</asp:RadioButtonList>
		</td>
	</tr>
	<tr id="showdec">
		<th>
			<strong>小数位</strong>
		</th>
		<td>
			<asp:TextBox ID="txtdecimal" CssClass="form-control text_md" runat="server" Text="2" />
		</td>
	</tr>
	<tr>
		<th>
			<strong>默认值</strong>
		</th>
		<td>
			<asp:TextBox ID="NumberType_DefaultValue" CssClass="form-control text_md" runat="server" Columns="10" />
		</td>
	</tr>
</tbody>
<!-- 双时间字段 -->
<tbody id="DivDoubleDateType" runat="server" class="mfield_body"></tbody>
<tbody id="DivColorType" runat="server" class="mfield_body">
	<tr>
		<th class="w12rem_lg">
			<strong>默认颜色值</strong>
		</th>
		<td>
			<asp:TextBox ID="ColorDefault" class="form-control text_md" runat="server" Text="#ffffff"/>
            <script>
                $(function () {
                    $("#ColorDefault").ColorPickerSliders({ hsvpanel: true, sliders: true, placement: 'auto', color: $(this).val(), previewformat: "rgb", });
                })
            </script>
		</td>
	</tr>
</tbody>
<!--Office转换为falsh-->
<tbody runat="server" id="DivUpload" class="mfield_body">
	<tr>
		<th class="w12rem_lg">
			<strong>允许上传的文件大小</strong>
		</th>
		<td>
			<asp:TextBox ID="TextBox2" CssClass="form-control pull-left" runat="server" Style="max-width: 80px;" Columns="5">1024</asp:TextBox>
			<span class="tips">KB</span>
			<span class="tips" style="color: blue">提示：1 KB = 1024 Byte，1 MB = 1024 KB</span>
			<span class="tips" style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<th>
			<strong>允许上传的文件类型</strong>
		</th>
		<td>
			<asp:TextBox ID="TextBox3" CssClass="form-control pull-left" Style="max-width: 200px;" Text="doc|docx|txt|pdf|xls|xlsx" runat="server" Columns="30" />
			<span class="tips" style="color: red">*</span><span class="tips" style="color: Blue">注：允许多个类型请用“|”号分割，如：doc|xls|pdf等等</span>
		</td>
	</tr>
</tbody>
<!--地图字段-->
<tbody runat="server" id="DivMapType" class="mfield_body">
    <tr>
        <th><strong>地图来源</strong></th>
        <td>
            <asp:DropDownList ID="MapSource_DP" runat="server" CssClass="form-control max20rem">
                <asp:ListItem Value="baidu">百度地图</asp:ListItem>
                <asp:ListItem Value="google">Google地图</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
      <tr>
        <th class="w12rem_lg"><strong>地图类型</strong></th>
        <td>
            <asp:RadioButtonList runat="server" ID="MapType_Rad" RepeatDirection="Horizontal">
                <asp:ListItem Value="simp" Selected="True">简单</asp:ListItem>
                <asp:ListItem Value="full">完全(支持多标记,自定义标记,Html内容)</asp:ListItem>
            </asp:RadioButtonList>
        </td>
    </tr>
</tbody>
<!--智能多文件上传-->
<tbody runat="server" id="DivSwfFileUpload" class="mfield_body">
	<tr>
		<th class="w12rem_lg">
			<strong>允许上传的文件大小</strong>
		</th>
		<td>
			<asp:TextBox ID="TxtMaxFileSize1" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="5">1024</asp:TextBox>
			<span class="tips">KB</span>
			<span class="tips" style="color: blue">提示：1 KB = 1024 Byte，1 MB = 1024 KB</span>
			<span class="tips" style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<th class="w12rem_lg">
			<strong>允许上传的文件类型</strong>
		</th>
		<td>
			<asp:TextBox ID="TxtUploadFileType1" CssClass="form-control pull-left" Style="max-width: 200px;" Text="rar|jpg|gif|bmp" runat="server" Columns="30" />
			<span class="tips" style="color: red">*</span>
			<span class="tips" style="color: Blue">注：允许多个类型请用"|"号分割，如：rar|jpg|gif|bmp 等等</span>
		</td>
	</tr>
</tbody>
<!--远程文件-->
<tbody runat="server" id="DivRemoteFile" class="mfield_body">
	<tr>
		<th class="w12rem_lg">
			<strong>允许上传的文件大小</strong>
		</th>
		<td>
			<asp:TextBox ID="TxtMaxFileSize2" CssClass="form-control pull-left" Style="max-width: 80px;" runat="server" Columns="5">1024</asp:TextBox>
			<span class="tips">KB</span>
			<span class="tips" style="color: blue">提示：1 KB = 1024 Byte，1 MB = 1024 KB</span>
			<span class="tips" style="color: red">*</span>
		</td>
	</tr>
	<tr>
		<th>
			<strong>允许上传的文件类型</strong>
		</th>
		<td>
			<asp:TextBox ID="TxtUploadFileType2" CssClass="form-control text_md" Text="rar|jpg|gif|bmp" runat="server" />
			<span class="tips" style="color: red">*</span>
			<span class="tips" style="color: Blue">注：允许多个类型请用"|"号分割，如：rar|jpg|gif|bmp 等等</span>
		</td>
	</tr>
	<tr>
		<th>
			<strong>FTP服务器名</strong>
		</th>
		<td>
			<asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control text_md">
			</asp:DropDownList>
		</td>
	</tr>
</tbody>
<!--  手机短信    -->
<tbody id="DivMobileSMS" class="mfield_body">
</tbody>
<tbody id="DivTableField" class="mfield_body"><!--库选字段-->
	<tr>
        <th class="w12rem_lg"><strong>库选类型</strong></th>
        <td>
            <asp:RadioButtonList ID="TableFieldType_Drop" RepeatDirection="Horizontal" runat="server">
                <asp:ListItem Text="单选模式" Value="1" Selected="True"></asp:ListItem>
                <asp:ListItem Text="多选模式" Value="2"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
	</tr>
    <tr>
		<th>
			<strong>字段值(Text)</strong>
		</th>
		<td>
			<asp:TextBox ID="TableField_Text" class="form-control" runat="server" /><span style="line-height: 30px;"> *示例：ZL_User.UserName，出现在下拉列表中值。</span>
		</td>
	</tr>
	<tr>
		<th>
			<strong>实际入库值(Value)</strong>
		</th>
		<td>
			<asp:TextBox ID="TableField_Value" class="form-control" runat="server" /><span style="line-height: 30px;">示例：ZL_User.UserID，用于实际的Value存值使用，如为空则存入上方字段值。</span>
		</td>
	</tr>
	<tr>
		<th>
			<strong>筛选条件</strong>
		</th>
		<td>
			<asp:TextBox ID="Where_Text" class="form-control" runat="server" /> <span style="line-height: 30px;"> T-Sql条件筛选如：UserID<10 （支持多条件查询）</span>
		</td>
	</tr>
</tbody>
<tbody id="DivRandom" class="mfield_body"><!--随机数字段-->
	<tr>
		<th class="w12rem_lg"><strong>类型</strong></th>
		<td>
            <asp:RadioButtonList runat="server" ID="Random_Type_Rad" RepeatDirection="Horizontal">
                <asp:ListItem Value="2" Selected="True">仅数字</asp:ListItem>
                <asp:ListItem Value="3">仅英文</asp:ListItem>
                <asp:ListItem Value="1">英文数字</asp:ListItem>
            </asp:RadioButtonList>
		</td>
	</tr>
    <tr>
		<td><strong>长度</strong></td>
		<td><asp:TextBox ID="Random_Len_T" class="form-control t_min" runat="server" Text="6" /></td>
    </tr>
</tbody>
<!--拍照字段-->
<tbody id="DivCameraType" runat="server" class="mfield_body">
    <tr>
        <th class="w12rem_lg"><strong>拍照大小</strong></th>
        <td>宽度:<asp:TextBox ID="CameraWidth_T" Text="120" runat="server" CssClass="form-control text_s" />px 高度:<asp:TextBox ID="CameraHeight_T" Text="120" runat="server" CssClass="form-control text_s" />px</td>
    </tr>
    <tr>
        <th><strong>照片大小</strong></th>
        <td>宽度:<asp:TextBox ID="CameraImgWidth_T" Text="100"  CssClass="form-control text_s" runat="server" />px 高度:<asp:TextBox ID="CameraImgHeight_T" Text="100" runat="server" CssClass="form-control text_s" />px</td>
        <td></td>
    </tr>
</tbody>
<!--压缩传入-->
<tbody runat="server" id="Divautothumb" class="mfield_body">
    <tr><td class="w12rem_lg">宽高属性</td>
     <td>
       <div class="input-group" style="width:280px;">
           <span class="input-group-addon">宽</span>
           <asp:TextBox runat="server" ID="autothumb_width_t"  class="form-control text_x" value="300"/>
           <span class="input-group-addon">高</span>
           <asp:TextBox runat="server" ID="autothumb_height_t" class="form-control text_x" value="100" />
           <span class="input-group-addon">PX</span>
       </div>
       <div class="rd_green">自动压缩图片为指定宽高,为0则不压缩</div>
     </td></tr>
</tbody>
<tr>
	<td></td><td>
		<asp:Button runat="server" ID="Save_Btn" Text="添加字段" class="btn btn-info" OnClientClick="return mfield.check()" OnClick="Save_Btn_Click" />
        <asp:Button runat="server" ID="SaveSys_Btn" Text="保存信息" class="btn btn-info" OnClick="SaveSys_Btn_Click" Visible="false"/>
        <a href="<%=ShowReturnUrl() %>" ID="Return_Btn" class="btn btn-outline-info">返回列表</a>
	</td>
</tr>
</table>
</div></div>
<asp:HiddenField runat="server" ID="Sys_type" Value="0" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/dist/js/bootstrap-switch.js"></script>
<script src="/JS/chinese.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/SelectCheckBox.js"></script>
<script src="/JS/DatePicker/WdatePicker.js"></script>
<script>
    var mfield = {};
    mfield.getpy = function (ontxt, id) {
        var $source = $("#" + ontxt);
        var $target = $("#" + id);
        if (!document.getElementById(id).disabled) {
            var str = $source.val().replace(/ /ig, "");
            if (str == "") { $target.val(""); return; }
            var strpy = makePy(str).toString().toLowerCase();
            if (strpy.indexOf(",") > -1) { strpy = strpy.split(',')[0]; }
            $target.val(strpy);
        }
    }
    //SelectModelType
    mfield.switch = function () {
        var $rad = $("input[name=type_rad]:checked");
        if ($rad.length < 1) { return; }
        $(".mfield_body").hide();
        $("#Div" + $rad[0].value).show();
    }
    mfield.init = function () {
        var fieldId = parseInt("<%:FieldID%>");
        //系统字段不可修改类型
        if ($("#Sys_type").val() == "1") {
            $("#ftype_tr").hide();
            $(".mfield_body").hide();
        }
        else {
            if (fieldId == 0) { SetRadVal("type_rad", "TextType"); }
            mfield.switch();
        }
    }
    //字段填写的值是否规范
    mfield.check = function () {
        $alias = $("#Alias_T");
        $name = $("#Name_T");
        if (ZL_Regex.isEmpty($alias.val())) { alert("字段别名不能为空"); $alias.focus(); return false; }
        if (ZL_Regex.isEmpty($name.val())) { alert("字段名称不能为空"); $name.focus(); return false; }
        var patt = /^[a-zA-Z0-9_\-]+$/
        if (!patt.test($name.val())) { alert('字段名称只能由字母、下划线或数字组成！'); $name.focus(); return false; }
        return true;
    }
    //------------------------------用于多选字段等
    mfield.addFromDic = function (id, val) {
        $txt = $("#" + id);
        var valArr = val.split('\n');
        var options = "";
        for (var i = 0; i < valArr.length; i++) {
            options += (valArr[i] + "|" + valArr[i]) + "\n";
        }
        mfield.addToTxt($txt, options);
    }
    mfield.addOption = function (btn) {
        var $div = $(btn).closest(".mfield_body");
        var $key = $div.find(".mfield_key");
        var $val = $div.find(".mfield_val");
        var $txt = $div.find(".mfield_txt");
        if (ZL_Regex.isEmpty($key.val())) { alert("选项名不能为空"); }
        else if (ZL_Regex.isEmpty($val.val())) { alert("选项值不能为空"); }
        else
        {
            mfield.addToTxt($txt, ($key.val() + "|" + $val.val()));
            $key.val(""); $val.val("");
        }
    }
    mfield.opendic = function (id) {
        window.open('../../Addon/SelectDictionary.aspx?ControlId=' + id + '', 'newWin', 'modal=yes,width=700,height=500,resizable=no,scrollbars=yes')
    }
    //添加选项入textbox,并保证格式准确
    mfield.addToTxt = function ($txt, option) {
        var text = $txt.val();
        if (ZL_Regex.isEmpty(option)) { return; }
        option = option.replace(/ /g, "");//选项不允许空格
        if (text.lastIndexOf("\n") != (text.length - 1)) { option = "\n" + option; }
        $txt.val(text + option);
    }
    $(function () { mfield.init(); })
</script>
</asp:Content>
