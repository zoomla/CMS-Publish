<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BackupRestore.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.BackupRestore" MasterPageFile="~/Manage/I/Safe.master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>备份与还原数据</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("DatalistProfile.aspx","扩展功能"),
        new Bread("","开发中心"),
        new Bread() {url="", text="备份与还原数据",addon="" }}
		)
    %>


<div class=" sysRow list_choice">
    <div>
        <asp:HiddenField ID="HdnPath" runat="server" />
        <div runat="server" visible="false" id="dbnolocal_sp" class="alert alert-danger">提示：当前数据库非本机模式，请填写目标服务器的路径地址并确保开放写入权限，如：D:\Backup\</div>
        <ul class="nav nav-tabs">
            <li class="nav-item"><a class="nav-link active" href="#tab0" data-toggle="tab"><i class="zi zi_database"></i> 数据备份</a></li>
            <li class="nav-item"><a class="nav-link" href="#tab1" data-toggle="tab"><i class="zi zi_folderOpen"></i> 文件备份</a></li>
        </ul>
        <table id="tab0" class="table table-striped table-bordered table-hover tabs sys_table">
            <tr><th colspan="2" class="text-center">数据库备份</th></tr>
            <tr><th scope="col" class="w12rem_lg">主数据库名</th>
			<td scope="col">
                <a href="DBTools/Default.aspx"><asp:Label runat="server" ID="DBName_L"></asp:Label></a>
			</td></tr>
            <tr>
                <th scope="col">数据库备份</th>
                <td scope="col">
					<div class="input-group mb-3 ">
					  <input runat="server" id="DatabasePath" class="form-control max20rem" />
					  <div class="input-group-append">
						<span class="input-group-text" id="basic-addon2">.bak</span>
					  </div>
					</div>
                    <span id="backup_sp" runat="server" class="padding10"> 
                        <asp:CheckBox ID="chBackup" runat="server" /> 备份在根目录(默认为temp目录)。</span>
                </td>
            </tr>
            <tr>
                <th scope="col">管理员操作</th>
                <td scope="col">
                    <asp:Button ID="Backup" runat="server" Text="备份数据库" class="btn btn-outline-info" OnClick="Backup_Click" />
                    <asp:Button ID="Restore" runat="server" Text="还原数据库" class="btn btn-outline-info" OnClick="Restore_Click" />
                </td>
            </tr>
        </table>
        <table id="tab1" class="table table-striped table-bordered table-hover tabs sys_table" style="display:none;">
            <tr><th colspan="3" class="text-center">全站备份</th></tr>
            <tr class="tdbg">
                <th scope="col" class="w12rem_lg">全站备份</th>
                <td scope="col">
                    <div class="input-group max20rem" >
                        <input runat="server" id="SiteText" class="form-control" />
						<div class="input-group-append">
                        <asp:Label runat="server" class="input-group-text">.zip</asp:Label>
						</div>
                    </div>
					  <label class="btn btn-default">
                        <asp:CheckBox runat="server" ID="Zip_UploadFiles" Checked="true" /> 包含上传目录(<%=ZoomLa.Components.SiteConfig.SiteOption.UploadDir %>)
                    </label>
                </td>
            </tr>
            <tr class="tdbg">
                <th scope="col">操作</th>
                <td scope="col">
                    <asp:Button ID="SiteBackup" runat="server" Text="备份全站" class="btn btn-outline-info" OnClick="SiteBackup_Click"
                        OnClientClick="if(confirm('要备份全站文件吗?')){setTimeout(function () { document.getElementById('SiteBackup').disabled = true;},50)}else{return false;}" />
                </td>
            </tr>
        </table>
        <div id="progressbar" style="width: 50%; display: none;">
            <div class="progress-label">压缩进度</div>
        </div>
        <div style="color: #f00; line-height: 25px; padding-left: 20px;">
            <asp:Label ID="runResult" runat="server" Visible="false" Text="还原数据库需如下操作：<br />1.断开数据库连接，因数据库有可能正在运行；<br />2.选择还原数据源；<br />3.删除数据库绑定的专属用户；<br />4.重新绑定用户。<br />* *如有问题可联系管理员进行还原。**"></asp:Label>
        </div>
        <div class="Creat_tips" runat="server" id="Creat">
            <div class="alert alert-success">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                <h4>提示!</h4>
                <p style="padding-left: 50px;">
                    <strong>
                        <span class='zi zi_exclamationTriangle' style='color: #f00; font-size: 18px;'></span>
                        <span>目前没有备份!</span>
                    </strong>
                </p>
            </div>
        </div>
        <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10"
            OnPageIndexChanging="EGV_PageIndexChanging" IsHoldState="false" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand"
            CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True">
            <Columns>
                <asp:TemplateField HeaderText="文件名">
                    <ItemTemplate>
                        <%#GetFName() %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="大小">
                    <ItemTemplate>
                        <%# GetSize(Eval("size").ToString())%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="创建时间">
                    <ItemTemplate>
                        <%# Eval("createTime")%>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton CommandName='Down' CommandArgument='<%# Eval("Name")%>' runat="server">[下载]</asp:LinkButton>
                        [<asp:LinkButton CommandName='<%#Eval("type","") == "1" ? "DelDir":"DelFiles" %>'
                            CommandArgument='<%# Eval("Name")%>' OnClientClick="if(!this.disabled) return confirm('确定要删除吗?');" runat="server">删除</asp:LinkButton>]
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
    </div>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<link type="text/css" href="/Plugins/JqueryUI/ProgressBar/css/jquery.ui.theme.css" rel="stylesheet" />
