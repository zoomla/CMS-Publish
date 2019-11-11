<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendSubMail.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Mail.SendSubMail" ValidateRequest="false" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>发送订阅邮件</title>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("SubscriptListManage.aspx?menu=all","订阅管理"),
        new Bread() {url="", text="发送邮件",addon="" }}
		)
    %>
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice">
    <table class="table table-striped table-bordered table-hover sys_table">
        <tr>
            <th class="w12rem_lg">收件人选择</th>
            <td>
                <asp:RadioButtonList ID="SubUsers_Radio" RepeatDirection="Horizontal" runat="server">
                    <asp:ListItem Selected="True" Value="alluser" Text="所有订阅用户"></asp:ListItem>
                    <%--<asp:ListItem Value="setuser" Text="自定义用户"></asp:ListItem>--%>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr style="display:none;" id="SetUser">
            <th>订阅用户</th>
            <td>
                <asp:TextBox TextMode="MultiLine" Enabled="false" CssClass="form-control max20rem" ID="SubUsers_T" Height="150" runat="server"></asp:TextBox>
                <asp:HiddenField ID="SubIDS_Hid" runat="server" />
                <button type="button" class="btn btn-info">选择订阅用户</button>
            </td>
        </tr>
        <tr>
            <th>邮件主题</th>
            <td>
				<div class="input-group ">
			  <asp:TextBox ID="Subject_T" runat="server" CssClass="form-control max20rem"></asp:TextBox>
			  <div id="port_btns" class="input-group-append">
				  <button type="button" class="btn btn-outline-info" onclick="ShowContents()">选择订阅内容</button>
			  </div>
			  </div>
            </td>
        </tr>
        <tr>
            <th>邮件内容</th>
            <td>
                <asp:TextBox ID="Content_T" runat="server"  CssClass="m50rem_50 mb-2" Height="300" TextMode="MultiLine"></asp:TextBox>
                <%=Call.GetUEditor("Content_T",3) %>
            </td>
        </tr>
        <tr>
            <th>邮件签名</th>
            <td>
                <asp:DropDownList ID="Graph_Drop" runat="server" CssClass="form-control max20rem" DataTextField="Name" DataValueField="ID"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="text-center">
                <asp:Button ID="Send_Btn" runat="server" OnClick="Send_Btn_Click" CssClass="btn btn-outline-info" Text="发送邮件" />
                <a href="SubscriptListManage.aspx" class="btn btn-outline-info">返回列表</a>
            </td>
        </tr>
    </table>
	</div></div>
</asp:Content>
<asp:Content ContentPlaceHolderID="ScriptContent" runat="server">
    <script type="text/javascript" src="/JS/Controls/ZL_Dialog.js"></script>
    <script>
        $(function () {
            $("#SubUsers_Radio input").click(function () {
                if ($(this)[0].checked&& $(this).val() == "setuser") {
                    $("#SetUser").show();
                } else {
                    $("#SetUser").hide();
                }
            });
        });
        function ShowContents() {
            comdiag.maxbtn = false;
            ShowComDiag("/Common/ContentList.aspx", "选择内容");
        }
        function DealResult(cid) {
            CloseComDiag();
            UE.getEditor("Content_T").setContent("读取中...",false);
            $.post("SendSubMail.aspx", { action: "getcon", cid: cid }, function (data) {
                if (!data) { alert('未知错误!'); return; }
                var conarr = JSON.parse(data);
                console.log(conarr);
                $("#Subject_T").val(conarr[0].Title);
                UE.getEditor("Content_T").setContent(conarr[0].content, false);
            });
        }
    </script>
</asp:Content>


