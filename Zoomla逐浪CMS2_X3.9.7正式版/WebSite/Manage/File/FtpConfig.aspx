<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FtpConfig.aspx.cs" Inherits="ZoomLaCMS.Manage.FtpFile.FtpConfig" EnableViewStateMac="false" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>远程文件配置</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/plus/ADManage.aspx","扩展功能"),
		new Bread("/{manage}/Content/Video/VideoList.aspx","文件管理"),
		new Bread("FtpAll.aspx","云端存储"),
        new Bread() {url="FtpAll.aspx", text="<a href='FtpConfig.aspx'>[添加云端服务器]</a>",addon="" }}
		)
    %>	
    <div class="container-fluid pr-0">
	<div class="row sysRow list_choice">
        <table class="table table-striped table-bordered table-hover sys_table">
            <tr>
                <td scope="col" class="spacingtitle" colspan="2" style="text-align: center;">
                    <strong>
                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                    </strong>
                </td>
            </tr>
            <tr>
                <th scope="col" class="w12rem_lg">远程服务器名 <span class="text-danger">*</span></th>
                <td scope="col">
                    <input id="Alias" runat="server" class="form-control max20rem" onblur="CheckName()" />
					<small class="text-muted">不可重名</small>
                    <span id="checkName" style="color: red; display: none;">重名了</span>
                </td>
            </tr>
            <tr>
                <th scope="col" >IP地址</th>
                <td scope="col">
                    <asp:TextBox ID="txt_fs" runat="server" CssClass="form-control max20rem" Text="u.z01.com"></asp:TextBox>
					
					<small class="text-muted">可以是别名，如u.z01.com</small>
                </td>
            </tr>
            <tr>
                <th scope="col">访问路径</th>
                <td scope="col">
                    <asp:TextBox ID="txt_url" runat="server" CssClass="form-control max20rem" Text="u.z01.com"></asp:TextBox>
                    &nbsp;&nbsp;<span class="red"><a href="http://www.z01.com/u.html" target="_blank">免费申请云存储</a></span>
                </td>
            </tr>
            <tr>
                <th scope="col">端口</th>
                <td scope="col">
                    <asp:TextBox ID="txt_pt" runat="server" CssClass="form-control max20rem" Text="21"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_pt" ErrorMessage="请输入端口号默认21" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th scope="col">用 户 名</th>
                <td scope="col">
                    <asp:TextBox ID="txt_user" runat="server" CssClass="form-control max20rem"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txt_user" ErrorMessage="请输入用户名" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th scope="col">密   码</th>
                <td scope="col">
                    <asp:TextBox ID="txt_pass" runat="server" CssClass="form-control max20rem"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txt_pass" ErrorMessage="请输入密码" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <th scope="col">存储路径</th>
                <td scope="col">
                    <asp:TextBox ID="txt_file" runat="server" CssClass="form-control max20rem" Text="/"></asp:TextBox>
					<small class="text-muted">必须为/或/path形式</small>
                    <ZL:FileUpload ID="file_path" runat="server" CssClass="form-control max20rem" Visible="false" />
                    <%--<asp:FileUpload ID="file_path" runat="server" CssClass="form-control max20rem" Visible="false" />--%>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txt_file" ErrorMessage="请输入远程文件路径" SetFocusOnError="True"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="text-center">
                    <asp:Button ID="Save_Btn" runat="server" Text="添加配置" CssClass="btn btn-info" OnClick="Save_Btn_Click" />
                    <input id="Button1" type="button" value="返回列表" class="btn btn-outline-info" onclick="javascript: history.back();" />
                </td>
            </tr>
        </table>
	</div>
    </div>
    <div style="display: none">
        <input type="text" id="FTPID" value="0" runat="server" />
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        function CheckName() {
            $.ajax({
                url: "FtpConfig.aspx",
                data: "action=CheckName&Alias=" + $("#Alias").val() + "&ID=" + $("#FTPID").val(),
                success: function (msg) {
                    switch (msg) {
                        case "1": $("#checkName").css("display", "");
                            $("#Button2").attr("disabled", "disabled");
                            break;
                        case "0": $("#checkName").css("display", "none");
                            $("#Button2").attr("disabled", "");
                            break;
                    }
                }
            });
        }
    </script>
</asp:Content>

