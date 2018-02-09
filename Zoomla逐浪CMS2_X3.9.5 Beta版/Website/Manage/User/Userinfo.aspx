<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Userinfo.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Userinfo" MasterPageFile="~/Manage/I/Index.master" %>
<%@ Import Namespace="ZoomLa.Model" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>会员信息</title>
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/Main.aspx","工作台"),
	new Bread("AdminManage.aspx","用户管理"),
	new Bread("UserManage.aspx","会员管理"),
	new Bread() {url="", text="会员信息",addon="当前用户:" + mu.UserName }}
	)
%>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ul class="nav nav-tabs mt_3rem">
<li class="nav-item"><a class="nav-link active show" href="#Tabs0" data-toggle="tab">基本信息</a></li>
<li class="nav-item"><a class="nav-link" href="#Tabs1" data-toggle="tab">联系信息</a></li>
<li class="nav-item"><a class="nav-link" href="#Tabs2" data-toggle="tab">其他信息</a></li>
<li class="nav-item"><a class="nav-link" href="#Tabs4" data-toggle="tab">权限角色</a></li>
</ul>
<div class="tab-content">
<div class="tab-pane active" id="Tabs0">
<table class="table table-striped table-bordered">
<tr>
	<th class="text-right w12rem_lg">用户名</th>
	<td colspan="3">
		<img title="/Images/userface/noface.png" style="width: 60px; height: 60px;" src="<%=mu.UserFace %>" onerror="shownoface(this);">
		<span><%=mu.UserName%></span>
        <span title="等级" class="text-info">[<%=ulvMod.Alias %>]</span>
		<a href="Addon/UserLogin.aspx?uname=<%=HttpUtility.UrlEncode(mu.UserName)+"&upwd="+mu.UserPwd %>" class="margin_l5" target="_blank"><i class="fa fa-external-link"></i>以此会员登录</a>
		<a href="UserModify.aspx?UserID=<%=mu.UserID %>" class="btn btn-outline-info" title="修改信息"><i class="fa fa-pencil"></i>修改</a>
		<%if (!pmu.IsNull)
            {%><a href="Userinfo.aspx?id=<%:mu.ParentUserID %>" class="btn btn-outline-info" title="点击查看"><i class="fa fa-user"></i> 推荐人：<%=pmu.UserName + "(" + pmu.UserID + ")" %></a><%}
    else
    { %><button type="button" class="btn btn-outline-info">无推荐人</button>
        <%} %>
	</td>
</tr>
<tr>
	<th class="text-right">资金管理</th>
	<td colspan="3">
		<a href="UserExp.aspx?UserID=<%=mu.UserID %>&type=1" class="btn btn-outline-info" title="管理资金">资金：<%=mu.Purse %></a>
		<a href="UserExp.aspx?UserID=<%=mu.UserID%>&type=2" class="btn btn-outline-info" title="管理银币">银币：<%=mu.SilverCoin %></a>
		<a href="UserExp.aspx?UserID=<%=mu.UserID %>&type=3" class="btn btn-outline-info" title="管理积分">积分：<%=mu.UserExp %></a>
		<a href="UserExp.aspx?UserID=<%=mu.UserID %>&type=4" class="btn btn-outline-info" title="管理点券">点券：<%=mu.UserPoint %></a>
		<a href="UserExp.aspx?UserID=<%=mu.UserID %>&type=5" class="btn btn-outline-info" title="管理虚拟币">虚拟币：<%=mu.DummyPurse %></a>
		<a href="UserExp.aspx?UserID=<%=mu.UserID %>&type=6" class="btn btn-outline-info" title="管理信誉值">信誉值：<%=mu.UserCreit %></a>
	</td>
</tr>
<tr>
	<th class="text-right">用户信息</th>
	<td colspan="3">
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
			<span class="input-group-text">ID</span>
		  </div>
		  <label class="form-control"><%=mu.UserID%></label>
		  <div class="input-group-prepend">
			<span class="input-group-text">会员组</span>
		  </div>
		  <label class="form-control"><%=GetGroupName(mu.GroupID.ToString()) %></label>
		  <div class="input-group-prepend">
			<span class="input-group-text">昵称</span>
		  </div>
		  <label class="form-control"><%=mu.HoneyName %></label>
		  <div class="input-group-prepend">
			<span class="input-group-text">Email</span>
		  </div>
		  <label class="form-control"><%=mu.Email %></label>
		  <div class="input-group-prepend">
			<span class="input-group-text">手机</span>
		  </div>
		  <label class="form-control"><%:string.IsNullOrEmpty(basemu.Mobile)?"未设置":basemu.Mobile %></label>
		  <div class="input-group-prepend">
			<span class="input-group-text">推荐码</span>
		  </div>
		  <label class="form-control"><%:GetPCode(mu.RoomID,mu.UserID) %></label>
		</div>
	</td>
