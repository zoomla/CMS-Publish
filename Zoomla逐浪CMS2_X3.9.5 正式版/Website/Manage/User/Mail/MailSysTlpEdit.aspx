<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MailSysTlpEdit.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Mail.MailSysTlpEdit" ValidateRequest="false" MasterPageFile="~/Manage/I/Index.master"   %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>修改系统模板</title>
    <script src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/I/Main.aspx","工作台"),
	new Bread("/{manage}/User/UserManage.aspx","用户管理"),
	new Bread("MailSysTlp.aspx","系统模板"),
	new Bread() {url="", text="修改系统模板",addon= "" }}
	)
%>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
    <table class="table table-striped table-bordered table-hover sys_table">
        <tr>
            <th class="w12rem_lg"><strong>模板名称</strong></th>
            <td style="text-align: left">
                <asp:TextBox ID="TxtTempName" class="form-control max20rem" runat="server" ReadOnly="True"></asp:TextBox></td>
        </tr>
        <tr>
            <th class="tdleft"><strong>模板内容</strong></th>
            <td>
                <textarea id="TxtContent" class="m50rem_50" style="height:200px;" runat="server"></textarea>
            </td>
        </tr>
        <tr><td></td>
            <td>
                <asp:Button ID="EBtnSubmit" class="btn btn-info" Text="保存" runat="server" OnClick="BtnSubmit_Click" />
                <a href="MailSysTlp.aspx" class="btn btn-outline-info">返回</a>
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