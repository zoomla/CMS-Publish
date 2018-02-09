<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Stock.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Stock" MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>添加入库出库记录</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-striped table-bordered table-hover">
        <tr class="text-center">
            <td colspan="2">
                <asp:Label ID="Label1" runat="server" Text="添加入库出库单"></asp:Label>
            </td>
        </tr>
        <tr >
            <td class="td_m">
                <strong>单据类型：</strong>
            </td>
            <td>
                <asp:RadioButtonList ID="stocktyle" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="RK" Selected="true">入库</asp:ListItem>
                    <asp:ListItem Value="CK">出库</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr >
            <td>
                <strong>单据编号：</strong>
            </td>
            <td>
                <asp:Label ID="danjuhao" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr >
            <td>
                <strong>商品选择：</strong>
            </td>
            <td>
                <asp:DropDownList CssClass="form-control text_300" ID="productid" runat="server" DataTextField="Proname" DataValueField="ID"></asp:DropDownList>
            </td>
        </tr>
        <tr >
            <td>
                <strong>商品数量：</strong>
            </td>
            <td>
                <asp:TextBox ID="Pronum" runat="server" class="form-control text_300">0</asp:TextBox><span class="rd_red">*</span>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="Pronum" ErrorMessage="商品数量必须是整数!" Type="Integer"></asp:RangeValidator>
            </td>
        </tr>
        <tr >
            <td>
                <strong>录入时间：</strong>
            </td>
            <td>
                <asp:TextBox ID="calendars" runat="server" class="form-control text_300" onclick="WdatePicker({ dateFmt: 'yyyy/MM/dd HH:mm:ss' });"></asp:TextBox>
            </td>
        </tr>
        <tr >
            <td>
                <strong>录 入 者：</strong>
            </td>
            <td>
                <asp:TextBox ID="adduser" runat="server"  class="form-control text_300"></asp:TextBox><span class="rd_red">*</span>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="adduser" ErrorMessage="录入者不能为空!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr >
            <td>
                <strong>备&nbsp; &nbsp; 注：</strong>
            </td>
            <td>
                <asp:TextBox ID="stockcontent" TextMode="MultiLine" class="form-control" runat="server" Height="91px" Width="482px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <asp:Button ID="Button1" class="btn btn-primary" runat="server" Text="保存信息" OnClick="Button1_Click" />

            </td>
        </tr>
    </table>
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
    