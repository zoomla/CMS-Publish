<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AskAdd.aspx.cs" Inherits="ZoomLaCMS.Manage.Design.Ask.AskAdd" MasterPageFile="~/Manage/I/Index.Master" %>
<%@ Register Src="~/Manage/I/ASCX/SFileUp.ascx" TagPrefix="ZL" TagName="SFileUp" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<script src="/JS/DatePicker/WdatePicker.js"></script>
<title>问题管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("Default.aspx","动力模块"),
        new Bread("AskList.aspx","问卷调查"),
        new Bread() {url="/{manage}/design/ask/AskAdd.aspx", text="问卷管理",addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
 <table class="table table-bordered table-striped sys_table">
     <tr><th scope="col" class="w12rem_lg">问卷名称</th><td scope="col"><ZL:TextBox runat="server" ID="Title_T" class="form-control max20rem" AllowEmpty="false" /></td></tr>
     <tr><th>问卷封面</th><td>
         <ZL:SFileUp runat="server" ID="PreViewImg_UP" />
     </td></tr>
     <tr><th>到期时间</th><td><asp:TextBox runat="server" ID="EndDate_T" class="form-control max20rem" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd' })"></asp:TextBox></td></tr>
     <tr><th>问卷说明</th><td><asp:TextBox runat="server" ID="Remind_T" class="form-control m50rem_50" TextMode="MultiLine"></asp:TextBox></td></tr>
     <tr><td></td><td>
         <asp:Button runat="server" ID="Save_Btn" Text="保存信息" class="btn btn-info" OnClick="Save_Btn_Click" />
         <a href="AskList.aspx" class="btn btn-outline-info">返回列表</a>
                  </td></tr>
 </table>
 </div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>