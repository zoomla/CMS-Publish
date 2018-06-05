<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditNode.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.EditNode" MasterPageFile="~/Manage/I/Index.master"%>
<%@ Register Src="~/Manage/I/ASCX/TlpDP.ascx" TagPrefix="ZL" TagName="TlpDP" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<link type="text/css" href="/dist/css/bootstrap-switch.min.css"  rel="stylesheet"/>
<script src="/dist/js/bootstrap-switch.js"></script>
<script src="/JS/SelectCheckBox.js"></script>
<title><asp:Literal runat="server" ID="Title_T"></asp:Literal> </title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("","系统设置"),
	new Bread("NodeManage.aspx","节点管理"),
	new Bread() {url=Request.RawUrl, text=Title_T.Text,addon="" }},
	Call.GetHelp(103)+"<div class='breadcrumb_addIco'><a href='" + Request.RawUrl + "' title='刷新'><i class='zi zi_redoalt'></i></a></div>"
	)
%>
	
<div class="container-fluid pr-0">
<div class="row sysRow">
<ul class="nav nav-tabs list_choice">
    <li class="nav-item"><a class="nav-link active" href="#Tabs0" data-toggle="tab">基本信息</a></li>
    <li class="nav-item"><a class="nav-link" href="#Tabs1" data-toggle="tab">栏目选项</a></li>
    <li class="nav-item"><a class="nav-link" href="#Tabs2" data-toggle="tab">收费设置</a></li>
    <li class="nav-item"><a class="nav-link" href="#Tabs3" data-toggle="tab">模板选项</a></li>
    <li class="nav-item"><a class="nav-link" href="#Tabs4" data-toggle="tab">生成选项</a></li>
    <li class="nav-item"><a class="nav-link" href="#Tabs6" data-toggle="tab">浏览权限</a></li>
    <li class="nav-item"><a class="nav-link" href="#Tabs7" data-toggle="tab">操作权限</a></li>
