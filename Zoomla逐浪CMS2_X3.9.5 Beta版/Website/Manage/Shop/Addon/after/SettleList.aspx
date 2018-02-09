<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SettleList.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Addon.after.SettleList" MasterPageFile="~/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>结算管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
 <ol id="BreadNav" class="breadcrumb navbar-fixed-top">
        <li><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
        <li><a href='../../OrderMangae.aspx'>订单管理</a></li>
        <li class="active">结算管理</li>
        <div id="help" class="pull-right text-center"><a href="javascript:;" id="sel_btn" class="help_btn" onclick="selbox.toggle();"><i class="fa fa-search"></i></a></div>
        <div id="sel_box" class="padding5">
            <div class="input-group">
                <input type="text" id="skey" class="form-control mvcparam" placeholder="请输入关键词" onkeypress="selbox.search();" />
                <span class="input-group-btn">
                    <asp:LinkButton runat="server" class="btn btn-default" ID="Search_Btn" OnClick="Search_Btn_Click"><i class="fa fa-search"></i></asp:LinkButton>
                </span>
            </div>
        </div>
    </ol>
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
    CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
    <Columns>
        <asp:TemplateField ItemStyle-CssClass="td_xs">
            <ItemTemplate>
                <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="td_s" />
        <asp:TemplateField HeaderText="订单ID" ItemStyle-CssClass="td_m">
            <ItemTemplate><a href="<%#CustomerPageAction.customPath2+"/Shop/OrderListInfo.aspx?ID="+Eval("OrderID") %>"><%#Eval("OrderID") %></a></ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="支付单号" DataField="PaymentNo" ItemStyle-CssClass="td_m" />
        <asp:BoundField HeaderText="预付金额" DataField="AmountPre" DataFormatString="{0:F2}" ItemStyle-CssClass="td_m" />
        <asp:BoundField HeaderText="结算金额" DataField="AmountSettle" DataFormatString="{0:F2}" ItemStyle-CssClass="td_m" />
        <asp:BoundField DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="创建时间" ItemStyle-CssClass="td_l"/>
        <asp:BoundField DataField="Remind" HeaderText="备注" />
        <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="td_l">
            <ItemTemplate>
              <a href="<%#CustomerPageAction.customPath2+"/Shop/OrderListInfo.aspx?ID="+Eval("OrderID") %>" class="option_style"><i class="fa fa-paper-plane"></i>订单</a>
              <a href="OrderSettle.aspx?sid=<%#Eval("ID") %>&ID=<%#Eval("OrderID") %>" class="option_style"><i class="fa fa-eye"></i>详情</a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>