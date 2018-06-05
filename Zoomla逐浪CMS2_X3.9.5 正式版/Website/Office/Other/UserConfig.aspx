<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserConfig.aspx.cs" Inherits="ZoomLaCMS.MIS.OA.UserConfig"  MasterPageFile="~/Office/OAMain.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>个人设置</title>
<script type="text/javascript">
    function SelAll() {
        $(":checkbox").each(function () { this.checked = true; });
    }
    function showdiv(obj, n) {
        $(obj).parent().parent().find("li").removeClass("cur");
        $(obj).parent().addClass("cur");
        switch (n) {
            case "1":
                $("#tab2").show();
                $("#tab1").hide();
                break;
            case "2":
                $("#tab1").show();
                $("#tab2").hide();
        }
    }
    function showpass(obj) {
        if ($(obj).text() == "修改密码")
            $(obj).text("返回");
        else
            $(obj).text("修改密码");
        $(obj).parent().find("table").toggle();
    }
</script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <ol id="BreadNav" class="breadcrumb fixed-top">
        <li class="breadcrumb-item"><a href="/Office/Main.aspx">主页面</a></li>
        <li class="breadcrumb-item">个人配置</li>
    </ol>
    <div id="mainDiv" class="list_choice">
        <ul class="nav nav-tabs">
            <li class="nav-item" onclick="showdiv(this,'1')"><a class="nav-link active" href="#Tabs0" data-toggle="tab">个人信息</a></li>
            <li class="nav-item" onclick="showdiv(this,'2')"><a class="nav-link" href="#Tabs1" data-toggle="tab">系统设置</a></li>
        </ul>
        <div id="tab2">
            <table class="table table_li table-border sys_table">
                <tr>
                    <th class="w12rem_lg">姓名：</th>
                    <td>
                        <asp:TextBox ID="TrueName" CssClass="form-control text_300" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <th>密码：</th>
                    <td>
                        <table style="display:none;">
                            <tr>
                                <td>原密码：</td>
                                <td><asp:TextBox ID="PassWord" TextMode="Password" CssClass="form-control text_300" runat="server" Width="218"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td>新密码：</td>
                                <td>
                                    <asp:TextBox ID="NewPassWord" TextMode="Password" CssClass="form-control text_300" runat="server" Width="218"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" Display="Dynamic" ErrorMessage="密码不能少于6位" ControlToValidate="NewPassWord" ValidationExpression="[\s\S]{6,}" ForeColor="Red"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>重复密码：</td>
                                <td>
                                    <asp:TextBox ID="RNewPassWord" TextMode="Password" CssClass="form-control text_300" runat="server" Width="218"></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" ControlToValidate="RNewPassWord" ControlToCompare="NewPassWord" Display="Dynamic" runat="server" ErrorMessage="两次输入不一致" ForeColor="Red" ></asp:CompareValidator>
                                </td>
                            </tr>
                        </table>
                        <button type="button" onclick="showpass(this);" name="setpassword" id="setpassword" class="button mt-2">修改密码</button>
                    </td>
                </tr>
                <tr>
                    <th>性别：</th>
                    <td>
                        <asp:RadioButtonList ID="UserSex" runat="server" RepeatColumns="2">
                            <asp:ListItem Value="1">男</asp:ListItem>
                            <asp:ListItem Value="2">女</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <th>手机：</th>
                    <td>
                        <asp:TextBox ID="UserPhone" CssClass="form-control text_300" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="手机号码输入格式错误" ControlToValidate="UserPhone" ValidationExpression="^1\d{10}$" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <th>电话：</th>
                    <td>
                        <asp:TextBox ID="UserTel" CssClass="form-control text_300" runat="server" ></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="电话号码输入格式错误" ControlToValidate="UserTel" ValidationExpression="((\d{11})|^((\d{7,8})|(\d{4}|\d{3})-(\d{7,8})|(\d{4}|\d{3})-(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1})|(\d{7,8})-(\d{4}|\d{3}|\d{2}|\d{1}))$)" Display="Dynamic" ForeColor="Red"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <th>部门：</th>
                    <td>
                        <asp:Label ID="Branch" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <th>状态：</th>
                    <td>
                        <asp:Label ID="StatusT" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <th>操作：</th>
                    <td>
                        <asp:Button ID="SetUserBtn" CssClass="btn btn-outline-info" runat="server" Text="保存" OnClick="SetUserBtn_Click" />
                    </td>
                </tr>
            </table>
        </div>
        <div id="tab1" style="display:none;">
            <table class="table table_li table-border sys_table">
                <tr><th>窗格顺序(主界面)：</td><td>提示:在页面直接拖动排序即可,实时保存</th></tr>
                <tr><th class="w12rem_lg">默认显示(左边栏)：</th>
                    <td>
                        <asp:CheckBoxList runat="server" ID="leftChk" RepeatDirection="Horizontal" CssClass="chkTable">
                            <asp:ListItem Value="leftChk0" Selected="True">显示左侧</asp:ListItem>
                            <asp:ListItem Value="leftChk1" Selected="True">日历</asp:ListItem>
                            <asp:ListItem Value="leftChk2" Selected="True">值班</asp:ListItem>
                            <asp:ListItem Value="leftChk3" Selected="True">联系人</asp:ListItem>
                            <asp:ListItem Value="leftChk4" Selected="True">快捷访问</asp:ListItem>
                            <asp:ListItem Value="leftChk5" Selected="True">历史记录</asp:ListItem>
                        </asp:CheckBoxList>
                    </td></tr>
                <tr><th>默认显示(主界面)：</th>
                    <td>
                        <asp:CheckBoxList runat="server" ID="mainChk" RepeatDirection="Horizontal" CssClass="chkTable">
                            <asp:ListItem Value="mainChk1" Selected="True">行政公文</asp:ListItem>
                            <asp:ListItem Value="mainChk2" Selected="True">行政办公</asp:ListItem>
                            <asp:ListItem Value="mainChk3" Selected="True">部门公告</asp:ListItem>
                            <asp:ListItem Value="mainChk4" Selected="True">邮箱管理</asp:ListItem>
                            <asp:ListItem Value="mainChk5" Selected="True">最新通知</asp:ListItem>
                            <asp:ListItem Value="mainChk6" Selected="True">论坛交流</asp:ListItem>
                        </asp:CheckBoxList></td></tr>
                <tr><th>弹窗提示(主界面)：</th>
                    <td><asp:CheckBoxList runat="server" ID="popChk" RepeatDirection="Horizontal" CssClass="chkTable">
                            <asp:ListItem Value="popChk1" Selected="True">新邮件</asp:ListItem>
                            <asp:ListItem Value="popChk2" Selected="True">未签到</asp:ListItem>
                            <asp:ListItem Value="popChk3" Selected="True">新公文</asp:ListItem>
                            <asp:ListItem Value="popChk4" Selected="True">新流程</asp:ListItem>
                        </asp:CheckBoxList></td></tr>
                <tr><th>操作：</th>
                    <td>
                        <asp:Button runat="server" CssClass="btn btn-outline-info" ID="saveBtn" Text="保存" OnClick="saveBtn_Click" />
                        <input type="button" value="重置" class="btn btn-outline-info ml-2" onclick="location = location;"/>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>

