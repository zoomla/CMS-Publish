<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMailTemp.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Mail.AddMailTemp" ValidateRequest="false" MasterPageFile="~/Manage/I/Index.master"  %>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
<title>创建邮件模板</title>
<script src="/Plugins/Ueditor/ueditor.config.js"></script>
<script src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/I/Main.aspx","工作台"),
		new Bread("/{manage}/User/UserManage.aspx","用户管理"),
		new Bread("MailTemplist.aspx","邮件模板"),
        new Bread() {url="", text="创建邮件模板",addon="" }}
		)
    %>
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice table-responsive-md">
    <table class="table table-striped table-bordered sys_table">
           <tr>
            <th class="tdleft"><strong>选择类型</strong></th>
            <td>
                <asp:DropDownList ID="drType" class="form-control max20rem" runat="server">
                    <asp:ListItem Value="1" Selected="True">系统通知</asp:ListItem>
                    <asp:ListItem Value="2">用户订阅</asp:ListItem>
                    <asp:ListItem Value="3">贺卡消息</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <th class="tdleft td_l"><strong>模板名称</strong></th>
            <td>
                <ZL:TextBox ID="TxtTempName" class="form-control max20rem" runat="server" AllowEmpty="false" ValidType="String"></ZL:TextBox></td>
        </tr>
        <tr><th class="tdleft"><strong>预览图片</strong></th>
            <td><ZL:SFileUp runat="server" ID="SFileUp" FType="Img"/></td>
        </tr>
        <tr>
			<td></td>
            <td>
                <textarea id="TxtContent" style="height:350px;width:960px;margin:0 auto;" runat="server"></textarea>
            </td>
        </tr>
        <tr><td></td>
            <td>
                <asp:Button ID="EBtnSubmit" class="btn btn-info" Text="保存" runat="server" OnClick="EBtnSubmit_Click" />
                <a href="MailTemplist.aspx" class="btn btn-outline-info">返回</a>
            </td>
        </tr>
    </table>
	</div>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        $(function () {
            UE.getEditor("TxtContent");
        })
    </script>
</asp:Content>



