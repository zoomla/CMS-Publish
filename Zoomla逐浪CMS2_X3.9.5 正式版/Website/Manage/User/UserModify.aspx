<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserModify.aspx.cs" Inherits="ZoomLaCMS.Manage.User.UserModify" MasterPageFile="~/Manage/I/Index.master" %>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagName="SFile" TagPrefix="ZL" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>修改用户信息</title>
<script src="/JS/ICMS/area.js"></script>
<script src="/JS/Controls/ZL_PCC.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
new Bread("/{manage}/Main.aspx","工作台"),
	new Bread("/{manage}/User/UserManage.aspx","会员管理"),
	new Bread() {url="", text="修改会员信息 [当前用户："+uinfo.UserName,addon="]" }}
	)
%>
<div class="list_choice">
<ul class="nav nav-tabs">
	<li class="nav-item"><a class="nav-link active" href="#Tabs0" onclick="tab1()" data-toggle="tab">基本信息</a></li>
	<li class="nav-item"><a class="nav-link" href="#Tabs1" data-toggle="tab" onclick="tab2()">联系信息</a></li>
	<li class="nav-item"><a class="nav-link" href="#Tabs2" data-toggle="tab" onclick="tab3()">扩展信息</a></li>
	<li class="nav-item"><a class="nav-link" href="#Tabs3" data-toggle="tab" id="platInfo_A" runat="server" visible="false">能力中心信息</a></li>
        <li class="nav-item"><a class="nav-link" href="#Tabs4" data-toggle="tab">权限角色</a></li>
    </ul>
    <div class="tab-content container-fluid pr-0">
        <div class="tab-pane active row sysRow table-responsive-md" id="Tabs0">
            <table class="table table-striped table-bordered table-hover sys_table">
                <tr>
                    <th scope="col" class="w12rem_lg">用户名</th>
                    <td scope="col" colspan="3">
                        <ZL:SFile FType="Img" ID="UserFace_SFile" runat="server" />
                        <span class="margin_l5"><strong><%=uinfo.UserName%></strong></span>
                        <a href="Addon/UserLogin.aspx?uname=<%=HttpUtility.UrlEncode(uinfo.UserName)+"&upwd="+uinfo.UserPwd %>" class="margin_l5" target="_blank"><i class="zi zi_externalLinkalt" zico="外部链接"></i> 以此会员登录</a>
		                <a href="javascript:;" onclick='$("#UserFace_SFile_body .sfile_selbtn").click();' class="btn btn-default margin_l5" title="修改头像"><i class="zi zi_pencilalt" zico="笔黑"></i> 修改头像</a>
                    </td>
                </tr>
                <tr>
                    <th>用户密码</th>
                    <td colspan="3">
						<div class="input-group mb-3">
						  <div class="input-group-prepend">
							<span class="input-group-text">登录密码</span>
						  </div>
						  <asp:TextBox ID="tbNewPwd" runat="server" onkeydown="return GetEnterCode('focus','tbConPwd');" placeholder="不修改则不输入" class="form-control max20rem"></asp:TextBox>
						  <div class="input-group-prepend">
							<span class="input-group-text">支付密码</span>
						  </div>
						  <asp:TextBox ID="PayPwd_T" runat="server" onkeydown="return GetEnterCode('focus','CheckPayPwd_T');" placeholder="不修改则不输入" CssClass="form-control max20rem" />
						  <div class="input-group-append">
							<asp:Button runat="server" ID="ClearPayPwd_Btn" Text="清空支付密码" class="btn btn-outline-info" OnClick="ClearPayPwd_Btn_Click" />
						  </div>
						</div>
						
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" Display="Dynamic" runat="server" ErrorMessage="密码不能少于6位" ControlToValidate="tbNewPwd" ValidationExpression="[\s\S]{6,}" ForeColor="Red" />
                        <asp:RegularExpressionValidator ID="PayPwd_Regular" Display="Dynamic" runat="server" ErrorMessage="支付密码必须是六位数字" ControlToValidate="PayPwd_T" ValidationExpression="^\d{6}$" ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <th>资金管理</th>
                    <td colspan="3">
					<div class="btn-group">
                        <a href="UserExp.aspx?UserID=<%=uinfo.UserID %>&type=1" class="btn btn-outline-info" title="管理资金">资金：<%=uinfo.Purse %></a>
                        <a href="UserExp.aspx?UserID=<%=uinfo.UserID %>&type=2" class="btn btn-outline-info" title="管理银币">银币：<%=uinfo.SilverCoin %></a>
                        <a href="UserExp.aspx?UserID=<%=uinfo.UserID %>&type=3" class="btn btn-outline-info" title="管理积分">积分：<%=uinfo.UserExp %></a>
                        <a href="UserExp.aspx?UserID=<%=uinfo.UserID %>&type=4" class="btn btn-outline-info" title="管理点券">点券：<%=uinfo.UserPoint %></a>
                        <a href="UserExp.aspx?UserID=<%=uinfo.UserID %>&type=5" class="btn btn-outline-info" title="管理虚拟币">虚拟币：<%=uinfo.DummyPurse %></a>
                        <a href="UserExp.aspx?UserID=<%=uinfo.UserID %>&type=6" class="btn btn-outline-info" title="管理信誉值">信誉值：<%=uinfo.UserCreit %></a>
					   </div>
                    </td>
                </tr>
                <tr>
                    <th>用户信息</th>
                    <td colspan="3">
						<div class="input-group mb-3">
						  <div class="input-group-prepend">
							<span class="input-group-text">ID</span>
						  </div>
						  <label class="form-control w12rem_lg"><%=uinfo.UserID%></label>
						  <div class="input-group-prepend">
							<span class="input-group-text">会员组</span>
						  </div>
						  <asp:DropDownList ID="DDLGroup" CssClass="form-control max20rem" onkeydown="return GetEnterCode('focus','DDLGroup');" runat="server"></asp:DropDownList>
						  <div class="input-group-prepend">
							<span class="input-group-text">昵称</span>
						  </div>
						  <ZL:TextBox ID="txtHoneyName" runat="server" onkeydown="return GetEnterCode('focus','WorkNum_T');" CssClass="form-control" AllowEmpty="false"/>
						  <div class="input-group-prepend">
							<span class="input-group-text">Email</span>
						  </div>
						  <ZL:TextBox ID="tbEmail" runat="server" CssError="hidden" onkeydown="return GetEnterCode('focus','tbQuestion');" CssClass="form-control w12rem_lg" AllowEmpty="false" ValidType="Mail" />
						  <div class="input-group-prepend">
							<span class="input-group-text">手机</span>
						  </div>
						  <ZL:TextBox ID="tbMobile" runat="server" CssError="hidden" onkeydown="return GetEnterCode('focus','tbPHS');" MaxLength="13" class="form-control w12rem_lg" ValidType="MobileNumber"  />
						</div>
						
						
                        <asp:HiddenField ID="OldEmail_Hid" runat="server" />
                        <span class="existemail red" style="display:none;" >邮箱不能为空</span>
                    </td>
                </tr>
                <tr>
                    <th>会员等级</th>
                    <td colspan="3">
                        <asp:Repeater runat="server" ID="Level_RPT">
                            <ItemTemplate>
                                <label class="btn btn-default mr-1">
                                    <input type="radio" name="level_rad" value="<%#Eval("OrderID") %>" /><%#Eval("Alias") %></label>
                            </ItemTemplate>
                        </asp:Repeater>
                    </td>
                </tr>
                <tr>
                    <th>提示问题<span class="text-danger">*</span></th>
                    <td>
                        <ZL:TextBox ID="tbQuestion" runat="server" onkeydown="return GetEnterCode('focus','tbAnswer');" CssClass="form-control max20rem" AllowEmpty="false" /></td>
                    <th class="w12rem_lg">问题答案<span class="text-danger">*</span></th>
                    <td>
                        <ZL:TextBox ID="tbAnswer" runat="server" onkeydown="return GetEnterCode('focus','BtnSubmit');" CssClass="form-control max20rem" AllowEmpty="false" />
                        
                    </td>
                </tr>
                <tr>
                    <th>最后登录时间</th>
                    <td><%=uinfo.LastLoginTimes.ToString("yyyy年MM月dd日 HH:mm")%></td>
                    <th>最后登录IP</th>
                    <td><%=uinfo.LastLoginIP+"("+GetIpLocation(uinfo.LastLoginIP)+")" %></td>
                </tr>
                <tr>
                    <th>最近活跃时间</th>
                    <td><%=uinfo.LastActiveTime.ToString("yyyy年MM月dd日 HH:mm")%></td>
                    <th>密码修改时间</th>
                    <td><%=uinfo.LastPwdChangeTime%></td>
                </tr>
                <tr>
                    <th>已发布文章数(统计数)</th>
                    <td>共计<%=GetCount()%>篇</td>
                    <th>云盘空间(占用数)</th>
                    <td><%=GetCloud()%></td>
                </tr>
                <tr>
                    <th>消费积分</th>
                    <td class="text-left">
                        <asp:TextBox ID="txtConsumeExp" runat="server" onkeydown="return GetEnterCode('focus','tbSign');" class="form-control w12rem_lg"></asp:TextBox>
                    </td>
                    <th>卖家积分</th>
                    <td class="text-left">
                        <asp:TextBox ID="txtboffExp" runat="server" onkeydown="return GetEnterCode('focus','txtConsumeExp');" class="form-control w12rem_lg"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>
        <div class="tab-pane row sysRow table-responsive-md" id="Tabs1">
            <table class="table table-striped table-bordered table-hover sys_table">
                <tr>
                    <th scope="col" class="w12rem_lg">真实姓名</th>
                    <td scope="col" class="text-left">
                        <asp:TextBox ID="tbTrueName" runat="server" onkeydown="return GetEnterCode('focus','tbBirthday');" class="form-control w12rem_lg"></asp:TextBox></td>
                    <th scope="col" class="w12rem_lg">性别</th>
                    <td scope="col" class="text-left">
                        <asp:RadioButtonList ID="tbUserSex" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Selected="True" Value="1">男</asp:ListItem>
                            <asp:ListItem Value="0">女</asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                <tr>
                    <th>出生日期</th>
                    <td class="text-left">
                        <asp:TextBox ID="tbBirthday" runat="server" onkeydown="return GetEnterCode('focus','tbOfficePhone');" onblur="setday(this);" onclick="WdatePicker()"
                            class="form-control max20rem"></asp:TextBox></td>
                    <th>办公电话</th>
                    <td class="text-left">
                        <asp:TextBox ID="tbOfficePhone" runat="server" onkeydown="return GetEnterCode('focus','tbProvince');" class="form-control max20rem"></asp:TextBox></td>
                </tr>
                <tr>
                    <th>家庭电话</th>
                    <td class="text-left">
                        <asp:TextBox ID="tbHomePhone" runat="server" onkeydown="return GetEnterCode('focus','tbFax');" class="form-control max20rem"></asp:TextBox></td>
                    <th>传真</th>
                    <td class="text-left">
                        <asp:TextBox ID="tbFax" runat="server" class="form-control max20rem" onkeydown="return GetEnterCode('focus','tbMobile');"></asp:TextBox></td>
                </tr>
                <tr class="tdbg">
                    <th>省市县</th>
                    <td class="text-left d-flex flex-row">
                        <select id="selprovince" class="form-control w12rem_lg" name="selprovince">
                        </select>
                        <select id="selcity" class="form-control w12rem_lg" name="selcity">
                        </select>
                        <select id="selcoutry" class="form-control w12rem_lg" name="selcoutry">
                        </select><asp:HiddenField ID="Adress_Hid" runat="server" />
                    </td>
                    <th>推荐人(ID)</th>
                    <td class="text-left">
                        <asp:TextBox ID="tbParentUserID" runat="server" onkeydown="return GetEnterCode('focus','tbHomePhone');" class="form-control max20rem"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>联系地址</th>
                    <td class="text-left">
                        <asp:TextBox ID="tbAddress" runat="server" onkeydown="return GetEnterCode('focus','tbZipCode');" class="form-control max20rem"></asp:TextBox></td>
                    <th>邮政编码</th>
                    <td class="text-left">
                        <asp:TextBox ID="tbZipCode" runat="server" class="form-control max20rem" onkeydown="return GetEnterCode('focus','tbIDCard');"></asp:TextBox></td>
                </tr>
                <tr>
                    <th>身份证号码</th>
                    <td class="text-left">
                        <asp:TextBox ID="tbIDCard" runat="server" Columns="40" onkeydown="return GetEnterCode('focus','tbHomepage');" class="form-control w12rem_lg"></asp:TextBox></td>
                    <th>个人主页</th>
                    <td class="text-left">
                        <asp:TextBox ID="tbHomepage" runat="server" onkeydown="return GetEnterCode('focus','tbQQ');" Columns="40" class="form-control w12rem_lg" >http://</asp:TextBox></td>
                </tr>
                <tr>
                    <th>QQ号码</th>
                    <td class="text-left">
                        <asp:TextBox ID="tbQQ" runat="server" onkeydown="return GetEnterCode('focus','tbICQ');" class="form-control w12rem_lg"></asp:TextBox></td>
                    <th>工号</th>
                    <td  class="text-left">
                        <asp:TextBox ID="WorkNum_T" runat="server" onkeydown="return GetEnterCode('focus','tbNewPwd');" class="form-control max20rem"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>头像选择</th>
                    <td>
                        <select id="sysface_dp" onchange="changeFace(this);" class="form-control max20rem">
                            <option value="/Images/userface/1.gif">01.gif</option>
                            <option value="/Images/userface/2.gif">02.gif</option>
                            <option value="/Images/userface/3.gif">03.gif</option>
                            <option value="/Images/userface/4.gif">04.gif</option>
                            <option value="/Images/userface/5.gif">05.gif</option>
                            <option value="/Images/userface/6.gif">06.gif</option>
                            <option value="/Images/userface/7.gif">07.gif</option>
                            <option value="/Images/userface/8.gif">08.gif</option>
                            <option value="/Images/userface/9.gif">09.gif</option>
                            <option value="/Images/userface/10.gif">10.gif</option>
                            <option value="/Images/userface/11.gif">11.gif</option>
                            <option value="/Images/userface/12.gif">12.gif</option>
                            <option value="/Images/userface/13.gif">13.gif</option>
                            <option value="/Images/userface/14.gif">14.gif</option>
                            <option value="/Images/userface/15.gif">15.gif</option>
                            <option value="/Images/userface/16.gif">16.gif</option>
                            <option value="/Images/userface/17.gif">17.gif</option>
                            <option value="/Images/userface/18.gif">18.gif</option>
                            <option value="/Images/userface/19.gif">19.gif</option>
                            <option value="/Images/userface/20.gif">20.gif</option>
                        </select>
                        <asp:HiddenField ID="UserFace_Hid" runat="server" />
                    </td>
                    <th>头像预览</th>
                    <td>
                        <asp:Image ID="UserFace_Img" runat="server" Height="111" Width="111" ImageUrl="/Images/userface/noface.png" />
                    </td>
                </tr>
                <tr>
                    <th>头像宽度</th>
                    <td class="text-left">
                        <asp:TextBox ID="tbFaceWidth" runat="server" class="form-control w12rem_lg" onkeydown="return GetEnterCode('focus','tbFaceHeight');" >16</asp:TextBox></td>
                    <th>头像高度</th>
                    <td class="text-left">
                        <asp:TextBox ID="tbFaceHeight" runat="server" class="form-control w12rem_lg" onkeydown="return GetEnterCode('focus','CompanyNameT');" >16</asp:TextBox></td>
                </tr>
                <tr>
                    <th>公司名称</th>
                    <td class="text-left">
                        <asp:TextBox ID="CompanyNameT" runat="server" class="form-control w12rem_lg" onkeydown="return GetEnterCode('focus','CompanyDescribeT');" Columns="40"></asp:TextBox>
                    </td>
                    <th>公司简介</th>
                    <td class="text-left">
                        <asp:TextBox ID="CompanyDescribeT" runat="server" TextMode="MultiLine" onkeydown="return GetEnterCode('focus','BtnSubmit');" Rows="4" Columns="28"></asp:TextBox></td>
                </tr>
            </table>
        </div>
        <div class="tab-pane row sysRow table-responsive-md" id="Tabs2">
            <table class="table table-striped table-bordered table-hover sys_table">
                <tr>
                    <th scope="col" class="w12rem_lg">商铺认证有效期截止</th>
                    <td scope="col" class="text-left">
                        <asp:TextBox ID="txtCerificateDeadLine" onkeydown="return GetEnterCode('focus','txtDeadLine');" runat="server" class="form-control w12rem_lg"  onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' })"></asp:TextBox></td>
                    <th class="w12rem_lg">有效期截止时间</th>
                    <td class="text-left">
                        <asp:TextBox ID="txtDeadLine" runat="server" onkeydown="return GetEnterCode('focus','txtboffExp');" class="form-control w12rem_lg"  onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' })"></asp:TextBox></td>
                </tr>

                <tr>
                    <th>签名档</th>
                    <td class="text-left">
                        <asp:TextBox ID="tbSign" runat="server" onkeydown="return GetEnterCode('focus','BtnSubmit');" class="form-control w12rem_lg"  TextMode="MultiLine" Width="253px"
                            Height="60"></asp:TextBox></td>
                    <th>隐私设定</th>
                    <td class="text-left">
                        <asp:RadioButtonList ID="tbPrivacy" runat="server">
                            <asp:ListItem Selected="True" Value="0">公开信息</asp:ListItem>
                            <asp:ListItem Value="1">只对好友公开</asp:ListItem>
                            <asp:ListItem Value="2">完全保密</asp:ListItem>
                        </asp:RadioButtonList></td>
                </tr>
                <tr><td colspan="4" id="html_td"></td></tr>
            <%--    <tbody id="mf_body">
                    <asp:Literal ID="lblHtml" runat="server"></asp:Literal>
                </tbody>--%>
            </table>
        </div>
        <script>
    $(function(){
        $("#html_td").load("/AdminMVC/Common/UserBaseField",{"uid":"<%:UserID%>",mode:"0"});
    })
