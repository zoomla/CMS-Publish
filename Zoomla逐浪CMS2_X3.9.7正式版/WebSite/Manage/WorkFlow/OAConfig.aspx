<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OAConfig.aspx.cs" Inherits="ZoomLaCMS.Manage.WorkFlow.OAConfigPage" MasterPageFile="~/Manage/I/Index.master"  %>


<asp:Content runat="server" ContentPlaceHolderID="head">
    <link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
    <script type="text/javascript" src="/dist/js/bootstrap-switch.js"></script>
    <title>OA系统配置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread() {url="", text="OA配置",addon="" }}
		)
    %>
	<div class="list_choice container-fluid pr-0">
    <ul class="nav nav-tabs">
        <li class="nav-item"><a class="nav-link active" href="#Tabs0" data-toggle="tab">系统设置</a></li>
        <li class="nav-item"><a class="nav-link" href="#Tabs1" data-toggle="tab">OA节点设置</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active row sysRow table-responsive-md" id="Tabs0">
            <table class="table table-striped table-bordered table-hover sys_table">
                <tr>
                    <th scope="col" class="w12rem_lg">绑定模型ID</th>
                    <td scope="col">
                        <div>
                            <asp:TextBox runat="server" CssClass="form-control max20rem" ID="bindModel" MaxLength="8" Columns="3"></asp:TextBox>
                        </div>
                        <div class="must">
                            <asp:RequiredFieldValidator ID="p1" runat="server" ControlToValidate="bindModel" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"
                                ErrorMessage="绑定模型不能为空!" />
                            <asp:RegularExpressionValidator ID="p2" runat="server" ControlToValidate="bindModel" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ErrorMessage="必须是数字!" ValidationExpression="^([0-9]+)" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>用户名显示</th>
                    <td>
                        <div>
                            <asp:RadioButtonList ID="UNameConfigR" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="1" Selected="True">用户名</asp:ListItem>
                                <asp:ListItem Value="2">真名(呢称)</asp:ListItem>
                                <asp:ListItem Value="3">真名</asp:ListItem>
                                <asp:ListItem Value="4">真名(ID)</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
						<small class="text-muted">提示:设置经办人,抄送人等显示格式</small>
                    </td>
                </tr>
                <tr>
                    <th>允许发送手机短信</th>
                    <td>
                        <div>
                            <input runat="server" type="checkbox" id="allowMsgR" class="switchChk" checked="checked" />
                        </div>
                        <div class="prompt"></div>
                    </td>
                </tr>
                <tr>
                    <th>允许自定义OA界面</th>
                    <td>
                        <div>
                            <input runat="server" type="checkbox" id="allowUIR" class="switchChk" checked="checked" />
                        </div>
                        <div class="prompt"></div>
                    </td>
                </tr>
                <tr>
                    <th>OA标题</th>
                    <td>
                        <asp:TextBox runat="server" CssClass="form-control max20rem" ID="oaTitleT" MaxLength="50" /></td>
                </tr>
                <tr>
                    <th>Logo地址</th>
                    <td>
                        <asp:TextBox runat="server" CssClass="form-control max20rem" ID="logoT" MaxLength="100" />
                    </td>
                </tr>
                <tr>
                    <th>主办人签名模板</th>
                    <td>
                        <asp:TextBox runat="server" ID="Leader_T" TextMode="MultiLine" CssClass="form-control m50rem_50"></asp:TextBox></td>
                </tr>
                <tr>
                    <th>协办人签名模板</th>
                    <td>
                        <asp:TextBox runat="server" ID="Parter_T" TextMode="MultiLine" CssClass="form-control m50rem_50"></asp:TextBox></td>
                </tr>
                <tr>
                    <th>邮箱容量</th>
                    <td>
						<div class="input-group">
						<asp:TextBox runat="server" CssClass="form-control max20rem" ID="MailSize_T" MaxLength="50" />
						  <div class="input-group-append">
							<span class="input-group-text">M</span>
						  </div>
						</div>
						
						<small class="text-muted">(以M为单位，0则不限制)</small>
                    </td>
                </tr>
                <tr>
                    <th>操作</th>
                    <td>
                        <asp:Button runat="server" ID="saveBtn" Text="保存" OnClick="saveBtn_Click" OnClientClick="disBtn(this,1000);" CssClass="btn btn-info" />
                        <input type="button" id="refBtn" value="重置" onclick="location = location;" class="btn btn-outline-info" />
                    </td>
                </tr>
            </table>
        </div>
        <div class="tab-pane row sysRow table-responsive-md" id="Tabs1">
            <table class="table table-striped table-bordered table-hover sys_table">
                <asp:Repeater runat="server" ID="RPT">
                    <ItemTemplate>
                        <tr>
                            <th scope="col" class="w12rem_lg">
                                <asp:TextBox ID="tbNodeName" data-name="title" CssClass="form-control max20rem" Text='<%#Eval("NodeName") %>' runat="server" /></th>
                            <td scope="col">
                                <asp:HiddenField runat="server" ID="ID_Hid" Value='<%#Eval("ID") %>' />
                                <asp:TextBox ID="tbNodeID" CssClass="form-control max20rem" Text='<%#Eval("NodeID") %>' data-name="content" runat="server"  />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
                <tr>
                    <th>操作</th>
                    <td>
                        <asp:Button CssClass="btn btn-info" runat="server" Text="保存" OnClick="NodeSavBtn_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        function checkvalue() {
            flag = false;
            dang = $("#DangBangT").val();
            yuan = $("#YuanBT").val();
            jijian = $("#JijianT").val();
            ren = $("#RenShiT").val();
            caiwu = $("#CaiWuT").val();
            kejiao = $("#KejiaoT").val();
            yiwu = $("#YiwuT").val();
            huli = $("#HuliT").val();
            info = $("#InfoT").val();
            news = $("#NewsT").val();
            bbs = $("#BBST").val();
            if (isNaN(dang) || isNaN(yuan) || isNaN(jijian) || isNaN(ren) || isNaN(caiwu) || isNaN(kejiao) || isNaN(yiwu) || isNaN(huli) || isNaN(info) || isNaN(news) || isNaN(bbs))
                alert("节点必须为数字");
            else
                flag = true;
            return flag;
        }
    </script>
</asp:Content>
