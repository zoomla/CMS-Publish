<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderPrint.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Printer.OrderPrint" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>订单输出</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("ListDevice.aspx","智能硬件"),
        new Bread() {url="", text="订单输出",addon="" }}
		)
    %>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
    <table class="table table-striped table-bordered sys_table">
        <tr>
            <th class="w12rem_lg">选择设备</th>
            <td>
                <ZL:Repeater ID="RPT" runat="server">
                    <ItemTemplate>
                        <label style="margin-right:15px;"><input type="radio" name="Dev_R" value="<%#Eval("ID") %>" <%#Eval("IsDefault").ToString().Equals("1") ? "checked='true'":"" %> /><%#Eval("Alias") %></label>
                    </ItemTemplate>
                </ZL:Repeater>
            </td>
        </tr>
        <tr>
            <th>选择模板</th>
            <td>
                <asp:DropDownList CssClass="form-control max20rem" runat="server" ID="Tlp_DP"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <th>选择订单</th>
            <td>
                <asp:DropDownList CssClass="form-control max20rem" runat="server" ID="Order_DP"></asp:DropDownList>
            </td>
        </tr>
        <tr>
            <th>打印数量</th>
            <td>
                <ZL:TextBox ID="Num_T" runat="server" CssClass="form-control max20rem" AllowEmpty="false" Text="1" ValidType="Int" />
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button runat="server" ID="Print_Btn" OnClick="Print_Btn_Click" Text="发送打印" CssClass="btn btn-outline-info" />
                <a href="MessageList.aspx" class="btn btn-outline-info">查看流水</a>
            </td>
        </tr>
    </table>
</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>