</tr>
    
<tr>
	<th class="text-right">绑定平台</th>
	<td colspan="3">
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
			<span class="input-group-text"><i class="fa fa-wechat text-success"></i></span>
		  </div>
		  <asp:Label runat="server" ID="Wechat_Info_T" CssClass="form-control disabled" Text="未绑定"></asp:Label>
		  <div class="input-group-prepend">
			<asp:Button runat="server" ID="Wechat_UnBind_Btn" class="btn btn-info input-group-text" disabled="disabled" CommandArgument="wechat" Text="解除绑定" OnClick="Plat_UnBind_Btn_Click" OnClientClick="return confirm('确定要解除绑定吗,相关信息将会移除!');" />
		  </div>
		  <div class="input-group-append">
			<input type="button" class="btn btn-outline-info input-group-text" value="绑定用户" onclick="showBindWechat();"/>
		  </div>
		</div>
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
			<span class="input-group-text"><i class="fa fa-weibo text-danger"></i></span>
		  </div>
		  <asp:Label runat="server" ID="Sina_Info_T" CssClass="form-control disabled" Text="未绑定"></asp:Label>
		  <div class="input-group-append">
			<span class="input-group-btn">
				<asp:Button runat="server" ID="Sina_UnBind_Btn" class="btn btn-info" disabled="disabled" CommandArgument="sina" Text="解除绑定" OnClick="Plat_UnBind_Btn_Click" OnClientClick="return confirm('确定要解除绑定吗,相关信息将会移除!');" />
			</span>
		  </div>
		</div>
		<div class="input-group mb-3">
		  <div class="input-group-prepend">
			<span class="input-group-text"><i class="fa fa-qq text-info"></i></span>
		  </div>
		  <asp:Label runat="server" ID="QQ_Info_T" CssClass="form-control disabled" Text="未绑定"></asp:Label>
		  <div class="input-group-append">
			<span class="input-group-btn">
				<asp:Button runat="server" ID="QQ_UnBind_Btn" class="btn btn-info" disabled="disabled" CommandArgument="qq" Text="解除绑定" OnClick="Plat_UnBind_Btn_Click" OnClientClick="return confirm('确定要解除绑定吗,相关信息将会移除!');" />
			</span>
		  </div>
		</div>
        <script>
            function showBindWechat()
            {
                ShowComDiag("Addon/BindWechat.aspx?UserID=<%:UserID%>","绑定微信");
            }
        </script>
	</td>
</tr>
<tr>
	<th class="text-right">提示问题</th>
	<td><%:mu.Question %></td>
	<th class="text-right">问题答案</th>
	<td><%:mu.Answer %></td>
</tr>
<tr>
	<th class="text-right">最后登录时间</th>
	<td><%=mu.LastLoginTimes.ToString("yyyy年MM月dd日 HH:mm")%></td>
	<th class="text-right">最后登录IP</th>
	<td><%=mu.LastLoginIP+"("+GetIpLocation(mu.LastLoginIP)+")" %></td>
</tr>
<tr>
	<th class="text-right">最近活跃时间</th>
	<td><%=mu.LastActiveTime.ToString("yyyy年MM月dd日 HH:mm")%></td>
	<th class="text-right">密码修改时间</th>
	<td><%=mu.LastPwdChangeTime%></td>
</tr>
<tr>
	<th class="text-right">已发布文章数(统计数)</th>
	<td>共计<%=GetCount()%>篇</td>
	<th class="text-right">云盘空间(占用数)</th>
	<td><%=GetCloud()%>
		<asp:LinkButton ID="CloudManage" runat="server" OnClick="CloudManage_Click" ForeColor="Red">&nbsp;[<%=cloud()%>]</asp:LinkButton>
	</td>