</script>
        <div class="tab-pane table-responsive-md" id="Tabs3">
            <table class="table table-striped table-bordered table-hover sys_table">
                <tr>
                    <th scope="col" class="w12rem_lg">真实姓名</th>
                    <td scope="col">
                        <asp:TextBox ID="tbTrueName_T" CssClass="form-control max20rem" runat="server"></asp:TextBox>
                    </td>
                    <th class="w12rem_lg">所属公司</th>
                    <td>
                        <asp:DropDownList ID="tbCompName_D" CssClass="form-control max20rem" runat="server" DataTextField="CompName" DataValueField="ID"></asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <th>公司部门</th>
                    <td>
                        <asp:Label runat="server" ID="tbPost_T"></asp:Label></td>
                    <th></th>
                    <td></td>
                </tr>
            </table>
        </div>
        <div class="tab-pane row sysRow" id="Tabs4">
            <table class="table table-striped table-bordered table-hover sys_table">
                <tr>
                    <th class="w12rem_lg">管理员角色设置</th>
                    <td valign="top">
                        <asp:CheckBoxList ID="cblRoleList" runat="server" /></td>
                </tr>
            </table>
        </div>
    </div>
    <asp:Literal ID="ltlTab" runat="server"></asp:Literal>
    <asp:Literal ID="models" runat="server"></asp:Literal>
    <div class="alert alert-light text-center">
        <asp:Button ID="BtnSubmit" runat="server" Text="确认修改" OnClick="BtnSubmit_Click" class="btn btn-outline-info" />
        <a href="UserManage.aspx" class="btn btn-outline-info">返回列表</a>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" class="btn btn-outline-info" />
    </div>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/DatePicker/WdatePicker.js"></script>
