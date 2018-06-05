<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddManage.aspx.cs" Inherits="ZoomLaCMS.Manage.User.AddManage" MasterPageFile="~/Manage/I/Index.master" %>
<%@ Register TagPrefix="ZL" TagName="UserGuide" Src="~/Manage/I/ASCX/UserGuide.ascx" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>编辑管理员</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("UserManage.aspx","用户管理"),
		new Bread("AdminManage.aspx","管理员管理"),
        new Bread() {url="", text="编辑管理员",addon="" }}
		)
    %>
 	<div class="list_choice">
    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
        <li class="nav-item"><a class="nav-link active" href="#home" role="tab" data-toggle="tab">基本信息</a></li>
        <li class="nav-item"><a class="nav-link" href="#profile" role="tab" data-toggle="tab">角色设置</a></li>
        <li class="nav-item"><a class="nav-link" href="#messages" role="tab" data-toggle="tab">审核权限</a></li>
    </ul>
    <div class="tab-content container-fluid pr-0" >
        <div class="tab-pane active row sysRow" id="home">
            <table class="table table-striped table-bordered table-hover sys_table">
                <tr>
                    <th class="w12rem_lg">管理员名</th>
                    <td>
                        <asp:TextBox ID="tbdName"  CssClass="form-control max20rem" onkeydown="return GetEnterCode('focus','txtAdminTrueName');" runat="server"></asp:TextBox>
						<small class="text-muted">管理员名必须大于等于2个字符并且不能超过20个字符</small>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="管理员名不能为空" ControlToValidate="tbdName" Display="None"/>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="tbdName" ErrorMessage="不能包含特殊字符，如@，#，$，%，^，&，*，(，)，'，?，{，}，[，]，;，:等" ValidationExpression="^[^@#$%^&*()'?{}\[\];:]*$" SetFocusOnError="True" Display="None"/>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbdName" ErrorMessage="管理员名必须大于等于2个字符并且不能超过20个字符!" ValidationExpression="\S{2,20}$" SetFocusOnError="True" Display="None" />
                    </td>
                </tr>
                <tr>
                    <th>真实姓名</th>
                    <td>
                        <asp:TextBox ID="txtAdminTrueName" onkeydown="return GetEnterCode('focus','tbPwd');" runat="server" class="form-control max20rem"></asp:TextBox>
						<small class="text-muted">真实姓名必须大于等于2个字符并且不能超过20个字符</small>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="真实姓名不能为空" ControlToValidate="txtAdminTrueName" Display="None"/>
                        <asp:RegularExpressionValidator ID="R4" runat="server" ControlToValidate="txtAdminTrueName" ErrorMessage="不能包含特殊字符，如@，#，$，%，^，&，*，(，)，'，?，{，}，[，]，;，:等" ValidationExpression="^[^@#$%^&*()'?{}\[\];:]*$" Display="Dynamic" ForeColor="Red"/>
                        <asp:RegularExpressionValidator ID="R5" runat="server" ControlToValidate="txtAdminTrueName" ErrorMessage="真实姓名必须大于等于2个字符并且不能超过20个字符！" ValidationExpression="\S{2,20}$" SetFocusOnError="True" Display="Dynamic" ForeColor="Red"/>
                    </td>
                </tr>
                <tr>
                    <th>新密码</th>
                    <td>
                        <asp:TextBox ID="tbPwd" onkeydown="return GetEnterCode('focus','tbPwd1');" class="form-control max20rem" runat="server" TextMode="Password"></asp:TextBox>
						<small class="text-muted">管理员密码字符数要在6-18之间</small>
                        <asp:CompareValidator ID="CV2" runat="server" ControlToCompare="tbPwd1" ControlToValidate="tbPwd" ErrorMessage="密码与初始密码不一致" Display="Dynamic" ForeColor="Red"/>
                        <asp:RegularExpressionValidator ID="R3" runat="server" ControlToValidate="tbPwd" ErrorMessage="管理员密码字符数要在6-18之间！" ValidationExpression="\S{6,18}" SetFocusOnError="True" Display="Dynamic" ForeColor="Red" />                      
                    </td>
                </tr>
                <tr>
                    <th>确认密码</th>
                    <td>
                        <asp:TextBox ID="tbPwd1" runat="server" onkeydown="return GetEnterCode('focus','cb1');" TextMode="Password" class="form-control max20rem" ></asp:TextBox>
						<small class="text-muted">确认密码必须与密码保持一致</small>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="tbPwd" ControlToValidate="tbPwd1" ErrorMessage="密码与初始密码不一致" Display="Dynamic" ForeColor="Red" />
                     </td>
                </tr>
                 <tr>
                    <th>二级密码</th>
                    <td>
                        <asp:TextBox ID="SPwd_T" runat="server" CssClass="form-control max20rem"></asp:TextBox>
						<small class="text-muted">开发中心等增进功能需要验证此密码，初始为123456</small>
                     </td>
                </tr>
                <tr id="SetModel_Div" visible="false" runat="server">
                    <th>场景设置</th>
                    <td>
                        <asp:Label runat="server" ID="Theme_L"><span class="btn btn-outline-info btn-sm">默认场景</span></asp:Label>
                        <input type="button" value="配置" class="btn btn-outline-info btn-sm" onclick="ShowAD();" />
                        <input type="button" value="清除" class="btn btn-outline-danger btn-sm" onclick="ClearAD();" />
                        <asp:HiddenField ID="curmodel_hid" runat="server" />
                    </td>
                </tr>
                <tr runat="server" visible="false">
                    <th>所属组织</th>
                    <td class="bqright">
                        <asp:TextBox ID="txtNode" CssClass="form-control max20rem"  runat="server" Enabled="false" Text="组织结构"></asp:TextBox>
                        <input id="Button3" type="button"  value="更改组织" onclick="AddNode('link')" class="btn btn-info"  />
                        <table cellpadding="0" cellspacing="0" id="NondeTable" border="0"></table>
                        <asp:HiddenField ID="hfNode" runat="server" />
                    </td>
                </tr>
                <tr>
                    <th>选项设置</th>
                    <td>
                        <div><asp:CheckBox ID="AddUser_Chk" Checked="true" runat="server" Text="添加同名用户(自动创建一个同于管理员名的用户)" /></div>
                        <div><asp:CheckBox ID="cb1" Checked="true" runat="server" Text="允许多人同时使用此帐号登录" /></div>
                        <div><asp:CheckBox ID="cb2" Checked="true" runat="server" Text="允许管理员修改密码" /></div>
                        <div><asp:CheckBox ID="cb3"  runat="server" Text="是否锁定(超级管理员不允许锁定)" /></div>
                        <div><asp:CheckBox ID="cb4" runat="server" Text="是否启用个性桌面" /></div>
                    </td></tr>
            </table>
        </div>
        <div class="tab-pane row sysRow" id="profile">
            <table class="table table-striped table-bordered table-hover sys_table">
                <tr>
                    <th class="w12rem_lg">管理员角色设置</th>
                    <td>
                        <asp:CheckBoxList ID="cblRoleList"  runat="server" DataTextField="RoleName" DataValueField="RoleID" /></td>
                </tr>
            </table>
        </div>
        <div class="tab-pane row sysRow" id="messages">
            <table class="table table-striped table-bordered table-hover sys_table">
                <tr>
                    <th class="w12rem_lg">是否前台审核互动</th>
                    <td><asp:CheckBox ID="CheckBox1" runat="server" /></td>
                </tr>
                <tr>
                    <th>发布内容默认状态</th>
                    <td>
                        <asp:DropDownList ID="DefaultStart_DP"  class="form-control w12rem_lg" runat="server">
                            <asp:ListItem Value="99" Selected="True">已审</asp:ListItem>
                            <asp:ListItem Value="0">待审</asp:ListItem>
                            <asp:ListItem Value="-1">退稿</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </div>
        <div class="sysBtline text-center">
            <asp:Button ID="btnSubmit" class="btn btn-info" runat="server" OnClick="btnSubmit_Click" Text="保存信息" />
            <a href="AdminManage.aspx" class="btn btn-outline-info">返回列表</a>
        </div>
    </div>
	</div>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script>
        //同名用户
        function hideAdmin(chk) {
            if (chk.checked) { $("#SameNameDiv").show(); }
            else $("#SameNameDiv").hide();
        }
        //自定义场景
        function ClearAD() {
            $("#Theme_L").html("<span class='alert alert-info'>默认配置</span>");
            $.post("", { action: "scene", "adminid": "<%:AdminID%>", "config": "",model:"" }, function (data) {
                if (data != 1) { alert("保存自定义场景失败"); }
            });
            $("#curmodel_hid").val("");
        }
        function ShowAD() {
            comdiag.reload = true;
            ShowComDiag("../Scence.aspx?Source=admin&curmodel=" + $("#curmodel_hid").val(), "场景设置");
        }
        function SetConfig(config, model) {
            $("#Theme_L").html("<span class='alert alert-danger'>自定义场景</span>");
            $.post("", { action: "scene", "adminid": "<%:AdminID%>", "config": config, model: model }, function (data) {
                if (data != 1) { alert("保存自定义场景失败"); }
            });
            $("#curmodel_hid").val(model);
            CloseComDiag();
        }
    </script>
</asp:Content>