</tr>
</table>
</div>
<div class="tab-pane" id="Tabs1">
<table class="table table-striped table-bordered table-hover">
<tbody>
	<asp:Repeater ID="BaseMU_RPT" runat="server">
		<ItemTemplate>
			<tr>
				<th class="text-right w12rem_lg">真实姓名</th>
				<td><%:mu.TrueName%></td>
				<th class="text-right w12rem_lg ">性别</th>
				<td><%#(Eval("UserSex","{0}")=="True") ? "男" : "女" %></td>
			</tr>
			<tr>
				<th class="text-right">出生日期</th>
				<td><%#Eval("BirthDay")%></td>
				<th class="text-right">办公电话</th>
				<td><%#Eval("OfficePhone")%></td>
			</tr>
			<tr>
				<th class="text-right">家庭电话</th>
				<td><%#Eval("HomePhone")%></td>
				<th class="text-right">传真</th>
				<td><%#Eval("Fax")%></td>
			</tr>
			<tr>
				<th class="text-right">省市县 </th>
				<td><%#Eval("Province") %> - <%#Eval("City") %> - <%#Eval("County") %></td>
				<th class="text-right">QQ号码 </th>
				<td><%#Eval("QQ") %></td>
			</tr>
			<tr>
				<th class="text-right">联系地址</th>
				<td><%#Eval("Address") %></td>
				<th class="text-right">邮政编码</th>
				<td><%#Eval("ZipCode") %></td>
			</tr>
			<tr>
				<th class="text-right">身份证号码</th>
				<td><%#Eval("IDCard") %></td>
				<th class="text-right">个人主页</th>
				<td><%#Eval("HomePage") %></td>
			</tr>
			<tr>
				<th class="text-right">头像宽度</th>
				<td><%#Eval("FaceWidth") %></td>
				<th class="text-right">头像高度</th>
				<td><%#Eval("FaceHeight") %></td>
			</tr>

			<tr>
				<th class="text-right">公司名称</th>
				<td style="height: 22px"><%# mu.CompanyName%></td>
				<th class="text-right">公司简介</th>
				<td><%#mu.CompanyDescribe %></td>
			</tr>
		</ItemTemplate>
	</asp:Repeater>
</tbody>
</table>
</div>
<div class="tab-pane" id="Tabs2">
<table class="table table-striped table-bordered">
<tbody>
	<tr>
		<th class="text-right">商铺认证有效期截止</th>
		<td>
			<asp:Label ID="txtCerificateDeadLine" runat="server"></asp:Label></td>
		<th class="text-right">有效期截止时间</th>
		<td>
			<asp:Label ID="txtDeadLine" runat="server"></asp:Label></td>
	</tr>
	<tr>
		<th class="text-right">签名档</th>
		<td>
			<asp:Label ID="tbSign" runat="server" TextMode="MultiLine" Width="253px"
				Height="60"></asp:Label></td>
		<th class="text-right">隐私设定</th>
		<td>
			<asp:RadioButtonList ID="tbPrivacy" runat="server" Visible="false">
				<asp:ListItem Selected="True" Value="0">公开信息</asp:ListItem>
				<asp:ListItem Value="1">只对好友公开</asp:ListItem>
				<asp:ListItem Value="2">完全保密</asp:ListItem>
			</asp:RadioButtonList>
			<asp:Label runat="server" ID="Privancy" Text=""></asp:Label>
		</td>
	</tr>
	<tr>
        <td colspan="4" id="html_td"></td>
	</tr>
</tbody>
</table>
</div>
<script>
    $(function(){
        $("#html_td").load("/AdminMVC/Common/UserBaseField",{"uid":"<%:UserID%>",mode:"1"});
    })
</script>
<div class="tab-pane" id="Tabs4">
<table class="table table-striped table-bordered table-hover">
<tr>
	<th style="width: 200px;">管理员角色设置</th>
	<td valign="top">
		<asp:CheckBoxList ID="cblRoleList" runat="server" /></td>
</tr>
<tr>
	<th>迁移会员组</th>
	<td>
		<asp:DropDownList runat="server" ID="UserGroup_DP" OnSelectedIndexChanged="UserGroup_DP_SelectedIndexChanged" AutoPostBack="true" DataTextField="GroupName" DataValueField="GroupID" CssClass="form-control text_300"></asp:DropDownList>
	</td>
