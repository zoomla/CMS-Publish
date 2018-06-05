<%@ Page Language="C#" MasterPageFile="~/Manage/I/Index.master" AutoEventWireup="true" CodeBehind="AddEditModel.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.AddEditModel" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server">
<link type="text/css" href="/dist/css/bootstrap-switch.min.css" rel="stylesheet" />
<title>编辑模型</title>
</asp:Content>
<asp:Content ContentPlaceHolderID="Content" Runat="Server">
<%=Call.SetBread( new Bread[] {
            new Bread("/{manage}/I/Main.aspx","工作台"),
            new Bread("ModelManage.aspx?ModelType="+ModelType,"模型管理"),
            new Bread(){url=Request.RawUrl, text=LTitle.Text}
}) %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
    <table class="table table-striped table-bordered sys_table">
	<tr>
		<th scope="col" class="text-center" colspan="2">
			<asp:Literal ID="LTitle" runat="server" ></asp:Literal>
		</th>
	</tr>
	<tr>
		<th scope="col" class="w12rem_lg" >
			<strong><%=bll.GetModelType(ModelType) %>名称</strong>
		</th>
		<td scope="col">
			<asp:TextBox ID="TxtModelName" class="form-control max20rem" onchange="checkTbName()" runat="server" MaxLength="50" onkeyup="Getpy('TxtModelName','TxtTableName')" autofocus="true" />
            <span>
			<asp:RequiredFieldValidator ID="RV1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtModelName">
			    <small class="text-muted">模型名称不能为空</small>
			</asp:RequiredFieldValidator></span>
        </td>
	</tr>
	<tr>
		<th>
			<strong>创建的数据表名</strong>
		</th>
		<td>
			<div class="input-group mb-3">
			<div class="input-group-prepend">
			<span class="input-group-text">
			<asp:Label ID="LblTablePrefix" class="input-group-prepend" runat="server"  />
			</span>
		  </div>
			
			<asp:TextBox ID="TxtTableName" CssClass="form-control max20rem" onchange="checkTbName()" runat="server" />
			</div>
			
            <span id="checkname_span" style="color:red;display:none;">表名重复!</span>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="TxtTableName"><small class="text-muted">数据表名不能为空</small></asp:RequiredFieldValidator>
		</td>
	</tr>
    <tr id="PubType1" visible="false" runat="server">
            <th>
                <strong>互动类型</strong>
            </th>
            <td>
                <asp:RadioButtonList ID="PubType" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Selected="True" Value="0">评论</asp:ListItem>
                    <asp:ListItem Value="1">投票</asp:ListItem>
                    <asp:ListItem Value="2">活动</asp:ListItem>
                    <asp:ListItem Value="3">留言</asp:ListItem>
                    <asp:ListItem Value="4">问券调查</asp:ListItem>
                    <asp:ListItem Value="5">统计</asp:ListItem>
                    <asp:ListItem Value="6">竞标</asp:ListItem>
                </asp:RadioButtonList>
             </td>
        </tr>
	<tr>
		<th>
			<strong>项目名称 <span class="text-danger">*</span></strong>
		</th>
		<td>
			<div class="input-group">
			<asp:TextBox ID="TxtItemName" runat="server" CssClass="form-control max20rem" MaxLength="20" />
            <div id="ItemTd" class="input-group-append">
            </div>
			</div>
            <span>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtItemName" ErrorMessage="RequiredFieldValidator">
			<small class="text-muted">项目名称不能为空</small>
			</asp:RequiredFieldValidator></span>
		</td>
	</tr>
	<tr>
		<th>
			<strong>项目单位 <span class="text-danger">*</span></strong>
		</th>
		<td>
			<div class="input-group">
			<asp:TextBox ID="TxtItemUnit" runat="server" Text="篇" CssClass="form-control max20rem" MaxLength="20" />
            <div id="Unitd" class="input-group-append">
            </div>
			</div>
			

			
			
            <span>
			<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtItemUnit" ErrorMessage="RequiredFieldValidator">
			<small class="text-muted">项目单位不能为空</small>
			</asp:RequiredFieldValidator></span>
		</td>
	</tr>
   <tr>
		<th>
			<strong>是否复制</strong>
			  <br />
			  确定模型是否可以复制
		</th>
		<td>
           <input type="checkbox" runat="server" id="rblCopy" class="switchChk"  checked="checked" />
		</td>
	</tr>
    <tr>
		<th>
			<strong>是否批量添加</strong>
			  <br />
			  确定用户中心是否可以批量添加
		</th>
		<td>
            <input type="checkbox" runat="server" id="rblIslotsize" class="switchChk"/>
		</td>
	</tr>
	<tr>
		<th>
			<strong>项目图标</strong>
		</th>
		<td>
			<div class="input-group">
				<asp:TextBox runat="server" ID="ItemIcon_T" CssClass="form-control max20rem"/>
				<div class="input-group-append">
				   <a href="javascript:;" onclick="ShowComDiag('/common/icon2.html','选择图标');" class="btn btn-info sfile_selbtn rounded-right">
				   <i class="zi zi_fileGraph" aria-hidden="true"></i>
				   </a>
				</div>
			</div>
			
		</td>
	</tr>
	<tr>
		<th>
			<strong>模型描述</strong>
		</th>
		<td>
			<asp:TextBox ID="TxtDescription" runat="server" CssClass="form-control m50rem_50" TextMode="MultiLine" Height="77px"/>
		</td>
	</tr>
	<tr>
		<td></td>
		<td colspan="2" class="text-left panel_footers">
			<asp:Button ID="EBtnSubmit"  Text="保存信息" OnClientClick="return CheckData();" CssClass="btn btn-info"  OnClick="EBtnSubmit_Click" runat="server" />
			&nbsp;&nbsp;
            <a href="ModelManage.aspx?ModelType=<%=Request["ModelType"] %>" class="btn btn-outline-info">返回列表</a>
		</td>
	</tr>
