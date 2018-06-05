<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkFlow.aspx.cs" Inherits="ZoomLaCMS.Manage.WorkFlow.WorkFlow" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>流程管理</title>
<link href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
<script src="/dist/js/bootstrap-switch.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/Config/SiteInfo.aspx","系统设置"),
		new Bread("Default.aspx","流程管理"),
        new Bread() {url="", text="添加流程",addon="" }}
		)
    %>
	<div class="container-fluid pr-0">
    <div class="row sysRow list_choice">
        <table class="table table-striped table-bordered sys_table">
            <tr>
                <th class="w12rem_lg">流程名称 <span class="text-danger">*</span></th>
                <td>
                    <asp:TextBox runat="server" CssClass="form-control max20rem" ID="proNameT" MaxLength="30" />
                    
                    <asp:RequiredFieldValidator ID="R1" ControlToValidate="proNameT" runat="server" ErrorMessage="流程名称不能为空" Display="Dynamic" ForeColor="Red" />
                </td>
            </tr>
             <tr>
                <th>项目名称 <span class="text-danger">*</span></th>
                <td>
					<div class="input-group ">
					<asp:TextBox runat="server" ID="NickName_T" CssClass="form-control max20rem" MaxLength="6" />
                    <asp:RequiredFieldValidator ID="R2" ControlToValidate="NickName_T" runat="server" ErrorMessage="项目名称不能为空" Display="Dynamic" ForeColor="Red" />
					  <div id="port_btns" class="input-group-append">
						<button type="button" class="btn btn-outline-info">收文</button>
                        <button type="button" class="btn btn-outline-info">发文</button>
                        <button type="button" class="btn btn-outline-info">会议</button>
                        <button type="button" class="btn btn-outline-info">申请</button>
                        <button type="button" class="btn btn-outline-info">请假</button>
					  </div>
				  	</div>
					
                </td>
            </tr>
            <tr><th>流程类型</th>
                <td>
                    <asp:DropDownList runat="server" ID="ProType_DP" CssClass="form-control max20rem">
                        <asp:ListItem Value="1">自由流程</asp:ListItem>
                        <asp:ListItem Value="2" Selected="True">公文流程</asp:ListItem>
                        <asp:ListItem Value="3">限定流程</asp:ListItem>
                    </asp:DropDownList>
					<small class="text-muted">公文流程:用户必须依预设好的步骤执行,可[自由指定]下一步骤主办人</small>
					<small class="text-muted">自由流程:用户可[自由指定主办人],主办人可[终止流程]</small>
					<small class="text-muted">限定流程:用户必须依据预设好的步骤与主办人,执行流程</small>
                </td>
            </tr>
            <tr>
                <th>流程分类</th>
                <td>
                    <asp:DropDownList runat="server" ID="ProClass_DP" CssClass="form-control max20rem"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <th>表单模型 <span class="text-danger">*</span></th> 
                <td>
					<div class="input-group ">
					  <asp:TextBox runat="server" ID="FormInfo_T" CssClass="form-control max20rem" />
					  <div id="port_btns" class="input-group-append">
						  <button type="button" class="btn btn-outline-info" onclick="SelModels('FormInfo_T',0)">选择模型</button>
					  </div>
				  	</div>
                  <%--  <span>请输入表单的内容模型ID,或Word文档ID</span>--%>
                    <asp:RequiredFieldValidator ID="R3" ControlToValidate="FormInfo_T" runat="server" ErrorMessage="表单模型不能为空" Display="Dynamic" ForeColor="Red" />
                </td>
            </tr>
            <tr><th>流程模板 <span class="text-danger">*</span></th><td>
                <asp:DropDownList runat="server" ID="FlowTlp_DP" CssClass="form-control max20rem">
                    <asp:ListItem Value="defTlp" Selected="True">默认模板</asp:ListItem>
                    <asp:ListItem Value="rece">收文模板</asp:ListItem>
                    <asp:ListItem Value="send">发文模板</asp:ListItem>
                </asp:DropDownList>
				<small class="text-muted">模板目录/Office/Tlp,值为空则使用默认模板</small>
				</td></tr>
            <tr><th>打印模板 <span class="text-danger">*</span></th><td>
                <asp:DropDownList runat="server" ID="PrintTlp_DP" CssClass="form-control max20rem">
                    <asp:ListItem Value="defTlp" Selected="True">默认打印模板</asp:ListItem>
                    <asp:ListItem Value="receprint">收文打印模板</asp:ListItem>
                    <asp:ListItem Value="sendprint">发文打印模板</asp:ListItem>
                </asp:DropDownList>
				<small class="text-muted">模板目录/Office/Tlp,值为空则使用默认模板</small>
				</td></tr>
        <%--    <tr>
                <th>是否归档</th>
                <td>
                    <input type="checkbox" runat="server" class="switchChk" id="flowdoc_chk" value="是否归档" />
					<small class="text-muted">流程完结后自动归档,只有拥有归档权限的角色可见</small>
                </td>
            </tr>--%>
            <tr>
                <th>流程说明</th>
                <td>
                    <asp:TextBox runat="server" ID="remindT" CssClass="form-control m50rem_50" TextMode="MultiLine"  />
                </td>
            </tr>
            <tr class="bg-info text-white"><td colspan="2" class="text-center"><strong>起草管理</strong></td></tr>
            <tr>
                <th>使用角色</th>
                <td>
					<div class="input-group ">
					  <asp:TextBox runat="server" CssClass="form-control max20rem" disabled="disabled" ID="sponsor_T" />
					  <div id="port_btns" class="input-group-append">
						  <input type="button" value="选择" class="btn btn-outline-info" onclick="ShowUserDiag('sponsor');"/>
					  </div>
				  	</div>
					<small class="text-muted">为空则所有角色可用,否则仅指定用户角色可发起该流程</small>
                    <asp:HiddenField runat="server" ID="sponsor_Hid" />
                </td>
            </tr>
     <%--       <tr><td>主办人别名</td>
                <td><asp:TextBox runat="server" ID="ReferUser_Alias" class="form-control max20rem" /></td>
            </tr>
            <tr><td>协办人别名</td>
                <td><asp:TextBox runat="server" ID="CCUser_Alias" class="form-control max20rem" />
                    <asp:CheckBox runat="server" ID="CCUser_Allow_Chk" Checked="true" Text="允许协办" /></td>
            </tr>
            <tr>
                <td>辅办人别名</td>
                <td>
                    <asp:TextBox runat="server" ID="HelpUser_Alias" class="form-control max20rem" />
                    <asp:CheckBox runat="server" ID="HelpUser_Allow" Checked="true" Text="允许辅办" /></td>
            </tr>--%>
