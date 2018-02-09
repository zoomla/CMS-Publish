<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ArriveList.aspx.cs" Inherits="ZoomLaCMS.Cart.Comp.ArriveList" EnableViewState="false" %>
<div runat="server" id="arrive_div" class="extenddiv">
<input type="hidden" id="Arrive_Hid" name="Arrive_Hid" />
<div runat="server" visible="false" id="arrive_empty_div">
    <div class="alert alert-info">没有可用的优惠券</div>
</div>
<div runat="server" visible="false" id="arrive_data_div">
    <ul id="arrive_active_ul" class="list-unstyled arrive_o">
        <asp:Repeater runat="server" ID="Arrive_Active_RPT" EnableViewState="false">
            <ItemTemplate>
                <li class="item" data-flow="<%#Eval("flow") %>">
                    <div class="c_top"></div>
                    <div class="detail">
                        <div class="c_msg">
                            <div class="c_price">
                                <i class="fa fa-rmb"></i><%#Eval("AMount","{0:f0}") %>
                                <span class="c_limit"><%#Arrive_GetMoneyRegion() %></span>
                            </div>
                            <div class="c_time"><%#"有效期至"+Eval("EndTime","{0:yyyy-MM-dd}") %></div>
                        </div>
                        <div class="c_type">
                            <span>[<%#Arrive_GetTypeStr() %>]</span>
                            <span class="pull-right"><%#Eval("ArriveName") %></span>
                        </div>
                    </div>
                    <div class="info"></div>
                    <span class="c_choose"></span>
                </li>
            </ItemTemplate>
        </asp:Repeater>
        <li class="clearfix"></li>
    </ul>
    <hr />
    <ul class="list-unstyled arrive_o">
        <asp:Repeater runat="server" ID="Arrive_Disable_RPT" EnableViewState="false">
            <ItemTemplate>
                <li class="item disable">
                    <div class="c_top"></div>
                    <div class="detail">
                        <div class="c_msg">
                            <div class="c_price">
                                <i class="fa fa-rmb"></i><%#Eval("AMount","{0:f0}") %>
                                <span class="c_limit"><%#Arrive_GetMoneyRegion() %></span>
                            </div>
                            <div class="c_time"><%#"有效期至"+Eval("EndTime","{0:yyyy-MM-dd}") %></div>
                        </div>
                        <div class="c_type"><span>[<%#Arrive_GetTypeStr() %>]</span></div>
                        <div class="r_gray margin_t5"><i class="fa fa-exclamation-circle"></i> <%#Eval("err") %></div>
                    </div>
                    <div class="info"></div>
                    <span class="c_choose"></span>
                </li>
            </ItemTemplate>
        </asp:Repeater>
        <li class="clearfix"></li>
    </ul>
</div>
</div>