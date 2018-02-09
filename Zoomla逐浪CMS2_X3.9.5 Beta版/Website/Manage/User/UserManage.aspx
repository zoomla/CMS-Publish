<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserManage.aspx.cs" Inherits="ZoomLaCMS.Manage.User.UserManage1" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head" EnableViewState="false">
<title><%=Resources.L.会员管理 %></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ul class="breadcrumb navbar-fixed-top">
<li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'><%=Resources.L.工作台 %></a></li>
<li class="breadcrumb-item"><a href='AdminManage.aspx'><%=Resources.L.用户管理 %></a></li>
<li class="breadcrumb-item"><a href='UserManage.aspx'><%=Resources.L.会员管理 %></a><a href='AddUser.aspx' class='reds'>[<%=Resources.L.添加会员 %>]</a></li>
</ul>
<div id="help" class="pull-right text-center"><a href="javascript::" id="sel_btn" class="help_btn"><i class="fa fa-search"></i></a></div>
	
		<div id="sel_box" runat="server" class="sel_box">
		<div class="d-flex flex-row">
            <div class="input-group">
                <asp:DropDownList ID="OrderType_DP" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="OrderType_DP_SelectedIndexChanged">
                    <asp:ListItem Value="Uid" Selected="True" Text="<%$Resources:L,用户ID %>"></asp:ListItem>
                    <asp:ListItem Value="Addtime" Text="<%$Resources:L,注册时间顺序 %>"></asp:ListItem>
                    <asp:ListItem Value="descAddtime" Text="<%$Resources:L,注册时间倒序 %>"></asp:ListItem>
                    <asp:ListItem Value="AuthTime" Text="<%$Resources:L,最近登录 %>"></asp:ListItem>
                    <asp:ListItem Value="ActiveTime" Text="<%$Resources:L,最近活跃 %>"></asp:ListItem>
                    <asp:ListItem Value="EditPassTime" Text="<%$Resources:L,最近修改密码 %>"></asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="ddlGroup_DP" runat="server" Width="150" DataTextField="GroupName" DataValueField="GroupID" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlGroup_DP_SelectedIndexChanged"></asp:DropDownList>
                <div runat="server" visible="false">
                    <asp:TextBox ID="sTime_T" runat="server" Style="border-right: none; width: 180px; border-radius: 0px;" placeholder="<%$Resources:L,起始日期 %>" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" CssClass="form-control"></asp:TextBox>
                    <asp:TextBox ID="eTime_T" runat="server" Style="width: 180px; border-radius: 0px;" placeholder="<%$Resources:L,终止日期 %>" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" CssClass="form-control"></asp:TextBox>
                    <strong id="strgroup" runat="server" visible="true"></strong><span class="input-group-btn" style="float: left;">
                        <asp:LinkButton runat="server" ID="Button1" OnClick="Button1_Click1" CssClass="btn btn-default"><span class="fa fa-search"></span></asp:LinkButton>
                    </span>
                </div>
            </div>
            <div class="input-group">
				
					<asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control">
						<asp:ListItem Selected="True" Value="UserName" Text="会员名"></asp:ListItem>
						<asp:ListItem Value="UserID">ID</asp:ListItem>
						<asp:ListItem Value="Email">Email</asp:ListItem>
						<asp:ListItem Value="HoneyName" Text="昵称"></asp:ListItem>
						<asp:ListItem Value="TrueName" Text="真实会员姓名"></asp:ListItem>
					</asp:DropDownList>


					<asp:TextBox ID="IDName" runat="server" CssClass="form-control"></asp:TextBox>
					<span class="input-group-btn">
						<asp:LinkButton runat="server" ID="Button2" OnClick="Button2_Click" CssClass="btn btn-outline-secondary"><span class="fa fa-search"></span></asp:LinkButton>
					</span>
			</div>
		</div>
        </div>
		</div>
    </div>
    <div class="border" style="display: none">
        <ul>
            <li>
                <div style="display: none">
                    <%=Resources.L.选择等级 %>：
	  <asp:DropDownList ID="SelectGroup" runat="server" DataValueField="GroupID" DataTextField="OtherName" CssClass="x_input"></asp:DropDownList>
                    <asp:Button ID="Rank" runat="server" Text="<%$Resources:L,设置等级 %>" CssClass="btn btn-primary" OnClick="Rank_Click" />
                </div>
            </li>
        </ul>
    </div>
	

