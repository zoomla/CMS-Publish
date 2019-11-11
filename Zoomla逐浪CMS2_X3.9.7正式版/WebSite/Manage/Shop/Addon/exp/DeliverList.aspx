<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeliverList.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.DeliverList" MasterPageFile="~/Manage/I/Index.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title><%=Resources.L.发退货明细 %></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx",Resources.L.工作台),
        new Bread("/{manage}/Shop/ProductManage.aspx",Resources.L.商城管理),						
        new Bread("../../BankRollList.aspx",Resources.L.明细记录),						
        new Bread() {url="", text=Resources.L.发退货明细,addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
    <table class="table table-striped table-bordered table-hover">
        <tr class="tdbg text-center">
            <td><span><%=Resources.L.日期 %></span></td>
            <td><%=Resources.L.方向 %></td>
            <td><%=Resources.L.客户名称 %></td>
            <td><span><%=Resources.L.用户名 %></span></td>
            <td><%=Resources.L.收货人姓名 %></td>
            <td><span><%=Resources.L.订单编号 %></span></td>
            <td><span><%=Resources.L.快递公司 %></span></td>
            <td><span><%=Resources.L.操作人 %></span></td>
            <td><span><%=Resources.L.经手人 %></span></td>
            <td><span><%=Resources.L.已签收 %></span></td>
            <td><span><%=Resources.L.操作 %></span></td>
        </tr>
    </table>
	</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>
