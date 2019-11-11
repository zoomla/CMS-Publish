<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserManage.aspx.cs" Inherits="ZoomLaCMS.Manage.User.UserManage1" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head" EnableViewState="false"><title><%=Resources.L.会员管理 %></title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ul class="breadcrumb fixed-top">
<li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'><%=Resources.L.工作台 %></a></li>
<li class="breadcrumb-item"><a href='AdminManage.aspx'><%=Resources.L.用户管理 %></a></li>
<li class="breadcrumb-item"><a href='UserManage.aspx'><%=Resources.L.会员管理 %></a><a href='AddUser.aspx' class='reds'> [<%=Resources.L.添加会员 %>]</a></li>
<div id="help" class="pull-right text-center"><a href="javascript::" id="sel_btn" class="help_btn"><i class="zi zi_search" zico="搜索"></i></a></div>
</ul>

<div runat="server" id="sel_box" class="sel_box">
    <div class="input-group">
        <asp:DropDownList ID="Group_DP" runat="server" Width="150" DataTextField="GroupName" DataValueField="GroupID" CssClass="form-control max20rem" AutoPostBack="true" OnSelectedIndexChanged="ddlGroup_DP_SelectedIndexChanged"></asp:DropDownList>
        <asp:TextBox runat="server" class="form-control max20rem" ID="UserID_T" placeholder="<%$Resources:L,用户ID %> "/>
        <asp:TextBox runat="server" class="form-control max20rem" ID="UName_T"  placeholder="<%$Resources:L,用户名 %>"/>
        <span class="input-group-append">
            <asp:LinkButton runat="server" ID="Search_Btn" OnClick="Search_Click" CssClass="btn btn-outline-secondary"><i class="zi zi_search" zico="搜索"></i></asp:LinkButton>
        </span>
        <div runat="server" visible="false">
            <asp:TextBox ID="sTime_T" runat="server" Style="border-right: none; width: 180px; border-radius: 0px;" placeholder="<%$Resources:L,起始日期 %>" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" CssClass="form-control "></asp:TextBox>
            <asp:TextBox ID="eTime_T" runat="server" Style="width: 180px; border-radius: 0px;" placeholder="<%$Resources:L,终止日期 %>" onclick="WdatePicker({ dateFmt: 'yyyy-MM-dd HH:mm:ss' })" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    
</div>

<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
<div id="navtab_div" class="sysUsertabs"></div>
<div class="tab-content col-12 table-responsive-md table_box">
<table id="EGV" class="table table-striped table-bordered table-hover">
<tr>
<th scope="col"></th>
<th scope="col"><asp:LinkButton runat="server" ID="ID_A" CommandArgument="AscID" OnClick="OrderBtn_Click">ID <i class='zi zi_arrowUp order_img'></i></asp:LinkButton></th>
<th scope="col"><%=Resources.L.用户名 %></th>
<th scope="col"><%=Resources.L.昵称 %></th>
<th scope="col"><%=Resources.L.会员组 %></th>
<th scope="col"><asp:LinkButton runat="server" ID="Purse_A" CommandArgument="Purse" OnClick="OrderBtn_Click"><%=Resources.L.资金 %><i class='zi zi_arrowUp order_img'></i></asp:LinkButton></th>
<th scope="col"><asp:LinkButton runat="server" ID="Addtime_A" CommandArgument="Addtime" OnClick="OrderBtn_Click"><%=Resources.L.注册时间 %><i class='zi zi_arrowUp order_img'></i></asp:LinkButton></th>
<th scope="col"><asp:LinkButton runat="server" ID="point_A" CommandArgument="point" OnClick="OrderBtn_Click"><%=Resources.L.积分 %><i class='zi zi_arrowUp order_img'></i></asp:LinkButton></th>
<th scope="col"><asp:LinkButton runat="server" ID="LoginTimes_A" CommandArgument="LoginTimes" OnClick="OrderBtn_Click"><%=Resources.L.登录次数 %><i class='zi zi_arrowUp order_img'></i></asp:LinkButton></th>
<th scope="col"><asp:LinkButton runat="server" ID="AuthTime_A" CommandArgument="AscAuthTime" OnClick="OrderBtn_Click"><%=Resources.L.最后登录时间 %><i class='zi zi_arrowUp order_img'></i></asp:LinkButton></th>
<th scope="col"><%=Resources.L.状态 %></th>
<th scope="col"><%=Resources.L.聚合认证 %></th>
<th scope="col"><%=Resources.L.操作 %></th>
</tr>
<tbody>
<ZL:Repeater runat="server" ID="RPT" PageSize="20" BoxType="dp" OnItemCommand="RPT_ItemCommand" PagePre="<tr><td><label class='allchk_l'><input type='checkbox' id='AllID_Chk'></label></td><td colspan='13'><div class='text-center'>" PageEnd="</div></td></tr>">
<ItemTemplate>
<tr ondblclick="location='UserInfo.aspx?id=<%# Eval("UserID") %>';">
<th scope="row" class="w1rem"><input type="checkbox" name="idchk" value='<%# Eval("UserID") %>' /></th>
<td><%#Eval("UserID") %></td>
<td>
    <div class="sys_userPopver" onmouseover="ShowPopover(this)"> 
        <a href="UserInfo.aspx?id=<%# Eval("UserID") %>" class="uinfo"><%#Eval("UserName") %></a>
        <div class="popover bs-popover-right popbox">
        <div class="arrow"></div>
        <h3 class="popover-header"><%=Resources.L.会员概览 %><a href="javasvript:;" class="hidePopover" ><i class="zi zi_times"></i></a></h3>
        <div class="popover-body">
        <ul>
        <li><%=Resources.L.注册时间 %> :</span><%#Eval("RegTime","{0:yyyy/MM/dd HH:mm}") %></li>
        <li><%=Resources.L.最后登录时间 %> :</span><%#Eval("LastLoginTime","{0:yyyy/MM/dd HH:mm}") %></li>
        <li><%=Resources.L.来自 %> :</span><%#GetIpLocation(Eval("LastLoginIP","")) %>(<%#Eval("LastLoginIP") %>)</li>
        </ul>
        <p>
        <a href="Addon/UserLogin.aspx?uname=<%#HttpUtility.UrlEncode(Eval("UserName",""))+"&upwd="+Eval("UserPwd") %>" class="option_style" target="_blank"><i class="zi zi_externalLinkalt" zico="外部链接"></i> <%=Resources.L.登录 %></a
        <asp:LinkButton runat="server" Visible='<%#Eval("Status","").Equals("1") %>' CommandArgument='<%#Eval("UserID") %>' CssClass="option_style" CommandName="Normal"><i class="zi zi_unlock" zico="未锁定"></i> <%=Resources.L.解锁 %></asp:LinkButton>
        <asp:LinkButton runat="server" Visible='<%#Eval("Status","").Equals("0") %>' CommandArgument='<%#Eval("UserID") %>' CssClass="option_style" CommandName="Lock"><i class="zi zi_lock" zico="未锁定"></i> <%=Resources.L.锁定 %></asp:LinkButton>
        <a href="<%# CustomerPageAction.customPath2 %>Shop/OrderList.aspx?UserID=<%# Eval("UserID") %>" class="option_style"><i class="zi zi_shoppingcart" zico="购物车黑"></i> <%=Resources.L.订单 %></a>
        </p>
        </div>
        </div>
    </div>
