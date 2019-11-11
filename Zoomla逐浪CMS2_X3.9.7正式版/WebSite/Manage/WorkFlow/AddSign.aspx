<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSign.aspx.cs" Inherits="ZoomLaCMS.Manage.WorkFlow.AddSign"  MasterPageFile="~/Manage/I/Index.master" %>

<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>添加电子签名</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("OAConfig.aspx","OA配置"),
		new Bread("SignManage.aspx","签章管理"),
        new Bread() {url="", text="添加签章",addon="" }}
		)
    %>
    <div class="container-fluid pr-0">
	<div class="row sysRow list_choice">
        <table class="table table-striped table-bordered table-hover sys_table">
            <tr>
                <th scope="col" class="w12rem_lg">签章名 <span class="text-danger">*</span></th>
                <td scope="col">
                    <asp:TextBox runat="server" CssClass="form-control max20rem" ID="signNameT" MaxLength="30" />
                    <asp:RequiredFieldValidator ControlToValidate="signNameT" ID="r1" runat="server" ErrorMessage="签章名不能为空" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th>签章图</th>
                <td>
                    <ZL:SFileUp ID="SFile_Up" runat="server" />

                </td>
            </tr>
            <tr>
                <th>签章密码</th>
                <td>
                    <asp:TextBox runat="server" ID="SignPwd_T" CssClass="form-control max20rem" TextMode="Password"></asp:TextBox>
					<small class="text-muted">默认为111111</small>
					</td>
            </tr>
            <tr>
                <th>密钥</th>
                <td>
                    <asp:TextBox runat="server" CssClass="form-control max20rem" ID="signKeyT" Enabled="false" />
					<small class="text-muted">提示:勿需填,添加时自动生成</small>
                </td>
            </tr>
            <tr>
                <th>绑定用户</th>
                <td>
					<div class="input-group">
					  <asp:TextBox runat="server" ID="BindUser_T" CssClass="form-control max20rem" />
					  <div id="port_btns" class="input-group-append">
						  <input type="button" onclick="user.sel('BindUser', 'user', '')" value="选择用户" class="btn btn-info" />
					  </div>
				    </div>
                    <asp:HiddenField ID="BindUser_Hid" runat="server" />
                </td>
            </tr>
            <tr>
                <th>状态</th>
                <td>
                    <asp:CheckBox runat="server" ID="statusChk" Text="启用" Checked="true" /></td>
            </tr>
            <tr>
                <th>备注</th>
                <td>
                    <asp:TextBox runat="server" ID="remindT" TextMode="MultiLine" Height="100" CssClass="form-control max20rem"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <th>操作</th>
                <td>
                    <asp:Button runat="server" ID="saveBtn" CssClass="btn btn-info" Text="保存" OnClick="saveBtn_Click" />
                    <asp:Button runat="server" ID="editBtn" CssClass="btn btn-info" Text="修改" OnClick="editBtn_Click" Visible="false" />
                    <input type="button" value="返回" class="btn btn-outline-info" name="back" onclick="history.back();" />
                </td>
            </tr>
        </table>
	</div>
    </div>
    <div id="div_share" class="panel panel-primary" style="display: none; position: absolute; z-index: 3;">
        <div class="panel-heading">
            <span style="float: right; cursor: pointer;" onclick="hidediv()" title="关闭">关闭</span><h3 class="panel-title">选择会员</h3>
        </div>
        <div class="panel-body">
            <iframe id="userIframe" style="z-index: 2; visibility: inherit; overflow: auto; overflow-x: hidden; width: 100%; height: 300px;" name="main_right" src="/Office/Mail/SelUser.aspx?Type=Radio" frameborder="0"></iframe>
        </div>
    </div>
    <asp:HiddenField runat="server" ID="dataField" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Controls/ZL_Array.js"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/Plugs/angular.min.js"></script>
    <script>
        user.hook["BindUser"] = userdeal;
        function userdeal(list, select) {
            $("#" + select + "_T").val(list[0].UserName);
            $("#" + select + "_Hid").val(list[0].UserID);
            if (comdiag != null) { CloseComDiag(); }
        }
    </script>
</asp:Content>
