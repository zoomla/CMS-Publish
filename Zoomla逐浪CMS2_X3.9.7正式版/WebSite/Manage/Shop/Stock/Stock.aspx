<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Stock.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Stock" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>添加入库出库记录</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<asp:Label runat="server" ID="Bread_L"></asp:Label>
	<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
    <table class="table table-striped table-bordered table-hover sys_table">
        <tr>
            <th class="text-center" colspan="2">
                <asp:Label ID="Label1" runat="server" Text="添加入库出库单"></asp:Label>
            </th>
        </tr>
        <tr >
            <th scope="col" class="w12rem_lg">
                <strong>单据类型</strong>
            </th>
            <td scope="col">
                <asp:RadioButtonList ID="stocktyle" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="RK" Selected="true">入库</asp:ListItem>
                    <asp:ListItem Value="CK">出库</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr >
            <th>
                <strong>单据编号</strong>
            </th>
            <td>
                <asp:Label ID="danjuhao" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr >
            <th>
                <strong>商品选择</strong>
            </th>
            <td>
                <asp:DropDownList CssClass="form-control max20rem" ID="productid" runat="server" DataTextField="Proname" DataValueField="ID"></asp:DropDownList>
            </td>
        </tr>
        <tr >
            <th>
                <strong>商品数量 <span class="text-danger">*</span></strong>
            </th>
            <td>
                <asp:TextBox ID="Pronum" runat="server" class="form-control max20rem">0</asp:TextBox>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="Pronum" ErrorMessage="商品数量必须是整数!" Type="Integer"></asp:RangeValidator>
            </td>
        </tr>
        <tr >
            <th>
                <strong>录入时间</strong>
            </th>
            <td>
                <asp:TextBox ID="calendars" runat="server" class="form-control max20rem" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });"></asp:TextBox>
            </td>
        </tr>
        <tr >
            <th>
                <strong>录 入 者 <span class="text-danger">*</span></strong>
            </th>
            <td>
                <asp:TextBox ID="adduser" runat="server"  class="form-control max20rem"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="adduser" ErrorMessage="录入者不能为空!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr >
            <th>
                <strong>备&nbsp; &nbsp; 注</strong>
            </th>
            <td>
                <asp:TextBox ID="stockcontent" TextMode="MultiLine" class="form-control" runat="server" Height="91px" Width="482px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="Button1" class="btn btn-info" runat="server" Text="保存信息" OnClick="Button1_Click" />

            </td>
        </tr>
    </table>
	</div>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript" src="/JS/DatePicker/WdatePicker.js"></script>
    <script type="text/javascript">
        function ttname(value) {
            document.getElementById("danjuhaos").value = value + document.getElementById("danjuhaobak").value;
            document.getElementById("danjuhao").innerHTML = document.getElementById("danjuhaos").value
        }
    </script>
</asp:Content>
    