</td>
<td><%#Eval("HoneyName") %></td>
<td><a href="UserManage.aspx?GroupID=<%#Eval("GroupID") %>"><%# Eval("GroupName") %></a></td>
<td><%#Eval("Purse","{0:F2}") %></td>
<td><%#Eval("RegTime","{0:yyyy年MM月dd日 HH:mm}") %></td>
<td><%#Eval("UserExp","{0:F2}") %></td>
<td><%#Eval("LoginTimes") %></td>
<td><%#Eval("LastLoginTime","{0:yyyy年MM月dd日 HH:mm}") %></td>
<td><%#GetStatus(Eval("Status","{0}")) %></td>
<td><%#GetState(Eval("State","{0}")) %></td>
<td>
    <a href='UserModify.aspx?UserID=<%# Eval("UserID")%>&tabs=Tabs4' class="option_style"><i class="zi zi_key" title="<%=Resources.L.权限 %>"></i><%=Resources.L.权限 %></a>
    <a href="/Space/Default?ID=<%#Eval("UserID") %>" target="_blank" title="<%=Resources.L.访问 %>"><i class="zi zi_externalLinkalt" zico="外部链接"></i> <%=Resources.L.主页 %></a>
</tr>
</ItemTemplate>
<FooterTemplate></FooterTemplate>
</ZL:Repeater>
<tbody>
</table>
</div>
<div class="input-group d-flex flex-wrap mb-5">
<asp:DropDownList ID="UserGroup_DP" CssClass="form-control" runat="server" DataValueField="GroupID" DataTextField="GroupName"></asp:DropDownList>
<span class="input-group-append d-flex flex-wrap">
<asp:Button ID="GroupMove" runat="server" Text="<%$Resources:L,批量移动 %>" OnClick="GroupMove_Click" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" class="btn btn-info" />
<asp:Button ID="btnLock" runat="server" Text="<%$Resources:L,批量锁定 %>" OnClick="btnLock_Click" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" class="btn btn-info" />
<asp:Button ID="btnNormal" runat="server" Text="<%$Resources:L,批量解锁 %>" OnClick="btnNormal_Click" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" class="btn btn-info" />
<asp:Button ID="Approve" runat="server" Text="<%$Resources:L,认证用户 %>" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" CssClass="btn btn-info" OnClick="Approve_Click" />
<asp:Button ID="ApproveFailure" runat="server" Text="<%$Resources:L,取消认证 %>" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}" CssClass="btn btn-info" OnClick="ApproveFailure_Click" />
<asp:Button ID="btnDel" runat="server" Text="<%$Resources:L,批量删除 %>" OnClick="btnDel_Click" OnClientClick="if(!IsSelectedId()){alert('未选中任何会员');return false;}else{return confirm('不可恢复性删除数据,你确定将该数据删除吗？')}" class="btn btn-info" />
<asp:Button ID="Export" runat="server" Text="<%$Resources:L,Excel导出 %>" CssClass="btn btn-info" OnClick="Export_Click" />
<input class="btn btn-info" type="button" onclick="inputuserinfo()" value="<%=Resources.L.Excel导入 %>" />
</span> </div>
</div>
</div>
<asp:HiddenField ID="Search_Hid" runat="server" />
<asp:HiddenField ID="GroupData_Hid" runat="server" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/SelectCheckBox.js"></script>
<script src="/JS/DatePicker/WdatePicker.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Plugs/ZL_NavTab.js"></script>
<script>
        $().ready(function () {
            $("#AllID_Chk").click(function () {//EGV 全选
                selectAllByName(this, "idchk");
            });
        })
        function inputuserinfo() {
            ShowComDiag("InputUser.aspx", "导入会员");
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

    function ShowPopover(obj) {
        $(".popbox").hide();
        $(obj).find(".popover").show();
    }
    $(".hidePopover").click(function () {
        $(this).parent(".popbox").hide();
        $(".popbox").hide();
    })

</script>
</asp:Content>