<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditSinglePage.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.EditSinglePage" MasterPageFile="~/Manage/I/Index.master" %>
<%@ Register Src="~/Manage/I/ASCX/TlpDP.ascx" TagPrefix="ZL" TagName="TlpDown" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>修改单页节点</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/I/Main.aspx","工作台"),
		new Bread("/{manage}/Config/SiteInfo.aspx","系统设置"),
        new Bread("NodeManage.aspx","节点管理"),
        new Bread() {url="", text="编辑单页",addon="" }}
		)
    %>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <ul class="nav nav-tabs list_choice">
        <li class="nav-item"><a class="nav-link active" href="#Tabs0" data-toggle="tab">基本信息</a></li>
        <li class="nav-item"><a class="nav-link" href="#Tabs1" data-toggle="tab">栏目选项</a></li>
        <li class="nav-item"><a class="nav-link" href="#Tabs3" data-toggle="tab">模板选项</a></li>
        <li class="nav-item"><a class="nav-link" href="#Tabs2" data-toggle="tab">生成选项</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active container-fluid pr-0" id="Tabs0">
		<div class="row sysRow table-responsive-md">
            <table class="table table-striped table-bordered table-hover sys_table">
                <tbody>
                    <tr>
                        <th class="w12rem_lg"><strong>所属节点</strong></th>
                        <td>
                            &nbsp;<asp:Label ID="LblNodeName" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr >
                        <th>
                            <strong>单页名称 <span id="TxtNodeName_sp" class="text-danger">*</span></strong>
                        </th>
                        <td>
                            <asp:TextBox ID="TxtNodeName" class="form-control max20rem" runat="server" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="tips" ForeColor="Red" runat="server" ErrorMessage="标识符不能为空！" ControlToValidate="TxtNodeDir" Display="Dynamic" SetFocusOnError="True" />
                        </td>
                    </tr>
                    <tr >
                        <th>
                            <strong>单页标识符 <span id="TxtNodeDir_sp" class="text-danger">*</span></strong>
                        </th>
                        <td>
                            <asp:TextBox ID="TxtNodeDir"  CssClass="form-control max20rem" MaxLength="20" runat="server" Columns="20"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ValrNodeIdentifier" ForeColor="Red" runat="server" ErrorMessage="标识符不能为空！" ControlToValidate="TxtNodeDir" Display="Dynamic" SetFocusOnError="True" />
                        </td>
                    </tr>
                    <tr >
                        <th>
                            <strong>栏目图片地址</strong>
                        </th>
                        <td>
                            <asp:TextBox ID="TxtNodePicUrl" class="form-control pull-left max20rem"  MaxLength="255" runat="server" Columns="50"></asp:TextBox>
                        </td>
                    </tr>
                    <tr >
                        <th>
                            <strong>单页提示</strong>
                        </th>
                        <td>
                            <asp:TextBox ID="TxtTips" class="form-control pull-left max20rem"  runat="server" Columns="60" Height="60px" Rows="2" TextMode="MultiLine"></asp:TextBox>
                        </td>
                    </tr>
                    <tr >
                        <th>
                            <strong>单页说明</strong><br />
                            用于在单页页详细介绍单页信息，支持HTML
                        </th>
                        <td>
                            <asp:TextBox ID="TxtDescription" class="form-control pull-left max20rem"  runat="server" Columns="60" Height="65px" Rows="2" TextMode="MultiLine" />
                        </td>
                    </tr>
                    <tr >
                        <th>
                            <strong>单页META关键词</strong><br />
                            针对搜索引擎设置的关键词<br />
                        </th>
                        <td>
                            <asp:TextBox ID="TxtMetaKeywords" class="form-control pull-left max20rem"  runat="server" Height="65px" Columns="60" Rows="4" TextMode="MultiLine" />
                        </td>
                    </tr>
                    <tr >
                        <th>
                            <strong>单页META网页描述</strong><br />
                            针对搜索引擎设置的网页描述<br />
                        </th>
                        <td>
                            <asp:TextBox ID="TxtMetaDescription" class="form-control pull-left max20rem" runat="server" Height="65px" Columns="60" Rows="4" TextMode="MultiLine" />
                        </td>
                    </tr>
                </tbody>
            </table>
		</div>
        </div>
        <div class="tab-pane container-fluid pr-0" id="Tabs1">
		<div class="row sysRow table-responsive-md">
            <table class="table table-striped table-bordered table-hover sys_table">
                <tbody>
                    <tr >
                        <th class="w12rem_lg">
                            <strong>打开方式</strong>
                        </th>
                        <td>
                            <asp:RadioButtonList ID="RBLOpenType" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True" Value="0">原窗口打开</asp:ListItem>
                                <asp:ListItem Value="1">新窗口打开</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr >
                        <th>
                            <strong>内容打开方式</strong>
                        </th>
                        <td>
                            <asp:RadioButtonList ID="RBLItemOpenType" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0">原窗口打开</asp:ListItem>
                                <asp:ListItem Value="1">新窗口打开</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr >
                        <th>
                            <strong>转换形式</strong>
                        </th>
                        <td>
                            <asp:RadioButtonList runat="server" AutoPostBack="True" RepeatDirection="Horizontal" ID="RadioButtonList1">
                                <asp:ListItem Value="1">页面转换</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr >
                        <th>
                            <strong>内容防护</strong>
                        </th>
                        <td class="style2">
                            <asp:RadioButtonList runat="server" RepeatDirection="Horizontal" ID="SafeGuard">
                                <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                                <asp:ListItem Value="0">否</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr >
                        <th>
                            <strong>绑定互动管理</strong><br />
                        </th>
                        <td>
                            <asp:DropDownList ID="DropDownList1" class="form-control pull-left w12rem_lg" runat="server"></asp:DropDownList>
							<small class="text-muted">只能绑定节点类别的互动模块</small>
                        </td>
                    </tr>