<div class="container-fluid pr-0">
<div class="row sysRow">	
    <div id="navtab_div" class="sysUsertabs"></div>
    <div class="tab-content col-12 table_box">
        <table id="EGV" class="table table-striped table-bordered table-hover">
            <tr>
                <td></td>
                <td>
                    <asp:LinkButton runat="server" ID="ID_A" CommandArgument="AscID" OnClick="OrderBtn_Click">ID <i class='fa fa-arrow-up order_img'></i></asp:LinkButton></td>
                <td>用户名</td>
                <td><%=Resources.L.真实姓名 %></td>
 <%--               <td><%=Resources.L.工号 %></td>--%>
                <td><%=Resources.L.会员组 %></td>
                <td>
                    <asp:LinkButton runat="server" ID="Purse_A" CommandArgument="Purse" OnClick="OrderBtn_Click"><%=Resources.L.资金 %><i class='fa fa-arrow-up order_img'></i></asp:LinkButton></td>
                <td>
                    <asp:LinkButton runat="server" ID="Addtime_A" CommandArgument="Addtime" OnClick="OrderBtn_Click"><%=Resources.L.注册时间 %><i class='fa fa-arrow-up order_img'></i></asp:LinkButton></td>
                <td>
                    <asp:LinkButton runat="server" ID="point_A" CommandArgument="point" OnClick="OrderBtn_Click"><%=Resources.L.积分 %><i class='fa fa-arrow-up order_img'></i></asp:LinkButton></td>
                <td>
                    <asp:LinkButton runat="server" ID="LoginTimes_A" CommandArgument="LoginTimes" OnClick="OrderBtn_Click"><%=Resources.L.登录次数 %><i class='fa fa-arrow-up order_img'></i></asp:LinkButton></td>
                <td>
                    <asp:LinkButton runat="server" ID="AuthTime_A" CommandArgument="AscAuthTime" OnClick="OrderBtn_Click"><%=Resources.L.最后登录时间 %><i class='fa fa-arrow-up order_img'></i></asp:LinkButton></td>
                <td><%=Resources.L.状态 %></td>
                <td><%=Resources.L.聚合认证 %></td>
                <td><%=Resources.L.操作 %></td>
            </tr>
            <ZL:Repeater runat="server" ID="RPT" PageSize="20" BoxType="dp" OnItemCommand="RPT_ItemCommand" PagePre="<tr><td><label class='allchk_l'><input type='checkbox' id='AllID_Chk'>全选</label></td><td colspan='13'><div class='text-center'>" PageEnd="</div></td></tr>">
                <ItemTemplate>
                    <tr ondblclick="location='UserInfo.aspx?id=<%# Eval("UserID") %>';">
                        <td>
                            <input type="checkbox" name="idchk" value='<%# Eval("UserID") %>' /></td>
                        <td><%#Eval("UserID") %></td>
                        <td>
                            <span style="position:relative;" onmouseover="ShowPopover(this)" onmouseout="HidePopover(this)">
                            <a href="UserInfo.aspx?id=<%# Eval("UserID") %>" class="uinfo"><%#Eval("UserName") %></a>
                            <div class="popover right bs-popover-right">
                                <div class="arrow"></div>
                                <h1 class="popover-header">概览</h1>
                                <div class="popover-content">
                                    <table>
                                        <tr><td>注册：</td><td><%#Eval("RegTime","{0:yyyy/MM/dd HH:mm:ss}") %></td></tr>
                                        <tr><td>登录：</td><td><%#Eval("LastLoginTime","{0:yyyy/MM/dd HH:mm:ss}") %></td></tr>
                                        <tr><td class="text-right">IP：</td><td><%#Eval("LastLoginIP") %></td></tr>
                                        <tr><td>来自：</td><td><%#GetIpLocation(Eval("LastLoginIP","")) %></td></tr>
                                        <tr class="option_tr">
                                            <td colspan="2" class="text-center">
                                                <a href="Addon/UserLogin.aspx?uname=<%#HttpUtility.UrlEncode(Eval("UserName",""))+"&upwd="+Eval("UserPwd") %>" class="option_style" target="_blank"><i class="fa fa-external-link"></i>登录</a>&nbsp;&nbsp;
                                                <asp:LinkButton runat="server" Visible='<%#Eval("Status","").Equals("1") %>' CommandArgument='<%#Eval("UserID") %>' CssClass="option_style" CommandName="Normal" ><i class="fa fa-unlock-alt"></i>解锁</asp:LinkButton>
                                                <asp:LinkButton runat="server" Visible='<%#Eval("Status","").Equals("0") %>' CommandArgument='<%#Eval("UserID") %>' CssClass="option_style" CommandName="Lock" ><i class="fa fa-lock"></i>锁定</asp:LinkButton>
                                                <a href="<%# CustomerPageAction.customPath2 %>Shop/OrderList.aspx?UserID=<%# Eval("UserID") %>" class="option_style"><i class="fa fa-shopping-cart"></i> 订单</a>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                            </span>
                        </td>
                        <td><%#Eval("Permissions") %></td>
           <%--             <td><%#Eval("WorkNum") %></td>--%>
                        <td><a href="UserManage.aspx?GroupID=<%#Eval("GroupID") %>"><%# Eval("GroupName") %></a></td>
                        <td><%#Eval("Purse","{0:F2}") %></td>
                        <td><%#Eval("RegTime","{0:yyyy年MM月dd日 HH:mm}") %></td>
                        <td><%#Eval("UserExp","{0:F2}") %></td>
                        <td><%#Eval("LoginTimes") %></td>
                        <td><%#Eval("LastLoginTime","{0:yyyy年MM月dd日 HH:mm}") %></td>
                        <td><%#GetStatus(Eval("Status","{0}")) %></td>
                        <td><%#GetState(Eval("State","{0}")) %></td>
                        <td><a href='UserModify.aspx?UserID=<%# Eval("UserID")%>&tabs=Tabs4' class="option_style"><i class="fa fa-key" title="<%=Resources.L.权限 %>"></i><%=Resources.L.权限 %></a>
                           <%-- <a href='CertificateAuditInfo.aspx?UserID=<%# Eval("UserID")%>' class="option_style"><i class="fa fa-newspaper-o" title="证件"></i>证件</a>--%>
                            <a href="/Space/Default?ID=<%#Eval("UserID") %>" target="_blank" title="访问"><i class="fa fa-external-link"></i> 主页</a>
                         <%--   <a href="javascript:void(0)" onclick="javascript:window.open('../../Space/Default?id=<%# Eval("UserID")%>')" class="option_style"></a>--%>
                            <a href="UserInfo.aspx?id=<%#Eval("UserID") %>&tabs=Tabs4" class="option_style"><i class="fa fa-product-hunt"></i>商品</a>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate></FooterTemplate>
            </ZL:Repeater>
        </table>
    </div>
    <div class="input-group d-flex flex-row mb-5">
        <asp:DropDownList ID="UserGroup_DP" CssClass="form-control" runat="server" DataValueField="GroupID" DataTextField="GroupName"></asp:DropDownList>
        <span class="input-group-append">
            <asp:Button ID="GroupMove" runat="server" Text="<%$Resources:L,批量移动 %>" OnClick="GroupMove_Click" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" class="btn btn-info" />
            <asp:Button ID="btnLock" runat="server" Text="<%$Resources:L,批量锁定 %>" OnClick="btnLock_Click" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" class="btn btn-info" />
            <asp:Button ID="btnNormal" runat="server" Text="<%$Resources:L,批量解锁 %>" OnClick="btnNormal_Click" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" class="btn btn-info" />
            <%--   <asp:Button ID="RenoVate" runat="server" Text="<%$Resources:L,刷新用户 %>" CssClass="btn btn-info" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" OnClick="RenoVate_Click" />--%>
            <asp:Button ID="Approve" runat="server" Text="<%$Resources:L,认证用户 %>" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" CssClass="btn btn-info" OnClick="Approve_Click" />
            <asp:Button ID="ApproveFailure" runat="server" Text="<%$Resources:L,取消认证 %>" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" CssClass="btn btn-info" OnClick="ApproveFailure_Click" />
            <asp:Button ID="btnDel" runat="server" Text="<%$Resources:L,批量删除 %>" OnClick="btnDel_Click" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}else{return confirm('不可恢复性删除数据,你确定将该数据删除吗？')}" class="btn btn-info" />
            <asp:Button ID="Export" runat="server" Text="<%$Resources:L,Excel导出 %>" CssClass="btn btn-info" OnClick="Export_Click" />
            <input class="btn btn-info" type="button" onclick="inputuserinfo()" value="<%=Resources.L.Excel导入 %>" />
        </span>
    </div>
	</div>
	</div>
    <asp:HiddenField ID="Search_Hid" runat="server" />
    <asp:HiddenField ID="GroupData_Hid" runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/SelectCheckBox.js"></script>
    <script src="/JS/DatePicker/WdatePicker.js"></script>
    <script src="/JS/Common.js"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/Plugs/ZL_NavTab.js"></script>
    <script>
        $().ready(function () {
            //pop.bindEvent($(".uinfo"));
            $("#AllID_Chk").click(function () {//EGV 全选
                selectAllByName(this, "idchk");
            });
        })
        var diag = new ZL_Dialog();
        function inputuserinfo() {//Excel导入
            diag.title = "<%=Resources.L.导入会员 %>";
            diag.url = "InputUser.aspx";
            diag.maxbtn = false;
            diag.ShowModal();
        }
        function CloseDiaog() {
            diag.CloseModal();
        }
        function IsSelectedId() {
            var chkArr = $("#EGV").find("input[type=checkbox]:checked");
            if (chkArr.length > 0)
                return true;
            else
                return false;
        }
        function ShowOrderIcon(id) {
            $("#" + id).find(".order_img").show();
        }
        function displayToolbar() {
            var dr = document.getElementById("search");
            if (dr.style.display == "none") {
                dr.style.display = "block";
                $("#Search_Hid").val("1");
            }
            else {
                $("#Search_Hid").val("0");
                dr.style.display = "none";
            }
        }
        function open_title() {
            diag.title = "<%=Resources.L.添加会员 %>";
        diag.url = "AddUser.aspx";
        diag.maxbtn = false;
        diag.ShowModal();
    }
    $().ready(function () {
        var searchFlag = $("#Search_Hid").val();
        if (searchFlag && searchFlag == "1") {
            displayToolbar();
        }
        $("#sel_btn").click(function (e) {
            if ($("#sel_box").css("display") == "none") {
                $(this).addClass("active");
                $("#sel_box").slideDown(300);
            }
            else {
                $(this).removeClass("active");
                $("#sel_box").slideUp(200);
            }
        });
        $("#navtab_div").ZL_NavTab({
            feildid: "GroupID",
            feildname: "GroupName",
            hid: "GroupData_Hid",
            curid: '<%=GroupID%>',
            tabclick: function (id) {
                location.href = "UserManage.aspx?GroupID=" + id;
            }
        });
    });
    HideColumn("5,6,7,8,9,10,11,12");
    var marleft = 0;
    var movewidth = 0;

    function ShowPopover(obj) {
        $(obj).find(".popover").show();
    }
    function HidePopover(obj) {
        $(obj).find(".popover").hide();
    }
    </script>
</asp:Content>