<script src="/JS/Modal/APIResult.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/ZL_Content.js"></script>
<script src="/JS/SelectCheckBox.js"></script>
<script>
    $(function () {
        //$("#UserFace_SFile_body img").css("width","60px").css("height","60px");
        $("#mf_body").find(".fd_td_r").attr("colspan", "3");
        $("#txtMoney,#txtUserCrite,#txtSilverCoin,#txtPoint,#txtUserPoint,#txtPurm").attr("disabled", true);
        //检测用户邮箱
        $("#tbEmail").change(function () {
            if ($("#OldEmail_Hid").val() == $(this).val()) {
                $(".existemail").hide();
                $("#BtnSubmit").removeAttr("disabled");
                return;
            }
            $.post("/API/UserCheck.ashx", { action: "ExistEmail", email: $(this).val() }, function (data) {
                var model = APIResult.getModel(data);
                if (APIResult.isok(model)) {
                    $(".existemail").hide();
                    $("#BtnSubmit").removeAttr("disabled");
                }
                else {
                    $(".existemail").show();
                    $("#BtnSubmit").attr("disabled", "disabled");
                }
            })
        });
        $("[href='#<%=ZoomLa.BLL.SafeSC.GetRequest("tabs")%>']").tab('show');
        //---------------------
        var pcc = new ZL_PCC("selprovince", "selcity", "selcoutry");
        var defstrs = $("#Adress_Hid").val().split(',');
        if (defstrs.length > 0 && defstrs[0] != "") { pcc.SetDef(defstrs[0], defstrs[1], defstrs[2]); }
        pcc.ProvinceInit();
        pcc.$province.change(area);
        pcc.$city.change(area);
        pcc.$county.change(area);
    });
    function SetPassWord(id) {
        $("#" + id).val(GetRanPass(6));
    }
    function area() {
        $("#tbProvince").val($("#selprovince").val());
        $("#tbCity").val($("#selcity").val());
        $("#tbCoutry").val($("#selcoutry").val());
    }
    function tab2() {
        $("#tbTrueName").focus();
    }
    function tab1() {
        $("#txtHoneyName").focus();
    }
    function tab3() {
        $("#txtMoney").focus();
    }
    function changeFace(obj) {
        $("#UserFace_Img").attr("src", obj.value);
        $("#UserFace_Hid").val(obj.value);
        $("#UserFace_SFile_body .sfile_img").attr("src", obj.value);
    }
    $("#FileUp_File").change(function () {
        $("#UserFace_Hid").val("");
    });
    function closeDiag() { CloseComDiag(); }
</script>
</asp:Content>

