<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart_Present.aspx.cs" Inherits="ZoomLaCMS.Cart.Comp.Cart_Present" EnableViewState="false" %>
<%@ Import Namespace="ZoomLa.Common" %>
<table style="margin-top:10px;color:#999;font-size:12px;">
<asp:Repeater runat="server" ID="Present_RPT">
    <ItemTemplate>
        <asp:Panel runat="server" Visible='<%#Eval("W_Type","")=="0" %>'>
            <tr>
                <td style="width: 80px;">【赠品】</td>
                <td style="width:200px;">
                    <%#Eval("Name") %>
                </td>
                <td><a href="/Shop/<%# Eval("P_ID") %>.aspx" target="_blank">浏览商品</a></td>
            </tr>
        </asp:Panel>
        <asp:Panel runat="server" Visible='<%#Eval("W_Type","")=="1" %>'>
            <tr>
                <td style="width: 80px;">【折扣】</td>
                <td style="width:200px;">
                    <%#Eval("Name") %>
                </td>
                <td>共优惠 <span style="color:red;"><%#ShowDisCount(Eval("R_Price"))  %></span>元</td>
            </tr>
        </asp:Panel>
            <asp:Panel runat="server" Visible='<%#Eval("W_Type","")=="2" %>'>
            <tr>
                <td style="width: 80px;">【优惠】</td>
                <td style="width:200px;">
                    <%#Eval("Name") %>
                </td>
                <td>共优惠 <span style="color:red;"><%#ShowDisCount(Eval("R_Price")) %></span>元</td>
            </tr>
        </asp:Panel>
    </ItemTemplate>
</asp:Repeater>
</table>
<script runat="server">
    public string ShowDisCount(object price)
    {
        return "-" + DataConverter.CDouble(price).ToString("F2");
    }
</script>