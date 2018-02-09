<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectPayPlat.aspx.cs" Inherits="ZoomLaCMS.BU.Money.SelectPayPlat" MasterPageFile="~/Common/Master/User.Master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>用户充值</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div id="pageflag" data-nav="home" data-ban="UserInfo"></div>
<div class="container margin_t5">
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a title="会员中心" href="/User/Default">会员中心</a></li>
		<li class="breadcrumb-item"><a href="/User/Info/UserInfo">账户管理</a></li>
		<li class="breadcrumb-item active">用户充值</li>
	</ol>
</div>
<div class="weui-cells weui-cells_form container">
        <div class="weui-cell">
            <div class="weui-cell__hd">
                <label class="weui-label">会员名</label>
            </div>
            <div class="weui-cell__bd">
                <asp:Label runat="server" ID="MCardNo_L"></asp:Label>
            </div>
        </div>
        <div class="weui-cell">
            <div class="weui-cell__hd">
                <label class="weui-label">现有余额</label>
            </div>
            <div class="weui-cell__bd">
                <asp:Label runat="server" ID="Purse_L"></asp:Label>
            </div>
        </div>
        <div id="reglist" class="weui-cells weui-cells_checkbox" style="margin-top:0px;">
            <asp:Repeater runat="server" ID="Regular_RPT">
                <ItemTemplate>
                       <label class="weui-cell weui-check__label" for="x<%#Eval("ID") %>">
                                <div class="weui-cell__hd">
                           <%-- <input type="radio" class="weui-check" name="regular_rad" id="x<%# Eval("ID") %>" value="<%#Eval("ID") %>" checked="checked">
                                <i class="weui-icon-checked"></i>--%>
                                 <input type="radio" name="regular_rad" id="x<%# Eval("ID") %>" value="<%#Eval("ID") %>" checked="checked">
                            </div>
                          
                            <div class="weui-cell__bd">
                                <p style="position:relative;bottom:-8px;"><%#Eval("Alias") %>
                                    (<span class="text-danger"><i class="fa fa-rmb"><%#Eval("Min","{0:F2}") %></i></span>)</p>
                            </div>
                        </label>
                </ItemTemplate>
            </asp:Repeater>
            <label class="weui-cell weui-check__label" for="x0">
                <div class="weui-cell__hd">
               <%--     <input type="radio" class="weui-check" name="regular_rad" id="x0" value="0">
                    <i class="weui-icon-checked"></i>--%>
                     <input type="radio" name="regular_rad" id="x0" value="0">
                </div>
                <div class="weui-cell__bd">
                        <div class="input-group mb-3" style="position:relative;bottom:-8px;">
                            <div class="input-group-prepend"><span class="input-group-text" id="basic-addon1">手动输入充值金额</span></div>
                            <asp:TextBox ID="Money_T" CssClass="form-control" Text="100" runat="server" placeholder="请输入充值金额" MaxLength="7"/>
                        </div>
                        <div>
                            <asp:RequiredFieldValidator ID="R2" CssClass="tips" runat="server" ControlToValidate="Money_T" Display="Dynamic" ForeColor="Red" ErrorMessage="金额不能为空" />
                            <asp:RegularExpressionValidator CssClass="tips" ID="R1" runat="server" ControlToValidate="Money_T" Display="Dynamic" ForeColor="Red" ErrorMessage="金额数值不正确" ValidationExpression="^\d+(\.\d{1,2})?$" />
                        </div>
                </div>
            </label>
        </div>
        <div class="weui-btn-area">
            <asp:Button runat="server" ID="Sure_Btn" OnClick="Sure_Btn_Click" class="weui-btn weui-btn_primary" Text="确定充值" />
        </div>
   </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<link href="/dist/css/weui.min.css" rel="stylesheet" />
<script src="/dist/js/weui.js"></script>
<script>
    $("#reglist .weui-cell:first").click();
</script>
</asp:Content>