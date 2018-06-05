<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PubInfo.aspx.cs" Inherits="ZoomLaCMS.Manage.Pub.PubInfo" MasterPageFile="~/Manage/I/Index.master"%>
<%@ Register Src="~/Manage/I/ASCX/TlpDP.ascx" TagPrefix="ZL" TagName="TlpDown" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
    <script src="/dist/js/bootstrap-switch.js"></script>
    <script src="/JS/DatePicker/WdatePicker.js"></script>
    <script src="/JS/chinese.js"></script>
    <script src="/JS/SelectCheckBox.js"></script>
    <title>互动模块配置</title>
	<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/Content/ContentManage.aspx","内容管理"),
	new Bread("PubManage.aspx","互动模块"),
	new Bread() {url="", text="添加互动",addon="" }}
	)
	%>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive">
    <table id="table" class="table table-bordered sys_table">
        <tr runat="server" id="PubNames">
            <th class="w12rem_lg">
                <strong>互动模块名称 <font class="text-danger">*</font></strong>
            </th>
            <td>
                <asp:TextBox ID="PubName" runat="server" CssClass="form-control max20rem" onchange="checkmodelname(this)"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PubName" ErrorMessage="互动模块名称不能为空!" Display="Dynamic"/>
            </td>
        </tr>
        <tr runat="server" id="Tr1">
            <th>
                <strong>模型表名 <span class="text-danger">*</span></strong>
            </th>
            <td>
                <div class="input-group" style="width:500px;">
                    <span class="input-group-prepend"><span class="input-group-text">ZL_Pub_</span></span>
                    <asp:TextBox ID="PubTableName" onchange="checkmodelname(this)" runat="server" class="form-control" />
                    <asp:DropDownList ID="ModelList_DP" DataTextField="PubTableName" DataValueField="PubTableName" onchange="setmodelname(this)" runat="server" CssClass="form-control max20rem"></asp:DropDownList>
                </div>
                <span id="modelname_span"></span>
                <asp:RequiredFieldValidator ID="R1" runat="server" ControlToValidate="PubTableName" ErrorMessage="模型名称不能为空!" Display="Dynamic"/>
            </td>
        </tr>
        <tr runat="server" id="PubClasss">
            <th>
                <strong>信息类别</strong>
            </th>
            <td>
                <asp:RadioButtonList ID="PubClass" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="6">首页</asp:ListItem>
                    <asp:ListItem Value="5">节点</asp:ListItem>
                    <asp:ListItem Selected="True" Value="0">内容</asp:ListItem>
                    <asp:ListItem Value="1">商城</asp:ListItem>
                    <asp:ListItem Value="2">黄页</asp:ListItem>
                    <asp:ListItem Value="3">店铺</asp:ListItem>
                    <asp:ListItem Value="4">会员</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr id="PubTypes" runat="server">
            <th>
                <strong>互动类型</strong>
                <div class="text-danger" style="font-weight:normal;">(不可修改)</div>
            </th>
            <td>
                <asp:RadioButtonList ID="PubType" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="0">评论</asp:ListItem>
                    <asp:ListItem Value="1">投票</asp:ListItem>
                    <asp:ListItem Value="2">活动</asp:ListItem>
                    <asp:ListItem Value="3">留言</asp:ListItem>
                    <asp:ListItem Value="4">问券调查</asp:ListItem>
                    <asp:ListItem Value="5">统计</asp:ListItem>
                    <asp:ListItem Value="6">竞标</asp:ListItem>
                    <asp:ListItem Value="7">评星</asp:ListItem>
                    <asp:ListItem Value="8">表单</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr id="starOPTr" runat="server" style="display:none;">
            <th>
                <strong>选项</strong>
            </th>
            <td>
                <asp:TextBox runat="server" ID="starOPT" Text="包装满意度,送货满意度,配送满意度" Width="600" />
            </td>
        </tr>
        <tr id="Tr2" runat="server">
            <th >
                <strong>前台权限</strong>
            </th>
            <td>
                <label><asp:CheckBox ID="CheckBox1" runat="server" onclick="checkAll(this)" /> 可查看</label>
                <label><asp:CheckBox ID="CheckBox2" runat="server" onclick="check(this)" /> 可修改</label>
                <label><asp:CheckBox ID="CheckBox3" runat="server" onclick="check(this)" /> 可删除</label>
                <label><asp:CheckBox ID="CheckBox4" runat="server" onclick="check(this)" /> 可审核</label>
            </td>
        </tr>
        <tr>
            <th>
                <strong>提交完毕跳转地址</strong>
            </th>
            <td>
                <span>
                    <asp:TextBox ID="PubGourl" runat="server" CssClass="form-control max20rem"></asp:TextBox>
                    <small class="text-muted">为空则默认跳转</small>
                </span>
            </td>
        </tr>
        <tr>
            <th>
                <strong>保留天数信息</strong>
            </th>
            <td>
				<div class="input-group max20rem">
					<asp:TextBox ID="Pubkeep" runat="server" Text="99999" class="form-control" />
				  	<div class="input-group-append">
					<span class="input-group-text">天</span>
				  	</div>
				</div>
            </td>
        </tr>
        <tr id="PubTemplates">
            <th>
                <strong>互动模板地址</strong><br />
				<small class="text-muted">添加时如果为空则自动创建</small>
            </th>
            <td>
                <%=PageCommon.GetTlpDP("PubTemplate") %>
                <asp:HiddenField ID="PubTemplate_hid" runat="server" />
            </td>
        </tr>
        <tr id="PubLoadstrs">
            <th>
                <strong>自定义调用互动标签</strong>
            </th>
            <td>
                <div class="input-group mb-3 max20rem">
                    <span class="input-group-prepend"><span class="input-group-text">{Pub.Load_</span></span>
                    <asp:TextBox ID="PubLoadstr" class="form-control" runat="server" AutoPostBack="True" OnTextChanged="PubLoadstr_TextChanged" />
                    <span class="input-group-append"><span class="input-group-text">/}</span></span>
                </div>
                <asp:Label ID="Label4" runat="server" CssClass="rd_red"></asp:Label>
            </td>
        </tr>
        <tr>
            <th>
                <strong>是否公开</strong>
            </th>
            <td>
                <input type="checkbox" runat="server" id="RaPublic" class="switchChk" checked="checked" />
            </td>
        </tr>
        <tr id="PubOpenComments">
            <th>
                <strong>是否开启前台管理</strong>
            </th>
            <td>
                <input type="checkbox" runat="server" id="PubOpenComment" class="switchChk" />
            </td>
        </tr>
        <tr id="PubShowTypes" style="display: none">
            <th>
                <strong>生成投票显示</strong>
            </th>
            <td>
                <asp:RadioButtonList ID="PubShowType" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="0">无</asp:ListItem>
                    <asp:ListItem Value="1">柱状</asp:ListItem>
                    <asp:ListItem Value="2">圆形</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr id="PubInputTMs" runat="server">
            <th>
                <strong>自定义信息提交模板</strong>
            </th>
            <td>
                <%=PageCommon.GetTlpDP("PubInputTM") %>
                <asp:HiddenField ID="PubInputTM_hid" runat="server" />
            </td>
        </tr>
        <tr id="PubInputLoadStrs" runat="server">
            <th>
                <strong>调用信息提交标签</strong>
            </th>
            <td>
                <div class="input-group max20rem" >
                    <span class="input-group-prepend"><span class="input-group-text">{Pub.</span></span>
                    <asp:TextBox ID="PubInputLoadStr" class="form-control" runat="server" AutoPostBack="True" OnTextChanged="PubInputLoadStr_TextChanged" />
                    <span class="input-group-append"><span class="input-group-text">/}</span></span>
                </div>
				<small class="text-muted">设置标签或模板中调用的标签</small>
				<asp:Label ID="Label3" runat="server" class="rd_red"></asp:Label>
            </td>
        </tr>
        <tr id="PubIsTrues">
            <th>
                <strong>是否需要审核</strong>
            </th>
            <td>
                <input type="checkbox" runat="server" id="PubIsTrue" class="switchChk" />
            </td>
        </tr>
        <tr>
            <th>
                <strong>结束时间</strong>
            </th>
            <td>
                <asp:TextBox ID="PubEndTime" runat="server" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' });" CssClass="form-control max20rem"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" ControlToValidate="PubEndTime" ErrorMessage="结束时间必须是日期!" ValidationExpression="^(\d{4}[\-]?\d{1,2}[\-]?\d{1,2})?([ ]?)(\d{1,2}[:]?\d{1,2}[:]?\d{1,2})?$" SetFocusOnError="True" Display="Dynamic" />
                <small class="text-muted">不限制请不要填写</small>
            </td>
        </tr>
        <tr>
            <th>
                <strong>互动描述</strong>
            </th>
            <td>
                <asp:TextBox ID="Pubinfo" runat="server" CssClass="form-control max20rem" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr><td colspan="2" class="text-center" style="background-color:#ddd;"><strong>投票限制</strong></td></tr>
        <tr>
            <th><strong>身份校验</strong></th>
            <td>
                <label><input type="checkbox" name="verify_chk" value="ip" checked="checked"/>IP校验</label>
                <label><input type="checkbox" name="verify_chk" value="cookie" checked="checked"/>Cookie校验</label>
                <label><input type="checkbox" name="verify_chk" value="user"/>用户校验(需开启用户登录检测)</label>
            </td>
        </tr>
        <tr><th><strong>用户可提交次数</strong></th>
            <td>
                <asp:TextBox ID="PubIPOneOrMore" runat="server" class="form-control max20rem" Text="0" />
                <small>同一身份用户,最多可投几次票,0为不限制</small>
            </td>
        </tr>
        <%--<tr id="PubOneOrMores">
            <th>
                <strong>用户重复提交次数</strong>
            </th>
            <td>
                <span>
                    <asp:RadioButtonList ID="PubOneOrMore" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="0">无限制</asp:ListItem>
                        <asp:ListItem Value="1">每人限一次</asp:ListItem>
                        <asp:ListItem Value="3">每篇文章限一次</asp:ListItem>
                        <asp:ListItem Value="2">自定义</asp:ListItem>
                    </asp:RadioButtonList>
                </span>
                <span>
                    <asp:TextBox ID="PubOneOrMorenum" style="display:none;" runat="server" Width="69px" CssClass="form-control">0</asp:TextBox>
                </span>
            </td>
        </tr>--%>
     <%--   <tr id="PubIPOneOrMores">
            <th>
                <strong>重复IP提交次数</strong>
            </th>
            <td>
                <span>
                    <asp:RadioButtonList ID="PubIPOneOrMore" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="0">无限制</asp:ListItem>
                        <asp:ListItem Value="1">每IP只限一次</asp:ListItem>
                        <asp:ListItem Value="2">自定义</asp:ListItem>
                    </asp:RadioButtonList>
                </span>
                <span>
                    <asp:TextBox ID="PubIPOneOrMorenum" runat="server" Visible="False" Width="69px" CssClass="form-control pull-left">0</asp:TextBox>
                </span>
            </td>
        </tr>--%>
   <%--     <tr>
            <th>
                <strong>cookie验证</strong>
            </th>
            <td>
                <input type="checkbox" runat="server" id="pubflag" class="switchChk" />
            </td>
        </tr>--%>
        <tr>
            <th><strong>隔多久可重复提交</strong></th>
            <td>
				<div class="input-group max20rem">
                    <asp:TextBox runat="server" class="form-control" ID="Interval_T" Text="0" />
                    <div class="input-group-append">
                        <span class="input-group-text">秒</span>
                    </div>
				</div>
		</td>
        </tr>
        <tr id="DivPuberrmsg">
            <th>
                <strong>达到提交次数提示</strong>
            </th>
            <td>
                <span>
                    <asp:TextBox ID="Puberrmsg" runat="server" class="form-control max20rem">该用户提交信息的数量已经达到上限!</asp:TextBox></span></td>
        </tr>
       <%-- <tr>
            <th><strong>提交时间间隔</strong></th>
            <td>
				<div class="input-group">
					<asp:TextBox ID="PubTimeSlot" runat="server" Text="10" CssClass="form-control max20rem" />
				  	<div class="input-group-append">
					<span class="input-group-text">秒</span>
				  	</div>
				</div>
            </td>
        </tr>--%>
        <tr runat="server" id="PubCodes">
            <th>
                <strong>是否需要验证码</strong>
            </th>
            <td>
                <input type="checkbox" runat="server" id="PubCode" class="switchChk" />
                <small>启用验证码,可用于防止挂机刷票</small>
            </td>
        </tr>
        <tr id="PubLogins">
            <th>
                <strong>是否需要登录</strong>
            </th>
            <td>
                <input type="checkbox" runat="server" id="PubLogin" class="switchChk" />
            </td>
        </tr>
        <tr>
            <td class="text-center" colspan="2">
                <div id="save">
                    <div>
                        <asp:Button ID="Submit_B" runat="server" Text="提交" OnClick="Submit_B_Click" CssClass="btn btn-info" />
                        <a href="pubmanage.aspx" class="btn btn-outline-info">返回</a>
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" class="C_input" />
                    </div>
                </div>
            </td>
        </tr>
    </table> 
    <div style="height:30px;"></div>
	</div></div>
    <ZL:TlpDown runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">    