<%--                    <tr>
                        <th>
                            <strong>单页模板</strong>
                        </th>
                        <td>
                            <%=PageCommon.GetTlpDP("TxtSinglepageTemplate") %>
                            <asp:HiddenField ID="TxtSinglepageTemplate_hid" runat="server" />
                        </td>
                    </tr>--%>
                </tbody>
            </table>
        </div>
        </div>
        <div class="tab-pane container-fluid pr-0" id="Tabs2">
		<div class="row sysRow table-responsive-md">
            <table class="table table-striped table-bordered table-hover sys_table">
                <tbody>
                    <tr >
                        <th class="w12rem_lg">
                            <strong>单页主文件扩展名</strong>
                        </th>
                        <td>
                            <asp:RadioButtonList ID="ListPageHtmlEx_Rad" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="0">.html</asp:ListItem>
                                <asp:ListItem Value="1">.htm</asp:ListItem>
                                <asp:ListItem Value="2">.shtml</asp:ListItem>
                                <asp:ListItem Value="3" Selected="True">.aspx(不生成静态)</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <strong>单页列表页扩展名</strong>
                        </th>
                        <td>
                            <asp:RadioButtonList ID="ListPageEx_Rad" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="3" Selected="True">.aspx(不生成静态)</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <strong>最新信息页扩展名</strong>
                        </th>
                        <td>
                            <asp:RadioButtonList ID="LastinfoPageEx_Rad" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="3" Selected="True">.aspx(不生成静态)</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <strong>热门信息页扩展名</strong>
                        </th>
                        <td>
                            <asp:RadioButtonList ID="HotinfoPageEx" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="3" Selected="True">.aspx(不生成静态)</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <strong>推荐信息扩展名</strong>
                        </th>
                        <td>
                            <asp:RadioButtonList ID="ProposePageEx" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Value="3" Selected="True">.aspx(不生成静态)</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <strong>节点目录生成位置</strong>
                        </th>
                        <td>
                            <asp:RadioButtonList ID="RBLPosition" runat="server" RepeatDirection="Horizontal">
                                <asp:ListItem Selected="True" Value="1">继承父节点目录</asp:ListItem>
                                <asp:ListItem Value="0">根目录下</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        </div>
		<div class="tab-pane container-fluid pr-0" id="Tabs3">
        <div class="row sysRow table-responsive-md" >
            <table class="table table-striped table-bordered table-hover sys_table">
                <%--模板选项--%>
                <tbody>
                    <tr>
                        <th class="w12rem_lg">
                            <strong>单页主访模板</strong>
                        </th>
                        <td>
                              <%=PageCommon.GetTlpDP("IndexTemplate",!string.IsNullOrEmpty(IndexTemplate_hid.Value),"/Class_"+NodeID+"/Default.aspx") %>
                              <asp:HiddenField ID="IndexTemplate_hid" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <strong>单页列表模板</strong>
                        </th>
                        <td>
                              <%=PageCommon.GetTlpDP("TxtTemplate",!string.IsNullOrEmpty(TxtTemplate_hid.Value),"/Class_"+NodeID+"/NodePage.aspx") %>
                                <asp:HiddenField ID="TxtTemplate_hid" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <strong>最新信息模板</strong>
                        </th>
                        <td>
                              <%=PageCommon.GetTlpDP("LastinfoTemplate",!string.IsNullOrEmpty(LastinfoTemplate_hid.Value),"/Class_"+NodeID+"/NodeNews.aspx") %>
                                <asp:HiddenField ID="LastinfoTemplate_hid" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <strong>热门信息模板</strong>
                        </th>
                        <td>
                              <%=PageCommon.GetTlpDP("HotinfoTemplate",!string.IsNullOrEmpty(HotinfoTemplate_hid.Value),"/Class_"+NodeID+"/NodeHot.aspx") %>
                                <asp:HiddenField ID="HotinfoTemplate_hid" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <strong>推荐信息模板</strong>
                        </th>
                        <td>
                              <%=PageCommon.GetTlpDP("ProposeTemplate",!string.IsNullOrEmpty(ProposeTemplate_hid.Value),"/Class_"+NodeID+"/NodeElite.aspx") %>
                                <asp:HiddenField ID="ProposeTemplate_hid" runat="server" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        </div>
    </div>
    <table border="0" cellpadding="0" cellspacing="0" width="100%" class="mt-2" >
        <tr>
            <td align="center">&nbsp; &nbsp;
			<asp:Button ID="EBtnSubmit" class="btn btn-info" Text="保存" OnClientClick="return EBtnS()" OnClick="EBtnSubmit_Click" runat="server" />&nbsp; &nbsp;
            <asp:Button ID="Cencel_B" runat="server" CssClass="btn btn-outline-info" Text="取消" OnClick="Cencel_B_Click" />
            </td>
        </tr>
    </table>
    <ZL:TlpDown runat="server" />
    <script src="/JS/chinese.js" type="text/javascript"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/ZL_Regex.js"></script>
    <script type="text/javascript">
        var nameFlag = true, dirFlag = true;
        $().ready(function () {
            Tlp_initTemp();
            var checkurl = "EditNode.aspx?NodeID=<%:NodeID %>&ParentID=<%:ParentID %>";
            $("#TxtNodeName").blur(function () {
                if (ZL_Regex.isEmpty(this.value)) { $("#TxtNodeName_sp").text("节点名称不能为空"); nameFlag = false; CheckBtn(); return; }
                $.post(checkurl, { action: "nodename", value: $("#TxtNodeName").val() }, function (data) {
                    if (data != 1) {//M_APIResult.Success:1
                        nameFlag = false;
                        $("#TxtNodeName_sp").text("单页名称重复,请修改节点名称");
                    }
                    else { $("#TxtNodeName_sp").text("*"); nameFlag = true; }
                    CheckBtn();
                });
            });
            $("#TxtNodeDir").blur(function () {
                if (ZL_Regex.isEmpty(this.value)) { $("#TxtNodeDir_sp").text("栏目名称不能为空"); dirFlag = false; CheckBtn(); return; }
                $.post(checkurl, { action: "nodedir", value: $("#TxtNodeDir").val() }, function (data) {
                    if (data != 1) {//M_APIResult.Success:1
                        dirFlag = false;
                        $("#TxtNodeDir_sp").text("栏目标识重复,请修改栏目标识");
                    }
                    else { $("#TxtNodeDir_sp").text("*"); dirFlag = true; }
                    CheckBtn();
                });
            });
            function CheckBtn() {
                if (nameFlag == true && dirFlag == true) { $("#EBtnSubmit").removeAttr("disabled"); }
                else { disBtn("EBtnSubmit"); }
            }
        });
        function Getpy(ontxt, id) {
            var str = document.getElementById(ontxt).value.trim();
            if (str == "") {
                document.getElementById(id).value = "";
                return;
            }
            var arrRslt = makePy(str);
            if (arrRslt.length > 0) {
                document.getElementById(id).value = arrRslt.toString().toLowerCase();
                if (document.getElementById(id).value.indexOf(',') > -1) {//判断栏目名称有多音字后栏目标识名“，”并去掉逗号后面的数据
                    var str = document.getElementById(id).value;
                    document.getElementById(id).value = str.split(',', 1);
                }
            }
        }
        function EBtnS() {
            var inLen = $("#Tabs0").children("input[type='text']").length;
            var Hidd = "";
            for (var i = 0; i < inLen; i++) {
                Hidd += $("#Tabs0").children("input[type='hidden']").eq(i).val() + "=" + $("#Tabs0").children("input[type='text']").eq(i).val() + "|";
            }
            $("#ADHid").val(Hidd);
            return true;
        }
        function BindPY() {
            $("#TxtNodeName").keyup(function () {
                Getpy("TxtNodeName", "TxtNodeDir");
            });
        }
    </script>
</asp:Content>