</ul>
<div class="tab-content col-12 table_box">
    <div class="co-1 tab-pane active" id="Tabs0">
        <table class="table table-striped table-bordered table-hover sys_table">
            <%-- 基本信息--%>
            <tbody>
                <tr>
                    <th class="w12rem_lg">所属栏目</th>
                    <td>
                        <asp:Label ID="LblNodeName" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <th>
                        栏目名称<span id="TxtNodeName_sp">*</span>
                    </th>
                    <td>
                        <asp:TextBox ID="TxtNodeName" CssClass="form-control m50rem_50" runat="server"/>
                        
                        <asp:RequiredFieldValidator Visible="false" ID="RequiredFieldValidator1" Display="Dynamic" runat="server" ControlToValidate="TxtNodeName" ErrorMessage="RequiredFieldValidator">栏目名不能为空</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <th>
                        栏目标识名<span id="TxtNodeDir_sp">*</span>
                    </th>
                    <td>
                        <asp:TextBox ID="TxtNodeDir" CssClass="form-control m50rem_50" MaxLength="20" runat="server"></asp:TextBox>                        
                        <small class="text-muted">目录名只能是字母、数字、下划线组成，首字符不能是数字
                        <asp:RegularExpressionValidator Visible="false" ID="RegTxtNodeDir" runat="server" ControlToValidate="TxtNodeDir" Display="Dynamic" ValidationExpression="[_a-zA-Z][_a-zA-Z0-9]*" ErrorMessage="目录名格式错误" SetFocusOnError="True" /></small>
                    </td>
                </tr>
                <tr>
                    <th>
                        栏目图片地址
                    </th>
                    <td>
                        <asp:TextBox ID="TxtNodePicUrl" class="form-control m50rem_50" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <th>
                        栏目提示
                    </th>
                    <td>
                        <asp:TextBox ID="TxtTips" class="form-control m50rem_50" runat="server"  Rows="2" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>
                        栏目说明
                    </th>
                    <td><asp:TextBox ID="TxtDescription"  class="form-control m50rem_50" runat="server"  Rows="2" TextMode="MultiLine"></asp:TextBox></td>
                </tr>
                <tr>
                    <th>栏目META关键词
                    </th>
                    <td>
                        <asp:TextBox ID="TxtMetaKeywords" class="form-control m50rem_50" runat="server" Rows="4" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>栏目META网页描述</th>
                    <td>
                        <asp:TextBox ID="TxtMetaDescription" class="form-control m50rem_50" runat="server" Rows="4" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                <th>创建人</th>
                <td><asp:TextBox ID="CUser_T" runat="server" CssClass="form-control max20rem"></asp:TextBox></td>
            </tr>
            <tr>
                <th>创建时间</th>
                <td><asp:TextBox ID="CDate_T" runat="server" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm' })" CssClass="form-control max20rem"></asp:TextBox></td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="tab-pane" id="Tabs1">
        <table class="table table-striped table-bordered table-hover sys_table">
            <%--栏目选项--%>
            <tbody>
                <tr>
                    <th class="w12rem_lg">
                        <strong>打开方式</strong>
                    </th>
                    <td>
                        <asp:RadioButtonList ID="RBLOpenType" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Value="_self">原窗口打开</asp:ListItem>
                            <asp:ListItem Value="_blank">新窗口打开</asp:ListItem>
                            <asp:ListItem Value="_parent">父窗口打开</asp:ListItem>
                            <asp:ListItem Value="_top">全局载入</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <th><strong>内容打开方式</strong></th>
                    <td>
                        <asp:RadioButtonList ID="RBLItemOpenType" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="0">原窗口打开</asp:ListItem>
                            <asp:ListItem Value="1">新窗口打开</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>栏目权限</strong>
                    </th>
                    <td>
                        <asp:RadioButtonList ID="RBLPurviewType" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Value="0">开放</asp:ListItem>
                            <asp:ListItem Value="1">认证</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <th><strong>URL访问格式</strong></th>
                    <td>
                        <label><input type="radio" name="UrlFormat_Rad" value="en" checked="checked"/>经典(/Item/Gid)</label>
                        <label><input type="radio" name="UrlFormat_Rad" value="cn" />中文(Item/标题)</label>
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>会员投稿状态</strong>
                    </th>
                    <td>
                        <asp:RadioButtonList ID="SiteContentAudit_Rad" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Value="0">待审核</asp:ListItem>
                            <asp:ListItem Value="99">已审核</asp:ListItem>
                            <asp:ListItem Value="-1">回收站</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>点击统计时间</strong>
                    </th>
                    <td>
                        <asp:DropDownList ID="ClickTimeout" CssClass="form-control text_md" runat="server">
                            <asp:ListItem Text="1秒" Value="1" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="30秒" Value="30"></asp:ListItem>
                            <asp:ListItem Text="1分钟" Value="60"></asp:ListItem>
                            <asp:ListItem Text="5分钟" Value="300"></asp:ListItem>
                            <asp:ListItem Text="10分钟" Value="600"></asp:ListItem>
                            <asp:ListItem Text="半小时" Value="1800"></asp:ListItem>
                            <asp:ListItem Text="1小时" Value="3600"></asp:ListItem>
                            <asp:ListItem Text="8小时" Value="28800"></asp:ListItem>
                            <asp:ListItem Text="24小时" Value="86400"></asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:TextBox ID="ClickTimeout" class="form-control" runat="server" Columns="30">0</asp:TextBox>--%>
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>热点的点击数</strong>
                    </th>
                    <td>
                        <asp:TextBox ID="TxtHitsOfHot" class="form-control text_md" runat="server">0</asp:TextBox>
                        <asp:RangeValidator Visible="false" ID="ValgHitsOfHot" runat="server" Display="Dynamic" ControlToValidate="TxtHitsOfHot" ErrorMessage="请输入整数" MinimumValue="0" MaximumValue="2147483647" Type="Integer" SetFocusOnError="True"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>工作流</strong>
                    </th>
                    <td>
                        <asp:DropDownList ID="ddlState" runat="server" CssClass="form-control text_md"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>内容防护</strong>
                    </th>
                    <td>
                            <input runat="server" type="checkbox" id="SafeGuard" class="switchChk"/>
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>简洁模式</strong>
                    </th>
                    <td>
                        <input type="checkbox" runat="server" id="isSimple_CH" class="switchChk" />
                    </td>
                </tr>
           <%--     <tr>
                    <th>
                        <strong>绑定互动管理</strong><br />
                    </th>
                    <td>
                        <asp:DropDownList ID="DropDownList1" CssClass="form-control text_md" runat="server"></asp:DropDownList>
                        <small class="text-muted">只能绑定节点类别的互动模块</small>
                    </td>
                </tr>--%>
            </tbody>
        </table>
    </div>
    <div class="tab-pane" id="Tabs2">
        <table class="table table-striped table-bordered table-hover sys_table">
            <%--收费设置--%>
            <tbody>
                <tr>
                    <th class="w12rem_lg">
                        默认消费积分
                    </th>
                    <td>
						<div class="input-group">
						<asp:TextBox ID="TxtConsumePoint" class="form-control max20rem" runat="server" Text="0" />
						  <div class="input-group-append">
							<span class="input-group-text">点</span>
						  </div>
						</div>
						<small class="text-muted">会员在此栏目下阅读内容时，该内容默认的收费积分数</small>
                    </td>
                </tr>
                <tr>
                    <th>
                        重复收费方式
                    </th>
                    <td class="sysConsumeType">
					<div class="btn btn-outline-info"><input type="radio" name="ConsumeType" value="0" /> 不重复收费</div>
					<div class="input-group">
					  <div class="input-group-prepend">
						<span class="input-group-text"><input type="radio" name="ConsumeType" value="1"/> 距离上次收费隔</span>
					  </div>
					  <asp:TextBox ID="TxtConsumeTime" class="form-control" runat="server" Text="0" />
					  <div class="input-group-append">
						<span class="input-group-text">小时重新收费</span>
					  </div>
					</div>
					<div class="input-group">
					  <div class="input-group-prepend">
						<span class="input-group-text"><input type="radio" name="ConsumeType" value="2"/> 重复阅读此文章</span>
					  </div>
					  <asp:TextBox ID="TxtConsumeCount" class="form-control" runat="server" Text="0" />
					  <div class="input-group-append">
						<span class="input-group-text">次后重新收费</span>
					  </div>
					</div>                        
					<div class="btn btn-outline-info"><input type="radio" name="ConsumeType" value="3" /> 上述两个条件都满足时重新收费</div><div class="cleafix"></div>
					<div class="btn btn-outline-info"><input type="radio" name="ConsumeType" value="4" /> 上述两者任一个满足时即重收费</div><div class="cleafix"></div>
					<div class="btn btn-outline-info"><input type="radio" name="ConsumeType" value="5" /> 每阅读一次即重复收费－不推荐</div><div class="cleafix"></div>
					<small class="text-muted">会员在此栏目下阅读内容时，该内容的重复收费方式</small>
                    </td>
                </tr>
                <tr runat="server" visible="false">
                    <th>
                        <strong>可浏览篇数</strong><br />
						<small class="text-muted">注：会员在此栏目下查看内容时,该节点可浏览篇数</small>
                    </th>
                    <td id="BGroups">
                        <asp:Repeater ID="BGroup" runat="server">
                            <ItemTemplate>
                                <span class="tips" style="width: 70px; display: block; float: left"><%# Eval("GroupName")%> </span>
                                <input type="hidden" value='<%# Eval("GroupID") %>' />
                                <asp:TextBox ID="CNode1" class="form-control pull-left" Style="max-width: 80px;" runat="server" Text='<%# GetViewVl(Eval("GroupID").ToString()) %>'></asp:TextBox><span class="tips">篇</span><div class="clearfix"></div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
                <tr>
                    <th>
                        分成比例
                    </th>
                    <td>
						<div class="input-group">
						<asp:TextBox ID="TxtShares" class="form-control max20rem" runat="server" Text="0" />
						  <div class="input-group-append">
							<span class="input-group-text">%</span>
						  </div>
						</div>
						<small class="text-muted">会员在此栏目下添加内容时，该内容默认的分成比例</small>
                    </td>
                </tr>
                <tr>
                    <th>发布内容收费</th>
                    <td>
                        <div class="input-group">
						<asp:TextBox ID="TxtAddMoney" class="form-control" runat="server">0</asp:TextBox>
						<div class="input-group-append"><span class="input-group-text">余额</span></div>
                            <asp:TextBox ID="TxtAddPoint" class="form-control " runat="server">0</asp:TextBox>
							<div class="input-group-append"><span class="input-group-text">点券</span></div>
                            <asp:TextBox ID="txtAddExp" class="form-control" runat="server">0</asp:TextBox>
							<div class="input-group-append"><span class="input-group-text">积分</span></div>
                        </div>						
						<small class="text-muted">会员在此栏目下发布内容时，每发布一篇内容收费</small>
                    </td>
                </tr>
                <tr>
                    <th>下载内容收费</th>
                    <td>
						<div class="input-group">
						<asp:TextBox ID="txtDeducExp" class="form-control max20rem" runat="server" Text="0" />
						  <div class="input-group-append">
							<span class="input-group-text">积分</span>
						  </div>
						</div>
						<small class="text-muted">会员在此栏目下载内容时，每下载一次所需费用</small>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="tab-pane" id="Tabs3">
        <table class="table table-striped table-bordered table-hover sys_table">
            <%--模板选项--%>
            <tbody>
                <tr>
                    <th class="w12rem_lg">
                        <strong>栏目首页模板</strong>
                    </th>
                    <td>
                            <%=PageCommon.GetTlpDP("IndexTemplate",!string.IsNullOrEmpty(IndexTemplate_hid.Value),"/Class_"+NodeID+"/Default.aspx") %>
                            <asp:HiddenField ID="IndexTemplate_hid" runat="server" />
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>栏目列表页模板</strong>
                    </th>
                    <td>
                            <%=PageCommon.GetTlpDP("ListTemplateFile",!string.IsNullOrEmpty(ListTemplateFile_hid.Value),"/Class_"+NodeID+"/NodePage.aspx") %>
                            <asp:HiddenField ID="ListTemplateFile_hid" runat="server" />
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>最新信息模板</strong>
                    </th>
                    <td>
                            <%=PageCommon.GetTlpDP("LastinfoTemplate",!string.IsNullOrEmpty(LastinfoTemplate_hid.Value),"/Class_"+NodeID+"/NodeNews.aspx") %>
                            <asp:HiddenField ID="LastinfoTemplate_hid" runat="server" />
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>热门信息模板</strong>
                    </th>
                    <td>
                            <%=PageCommon.GetTlpDP("HotinfoTemplate",!string.IsNullOrEmpty(HotinfoTemplate_hid.Value),"/Class_"+NodeID+"/NodeHot.aspx") %>
                            <asp:HiddenField ID="HotinfoTemplate_hid" runat="server" />
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>推荐信息模板</strong>
                    </th>
                    <td>
                            <%=PageCommon.GetTlpDP("ProposeTemplate",!string.IsNullOrEmpty(ProposeTemplate_hid.Value),"/Class_"+NodeID+"/NodeElite.aspx") %>
                            <asp:HiddenField ID="ProposeTemplate_hid" runat="server" />
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>选择内容模型</strong>
                    </th>
                    <td>
                        <table class="table table-striped table-bordered table-hover">
                            <asp:Repeater ID="Model_RPT" runat="server">
                                <ItemTemplate>
                                    <tr class="tdbg">
                                        <td class="w12rem_lg">
                                            <label><%# GetChk(Eval("ModelID","{0}")) %>
                                            <%#GetModelIcon() %> <%# Eval("ModelName") %>
                                            </label>
                                        </td>
                                        <td>
                                                <%#PageCommon.GetTlpDP("ModelTemplate_"+Eval("ModelID")) %>
                                                <input type="hidden" id="ModelTemplate_<%# Eval("ModelID") %>_hid" name="ModelTemplate_<%# Eval("ModelID") %>" value="<%# GetTemplate(Eval("ModelID","{0}")) %>" />
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="tab-pane" id="Tabs4">
        <table class="table table-striped table-bordered table-hover sys_table">
            <%--生成选项--%>
            <tbody>
                <tr>
                    <th class="w12rem_lg">
                        <strong>列表首页扩展名</strong>
                    </th>
                    <td>
                            <asp:RadioButtonList ID="ListPageHtmlEx_Rad" runat="server" RepeatDirection="Horizontal" class="pull-left">
                                <asp:ListItem Value="0">.html</asp:ListItem>
                                <asp:ListItem Value="1">.htm</asp:ListItem>
                                <asp:ListItem Value="2">.shtml</asp:ListItem>
                                <asp:ListItem Value="3" Selected="True">.aspx(不生成静态)</asp:ListItem>
                            </asp:RadioButtonList>
                             <input runat="server" type="button" onclick="createHtml();" id="Release_Btn"  visible="false" class="btn btn-link" value="发布该节点" />
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>栏目列表页面扩展名</strong>
                    </th>
                    <td>
                        <asp:RadioButtonList ID="ListPageEx_Rad" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="0">.html</asp:ListItem>
                            <asp:ListItem Value="1">.htm</asp:ListItem>
                            <asp:ListItem Value="2">.shtml</asp:ListItem>
                            <asp:ListItem Value="3" Selected="True">.aspx(不生成静态)</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>最新信息页扩展名</strong>
                    </th>
                    <td>
                        <asp:RadioButtonList ID="LastinfoPageEx_Rad" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="0">.html</asp:ListItem>
                            <asp:ListItem Value="1">.htm</asp:ListItem>
                            <asp:ListItem Value="2">.shtml</asp:ListItem>
                            <asp:ListItem Value="3" Selected="True">.aspx(不生成静态)</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>热门信息页扩展名</strong>
                    </th>
                    <td>
                        <asp:RadioButtonList ID="HotinfoPageEx" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="0">.html</asp:ListItem>
                            <asp:ListItem Value="1">.htm</asp:ListItem>
                            <asp:ListItem Value="2">.shtml</asp:ListItem>
                            <asp:ListItem Value="3" Selected="True">.aspx(不生成静态)</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>推荐信息扩展名</strong>
                    </th>
                    <td>
                        <asp:RadioButtonList ID="ProposePageEx" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="0">.html</asp:ListItem>
                            <asp:ListItem Value="1">.htm</asp:ListItem>
                            <asp:ListItem Value="2">.shtml</asp:ListItem>
                            <asp:ListItem Value="3" Selected="True">.aspx(不生成静态)</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr> 
                    <th>
                        <strong>内容页扩展名</strong>
                    </th>
                    <td>
                        <asp:RadioButtonList ID="ContentFileEx_Rad" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="0">.html</asp:ListItem>
                            <asp:ListItem Value="1">.htm</asp:ListItem>
                            <asp:ListItem Value="2">.shtml</asp:ListItem>
                            <asp:ListItem Value="3" Selected="True">.aspx(不生成静态)</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>节点目录生成位置</strong>
                    </th>
                    <td>
                        <asp:RadioButtonList ID="RBLPosition" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Value="1">继承父节点目录</asp:ListItem>
                            <asp:ListItem Value="0">根目录下</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                    
                <tr>
                    <th>
                        <strong>内容页文件名规则</strong>
                    </th>
                    <td>
                        <asp:DropDownList ID="DDLContentRule" CssClass="form-control max20rem" runat="server">
                            <asp:ListItem Selected="True" Value="2">栏目目录/InfoID</asp:ListItem>
                            <asp:ListItem Value="0">栏目目录/年/月/日/infoid</asp:ListItem>
                            <asp:ListItem Value="1">栏目目录/年-月/InfoID</asp:ListItem>
                            <asp:ListItem Value="3">栏目目录/年月日/标题</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="tab-pane" id="Tabs7">
        <table class="table table-striped table-bordered table-hover sys_table">
            <%--后台权限--%>
            <tbody>
                <tr>
                    <th class="w12rem_lg">
                        <strong>后台权限</strong>
                    </th>
                    <td>
                        <ZL:ExGridView ID="AdminRole_EGV" runat="server" CssClass="table table-striped table-bordered table-hover" 
                            AutoGenerateColumns="False" DataKeyNames="RoleID">
                            <Columns>
                                <asp:TemplateField HeaderText="角色名">
                                    <HeaderTemplate>
                                        <label><input type="checkbox" onclick="ChkAll('admin');" />角色名</label>
                                    </HeaderTemplate>
                                    <ItemStyle  HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <label><%#Eval("RoleName") %><input type="checkbox" id="checkAll" onclick="CheckAll(this,'checkAll','0');" /></label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <label><input type="checkbox"  onclick="ColChk('look1');" />查看</label>
                                    </HeaderTemplate>
                                    <HeaderStyle  />
                                    <ItemTemplate>
                                        <asp:HiddenField ID="HiddenRID" runat="server" Value='<%# Eval("RoleID") %>' />
                                        <asp:CheckBox ID="chkSel1" data-auth="look1" runat="server" Checked='<%# getbool(Eval("look")) %>'  />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="录入">
                                    <HeaderTemplate>
                                        <label><input type="checkbox"  onclick="ColChk('addto1');" />录入</label>
                                    </HeaderTemplate>
                                    <HeaderStyle  />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSel2" data-auth="addto1" runat="server" Checked='<%# getbool(Eval("addTo")) %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <label><input type="checkbox"  onclick="ColChk('state1');" />审核</label>
                                    </HeaderTemplate>
                                    <HeaderStyle  />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSel3" data-auth="state1" runat="server" Checked='<%# getbool(Eval("State")) %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <label><input type="checkbox"  onclick="ColChk('modify1');" />修改</label>
                                    </HeaderTemplate>
                                    <HeaderStyle  />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSel4" data-auth="modify1" runat="server" Checked='<%# getbool(Eval("Modify")) %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <label><input type="checkbox"  onclick="ColChk('col1');" />仅当前节点</label>
                                    </HeaderTemplate>
                                    <HeaderStyle  />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSel5" data-auth="col1" runat="server" Checked='<%# getbool(Eval("Columns")) %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <label><input type="checkbox" onclick="ColChk('com1');" />评论管理</label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSel6" data-auth="com1" runat="server" Checked='<%# getbool(Eval("Comments")) %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                            </ZL:ExGridView>
                    </td>
                </tr>
                <tr>
                    <th><strong>用户权限</strong></th>
                    <td>
                        <ZL:ExGridView runat="server" ID="GroupAuth_EGV" AutoGenerateColumns="false" EnableTheming="False" CssClass="table table-striped table-bordered table-hover" DataKeyNames="GroupID">
                            <Columns>
                                <asp:TemplateField HeaderText="组名称">
                                    <HeaderTemplate>
                                        <label><input type="checkbox" onclick="ChkAll('group');" />组名称</label>
                                    </HeaderTemplate>
                                    <ItemStyle  HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <label><%# Eval("GroupName") %><input type="checkbox" id="checkAll" onclick="CheckAll(this, 'checkAll', '0');" /></label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="查看">
                                    <HeaderTemplate>
                                        <label><input type="checkbox" onclick="ColChk('look2');" />查看</label>
                                    </HeaderTemplate>
                                    <HeaderStyle  />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSel1" data-auth="look2" runat="server" Checked='<%#GroupAuth("look") %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="下载">
                                    <HeaderTemplate>
                                        <label><input type="checkbox" onclick="ColChk('down');" />下载</label>
                                    </HeaderTemplate>
                                    <HeaderStyle  />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSel11" data-auth="down" runat="server" Checked='<%#GroupAuth("down") %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <label><input type="checkbox" onclick="ColChk('quote');" />引用</label>
                                    </HeaderTemplate>
                                    <HeaderStyle  />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSel12" data-auth="quote" runat="server" Checked='<%#GroupAuth("quote") %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <label><input type="checkbox" onclick="ColChk('addto2');" />录入</label>
                                    </HeaderTemplate>
                                    <HeaderStyle  />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSel2" data-auth="addto2" runat="server" Checked='<%#GroupAuth("addTo") %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <label><input type="checkbox" onclick="ColChk('modify2');" />修改</label>
                                    </HeaderTemplate>
                                    <HeaderStyle  />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSel3" data-auth="modify2" runat="server" Checked='<%#GroupAuth("Modify") %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <label><input type="checkbox" onclick="ColChk('del');" />删除</label>
                                    </HeaderTemplate>
                                    <HeaderStyle  />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSel4" data-auth="del" runat="server" Checked='<%#GroupAuth("Deleted") %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <label><input type="checkbox" onclick="ColChk('col2');" />仅当前节点</label>
                                    </HeaderTemplate>
                                    <HeaderStyle  />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSel5" data-auth="col2" runat="server" Checked='<%#GroupAuth("Columns") %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderTemplate>
                                        <label><input type="checkbox" onclick="ColChk('com2');" />评论管理</label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkSel6" data-auth="com2" runat="server" Checked='<%#GroupAuth("Comments") %>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                        </ZL:ExGridView>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="tab-pane" id="Tabs6">
        <table class="table table-striped table-bordered table-hover sys_table">
            <!--前台权限-->
            <tbody>
                <tr>
                    <th class="w12rem_lg">浏览/查看权限						
                    </th>
                    <td>
                        <asp:RadioButtonList ID="SelCheck_RadioList" runat="server" class="w-100">
                            <asp:ListItem Text="开放栏目 任何人（包括游客）可以浏览和查看此栏目下的信息。" Selected="True" Value="allUser"></asp:ListItem>
                            <asp:ListItem Text="半开放栏目 任何人（包括游客）都可访问列表页。游客不可浏览内容，会员根据栏目权限决定是否可以查看。" Value="moreUser"></asp:ListItem>
                            <asp:ListItem Text="认证栏目 会员根据栏目权限决定是否可以浏览列表与内容页。" Value="onlyUser"></asp:ListItem>
                        </asp:RadioButtonList>
                         <small class="text-muted">栏目权限为继承关系。如：当父栏目设为“认证栏目”时，子栏目的权限设置将继承父栏目设置，即使子栏目设为“开放栏目”也无效。相反，如父栏目设为“开放栏目”，子栏目可以设为“半开放栏目”或“认证栏目”。</small>    
                    </td>
                </tr>
                <tr>
                    <th>
                        允许浏览此栏目会员组
                    </th>
                    <td>
                        <asp:CheckBoxList ID="ViewGroup_Chk" runat="server" RepeatDirection="Horizontal" RepeatColumns="5" Width="100%">
                        </asp:CheckBoxList>						
						<small class="text-muted">半开放栏目和认证栏目，请在此设置允许浏览此栏目的会员组</small>
                    </td>
                </tr>
                <tr>
                    <th>发表权限						
                    </th>
                    <td>
                        <asp:CheckBoxList ID="input_Chk" runat="server" RepeatDirection="Horizontal" RepeatColumns="5" Width="100%">
                        </asp:CheckBoxList>
						<small class="text-muted">请在此设置允许在此栏目发表信息的会员组,游客无发表信息权限。</small>
                    </td>
                </tr>
                <tr>
                    <th>
                        <strong>评论权限</strong>
                    </th>
                    <td>
                        <asp:RadioButtonList ID="RBLCommentType" runat="server" RepeatDirection="Horizontal" class="w-100">
                            <asp:ListItem Selected="True" Value="0">关闭评论</asp:ListItem>
                            <asp:ListItem Value="1">允许游客</asp:ListItem>
                            <asp:ListItem Value="2">必须登录</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:CheckBoxList ID="forum_Chk" runat="server" class="w-100">
                            <asp:ListItem Value="1">允许在此栏目发表评论</asp:ListItem>
                            <asp:ListItem Value="2">评论需要审核</asp:ListItem>
                            <asp:ListItem Value="3">一篇文章只能发表一次评论</asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="panel-footer text-center">
        <asp:Button ID="EBtnSubmit" CssClass="btn btn-outline-info" Text="保存设置" OnClick="EBtnSubmit_Click" runat="server" UseSubmitBehavior="false" />
        <asp:Button ID="Cancel_B" CssClass="btn btn-outline-info" Text="返回列表" OnClick="Cancel_B_Click" runat="server" />
    </div>
