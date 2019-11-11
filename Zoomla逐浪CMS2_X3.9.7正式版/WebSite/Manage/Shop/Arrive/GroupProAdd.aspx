<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GroupProAdd.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Arrive.GroupProAdd" MasterPageFile="~/Manage/I/Index.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>组合管理</title>
	<%=Call.SetBread( new Bread[] {
	new Bread("/{manage}/I/Main.aspx","工作台"),
	new Bread("GroupPro.aspx","组合商品"),
	new Bread(){url="", text="组合管理"}
	}) %>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
<table class="table table-bordered table-striped sys_table">
    <tr><th class="td_m">组合名称</th><td><ZL:TextBox runat="server" ID="Name_T" AllowEmpty="false" MaxLength="50" class="form-control max20rem" /></td></tr>
    <tr><th>组合商品</th><td>
                <input type="button" value="选择商品" onclick="upro.showdiag();" class="btn btn-outline-info" runat="server" id="selpro_btn" />
                <div id="uprolist" class="uprolist"></div>
                <asp:HiddenField runat="server" ID="UProIDS_Hid" />
                     </td></tr>
    <tr><th>备注</th><td><asp:TextBox runat="server" ID="Remind_T" class="form-control m50rem_50" TextMode="MultiLine" /></td></tr>
    <tr><td></td><td>
        <asp:Button runat="server" ID="Save_Btn" Text="保存信息" OnClick="Save_Btn_Click" class="btn btn-info" />
        <a href="GroupPro.aspx" class="btn btn-outline-info">返回列表</a>
    </td></tr>
</table>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script src="/JS/Controls/ZL_Array.js"></script>
    <script src="/JS/shop_upro.js"></script>
    <script>
        function closeDiag() { CloseComDiag(); }
    </script>
</asp:Content>