<%--            <tr style="display: none;">
                <th>自动文号表达式</th>
                <td>
                    <input name="txtAutoName" type="text" size="30" id="txtAutoName" class="BigInput" />
                    &nbsp;&nbsp;<a href="javascript:my_tip()">查看说明</a>
                </td>
            </tr>
            <tr id="tip" style="display: none">
                <th>说明</th>
                <td>表达式中可以使用以下特殊标记：<br>
                    {Y}：表示年 4位的年份<br>
                    {yy}：表示年 不包含纪元的年份，如果不包含纪元的年份小于 10，则显示具有前导0的年份<br>
                    {M}：表示月 一位数的月份没有前导0<br>
                    {mm}：表示月 一位数的月份有一个前导0<br>
                    {D}：月中的某一天,一位数的日期没有前导0<br>
                    {dd}：月中的某一天,一位数的日期有一个前导0<br>
                    {H}：表示时<br>
                    {I}：表示分<br>
                    {S}：表示秒<br>
                    {F}：表示流程名<br>
                    {U}：表示用户姓名<br>
                    {SD}：表示短部门<br>
                    {LD}：表示长部门<br>
                    {R}：表示角色<br>
                    {N}：表示编号，通过 <u>编号计数器</u> 取值并自动增加计数值<br>
                    <br>
                    例如，表达式为：成建委发[{Y}]{N}号，编号位数为4<br>
                    自动生成文号如：成建委发[2006]0001号<br>
                    <br>
                    例如，表达式为：BH{N}，编号位数为3<br>
                    自动生成文号如：BH001<br>
                    <br>
                    例如，表达式为：{F}流程（{Y}年{M}月{D}日{H}:{I}）{U}<br>
                    自动生成文号如：请假流程（2009年1月1日10:30）张三<br>
                    <br>
                    可以不填写自动文号表达式，则系统默认按以下格式，如：<br>
                    请假流程(2009-01-01 10:30)
                </td>
            </tr>--%>
            <tr>
                <td></td>
                <td>
                    <asp:Button runat="server" ID="saveBtn" CssClass="btn btn-info" Text="保存流程" OnClick="saveBtn_Click" />
                    <a href="Default.aspx" class="btn btn-outline-info">返回列表</a>
                </td>
            </tr>
        </table>
	</div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/SelectCheckBox.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
    function ShowUserDiag(source) {
        var url = "/Common/Dialog/SelUserRole.aspx?#" + source;
        ShowComDiag(url, "选择角色");
    }
    var udiag = new ZL_Dialog();
    function SelModels(cid, mid) {
        udiag.title = "选择模型";
        udiag.url = "SelModelFieds.aspx?cid=" + cid + "&mid=" + mid;
        udiag.width = "modeldiag";
        udiag.ShowModal();
    }
    function GetModelID(cid, mid) {
        $("#" + cid).val(mid);
        udiag.CloseModal();
        $("#CanEditField_T").val('*');
    }

    function UserFunc(list, select) {
        Def_RoleFunc(list, select);
    }
    function CloseDiag() {
        udiag.CloseModal();
    }
    $(function () {
        $("#listdiv button").click(function () {
            $("#NickName_T").val($(this).text());
        });
    });
</script>
</asp:Content>