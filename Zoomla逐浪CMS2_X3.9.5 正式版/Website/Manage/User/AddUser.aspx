<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="ZoomLaCMS.Manage.User.AddUser"  MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
<script src="/dist/js/bootstrap-switch.js"></script><title>添加会员</title>
    <%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/I/Main.aspx","工作台"),
        new Bread("/{manage}/user/UserManage.aspx","用户管理"),
		 new Bread("UserManage.aspx","会员管理"),
        new Bread() {url="", text="添加会员",addon= "" }}
        )
    %>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container-fluid pr-0 mt_3rem">
	<div class="row sysRow table-responsive-md">
        <table class="table table-striped table-bordered sys_table">
            <tr>
                <th colspan="4" class="text-center">添加会员 </th>
            </tr>
            <tr>
                <th scope="col" class="text-right w12rem_lg" >用户名<span class="text-danger">*</span></th>
                <td scope="col">
                    <ZL:TextBox runat="server" ID="tbUserName" TabIndex="1" onkeydown="return GetEnterCode('focus','WorkNum_T');" CssClass="form-control max20rem" AllowEmpty="false" ValidType="String"></ZL:TextBox>
                    <div id="check" runat="server"></div></td>
                 <th scope="col" class="text-right w12rem_lg">工号</th>
                <td scope="col">
                    <asp:TextBox ID="WorkNum_T" Cssclass="form-control max20rem" TabIndex="2"  onkeydown="return GetEnterCode('focus','txtpassword');" runat="server"></asp:TextBox>
                </td>

            </tr>
            <tr>
                <th class="text-right">用户密码<span class="text-danger">*</span></th>
                <td colspan="3">
					<div class="input-group">
					  <ZL:TextBox runat="server" ID="txtpassword" TabIndex="1" onkeydown="return GetEnterCode('focus','WorkNum_T');" CssClass="form-control max20rem" AllowEmpty="false" ValidType="Custom" ValidExpressionCustom="[\s\S]{6,}" ValidError="密码不能少于6位"></ZL:TextBox>
						<div class="input-group-append">
						<input type="button" value="随机密码" onclick="SetPassWord('txtpassword');" class="input-group-text btn" />
					  </div>
					</div>
                </td>
            </tr>
           
            <tr>
                <th class="text-right">E-mail<span  class="text-danger">*</span></th>
                <td>
                    <ZL:TextBox runat="server" ID="tbEmail" TabIndex="4" onkeydown="return GetEnterCode('focus','txtHoneyName');" CssClass="form-control max20rem" AllowEmpty="false" ValidType="Mail"></ZL:TextBox>
                    <span class="red existemail" style="display:none;" >邮箱已被注册!</span>
                </td>
                <th class="text-right">呢称</th>
                <td>
                    <asp:TextBox ID="txtHoneyName" runat="server" TabIndex="5" onkeydown="return GetEnterCode('focus','tbQuestion');" class="form-control max20rem"></asp:TextBox>
            </tr>
            <tr>
                <th class="text-right">所属会员组</th>
                <td >
                    <asp:DropDownList ID="DDLGroup" runat="server" TabIndex="8" onkeydown="return GetEnterCode('focus','tbTrueName');" class="btn btn-default dropdown-toggle max20rem"></asp:DropDownList></td>
                <th width="224" class="text-right">VIP类型</th>
                <td width="515">
                    <input type="checkbox" runat="server" id="VIPUser" class="switchChk" />
            </tr>
            <tr>
                <th class="text-right">真实姓名</th>
                <td >
                    <asp:TextBox ID="tbTrueName" runat="server" class="form-control max20rem" TabIndex="9" onkeydown="return GetEnterCode('focus','tbUserSex');"></asp:TextBox></td>
                <th class="text-right">性别</th>
                <td >
                    <asp:RadioButtonList ID="tbUserSex" runat="server"  TabIndex="10" onkeydown="return GetEnterCode('focus','tbBirthday');" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True" Value="1">男</asp:ListItem>
                        <asp:ListItem Value="0">女</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <th class="text-right">出生日期</th>
                <td>
                    <asp:TextBox ID="tbBirthday" runat="server" onblur="setday(this);" TabIndex="11" onkeydown="return GetEnterCode('focus','tbOfficePhone');" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd' });" class="form-control max20rem"></asp:TextBox></td>
                <th class="text-right">办公电话</th>
                <td >
                    <asp:TextBox ID="tbOfficePhone" runat="server" class="form-control max20rem" TabIndex="12" onkeydown="return GetEnterCode('focus','tbHomePhone');"></asp:TextBox></td>
            </tr>
            <tr>
                <th class="text-right">家庭电话</th>
                <td >
                    <asp:TextBox ID="tbHomePhone" runat="server" class="form-control max20rem"  TabIndex="13" onkeydown="return GetEnterCode('focus','tbFax');"></asp:TextBox></td>
                <th  class="text-right">推荐人</th>
                <td>
                    <asp:TextBox ID="ParentUser_T" runat="server" Cssclass="form-control max20rem" TabIndex="14"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <th class="text-right">手机号码</th>
                <td>
                    <ZL:TextBox ID="tbMobile" runat="server" class="form-control max20rem" TabIndex="15" onkeydown="return GetEnterCode('focus','tbPHS');" ValidType="MobileNumber" ></ZL:TextBox>
                </td>
                <th  class="text-right">头像地址</th>
                <td>
                    <asp:TextBox ID="tbUserFace" runat="server" TabIndex="26" onkeydown="return GetEnterCode('focus','tbFaceWidth');" class="form-control max20rem"></asp:TextBox></td>
            </tr>
            <tr>
                <th class="text-right">联系地址</th>
                <td>
                    <asp:TextBox ID="tbAddress" runat="server" Columns="40" class="form-control max20rem"  TabIndex="17" onkeydown="return GetEnterCode('focus','tbZipCode');" ></asp:TextBox></td>
                <th class="text-right">邮政编码</th>
                <td>
                    <ZL:TextBox ID="tbZipCode" runat="server" class="form-control max20rem"  TabIndex="18" onkeydown="return GetEnterCode('focus','tbIDCard');" ValidType="PostalCode" ></ZL:TextBox></td>
            </tr>
            <tr>
                <th class="text-right">身份证号码</th>
                <td>
                    <asp:TextBox ID="tbIDCard" runat="server" Columns="40" class="form-control max20rem"  TabIndex="19" onkeydown="return GetEnterCode('focus','tbHomepage');"></asp:TextBox></td>
                <th class="text-right">个人主页</th>
                <td>
                    <asp:TextBox ID="tbHomepage" runat="server" Columns="40" class="form-control max20rem" TabIndex="20" onkeydown="return GetEnterCode('focus','tbQQ');">http://</asp:TextBox></td>
            </tr>
            <tr>
                <th class="text-right">QQ号码</th>
                <td>
                    <asp:TextBox ID="tbQQ" runat="server" class="form-control max20rem" TabIndex="21" onkeydown="return GetEnterCode('focus','tbFax');"></asp:TextBox></td>
                <th class="text-right">传真</th>
                <td>
                    <asp:TextBox ID="tbFax" runat="server" class="form-control max20rem" TabIndex="14" onkeydown="return GetEnterCode('focus','tbMobile');"></asp:TextBox></td>
            </tr>
            <tr>
                <th class="text-right">签名档</th>
                <td>
                    <asp:TextBox ID="tbSign" runat="server" class="form-control max20rem" TabIndex="29" onkeydown="return GetEnterCode('focus','btnSave');" TextMode="MultiLine" Width="300" Height="60"></asp:TextBox></td>
                <th class="text-right">隐私设定</th>
                <td>
                    <asp:RadioButtonList ID="tbPrivacy" TabIndex="30" onkeydown="return GetEnterCode('focus','lblHtml');" runat="server">
                        <asp:ListItem Selected="True" Value="0">公开信息</asp:ListItem>
                        <asp:ListItem Value="1">只对好友公开</asp:ListItem>
                        <asp:ListItem Value="2">完全保密</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
           <%-- <asp:Literal ID="lblHtml" runat="server"></asp:Literal>--%>
            <tr><td colspan="4" id="html_td">

                </td></tr>
            <tr>
                <td colspan="4" class="text-center">
                    <asp:Button ID="btnSave" runat="server" CssClass="btn btn-info" TabIndex="31"  Text="保存会员信息" OnClick="btnSave_Click"/>
                    <asp:Button ID="btnCancel" CssClass="btn btn-outline-info" runat="server" TabIndex="32" Text="取消" OnClientClick="location.href='UserManage.aspx';return false;" />
                </td>
            </tr>
        </table>
	</div>
    </div>
<script>
    $(function () {
        $("#html_td").load("/AdminMVC/Common/UserBaseField", { "uid": "-1", mode: "0" });
        })
</script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/DatePicker/WdatePicker.js"></script>
    <script src="/JS/Modal/APIResult.js"></script>
    <script>
        function SetPassWord(id) {
            $("#" + id).val(GetRanPass(6));
        }
        $(function () {
            SetPassWord('txtpassword');
            //existemail
            $("#tbEmail").change(function () {
                $.post("/API/UserCheck.ashx", { action: "ExistEmail", email: $(this).val() }, function (data) {
                    var model = APIResult.getModel(data);
                    if (APIResult.isok(model)) {
                        $(".existemail").hide();
                        $("#btnSave").removeAttr("disabled");
                    }
                    else {
                        $(".existemail").show();
                        $("#btnSave").attr("disabled", "disabled");
                    }
                })
            });
        })
    </script>
</asp:Content>
