<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BarConfig.aspx.cs" Inherits="ZoomLaCMS.Manage.Guest.BarConfig" MasterPageFile="~/Manage/I/Index.master" %>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
<title>贴吧栏目设置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/Guest/GuestManage.aspx","留言分类管理"),
        new Bread() {url="", text="添加留言分类",addon="" }}
		)
    %>
<asp:Label runat="server" ID="NavLabel"></asp:Label>
<ul class="nav nav-tabs list_choice">
    <li class="nav-item"><a class="nav-link active" href="#basic" data-toggle="tab">基本设置</a></li>
    <li class="nav-item"><a class="nav-link" href="#auth" data-toggle="tab">权限设定</a></li>
</ul>
<div class="tab-content barconfig container-fluid pr-0">
    <div class="tab-pane active table-responsive-md  row sysRow" id="basic">
        <table class="table table-bordered table-hover table-striped sys_table">
            <tr class="onlybar">
                <th class="w12rem_lg">上级栏目</th>
                <td>
                    <div class="dropdown">
                        <button class="btn btn-default dropdown-toggle max20rem" type="button" id="dropdownMenu1" runat="server" data-toggle="dropdown" aria-expanded="true">
                            <span id="dr_text"></span>
                           <span class="caret pull-right mt-2"></span>
                            <asp:HiddenField id="selected_Hid" runat="server" />
                        </button>
                        <ul id="PCate_ul" runat="server" class="dropdown-menu max20rem"  role="menu" aria-labelledby="dropdownMenu1"></ul>
                    </div>
                    </td>
            </tr>
            <tr class="onlybar">
                <th><span>所属类别</span></th>
                <td>
                    <asp:RadioButtonList ID="PostType" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="0" Selected="True">论坛版面</asp:ListItem>
                        <asp:ListItem Value="1">论坛分类</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <th class="w12rem_lg">栏目类型</th>
                <td>
                    <asp:RadioButtonList runat="server" ID="GType_Rad" RepeatDirection="Horizontal">
                        <asp:ListItem Value="1" Selected="True">贴吧栏目</asp:ListItem>
                        <asp:ListItem Value="0">留言栏目</asp:ListItem>
                    </asp:RadioButtonList></td>
            </tr>
            <tr>
                <th><span>栏目名称</span></th>
                <td>
                    <asp:TextBox ID="txtCateName" class="form-control max20rem" runat="server" placeholder="栏目名称" autofocus="true"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" Style="float: left; margin-top: 10px; color: red;" ValidationGroup="add" ErrorMessage="必填项" ControlToValidate="txtCateName" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th>审核模式</th>
                <td>
                   <input type="checkbox" id="IsCheck_Ra" class="switchChk" runat="server" />
                </td>
            </tr>
            <tr id="checkopt_tr">
                <th>显示模式</th>
                <td>
                    <input type="checkbox" id="CheckOpt_Ra" runat="server" class="pull-left switchChk" />
					<small class="text-muted">(开启后列表将显示未审核的留言)</small>
                </td>
            </tr>
            <tr class="onlybar">
                <th>发贴积分</th>
                <td>
                    <asp:TextBox ID="SenderScore_T" Text="0" CssClass="form-control td_s" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="onlybar">
                <th>回贴积分</th>
                <td>
                    <asp:TextBox ID="ReplyScore_T" Text="0" CssClass="form-control td_s" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr class="onlybar">
                <th>注册发帖</th>
                <td>
					<div class="input-group mb-3">
					  <asp:TextBox ID="UserTime_T" runat="server" Text="120" CssClass="form-control max20rem"></asp:TextBox>
					  <div class="input-group-append">
						<span class="input-group-text">分钟</span>
					  </div>
					</div>
                </td>
            </tr>
            <tr>
                <th>发帖间隔</th>
                <td>
					<div class="input-group mb-3">
					  <asp:TextBox ID="SendTime_T" runat="server" Text="5" CssClass="form-control max20rem"></asp:TextBox>
					  <div class="input-group-append">
						<span class="input-group-text">分钟</span>
					  </div>
					</div>
                </td>
            </tr>
            
            <tr class="barFile_div onlybar">
                <th><span>图片压缩</span></th>
                <td>
                    <div class="input-group pull-left max20rem">
                        <asp:TextBox runat="server" ID="ZipImgSize_T" CssClass="form-control" />
                        <span class="btn btn-default input-group-addon">KB</span>
                    </div><div class="pull-left"><span>0为不压缩,如输入2048,则超过2M的图片会自动等比压缩</span> </div>
                </td>
            </tr>
            <tr class="onlybar">
                <th><span>能力同步</span></th>
                <td>
                    <asp:TextBox runat="server" ID="IsPlat_T" CssClass="form-control max20rem"></asp:TextBox>
                    <span class="rd_green">请输入能力中心公司ID</span>
                </td>
            </tr>
            <tr class="barFile_div">
                <th><span>栏目图标</span></th>
                <td>
                    <ZL:SFileUp runat="server" ID="SFileUp" FType="Img" />
                    <%--<asp:TextBox runat="server" ID="ImageInfo_T" CssClass="form-control max20rem" Style="display: inline;"></asp:TextBox>--%>
                </td>
            </tr>
            <tr class="barFile_div">
                <th><span>栏目简介</span></th>
                <td>
                    <asp:TextBox ID="BarDesc_T" class="form-control pull-left" runat="server" TextMode="MultiLine" Width="300px" placeholder="栏目简介"></asp:TextBox>
                    <asp:RegularExpressionValidator runat="server" ID="pv2" ValidationExpression="^((.){0,300}$)" ValidationGroup="add" Display="Dynamic" ForeColor="Red" ErrorMessage="简介内容不能大于30位！" ControlToValidate="BarDesc_T" />
                </td>
            </tr>
            <tr class="onlybar">
                <th>管理人员</th>
                <td>
                    <button type="button" onclick="UserList.open();" class="btn btn-info"><i class="zi zi_plus"></i> 选择用户</button>
                    <span style="padding-left: 5px;">提示：包含拥有在前台修改,删除,置顶,精华权限</span>
                    <table class="table table-bordered table-striped" style="width:500px;">
                        <thead><tr><td>ID</td><td>用户名</td><td>操作</td></tr></thead>
                        <tbody id="UserList_Body"></tbody>
                    </table>
                    <div id="page_footer"></div>
                    <asp:HiddenField runat="server" ID="BarOwner_Json_T" />
                    <asp:HiddenField runat="server" ID="BarOwner_Hid" />
                </td>
            </tr>
        </table>
    </div>
    <div class="tab-pane table-responsive-md row sysRow" id="auth">
        <table class="table table-bordered table-hover table-striped sys_table">
            <tr>
                <th class="w12rem_lg"><span>访问权限</span></th>
                <td>
                    <asp:RadioButtonList ID="NeedLog" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="0" Selected="True">允许匿名</asp:ListItem>
                        <asp:ListItem Value="1">登录用户</asp:ListItem>
                        <asp:ListItem Value="2">指定用户</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <th><span>发贴权限</span></th>
                <td>
                    <asp:RadioButtonList ID="PostAuth" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Value="0">允许匿名</asp:ListItem>
                        <asp:ListItem Value="1" Selected="True">登录用户</asp:ListItem>
                        <asp:ListItem Value="2">指定用户</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
        </table>
    </div>
    <div class="text-center Conent_fix">
        <asp:Button runat="server" CssClass="btn btn-info" ID="AddBar_Btn" OnClientClick="return CheckData()" Text="保存信息" OnClick="AddBar_Btn_Click" />
        <a id="cencel_A" href="#" class="btn btn-outline-info">返回列表</a>
    </div>
    </div>
   
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/dist/js/bootstrap-switch.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Controls/ZL_Array.js"></script>
<script src="/JS/Controls/ZLPage.js"></script>
<script src="/JS/Controls/Control.js?v=2"></script>
<script>
    $(function () {
        //$("#ImageInfo_T").IconSelect();
        if("<%:GType%>"=="0"){
            $("#cencel_A").attr("href","GuestManage.aspx");
        }else{
            $("#cencel_A").attr("href","GuestCateMana.aspx?Type=<%:GType %>");
        }
        $("#GType_Rad :radio").click(function () { if (this.value == "1") $(".onlybar").show(); else $(".onlybar").hide(); });
        $("#dropdownMenu1").find("#dr_text").text($("#PCate_ul").find("[role=" + $("#selected_Hid").val() + "]").children().first().text().trim());
        $("#PostAuth :radio").click(function () {
            if ($(this).val() == "2") {
                ShowDiag("请指定用户权限","BarAuthSet.aspx?ID=<%=CateID %>");
            }
        });
        $("#NeedLog :radio").click(function () {
            if ($(this).val() == "2") {
                ShowDiag("请指定用户权限", "BarAuthSet.aspx?ID=<%=CateID %>");
            }
        });
    });
    function HideBarSet() {$(".onlybar").hide();}
    function CheckData() {
        if (ZL_Regex.isEmpty($("#txtCateName").val())) {
            alert("栏目名称不能为空！");
            return false;
        }
        if (!ZL_Regex.isNum($("#SenderScore_T").val()) || !ZL_Regex.isNum($("#ReplyScore_T").val())) {
            alert('积分格式不对！');
            return false;
        }
        if(!ZL_Regex.isNum($("#UserTime_T").val()) || !ZL_Regex.isNum($("#SendTime_T").val())){
            alert('用户发贴时间或发贴间隔格式不对!');
            return false;
        }
        return true;
    }
    function Refresh() {
        parent.location = parent.location;
    }
    var bardiag=new ZL_Dialog();
    function SelBarOwner() {
        bardiag.title = "选择吧主";
        bardiag.content = "userdiv";
        bardiag.ShowModal();
    }
    function selectCate(data) {
        $("#selected_Hid").val($(data).attr("role"));
        $("#dropdownMenu1").find("#dr_text").text($(data).children().first().text().trim());
    }
    function CloseDiag() {
        //diag.CloseModal();
        bardiag.CloseModal();
        comdiag.CloseModal();
    }
