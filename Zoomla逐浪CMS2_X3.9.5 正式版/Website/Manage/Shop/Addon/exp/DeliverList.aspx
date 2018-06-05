<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeliverList.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.DeliverList" MasterPageFile="~/Manage/I/Index.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>发退货明细</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/Shop/ProductManage.aspx","商城管理"),						
        new Bread("../../BankRollList.aspx","明细记录"),						
        new Bread() {url="", text="发退货明细",addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
    <table class="table table-striped table-bordered table-hover">
        <tr class="tdbg text-center">
            <td><span>日期</span></td>
            <td>方向</td>
            <td>客户名称</td>
            <td><span>用户名</span></td>
            <td>收货人姓名</td>
            <td><span>订单编号</span></td>
            <td><span>快递公司</span></td>
            <td><span>操作人</span></td>
            <td><span>经手人</span></td>
            <td><span>已签收</span></td>
            <td><span>操作</span></td>
        </tr>
    </table>
	</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>
