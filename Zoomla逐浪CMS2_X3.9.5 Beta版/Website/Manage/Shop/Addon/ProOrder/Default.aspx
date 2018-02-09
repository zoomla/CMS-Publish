<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Addon.ProOrder.Default" MasterPageFile="~/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>申购单列表</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="BreadDiv" class="container-fluid mysite">
        <div class="row">
            <ol id="BreadNav" class="breadcrumb navbar-fixed-top">
                <li><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
                <li><a href='<%=CustomerPageAction.customPath2+"Shop/ProductManage.aspx" %>'>商品管理</a></li>
                <li class="active"><a href='<%=Request.RawUrl %>'>申购单列表</a></li>
                <div id="help" class="pull-right text-center"><a href="javascript:;" id="sel_btn" class="help_btn" onclick="selbox.toggle();"><i class="fa fa-search"></i></a></div>
                <div id="sel_box" class="padding5">
                </div>
            </ol>
        </div>
    </div>
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
    CssClass="table table-striped table-bordered" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
    <Columns>
        <asp:TemplateField ItemStyle-CssClass="td_xs">
            <ItemTemplate>
                <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="td_s" />
        <asp:TemplateField HeaderText="订单编号" ItemStyle-CssClass="td_l">
            <ItemTemplate>
                <a href="ProOrderInfo.aspx?ID=<%#Eval("ID") %>"><%#Eval("OrderNo") %></a>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="店铺名称">
            <ItemTemplate>
                <%#ShowStoreName() %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="订货人">
            <ItemTemplate>
                <a href="javascript:;" onclick="user.showuinfo('<%#Eval("UserID") %>');"><%#Eval("AddUser") %></a>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="订单金额" DataField="OrdersAmount" DataFormatString="{0:F2}"  />
<%--        <asp:TemplateField HeaderText="订单状态">
            <ItemTemplate>
                <%#GetOrderStatus() %>
            </ItemTemplate>
        </asp:TemplateField>--%>
        <asp:TemplateField HeaderText="物流状态">
            <ItemTemplate>
                <%#GetExpStatus() %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="AddTime" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="创建时间" ItemStyle-CssClass="td_l"/>
        <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="td_l">
            <ItemTemplate>
                <a class="option_style" href="ProOrderInfo.aspx?id=<%#Eval("ID") %>"><i class="fa fa-pencil" title="修改"></i></a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
<a href="../Material/MatReport.aspx" class="btn btn-info">查看原料汇总</a>
<asp:Button runat="server" ID="BatSend_Btn" Text="批量发货" OnClick="BatSend_Btn_Click" class="btn btn-info" />
<%--<asp:Button runat="server" ID="BatFinish_Btn" Text="批量完结" OnClick="BatFinish_Btn_Click" class="btn btn-info" />--%>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Controls/ZL_Dialog.js"></script>
</asp:Content>