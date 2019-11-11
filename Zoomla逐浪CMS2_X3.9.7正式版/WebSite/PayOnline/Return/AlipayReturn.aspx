<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AlipayReturn.aspx.cs" Inherits="ZoomLaCMS.PayOnline.Return.AlipayReturn" EnableViewStateMac="false" MasterPageFile="~/Common/Master/Empty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>支付信息</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<table width="500px" class="border" align="center" cellspacing="1" id="display1"   cellpadding="2" style="background-color: #CCCCCC;">
            <tr class="title">
              <td align="center"   colspan="2"><B>支付结果</B></td>
            </tr>
            <tr>
              <td align="right"> 支付宝交易号：</td>
              <td align="left"><asp:Label ID="lbTrade_no" runat="server"></asp:Label></td>
            </tr>
            <tr>
              <td  align="right">订单号：</td>
              <td  align="left"><asp:Label ID="lbOut_trade_no" runat="server"></asp:Label></td>
            </tr>
            <tr>
              <td  align="right">付款总金额：</td>
              <td  align="left"><asp:Label ID="lbTotal_fee" runat="server"></asp:Label></td>
            </tr>
            <tr>
              <td  align="right"> 商品标题：</td>
              <td  align="left"><asp:Label ID="lbSubject" runat="server"></asp:Label></td>
            </tr>
            <tr>
              <td  align="right"> 商品描述：</td>
              <td  align="left"><asp:Label ID="lbBody" runat="server"></asp:Label></td>
            </tr>
            <tr>
              <td  align="right"> 买家账号：</td>
              <td align="left"><asp:Label ID="lbBuyer_email" runat="server"></asp:Label></td>
            </tr>
            <tr>
              <td  align="right"> 收货人姓名：</td>
              <td  align="left"><asp:Label ID="LbName" runat="server"></asp:Label></td>
            </tr>
            <tr>
              <td  align="right"> 收货人地址：</td>
              <td  align="left"><asp:Label ID="LbAddress" runat="server"></asp:Label></td>
            </tr>
            <tr>
              <td  align="right"> 收货人邮编：</td>
              <td  align="left"><asp:Label ID="LbZip" runat="server"></asp:Label></td>
            </tr>
            <tr>
              <td  align="right"> 收货人电话：</td>
              <td  align="left"><asp:Label ID="LbPhone" runat="server"></asp:Label></td>
            </tr>
            <tr>
              <td  align="right"> 收货人手机：</td>
              <td  align="left"><asp:Label ID="LbMobile" runat="server"></asp:Label></td>
            </tr>
          </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">

</asp:Content>