<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WDConfig.aspx.cs" Inherits="ZoomLaCMS.Manage.Guest.WDConfig" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>问答配置</title>
<link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("WdCheck.aspx","问答管理"),
        new Bread() {url="", text="问答配置",addon="" }}
		)
    %>
<div class="Creat_tips list_choice">
<div class="alert alert-info alert-dismissible fade show">
  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
  <h4>提示!</h4>
  <p class="pl-5"> 
	  本设置针对问答模块定义，可点击<a href="/Ask" target="_blank" class="btn btn-info">问答中心</a>访问前端功能</p>
  <p>注意事项: 查看、回复、提问权限如不勾选用户组,则代表无用户限制! </p>
</div>
</div>
<ul class="nav nav-tabs" role="tablist">
<li class="nav-item" role="presentation" class="active"><a class="nav-link active" href="#auth" aria-controls="auth" role="tab" data-toggle="tab">权限管理</a></li>
<li class="nav-item" role="presentation"><a class="nav-link" href="#exp" aria-controls="exp" role="tab" data-toggle="tab">奖励设定</a></li>
</ul>
<div class="tab-content">
	<div role="tabpanel" class="tab-pane active table-responsive-md" id="auth">
		<table class="table table-striped table-bordered table-hover sys_table">
			<tr>
			<th class="w12rem_lg">查看权限</th>
			<td>
				<asp:Repeater ID="selGroup_Rpt" EnableViewState="false" runat="server">
					<ItemTemplate>
						<label><input type="checkbox" name="selGroup" <%#GetCheck(1) %> value="<%#Eval("GroupID") %>" /><%#Eval("GroupName") %></label> 
					</ItemTemplate>
				</asp:Repeater>
			</td>
		</tr>
		<tr>
			<th>回复权限</th>
			<td>
				<asp:Repeater ID="ReplyGroup_Rpt"  EnableViewState="false" runat="server">
					<ItemTemplate>
						<label><input type="checkbox" name="replyGroup" <%#GetCheck(2) %> value="<%#Eval("GroupID") %>" /><%#Eval("GroupName") %></label> 
					</ItemTemplate>
				</asp:Repeater>
			</td>
		</tr>
		<tr>
			<th>提问权限</th>
			<td>
				 <asp:Repeater ID="QuestGroup_Rpt"  EnableViewState="false" runat="server">
					<ItemTemplate>
						<label><input type="checkbox" name="questGroup" <%#GetCheck(3) %> value="<%#Eval("GroupID") %>" /><%#Eval("GroupName") %></label>
					</ItemTemplate>
				</asp:Repeater>
			</td>
		</tr>
		<tr>
			<th>提问登录</th>
			<td>
			   <input type="checkbox" id="IsLogin" class="switchChk" runat="server" />
			</td>
		</tr>
		<tr>
			<th>回复登录</th>
			<td>
				<input type="checkbox" id="IsReply" class="switchChk" runat="server" />
			</td>
		</tr>
		</table>
	</div>
	<div role="tabpanel" class="tab-pane" id="exp">
		<table class="table table-striped table-bordered table-hover sys_table table-responsive-md">
			<tr>
		<th class="w12rem_lg">奖励类型</th>
		<td>
			<asp:RadioButtonList ID="PointType_R" runat="server" RepeatDirection="Horizontal">
				<asp:ListItem Value="Point" Selected="True" Text="积分"></asp:ListItem>
				<asp:ListItem Value="SIcon" Text="银币"></asp:ListItem>
				<asp:ListItem Value="UserPoint" Text="点券"></asp:ListItem>
				<asp:ListItem Value="DummyPoint" Text="虚拟币"></asp:ListItem>
				<asp:ListItem Value="Credit" Text="信誉点"></asp:ListItem>
			</asp:RadioButtonList>
		</td>
	</tr>
	<tr>
		<th>提问奖励</th>
		<td>
			<asp:TextBox ID="QuestPoint_T" Text="0" runat="server" CssClass="form-control text_md num"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<th>回复奖励</th>
		<td>
			<asp:TextBox ID="Point_T" runat="server" Text="0" CssClass="form-control text_md num"></asp:TextBox>
		</td>
	</tr>
	<tr>
		<th>采纳奖励 <span class="text-danger">*</span></th>
		<td>
			<asp:TextBox ID="GPoint_T" runat="server" Text="0" CssClass="form-control text_md num"></asp:TextBox><small class="text-muted">问题被采纳推荐获得的奖励</small>
		</td>
	</tr>
		</table>
        </div>
</div>
<div class="text-center">
	<asp:Button ID="Save_B" runat="server" OnClientClick="return CheckData()" OnClick="Save_B_Click" CssClass="btn btn-info" Text="保存" />
	<a href="javascript:;" onclick="clearData()" class="btn btn-outline-info">重置</a>
</div>
<script src="/JS/ZL_Regex.js"></script>
<script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
<script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
<script>
	function CheckData() {
		var bl = true;
		$(".num").each(function () {
			if (!ZL_Regex.isNum($(this).val())) {
				alert("数据格式不正确!");
				$(this).focus();
				bl = false;
				return false;
			}
		});
		return bl;
	}
	var diag = new ZL_Dialog();
	function showdiv(div_id, f) {
		$("#dataField").val(f);
		var div_obj = $("#" + div_id);
		var h = (document.documentElement.offsetHeight) / 2;
		var w = (document.documentElement.offsetWidth - 400) / 2;
		div_obj.animate({ opacity: "show", left: w, top: 100, width: div_obj.width, height: div_obj.height }, 300);
		div_obj.focus();
	}
	function selgroup(groupJson) {
		var Gnames = "";
		var Gids = "";
		for (var i = 0; i < groupJson.length; i++) {
			Gnames += "[" + groupJson[i].Gname + "],";
			Gids += groupJson[i].Gid + ",";
		}
		Gnames = Gnames.substring(0, Gnames.length - 1);
		Gids = Gids.substring(0, Gids.length - 1);
		var flag = $("#dataField").val();
		$("#" + flag + "T").val(Gnames);
		$("#" + flag + "D").val(Gids);
		$("#div_group").toggle();
	}
	function clearData() {
		$("input[type='text']").val('0');
		$("input[type='checkbox']").each(function (i, v) {
			v.checked = false;
		});
	}
</script>
</asp:Content>
