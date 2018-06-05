<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TemplateEdit.aspx.cs" Inherits="ZoomLaCMS.Manage.Template.TemplateEdit"  MasterPageFile="~/Manage/I/Index.master"  ValidateRequest="false"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
<link rel="stylesheet" href="/Plugins/CodeMirror/lib/codemirror.css">
<link rel="stylesheet" href="/Plugins/CodeMirror/theme/eclipse.css">
<script src="/Plugins/CodeMirror/lib/codemirror.js"></script>
<script src="/Plugins/CodeMirror/mode/xml.js"></script>
<script src="/Plugins/CodeMirror/mode/javascript/javascript.js"></script>
<script src="/Plugins/CodeMirror/addon/selection/active-line.js"></script>
<script src="/Plugins/CodeMirror/addon/edit/matchbrackets.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<%--<script src="/Plugins/CodeMirror/mode/htmlmixed.js"></script>--%>
<title>编辑模板</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("TemplateSet.aspx","模板风格"),				
        new Bread("TemplateManage.aspx","模板列表"),				
        new Bread() {url=Request.RawUrl.ToString(), text="模板编辑",addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
<table class="table table-striped table-bordered" align="center">
<tr class="title">
	<td align="left" colspan="2">
			<div class="input-group mb-3">
			<div class="input-group-prepend">
			<span class="input-group-text"><i class="zi zi_edit" zico="编辑"></i></span>
			</div>
			<div class="input-group-prepend">
			<span class="input-group-text"><asp:Label ID="FolderName_L" runat="server" /></span>
			</div>
			<asp:TextBox ID="FileName_T" runat="server" CssClass="form-control max20rem text-right"></asp:TextBox>
			<div class="input-group-append">
			<span class="input-group-text"><asp:Label runat="server" ID="FileExt_L" /></span>
			</div>
			</div>
			<span class="text-danger" runat="server" id="whitespace_sp" visible="false">提示：模板名不能包含空格,为了安全和规范,保存时会自动过滤空格</span>
	</tr>
	<tr>
		<td colspan="2">
			<div id="labeldiv">
	<ul class="nav nav-tabs top_opbar mb-0">
		<li class="nav-item"><a class="nav-link active" href="#Tabs0" data-toggle="tab">自定标签</a></li>
		<li class="nav-item"><a class="nav-link"  href="#Tabs1" data-toggle="tab">字段标签</a></li>
		<li class="nav-item"><a class="nav-link" href="#Tabs2" data-toggle="tab">系统标签</a></li>
		<li class="nav-item"><a class="nav-link" href="#Tabs3" data-toggle="tab">扩展函数</a></li>
	</ul>
	<div class="row">
	<div class="col-sm-4 col-xl-4 p-0 LabelCallTab_l">
		<div class="tab-content">
			<div class="tab-pane active" id="Tabs0" runat="server">
				<div class="card">
				   <div class="card-header">
						<asp:DropDownList ID="CustomLabel_DP" runat="server" CssClass="form-control text_md" onchange="GetCustom(this);" EnableViewState="false"></asp:DropDownList>
				   </div>
					<div class="card-body" id="CustomLabel_div"></div>
				</div>
			</div>
			<div class="tab-pane" id="Tabs1">
				<div class="card">
					<div class="card-header">
						<asp:DropDownList ID="Field_DP" runat="server" CssClass="form-control text_md" onchange="GetField(this);"  EnableViewState="false"></asp:DropDownList>
					</div>
					<div class="card-body" id="Field_div"></div>
				</div>
			</div>
			<div class="tab-pane" id="Tabs2">
				<div class="list-group">
					<asp:Label ID="lblSys" runat="server"  EnableViewState="false"></asp:Label>
				</div>
			</div>
			<div class="tab-pane" id="Tabs3">
				<div class="list-group">
					<asp:Label ID="lblFun" runat="server"  EnableViewState="false"></asp:Label>
				</div>
			</div>
		</div>
	</div>
	<div class="col-sm-8 col-xl-7 border p-0">
		<div class="ml-3">
			<%=ZoomLa.Safe.SafeC.ReadFileStr("/manage/Template/label.htm") %>
		</div>
		<div id="Textarea">
			<asp:TextBox TextMode="MultiLine" runat="server" ID="textContent" Style="max-width: 100%; width: 100%; height: 530px;" />
		</div>
	</div>
	</div>
	<div class="clearfix"></div>
</div>
		</td>
	</tr>
	<tr>
		<td colspan="2" class="text-center">
		  <asp:LinkButton ID="SaveTem_LB" runat="server" OnClick="btnSave_Click" CssClass="btn btn-info"><i class="zi zi_floderLine" aria-hidden="true"></i> 保存模板</asp:LinkButton>
		  <a href="<%=ReturnUrl %>" class="btn btn-outline-info"><i class="zi zi_backward" zico="快退"></i> 返回列表</a>
		</td>
	</tr>
</table>
	
<div class="modal" id="userinfo_div">
	<div class="modal-dialog" style="width: 800px;">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
				<span class="modal-title"><strong id="title">用户信息</strong></span>
			</div>
			<div class="modal-body">
				  <iframe id="user_ifr" style="width:100%;height:600px;border:none;" src=""></iframe>
			</div>
		</div>
	</div>
</div>
</div></div>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Controls/ZL_Array.js"></script>
<script src="/Plugins/CodeMirror/LabelCall.js?v=1"></script>
<script src="/Design/JS/sea.js"></script>
<script type="text/javascript">
	var base64 = null;
	seajs.use(["base64"], function (instance) {
		base64 = instance;
	})
	var diag = new ZL_Dialog();
	function opentitle(url, title)
	{
		diag.title = "修改标签";
		diag.url = url;
		diag.ShowModal();
		return false;
	}
	function closeCuModal() {
		diagLabel.CloseModal();
	}
</script>
</asp:Content>