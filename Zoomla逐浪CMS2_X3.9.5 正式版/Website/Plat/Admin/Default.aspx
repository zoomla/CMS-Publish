<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Plat.Admin.Default" MasterPageFile="~/Plat/Main.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>管理中心</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container platcontainer">
	<div class="child_head"><i class="child_head_span1"></i> <span class="child_head_span2">平台管理</span></div>
	<div class="row">
    <div class="col-md-2 col-sm-4 col-xs-6 app"> 
        <div style="background: #FE7906;" class="cdiv" onclick="location='UserManage.aspx';">
            <i class="zi zi_folderOpen mr-2 zi_3x" ></i><br /> <span>用户管理</span>
        </div>
    </div>
    <div class="col-md-2 col-sm-4 col-xs-6 app">
         <div style="background: #b572dd;" class="cdiv" onclick="location='UserAudit.aspx';">
            <i class="zi zi_useralt mr-2 zi_3x"></i><br /> <span>用户审核</span>
        </div>
    </div>
    <div class="col-md-2 col-sm-4 col-xs-6 app"> 
        <div style="background: #004B9B;" title="角色权限" class="cdiv" onclick="location='UserRole.aspx';">
            <i class="zi zi_fileNew mr-2 zi_3x"></i><br /> <span>角色权限</span>
        </div>
    </div>
    <div class="col-md-2 col-sm-4 col-xs-6 app"> 
        <div style="background: #74B512;" class="cdiv" title="公司信息" onclick="location='/Plat/Group/CompDetail.aspx';">
            <i class="zi zi_folders mr-2 zi_3x"></i><br /> <span>公司信息</span>
        </div>
    </div>
    <div class="col-md-2 col-sm-4 col-xs-6 app"> 
        <div style="background: #A43AE3;" class="cdiv" title="部门管理" onclick="location='/Plat/Admin/GroupAdmin.aspx';">
            <i class="zi zi_book mr-2 zi_3x"></i><br /> <span>部门管理</span>
        </div>
    </div>
    <div class="col-md-2 col-sm-4 col-xs-6 app"> 
        <div style="background: #22AFC2;" class="cdiv" title="文库管理" onclick="location='/Plat/Doc/Default.aspx'">
            <i class="zi zi_hdd mr-2 zi_3x"></i><br /> <span>文库管理</span>
        </div>
    </div>
    </div>
</div>
<script>
    $(function () {
        $("#top_nav_ul li[title='管理']").addClass("active");
        $(".app").height($(".app").width());
        window.onresize = function () {
            $(".app").height($(".app").width());
        }
    });
</script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    
</asp:Content>