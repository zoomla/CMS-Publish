<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaypalManage.aspx.cs" Inherits="ZoomLaCMS.Manage.Pay.PaypalManage" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>PayPal支付</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/Config/SiteInfo.aspx","系统设置"),		
        new Bread("PayPlatManage.aspx","在线支付平台"),		
        new Bread() {url="", text="PayPal支付平台",addon="" }},
		Call.GetHelp(57)
		)
    %>
	<div class="container-fluid pr-0">
	<div class="row sysRow list_choice table-responsive-md">
    <table class="table table-striped table-bordered table-hover sys_table">
        <tr>
            <th scope="col" class="spacingtitle text-center" colspan="2">
                <asp:Label ID="LblTitle" runat="server" Text="PayPal支付平台" />
            </th>
        </tr>
        <tr>
            <th scope="col" class="w12rem_lg">方式名称</th>
            <td scope="col">
                <ZL:TextBox ID="payname" runat="server" AllowEmpty="false" class="form-control text_300">Paypal国际在线支付</ZL:TextBox>
            </td>
        </tr>

        <tr>
            <th>接口类型</th>
            <td>
                <asp:TextBox ID="pay_intf" runat="server" ReadOnly="True" class="form-control text_300">PayPal</asp:TextBox>
            </td>
        </tr>

        <tr>
            <th>ClientID</th>
            <td>
                <asp:TextBox ID="ClientID_T" runat="server" class="form-control m50rem_50" />
            </td>
        </tr>
        <tr>
            <th>Secret</th>
            <td>
                <asp:TextBox ID="Secret_T" runat="server" class="form-control m50rem_50" />
            </td>
        </tr>
    <%--    <tr>
            <th>支持交易货币</th>
            <td>
                <asp:CheckBoxList ID="Currency_DP" runat="server" RepeatColumns="8">
                    <asp:ListItem Value='CNY'>人民币 </asp:ListItem>
                    <asp:ListItem Value='USD'>美元 </asp:ListItem>
                    <asp:ListItem Value='EUR'>欧元 </asp:ListItem>
                    <asp:ListItem Value='GBP'>英镑 </asp:ListItem>
                    <asp:ListItem Value='CAD'>加拿大元 </asp:ListItem>
                    <asp:ListItem Value='AUD'>澳元 </asp:ListItem>
                    <asp:ListItem Value='NZD'>新西兰元 </asp:ListItem>
                    <asp:ListItem Value='RUB'>卢布 </asp:ListItem>
                    <asp:ListItem Value='HKD'>港币 </asp:ListItem>
                    <asp:ListItem Value='TWD'>新台币 </asp:ListItem>
                    <asp:ListItem Value='KRW'>韩元 </asp:ListItem>
                    <asp:ListItem Value='SGD'>新加坡元 </asp:ListItem>
                    <asp:ListItem Value='JPY'>日元</asp:ListItem>
                    <asp:ListItem Value='MYR'>马元 </asp:ListItem>
                    <asp:ListItem Value='CHF'>瑞士法郎</asp:ListItem>
                    <asp:ListItem Value='SEK'>瑞典克朗 </asp:ListItem>
                    <asp:ListItem Value='DKK'>丹麦克朗 </asp:ListItem>
                    <asp:ListItem Value='PLZ'>兹罗提 </asp:ListItem>
                    <asp:ListItem Value='NOK'>挪威克朗 </asp:ListItem>
                    <asp:ListItem Value='HUF'>福林 </asp:ListItem>
                    <asp:ListItem Value='CSK'>捷克克朗</asp:ListItem>
                </asp:CheckBoxList>
                选择某种交易货币，请先确认“货币管理－货币列表”中已经存在此币种，如不存在请先进行货币种类的添加；</td>
        </tr>--%>
    <%--    <tr>
            <th>支付手续费</th>
            <td>
                <asp:TextBox ID="number" runat="server" Text="0.05" class="form-control text_md pull-left" />
                <span class="tips">此处可以输入公式来计算支付手续费，并可使用后面的公式验算功能审核手续费，公式中订单金额以字母“p”表示；</span>
            </td>
        </tr>--%>
        <tr>
            <td></td>
            <td><asp:Button ID="EBtnSubmit" Text="保存信息" OnClick="EBtnSubmit_Click" runat="server" class="btn btn-info"/>
        </td>
        </tr>
    </table>
	</div></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>