<script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script>
        $().ready(function () {
            Tlp_initTemp();
            EventTypeChange();
            initPubType($("#PubType input:checked").val());
        });
        function initPubType(value) {
            switch (value) {
                case "1":
                    $("#PubShowTypes").show();
                    break;
                case "5":
                    $("#PubOpenComments").hide();
                    $("#PubOneOrMores").show();
                    $("#PubIsTrues").show();
                    $("#PubCodes").hide();
                    $("#PubLogins").hide();
                    break;
                case "7":
                    $("#starOPTr").show();
                    break;
                default:
                    $("#PubShowTypes").hide();
                    $("#PubOpenComments").show();
                    $("#PubOneOrMores").show();
                    $("#PubIsTrues").show();
                    $("#PubCodes").show();
                    $("#PubLogins").show();
                    $("#starOPTr").hide();
                    break;
            }
        }
        //绑定互动类型选择事件
        function EventTypeChange() {
            $("#PubType input").change(function () {
                var value = $(this).val();
                initPubType(value);
            });
            $("#PubOneOrMore input").change(function () {
                initPubOne($(this).val());
            });
        }
        function checkmodelname(obj) {
            //modelname_span
            //PubName
            if ($(obj).val() == "")
                return;
            $.post("PubInfo.aspx", { action: 'modelname', value: $(obj).val() }, function (result) {
                $("#modelname_span").html(result);
            })
        }
        function setmodelname(obj) {
            //PubTableName
            $("#PubTableName").val($(obj).find("option:checked").val().replace("ZL_Pub_",""));
        }
        function check(obj) {
            chkArr1 = $(obj).parent().find(":checkbox[name=CheckBox1]");
            chkArr2 = $(obj).parent().find(":checkbox[name=CheckBox2]");
            chkArr3 = $(obj).parent().find(":checkbox[name=CheckBox3]");
            chkArr4 = $(obj).parent().find(":checkbox[name=CheckBox4]");
            if (!chkArr2[0].checked && !chkArr3[0].checked && !chkArr4[0].checked) {
                chkArr1[0].checked = false;
            }
            else {
                chkArr1[0].checked = true;
            }
        }
        function checkAll(obj) {
            chkArr2 = $(obj).parent().find(":checkbox[name=CheckBox2]");
            chkArr3 = $(obj).parent().find(":checkbox[name=CheckBox3]");
            chkArr4 = $(obj).parent().find(":checkbox[name=CheckBox4]");
            if (!obj.checked) {
                chkArr2[0].checked = false;
                chkArr3[0].checked = false;
                chkArr4[0].checked = false;
            }
        }
        function ShowDiag(url, title) {
            ShowComDiag(url, title);
        }
        function CloseDialog() {
            CloseComDiag();
        }
    </script>
</asp:Content>
