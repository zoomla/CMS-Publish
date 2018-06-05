<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditDataList.aspx.cs" MasterPageFile="~/Manage/I/Index.master" Inherits="ZoomLaCMS.Manage.Config.EditDataList" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>修改表说明</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/I/Main.aspx","工作台"),
		new Bread("DatalistProfile.aspx","系统全库概况"),
        new Bread() {url="", text="修改说明",addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
<table class="table table-striped table-bordered sys_table">
    <tr>
        <th class="w12rem_lg">数据表名</th>
        <td>
            <asp:Label ID="TxtTableName" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <th><strong>类型</strong></th>
        <td>
            <asp:Label ID="TxtType" runat="server"></asp:Label><asp:HiddenField ID="TxtTypeID" runat="server" />
        </td>
    </tr>

    <tr>
        <th><strong>说明</strong></th>
        <td>
            <asp:TextBox ID="TxtExplain" runat="server" class="form-control text_300"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td></td>
        <td>
            <asp:Button ID="EBtnTable" runat="server" OnClick="EBtnTable_Click" Text="保存信息" class="btn btn-info" />
            <a href="DataListProfile.aspx" class="btn btn-outline-info">返回列表</a>
        </td>
    </tr>
</table>
</div></div>
</asp:Content>
