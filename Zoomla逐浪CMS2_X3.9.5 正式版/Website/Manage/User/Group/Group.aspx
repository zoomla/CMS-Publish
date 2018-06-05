<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Group.aspx.cs" Inherits="ZoomLaCMS.Manage.User.GroupPage"   MasterPageFile="~/Manage/I/Index.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <link type="text/css" href="/dist/css/bootstrap-switch.min.css"  rel="stylesheet"/>
    <script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
    <script type="text/javascript" src="/JS/ZL_Regex.js"></script>
    <title><%=Resources.L.会员组编辑 %></title>
<%=Call.SetBread(new Bread[] {
        new Bread() {url="", text="后台管理",addon= "" },
		new Bread() {url="", text="会员管理",addon= "" },
		new Bread("GroupManage.aspx","会员组管理")
		}
        )
    %>	
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
  <table class="table table-striped table-bordered table-hover  sys_table">
    <tr>
      <th class="spacingtitle text-center" colspan="2" align="center"><asp:Literal ID="LTitle" runat="server" Text="<%$Resources:L,添加会员组 %>"></asp:Literal></th>
    </tr>
    <tr>
        <th scope="col" class="tdbgleft w12rem_lg" ><strong><%=Resources.L.父会员组名称 %></strong></th>
        <td scope="col"><asp:Label ID="Label1" runat="server"></asp:Label></td>
    </tr>
    <tr>
      <th class="tdbgleft"><strong><%=Resources.L.会员组名称 %><span class="text-danger">*</span></strong></th>
      <td><asp:TextBox class="form-control max20rem" ID="TxtGroupName" runat="server" MaxLength="30" />
          <asp:Label ForeColor="Red" ID="CheckName" runat="server" Text=""></asp:Label>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor="Red" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtGroupName"><%=Resources.L.会员组名称不能为空 %></asp:RequiredFieldValidator></td>
    </tr>
    <tr>
      <th class="tdbgleft"><strong><%=Resources.L.会员组别名 %></strong></th>
      <td><asp:TextBox class="form-control max20rem"  ID="OtherName" runat="server"  MaxLength="200" /></td>
    </tr>
    <tr>
      <th class="tdbgleft"><strong><%=Resources.L.会员组说明 %></strong></th>
      <td><asp:TextBox class="form-control m50rem_50" ID="TxtDescription" runat="server" TextMode="MultiLine"  Height="60px" /></td>
    </tr>
    <tr>
      <th class="tdbgleft"><strong><%=Resources.L.是否为招生人员 %></strong></th>
      <td>
           <input type="checkbox" runat="server" id="txt_Enroll" class="switchChk" />
      </td>
    </tr>
      <tr>
          <th class="tdbgleft"><strong><%=Resources.L.班级成员 %></strong></th>
          <td>
              <asp:RadioButtonList ID="ClassEnroll_Radio" RepeatDirection="Horizontal" runat="server">
                  <asp:ListItem Value="" Selected="True" Text="<%$Resources:L,学生 %>"></asp:ListItem>
                  <asp:ListItem Value="isteach" Text="<%$Resources:L,教师 %>"></asp:ListItem>
                  <asp:ListItem Value="isfamily" Text="<%$Resources:L,家长 %>"></asp:ListItem>
              </asp:RadioButtonList>
          </td>
      </tr>
    <tr>
      <th class="tdbgleft"><strong><%=Resources.L.是否注册可选 %></strong></th>
      <td>
          <input type="checkbox" runat="server" id="RBLReg" class="switchChk" checked="checked" />
     </td>
    </tr>
    <tr>
      <th class="tdbgleft"><strong><%=Resources.L.是否为企业用户组 %></strong></th>
      <td>
          <input type="checkbox" runat="server" id="RBcompanyG" class="switchChk" />
      </td>
    </tr>
    <tr>
      <th class="tdbgleft"><strong><%=Resources.L.是否为VIP用户组 %></strong></th>
      <td>
          <input type="checkbox" runat="server" id="RBVipG" class="switchChk" />
     </td>
    </tr>
    <tr>
      <th class="tdbgleft"><strong><%=Resources.L.VIP默认级别 %></strong></th>
      <td><asp:TextBox class="form-control max20rem" runat="server" ID="txtVIPNum" Text="0"></asp:TextBox>
        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtVIPNum" ErrorMessage="<%$Resources:L,请输入有效数字 %>" MaximumValue="999" MinimumValue="0" Type="Integer"></asp:RangeValidator></td>
    </tr>
    <tr>
        <th class="tdbgleft"><strong><%=Resources.L.余额升级费用 %></strong></th>
        <td>
            <asp:TextBox class="form-control max20rem int" ID="UpGradeMoney" runat="server">0</asp:TextBox>
			<small class="text-muted"><%=Resources.L.为0或空则不允许购买 %></small>
			</td>
    </tr>
      <tr>
          <th class="tdbgleft"><strong><%=Resources.L.银币升级费用 %></strong></th>
          <td>
              <asp:TextBox class="form-control max20rem int" ID="UpSIcon_T" runat="server">0</asp:TextBox></td>
      </tr>
      <tr>
          <th class="tdbgleft"><strong><%=Resources.L.积分升级费用 %></strong></th>
          <td>
              <asp:TextBox class="form-control max20rem int" ID="UpPoint_T" runat="server">0</asp:TextBox></td>
      </tr>
    <tr>
      <th class="tdbgleft"><strong><%=Resources.L.返利比率 %></strong></th>
      <td><asp:TextBox class="form-control max20rem" ID="txtRebateRate" runat="server">0</asp:TextBox>
	  <small class="text-muted">值范围:0-100,0为不启用</small>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="<%$Resources:L,请输入有效数据 %>" Operator="GreaterThanEqual" Type="Double" ValueToCompare="0" Display="Dynamic" ForeColor="Red" ControlToValidate="txtRebateRate"></asp:CompareValidator>
        <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="<%$Resources:L,请输入有效数据 %>" Operator="LessThanEqual" Type="Double" ValueToCompare="100" ForeColor="Red" Display="Dynamic"  ControlToValidate="txtRebateRate"></asp:CompareValidator></td>
    </tr>
    <tr>
      <th class="tdbgleft"><strong><%=Resources.L.信誉值 %></strong></th>
      <td><asp:TextBox class="form-control max20rem" ID="txtCreit" runat="server">0</asp:TextBox>
		<small class="text-muted">(<%=Resources.L.用户达到多少信誉值可升级为此等级 %>)</small>
        <asp:CompareValidator ID="CompareValidator3" runat="server" ErrorMessage="<%$Resources:L,请输入有效数据 %>" Operator="GreaterThanEqual" Type="Integer" ValueToCompare="0"  ControlToValidate="txtCreit"></asp:CompareValidator></td>
    </tr>
    <tr>
      <th class="tdbgleft"><strong><%=Resources.L.付费方式 %></strong></th>
      <td>
	  
	  <div class="input-group">
	  <div class="input-group-prepend">
		<span class="input-group-text"><%=Resources.L.每个包年会员费为 %></span>
	  </div>
	  <asp:TextBox class="form-control max20rem" ID="Byear" runat="server">50</asp:TextBox>
	   <div class="input-group-prepend ">
		<span class="input-group-text"><%=Resources.L.每个月最多使用 %></span>
	  </div>
	  <asp:TextBox class="form-control max20rem" ID="Payment" runat="server">50</asp:TextBox>
	  <div class="input-group-append">
		<span class="input-group-text"><%=Resources.L.篇文章 %></span>
	  </div>
	</div>
	  
        <asp:CompareValidator ID="CompareValidator5" runat="server" ErrorMessage="请输入有效数据！" Operator="GreaterThanEqual" Type="Double" ValueToCompare="0"  ControlToValidate="Payment"></asp:CompareValidator></td>
    </tr>
  </table>
    <table class="table table-striped table-bordered table-hover">
    <tr>
      <td colspan="2" class="text-center">
        <asp:Button ID="EBtnSubmit" Text="<%$Resources:L,保存设置 %>" OnClick="EBtnSubmit_Click" runat="server" class="btn btn-info"/>
        <a href="GroupManage.aspx" class="btn btn-outline-info">返回列表</a></td>
    </tr>
  </table>
  </div>
  </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        function SelectRule() {
            window.open('RuleList.aspx?id=<%=Mid %>', '', 'width=600,height=450,resizable=0,scrollbars=yes');
        }
        function VIP() {
            var dd = document.getElementByNames("RBVipG");
        }
        $(function () {
            ZL_Regex.B_Num(".int");
        })
    </script>
</asp:Content>