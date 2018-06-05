<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddressList.aspx.cs" Inherits="ZoomLaCMS.Cart.Comp.AddressList" EnableViewState="false" %>
<asp:repeater runat="server" id="AddressRPT">
    <ItemTemplate>
        <li id="addli_<%#Eval("ID") %>">
            <label class="normalw"><input type="radio" name="address_rad" value="<%#Eval("ID") %>" /><%#GetAddress() %></label>
            <span>
                <%#GetIsDef() %>
                <a href="javascript:;" onclick="EditAddress(<%#Eval("ID") %>);">修改</a>
                <a href="javascript:;" onclick="DelAddress(<%#Eval("ID") %>);">删除</a>
            </span>
        </li>
    </ItemTemplate>
</asp:repeater>
<div runat="server" id="EmptyDiv" class="r_red" visible="false">你没有收货地址,请先填写收货地址</div>