<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddMailIdiograph.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Mail.AddMailIdiograph" ValidateRequest="false" MasterPageFile="~/Manage/I/Index.master" %>
<%@ Register TagPrefix="ZL" TagName="UserGuide" Src="~/Manage/I/ASCX/UserGuide.ascx" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>签名管理</title>
    <script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="/Plugins/Ueditor/ueditor.all.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/User/UserManage.aspx","用户管理"),
        new Bread("/{manage}/User/Mail/SubscriptListManage.aspx?menu=all","订阅管理"),
        new Bread("MailIdiographList.aspx","签名列表"),
        new Bread() {url="", text="添加签名",addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
    <table class="table table-striped table-bordered table-hover sys_table">
      <tr>
        <th scope="col" class="w12rem_lg">签名标签</th>
        <td scope="col"><asp:TextBox ID="txtName" runat="server" class="form-control m50rem_50"></asp:TextBox></td>
      </tr>
        <tr>
            <th>签名内容</th>
            <td>
                <asp:TextBox ID="txtContext" class="m50rem_50" style="height:200px;" runat="server" TextMode="MultiLine"></asp:TextBox>
                <%=Call.GetUEditor("txtContext",2) %>
            </td>
        </tr>
      <tr>
        <th>签名状态</th>
        <td><asp:RadioButtonList ID="rblState" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem Value="True" Selected="true">启用</asp:ListItem>
            <asp:ListItem Value="False">禁用</asp:ListItem>
          </asp:RadioButtonList></td>
      </tr>
      <tr><td></td>
        <td><asp:Button ID="Save_Btn" class="btn btn-outline-info" runat="server" Text="提交" OnClick="Save_Btn_Click" /></td>
      </tr>
    </table>
  </div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>
