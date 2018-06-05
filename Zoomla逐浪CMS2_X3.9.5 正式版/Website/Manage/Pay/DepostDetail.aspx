<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepostDetail.aspx.cs" Inherits="ZoomLaCMS.Manage.Pay.DepostDetail" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>充值详情</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread( new Bread[] {
new Bread("/{manage}/Config/SiteInfo.aspx","系统设置"),
new Bread("../Shop/PayList.aspx","支付明细"),
new Bread(){url="", text="充值单详情"}
}) %>

    <div id="condiv" class="container-fluid pr-0">
	<div class="row sysRow list_choice">
    <table class="table table-bordered table-striped sys_table">
        <tr><th class="w12rem_lg">支付单号：</th>  <td><asp:Label runat="server" ID="PayNo_L"></asp:Label></td></tr>
        <tr><th>订单编号</th>  <td><asp:Label runat="server" ID="OrderNo_L"></asp:Label></td></tr>
        <tr><th>付款状态</th><td><asp:Label runat="server" ID="PayStatus_L"></asp:Label></td></tr>
        <tr><th>处理结果</th><td><asp:Label runat="server" ID="CStatus_L"></asp:Label></td></tr>
        <tr><th>会 员 名 </th><td><asp:Label runat="server" ID="UserName_L"></asp:Label></td></tr>
        <tr><th>充值金额</th><td><asp:Label runat="server" ID="MoneyPay_L"></asp:Label></td></tr>
        <tr><th>优惠金额</th><td>0.00</td></tr>
        <tr><th>充值日期</th><td><asp:Label runat="server" ID="AddTime_L"></asp:Label></td></tr>
        <tr><th>支付平台</th><td><asp:Label runat="server" ID="PayPlat_L"></asp:Label></td></tr>
        <tr><th>实收金额</th><td><asp:Label runat="server" ID="MoneyTrue_L"></asp:Label></td></tr>
        <tr><th>付款日期</th><td><asp:Label runat="server" ID="PayedTime_L"></asp:Label></td></tr>
        <tr><th>备注</th><td><asp:Label runat="server" ID="Remark_L"></asp:Label></td></tr>
        <tr><td></td>
        <td> 
            <asp:Button ID="ForceSucc_B" runat="server" Visible="false" CssClass="btn btn-outline-info" Text="强制成功" OnClientClick="return confirm('确定要强制改变支付单状态吗?');" OnClick="ForceSucc_B_Click" />
            <input type="button" class="btn btn-outline-info" value="导出Excel" onclick="OutToExcel();"  />
            <asp:Literal ID="Return_L" runat="server" />
        </td></tr>
    </table>
	</div>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Label/ZLHelper.js"></script>
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script>
        function OutToExcel() {
            var $html = $(document.getElementById("condiv").outerHTML);
            $html.find("td").css("border", "1px solid #666");
            $html.find("tr:last").remove();
            ZLHelper.OutToExcel($html.html(), "充值信息");
        }
        var userdiag = new ZL_Dialog();
        function showuser(uid) {
            userdiag.reload = true;
            userdiag.title = "查看用户";
            userdiag.url = "../User/Userinfo.aspx?id="+uid;
            userdiag.backdrop = true;
            userdiag.maxbtn = false;
            userdiag.ShowModal();
        }
    </script>
</asp:Content>