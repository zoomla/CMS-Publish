<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrderBack.aspx.cs" Inherits="ZoomLaCMS.BU.Order.Addon.back.OrderBack" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>退款处理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <table class="table table-bordered table-striped">
        <tr>
            <td class="td_m">订单号：</td><td><asp:Label ID="OrderNo_L" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td>订单金额：</td><td><asp:Label ID="Orderamounts_L" runat="server"></asp:Label> </td>
        </tr>
        <tr>
            <td>下单日期：</td><td><asp:Label ID="Cdate_L" runat="server"></asp:Label></td>
        </tr>
        <tr>
            <td>退款原因：</td><td><asp:TextBox runat="server" ID="UserRemind_T" TextMode="MultiLine" CssClass="form-control" style="height:120px;"  disabled="disabled"/></td>
        </tr>
        <tr><td>处理备注：</td><td>
            <asp:TextBox runat="server" ID="AdminRemind_T" TextMode="MultiLine" class="form-control" style="height:120px;"></asp:TextBox>
                          </td></tr>
        <tr>
            <td></td>
            <td>
                <asp:Button runat="server" class="btn btn-info" ID="Sure_Btn" Text="确认退款" OnClick="Sure_Btn_Click" OnClientClick="return confirm('确定要同意退款吗,需手动将金额返还用户');" />
                <asp:Button runat="server" class="btn btn-info" ID="Reject_Btn" Text="拒绝退款" OnClick="Reject_Btn_Click" OnClientClick="return confirm('确定要拒绝该次退款申请吗');" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script"></asp:Content>