</tr>
<tr>
	<th>特许商品</th>
	<td>
		<input type="button" value="选择商品" onclick="upro.showdiag();" class="btn btn-info" />
		<asp:Button runat="server" ID="AddUPro_Btn" OnClick="AddUPro_Btn_Click" class="btn btn-info" Text="保存修改" />
		<div class="uprolist" id="uprolist">
			<asp:Repeater runat="server" ID="UPRONode_RPT" OnItemDataBound="UPRONode_RPT_ItemDataBound">
				<ItemTemplate>
					<div>
						<div class="up_nodeitem"><%#Eval("NodeName") %></div>
						<asp:Repeater runat="server" ID="UPro_RPT">
							<ItemTemplate>
								<div class="btn btn-default up_proitem">
									<div class="proname"><%#Eval("Proname") %></div>
									<a href="javascript:;" style="z-index: 10;" class="pull-right" onclick="upro.del(this,'<%#Eval("ID") %>');"><i class="fa fa-trash-o"></i></a>
								</div>
							</ItemTemplate>
						</asp:Repeater>
					</div>
				</ItemTemplate>
			</asp:Repeater>
		</div>
		<asp:HiddenField runat="server" ID="UProIDS_Hid" />
		<script>
			var upro = {};
			upro.showdiag = function () { ShowComDiag("<%:customPath2%>Shop/ProductsSelect.aspx?callback=selupro", "选择商品"); }
			upro.del = function (btn, proid) {
				var ids = $("#UProIDS_Hid").val();
				ids = ids.replace("," + proid + ",", ",");
				$("#UProIDS_Hid").val(ids);
				$(btn).closest(".up_proitem").remove();
			}
			function selupro(list) {
				list = JSON.parse(list);
				var ids = list.GetIDS("id");
				$("#UProIDS_Hid").val($("#UProIDS_Hid").val() + "," + ids);
				$("#AddUPro_Btn").click();
			}
		</script>
		<div class="Creat_tips">
    <div class="alert alert-info fade in margin_b2px">
      <button class="close" aria-hidden="true" type="button" data-dismiss="alert">×</button>
      <p>说明：会员特许商品存于ZL_User_BindPro表中，查询需要创建函数查询，其语法为：<br/>
      SELECT * FROM ZL_Commodities WHERE ID IN
     (SELECT CAST(id AS INT) FROM ZL_StringSplitTable
     (SELECT ProIDS FROM ZL_User_BindPro WHERE UserID='[UserID]'))<br/><br/>
          *[UserID]为变量
   </p>
    </div>
  </div>
	  
	</td>
</tr>
</table>
</div>
</div>
<div class="text-center">
<a href="UserModify.aspx?UserID=<%=UserID %>" class="btn btn-outline-info" title="修改信息"><i class="fa fa-pencil"></i>修改</a>
<asp:Button ID="LockUser" CssClass="btn btn-outline-info" runat="server" Text="禁止登录" OnClick="LockUser_Click" />
<asp:Button ID="ClearCode_B" runat="server" Text="取消验证器" OnClick="ClearCode_B_Click" CssClass="btn btn-outline-info" />
<asp:Button runat="server" ID="UPClient_Btn" Text="升级为客户" class="btn btn-outline-info" OnClick="UPClient_Btn_Click" />
<input type="button" class="btn btn-outline-info" value="能力中心信息" onclick="ShowComDiag('Addon/UPToPlat.aspx?ID=<%:UserID%>','能力信息');" />
<asp:Button runat="server" ID="Approve_B" Text="聚合认证" class="btn btn-outline-info" OnClick="Approve_B_Click" Visible="false" />
<asp:Button runat="server" ID="ApproveFailure_B" Text="取消认证" class="btn btn-outline-info" OnClick="ApproveFailure_B_Click" Visible="false" />
<asp:Button ID="DelUserPost_Btn" runat="server" Text="删除用户帖子" OnClientClick="return confirm('确定要删除吗!!');" OnClick="DelUserPost_Btn_Click" class="btn btn-outline-info" />
<a href="../Shop/OrderList.aspx?UserID=<%=UserID %>" class="btn btn-outline-info">用户订单</a>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
.suinfo label { min-width: 90px; }

</style>
<script src="/JS/DatePicker/WdatePicker.js"></script>
<script src="/JS/Modal/APIResult.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Controls/ZL_Array.js"></script>
<script src="/JS/ZL_Content.js"></script>
<script>
    $().ready(function () {
        $("[href='#<%=ZoomLa.BLL.SafeSC.GetRequest("tabs") %>']").tab('show');
        $("#mf_body").find(".fd_td_r").attr("colspan","3");
        if("<%=Request.QueryString["show"]%>"=="diag"){$("#navHolder").hide();}
    });
        function closeDiag() { CloseComDiag(); }
</script>
</asp:Content>