</table>
    <div id="icons" style="display:none"></div>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/dist/js/bootstrap-switch.js"></script>
<script src="/JS/chinese.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
    $("body").ready(function () {
        SelUnit();
        SelItem();
    });
function CheckData(){
    var patt = /^[a-zA-Z0-9_\-]+$/
    if (!patt.test($("#TxtTableName").val())) {
        alert('数据表名只能由字母、下划线或数字组成！');
        $("#TxtTableName").focus();
        return false;
    }
    return true;
}
function Getpy(ontxt, id) {
if ('<%=Request["ModelID"] %>' == "") {
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
}
function SelUnit(){
    var units= "篇,个,张,件";
    var array=units.split(",");
    for (var i = 0; i < array.length; i++) {
        var str="<button type='button' class='btn btn-outline-info'>"+array[i]+"</button>"
        $("#Unitd").append(str);
    }
    $("#Unitd").find("button").click(function(){
        $("#TxtItemUnit").val($(this).text());
    });
            
}
function SelItem(){
    var units= "文章,软件,图片,商品";
    var array=units.split(",");
    for (var i = 0; i < array.length; i++) {
        var str="<button type='button' class='btn btn-outline-info'>"+array[i]+"</button>"
        $("#ItemTd").append(str);
    }
    $("#ItemTd").find("button").click(function(){
        $("#TxtItemName").val($(this).text());
    });
            
}
//检查表名是否重复
function checkTbName(){
    var tbname=$("#TxtTableName").val();
    //checkname_span
    $.ajax({
        type:'POST',
        data:{action:'checkname',tbname:tbname},
        success:function(data){
            if (data==-1) {
                $("#checkname_span").show();
                $("#EBtnSubmit").attr("disabled","disabled");
            }else{
                $("#checkname_span").hide();
                $("#EBtnSubmit").removeAttr("disabled");
            }
        }
    });
}
var zlicon = { text: "" };
zlicon.back = function (icon) {
    if (!icon) { return; }
    $(zlicon.text).val(icon);
    $(zlicon.text + "_icon").attr("class", icon);
    CloseComDiag();
	console.log(icon);
	//$("#ico_show").toggleClass(icon);
	$("#ico_show").attr("class", icon);
}
zlicon.init = function (text) {
    zlicon.text = text;
    zlicon.back($(text).val());
	
}
zlicon.init("#ItemIcon_T");


</script>
</asp:Content>