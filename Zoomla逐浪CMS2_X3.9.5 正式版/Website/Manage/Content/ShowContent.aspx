<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowContent.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.ShowContent" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
<title>预览内容</title>
    <style>
    .tab-pane table tr td:first-child{ width:10%; }
    .bottom0{margin-bottom:0px;}
    #middle_td{vertical-align: middle;}
    .alert-info{margin-top:5px;}
    </style>
    <script src='/JS/Plugs/ZL_UAction.js'></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
   <asp:Label runat="server" ID="Bread_L"></asp:Label>
    <asp:HiddenField ID="ModelID_Hid" runat="server" />
	<div class="container-fluid pr-0">
    <div class="row sysRow list_choice">
        <ul class="nav nav-tabs">
            <li class="nav-item"><a class="nav-link active" href="#base" data-toggle="tab">基本信息</a></li>
            <li class="nav-item"><a class="nav-link" href="#info" data-toggle="tab">信息属性</a></li>
            <li class="nav-item"><a class="nav-link" href="#process" data-toggle="tab">流程控制</a></li>
            <li class="nav-item"><a class="nav-link" href="#Copyright " data-toggle="tab">版权管理</a></li>
        </ul>
		
        <div class="tab-content table-responsive">
            <div class="tab-pane fade in active show" id="base">
                <table class="table table-bordered sys_table">
                    <tr>
                        <th class="w12rem_lg">所属节点</th>
                        <td>
                            <asp:Label runat="server" ID="NodeName_L"></asp:Label>
						</td>
                    </tr>
                    <tr>
                        <th>ID</th>
						<td>
							<asp:Label ID="Gid_L" runat="server"></asp:Label>
						</td>
                    </tr>
                    <tr id="html_td"></tr>
                    <tr>
						<th><asp:Label runat="server" ID="C_Title_L"></asp:Label></th>
						<td>
							<asp:Label ID="Title_L" runat="server"></asp:Label>
						</td>
					</tr>
                    <tr><th class="fd_td_l">主编辑器扩展图</th><td><img runat="server" id="topimg_img" class="img_100" onerror="shownopic(this);" /></td></tr>
                </table>
                <script>
                    $.post("/AdminMVC/Common/ContentField?gid=<%:Gid%>", {"mode":"1"}, function (data) {
                        $("#html_td").replaceWith(data);
                    })

                </script>
            </div>
            <div class="tab-pane fade" id="info">
                <table class="table table-bordered sys_table">
                    <tr>
						<th class="w12rem_lg">录入者</th>
						<td >
							<asp:Label ID="Inputer_L" runat="server"></asp:Label>
						</td>
					</tr>
					<tr>
						<th>点击数</th>
						<td >
							<asp:Label ID="Hits_L" runat="server"></asp:Label>
						</td>
					</tr>
					<tr>
						<th>录入时间</th>
						<td >
							<asp:Label ID="CreateTime_L" runat="server"></asp:Label>
						</td>
					</tr>
                    <tr>
						<th>更新时间</th>
						<td >
							<asp:Label ID="UpdateTime_L" runat="server"></asp:Label>
						</td>
					</tr>
                </table>
            </div>
            <div class="tab-pane fade" id="process">
                <table class="table table-bordered sys_table">
                    <tr>
						<th class="w12rem_lg">审核状态<br />
						</th>
						<td class="tdrighttxt">
							<asp:Label ID="ConStatus_L" runat="server"></asp:Label>
						</td>
					</tr>
					<tr>
						<th>推荐</th>
						<td>
							<asp:Label ID="Elite_L" runat="server"></asp:Label>
						</td>
					</tr>
                </table>
            </div>
            <div class="tab-pane fade" id="Copyright">
                <table class="table table-bordered cr_table sys_table">
                    <tr id="cr_tr">
                        <th id="middle_td"  class="w12rem_lg">授权规则</th>
                        <td>
                            <div class="form-group text_300">
                                <label class="sr-only" for="exampleInputAmount">Amount (in dollars)</label>
                                <div class="input-group">
                                    <div class="input-group-addon">转载使用</div>
                                    <input type="text" class="form-control text-right" id="RepPri_T" disabled="disabled" placeholder="0-99元的整数">
                                    <div class="input-group-addon">.00</div>
                                </div>
                            </div>
                            <div class="form-group text_300 bottom0">
                                <label class="sr-only" for="exampleInputAmount">Amount (in dollars)</label>
                                <div class="input-group">
                                    <div class="input-group-addon">素材使用</div>
                                    <input type="text" class="form-control text-right" id="MatPri_T" disabled="disabled" placeholder="0-99元的整数">
                                    <div class="input-group-addon">.00</div>
                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr id="worksid_tr">
                        <th>版权编号</th>
                        <td>
                            <label id="cr_worksid_l"></label>
                        </td>
                    </tr>
                    <tr id="workslink_tr">
                        <th>售卖网址</th>
                        <td id="cr_worklink"></td>
                    </tr>
                </table>
                <div id="configcr" class="alert alert-info" style="display: none;">
                    <span><strong>提示：</strong></span>未配置版权印接口，若要使用版权功能，请 <a class="btn btn-info" href="../Config/PlatInfoList.aspx">前往配置>></a>
                </div>
                <div id="nonecr" class="alert alert-info" style="display: none;">
                    <span><strong>提示：</strong></span>文章没有生成版权印，若要生成版权印，请前往修改页面进行操作!
                </div>
            </div>
        </div>
        <div class="text-center Conent_fix">
            <a href="EditContent.aspx?GeneralID=<%:Gid %>" class="btn btn-outline-info mb-2">修改内容</a>
				&nbsp;<asp:Button ID="Del_Btn" CssClass="btn btn-outline-danger mb-2" runat="server" Text="删除" OnClientClick="return confirm('你确定将该数据删除到回收站吗？')"
					OnClick="delete_Click" />
				&nbsp;<asp:Button ID="Reject_Btn" CssClass="btn btn-outline-danger mb-2" runat="server" Text="直接退稿" OnClick="Reject_Btn_Click" />
				&nbsp;<asp:Button ID="UnAudit_Btn" CssClass="btn btn-outline-danger mb-2" runat="server" Text="取消审核" OnClick="UnAudit_Btn_Click" />
				&nbsp;<asp:Button ID="Elite_Btn" CssClass="btn btn-outline-info mb-2" runat="server" Text="设为推荐" OnClick="Elite_Btn_Click" />
                &nbsp;<asp:Button ID="Button6" CssClass="btn btn-outline-danger mb-2" runat="server" Text="取消推荐" OnClick="Button6_Click" />
                <a href="/Item/<%:Request.QueryString["GID"] %>.aspx" target="_blank" class="btn btn-outline-info mb-2">浏览文章</a>
        </div>
    </div>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/SelectCheckBox.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Modal/APIResult.js"></script>