</div>
</div>
</div>
<ZL:TlpDP runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/DatePicker/WdatePicker.js"></script>
<script src="/JS/chinese.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Controls/ZL_Array.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script>
    function setSaveWidth(){
        //$("#save").width($($(this).attr("href")).width());
    }
    $().ready(function () {
        $("#GridView1 tr>th:eq(0)").append("<input type=checkbox id='chkThisAll1'/>");
        $("#Egv tr>th:eq(0)").append("<input type=checkbox id='chkThisAll'/>");
        $("#chkThisAll").click(function () {
            CheckAll(this,"chkThisAll",1);
        });
        $("#chkThisAll1").click(function () {
            CheckAll(this,"chkThisAll1",1);
        });
        Tlp_initTemp();
    })
    var diag=new ZL_Dialog();
    function ShowTList(url){
        diag.title="选择模板";
        diag.url=url;
        diag.maxbtn=false;
        diag.ShowModal();
    }
    function CloseDialog(){
        diag.CloseModal();
    }

    function selectnum() {
        //parent.document.getElementById("main_right").height = document.body.offsetHeight + 50;
    }
    function CheckAll(obj,id,n){
        var chkArr;
        if(n==0)
            chkArr = $(obj).parent().parent().parent().find("input[type=checkbox][id!=" + id + "]");
        if(n==1)
            chkArr = $(obj).parent().parent().parent().parent().find("input[type=checkbox][id!=" + id + "]");
        for (var i = 0; i < chkArr.length; i++) {
            chkArr[i].checked = obj.checked;
               
        }
    }
    function ColChk(name) {
        obj = event.srcElement;
        console.log(obj, $('span[data-auth=' + name + '] :checkbox'));
        $('span[data-auth=' + name + '] :checkbox').each(function () { this.checked = obj.checked; });
    }
    function ChkAll(type) {
        obj = event.srcElement;
        if (type == 'admin') { $("#AdminRole_EGV input[type=checkbox]").each(function () { this.checked = obj.checked; }); }
        if (type == 'group') { $("#GroupAuth_EGV input[type=checkbox]").each(function () { this.checked = obj.checked; }); }
    }
    /*-----------栏目名称与目录-----------*/
    var nameFlag = true, dirFlag = true;
    $(function () {
        $("#TxtNodeName").blur(function () {
            if (ZL_Regex.isEmpty(this.value)) { $("#TxtNodeName_sp").text("节点名称不能为空"); nameFlag = false; CheckBtn(); return; }
            $.post("<%:Request.RawUrl%>", { action: "nodename", value: $("#TxtNodeName").val() }, function (data) {
                if (data != M_APIResult.Success) {
                    nameFlag = false;
                    $("#TxtNodeName_sp").text("节点名称重复,请修改节点名称");
                }
                else { $("#TxtNodeName_sp").text("*"); nameFlag = true; }
                CheckBtn();
            });
        });
        $("#TxtNodeDir").blur(function () {
            if (ZL_Regex.isEmpty(this.value)) { $("#TxtNodeDir_sp").text("栏目名称不能为空"); dirFlag = false; CheckBtn(); return; }
            $.post("<%:Request.RawUrl%>", { action: "nodedir", value: $("#TxtNodeDir").val() }, function (data) {
                if (data != M_APIResult.Success) {
                    dirFlag = false;
                    $("#TxtNodeDir_sp").text("栏目标识重复,请修改栏目标识");
                }
                else { $("#TxtNodeDir_sp").text("*"); dirFlag = true; }
                CheckBtn();
            });
        });
        function CheckBtn()
        {
            if (nameFlag == true && dirFlag == true) { $("#EBtnSubmit").removeAttr("disabled"); }
            else { disBtn("EBtnSubmit"); }
        }
    })
    function BindPY() {
        $("#TxtNodeName").keyup(function () {
            Getpy("TxtNodeName", "TxtNodeDir");
        });
    }
    function createHtml() {
        var path = "<%=customPath2%>";
        var url = path + "Content/CreateHtmlContent.aspx?CType=node&NodeID=<%=NodeID%>";
        comdiag.reload = true;
        ShowComDiag(url, "生成发布");
    }
</script>
</asp:Content>
