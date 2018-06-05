<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MessageSend.aspx.cs" Inherits="ZoomLaCMS.MIS.OA.Mail.MessageSend"  MasterPageFile="~/Office/OAMain.master"  ValidateRequest="false"%>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>发送短消息</title>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
<script type="text/javascript" src="/JS/MisView.js"></script>
<script type="text/javascript" src="/JS/ICMS/ZL_Common.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="mainDiv"> 
<div class="clearfix"></div>
<div class="us_seta">
<div class="pr-1 mt-1 table-responsive-md">
<table class="table table-bordered sys_table">
    <tr>
        <th class="text-right w12rem_lg">收件人</th>
        <td class="tdRight">
		<div class="input-group mb-3">
		  <asp:TextBox CssClass="form-control max20rem" ID="User_T" runat="server"  />
		  <div class="input-group-append">
			<button type="button" onclick="user.sel('User','OA');" class="btn btn-info">选择</button>
		  </div>
		</div>
		<asp:HiddenField ID="User_Hid" runat="server" />
        </td>
    </tr>
    <tr>
        <th class="text-right">抄送人</th>
        <td class="tdRight">
		<div class="input-group mb-3">
		  <asp:TextBox CssClass="form-control max20rem" ID="CCUser_T" runat="server"/>
		  <div class="input-group-append">
			<button type="button" onclick="user.sel('CCUser','OA');" class="btn btn-info">选择</button>
		  </div>
		</div>
		<asp:HiddenField ID="CCUser_Hid" runat="server" />
        </td>
    </tr>
    <tr>
        <th class="text-right">邮件标题</th>
        <td class="tdRight">
        <asp:TextBox ID="TxtTitle" CssClass="form-control max20rem" runat="server" />
        <%-- <asp:RequiredFieldValidator ID="ValrTitle" runat="server" ControlToValidate="TxtTitle" ErrorMessage="邮件标题不能为空" Display="Dynamic">*</asp:RequiredFieldValidator>--%>
        </td>
    </tr>
    <tr>
        <th class="text-right">内容</th>
        <td>
        <asp:TextBox ID="EditorContent" runat="server" TextMode="MultiLine" Width="100%" Height="300px" ClientIDMode="Static">
        </asp:TextBox>
        <%--  <asp:RequiredFieldValidator ID="ValrContent" runat="server" ControlToValidate="EditorContent" ErrorMessage="短消息内容不能为空" Display="Dynamic">*</asp:RequiredFieldValidator>--%>
        </td>
    </tr>
    <tr id="hasFileTR" runat="server" visible="true">
        <th class="text-right">已上传文件<asp:HiddenField runat="server" ID="hasFileData" ClientIDMode="Static" />
        </th>
        <td id="hasFileTD" runat="server"></td>
    </tr>
    <tr>
        <th >
        附件：   
        </th>
        <td colspan="7">
            <table id="attachTB">
                <tr>
                    <td>
                    <input type="file" name="fileUPs" class="fileUP" /><input type="button" class="btn btn-outline-danger btn-sm mr-2" value="删除" onclick="delAttach(this);" /><input type="button" class="btn btn-sm btn-info" value="再加个附件" onclick="addAttach();" />
                    </td>
                </tr>
            </table>
    	</td>
    </tr>
    <tr>
        <td></td>
        <td>
            <asp:Button ID="BtnSend" runat="server" Text="发送" OnClick="BtnSend_Click" OnClientClick="return SendConfirm();" class="btn btn-outline-info" />
            <asp:Button ID="Button1" runat="server" Text="存草稿" OnClick="Button1_Click" class="btn btn-outline-info" />
            <asp:Button ID="BtnReset" runat="server" Text="清除" OnClick="BtnReset_Click" class="btn btn-outline-danger" />
        </td>
    </tr>
</table>
</div>
</div>
</div>
</div>
<%=Call.GetUEditor("EditorContent",2)%>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/ICMS/ZL_Common.js"></script>
<script>
var uptr = '<tr><td><input type="file" name="fileUP" class="fileUP" /><input type="button" class="btn btn-sm  btn-outline-danger" value="删除" onclick="delAttach(this);" /></td></tr>';
function addAttach() {
	$("#attachTB").append(uptr);
}
function delAttach(obj) {
	$(obj).parent().remove();
}
function delHasFile(v, obj) {
	rv = $("#hasFileData").val().replace(v + ",", "");
	$("#hasFileData").val(rv)
	$(obj).parent().remove();
}
function SendConfirm()
{
    rece = $("#User_T").val();
	if (rece == "") { alert('未选定收件人!'); return false;}
	title = $("#TxtTitle").val();
	if (title == "") { alert('邮件标题不能为空!'); return false; }
   
	if (confirm('确定要发送该邮件吗'))
	{
		disBtn(this, 3000); return true;
	} else {
		return false;
	}
}
</script> 
</asp:Content>