</script>
<script>
    var UserList = { };
    var ulist=[];
    //打开选择用户弹窗
    UserList.open = function (select) {
        var url = "/Common/Dialog/SelGroup.aspx";
        if (select && select != "") { url += "#" + select; }
        comdiag.maxbtn = false;
        comdiag.ShowModal(url, "选择用户");
    }
    UserList.del = function (uid) {
        $("#tr_" + uid).remove();
        page.list.RemoveByID(uid, "UserID");
        $("#BarOwner_Hid").val(page.list.GetIDS("UserID"));
    }
    if(!ZL_Regex.isEmpty($("#BarOwner_Json_T").val()))
    {
        ulist=JSON.parse($("#BarOwner_Json_T").val());
    }
    var page = new ZLPage(ulist,'<tr id="tr_@UserID"><td>@UserID</td><td>@UserName</td><td><a href="javascript:;" onclick="UserList.del(@UserID);" title="删除"><i class="zi zi_expandarrowsalt"></a></td></tr>', {
        body: "#UserList_Body",
        footer: "#page_footer",
        //psize: 10, cpage: 1,pnum:9,
        rowEvent:null,
    });
    function UserFunc(list, select) {
        page.list.addAll(list, "UserID");
        page.notifyListChange();
        page.showPage(1);
        $("#BarOwner_Hid").val(page.list.GetIDS("UserID"));
        CloseDiag();
    }
</script>
</asp:Content>