<script>
    $(function () {
        crhelper.init();
        if (getParam("type")) {
            $("li a[href='#tab" + getParam("type") + "']").parent().addClass("active").siblings("li").removeClass("active");;
        }
    })
    function ShowTabs(n) {
        location.href = 'ShowContent.aspx?GID=<%=Request.QueryString["GID"] %>&type=' + n + '&modeid=<%=Request.QueryString["modeid"] %>';
    }
    var diag = new ZL_Dialog();
    function opentitle(url, title) {
        diag.title = title;
        diag.url = url;
        diag.ShowModal();
    }
    function editnode(NodeID) {
        var answer = confirm("该栏目未绑定模板，是否立即绑定");
        if (answer == false) {
            return false;
        }
        else {
            open_page(NodeID, "Node/EditNode.aspx?NodeID=");
        }
    }
    function closdlg() {
        Dialog.close();
    }
    function open_page(NodeID, strURL) {
        var diag = new Dialog();
        diag.Width = 1000;
        diag.Height = 750;
        diag.Title = "配置节点<span style='font-weight:normal'>[ESC键退出当前操作]</span>";
        diag.URL = strURL + NodeID;
        diag.show();
    }
    $().ready(function () {
        if ($("#Egv tr").length > 1) { $("#commentDiv").show(); }
    });

    var crhelper = { api: "/Manage/Copyright/cr.ashx", gid:"<%:Gid%>" };
    crhelper.init=function(){
        $.post(this.api+"?action=get",{ gid: crhelper.gid },function(data){
            var model = APIResult.getModel(data);
            if (APIResult.isok(model)) {
                $("#RepPri_T").val(model.result.RepPrice);
                $("#MatPri_T").val(model.result.MatPrice);
                $("#cr_worksid_l").text(model.result.WorksID);
                var link = "http://www.banquanyin.com/" + model.result.WorksID;
                $("#cr_worklink").text("").append($("<a href='" + link + "' target='_blank' >" + link + "</a>"));
            }
            else {
                $(".cr_table").hide();
                if(model.retmsg=="未配置版权印接口"){
                    $("#configcr").css("display","block");
                } else {
                    $("#nonecr").css("display", "block");
                }
            }
        });
    }
    </script>
</asp:Content>