<link type="text/css" href="/Plugins/JqueryUI/ProgressBar/css/jquery.ui.progressbar.css" rel="stylesheet" />
<script type="text/javascript" src="/Plugins/JqueryUI/ProgressBar/js/jquery-ui.custom.js"></script>
<style type="text/css">
    .ui-progressbar {position: relative;top:50%;}
    .progress-label {position: absolute;left: 50%;top: 4px;font-weight: bold;text-shadow: 1px 1px 0 #fff;}
    .tdtitle {font-size:14px;font-weight:bold;text-align:center;}
    .allchk_l { display:none; }
</style>
<script>
$(function () {
	var progressbar = $("#progressbar"),
		progressLabel = $(".progress-label");

	progressbar.progressbar({//绑定进度条事件
		value: false,
		change: function () {
			progressLabel.text(progressbar.progressbar("value") + "%");
		},
		complete: function () {
			progressLabel.text("操作完成!");
		}
	});
	function progress() {
		var val = progressbar.progressbar("value") || 0;
		progressbar.progressbar("value", val + 1);
	}
    //-----Tab
	$("[data-toggle]").click(function () {
	    var filter = $(this).attr("href");
	    $(".tabs").hide();
	    $(filter).show();
	});
});
function increase(value) {//后台算出百分比，然后传值前台
	var progressbar = $("#progressbar")
	var val = progressbar.progressbar("value") || 0;
	progressbar.progressbar("value", value);
	//progressbar.progressbar("value", val + 1);//加1位
}
//实时获取进度,后台用异步或线程池
function ajaxPost(obj, a, val) {//this,actionName,要上传的值,回调方法,是否弹出回复窗(true显示,false不显示)
	$.ajax({
		type: "Post",
		url: "BackupRestore.aspx",
		data: { action: a, value: val },
		success: function (data) {
			if (a == "getProgress" && data == "100") {
				increase(parseInt(data));
				clearInterval(interval);
				location = location;
			}
			else {
				increase(parseInt(data));//必须要转换次，否则返回的字符串变量无用为0%
			}
		},
		error: function (data) {
		}
	});
}
var interval;
function beginCheck(request) {
	setTimeout(function () { document.getElementById('SiteBackup').disabled = true; }, 50);
	$("#progressbar").show();
	interval = setInterval(function () { ajaxPost(this, request, '') }, 1000);
}//实时获取后台进度
</script>
</asp:Content>