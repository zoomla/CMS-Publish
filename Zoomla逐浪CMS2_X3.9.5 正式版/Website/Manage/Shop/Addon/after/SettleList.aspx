<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SettleList.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Addon.after.SettleList" MasterPageFile="~/Manage/I/Index.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>结算管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
 <ol id="BreadNav" class="breadcrumb fixed-top">
        <li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
        <li class="breadcrumb-item"><a href='../../OrderMangae.aspx'>订单管理</a></li>
        <li class="breadcrumb-item">结算管理</li>
        <div id="help" class="pull-right text-center"><a href="javascript:;" id="sel_btn" class="help_btn" onclick="selbox.toggle();"><i class="zi zi_search"></i></a></div>
        <div id="sel_box" class="padding5">
            <div class="input-group">
                <input type="text" id="skey" class="form-control mvcparam " placeholder="请输入关键词" onkeypress="selbox.search();" />
                <span class="input-group-btn">
                    <asp:LinkButton runat="server" class="btn btn-outline-dark" ID="Search_Btn" OnClick="Search_Btn_Click"><i class="zi zi_search"></i></asp:LinkButton>
                </span>
            </div>
        </div>
    </ol>
<div class="list_choice table-responsive-md">
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
    CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
    <Columns>
        <asp:TemplateField ItemStyle-CssClass="max20rem">
            <ItemTemplate>
                <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="max20rem" />
        <asp:TemplateField HeaderText="订单ID" ItemStyle-CssClass="max20rem">
            <ItemTemplate><a href="<%#CustomerPageAction.customPath2+"/Shop/OrderListInfo.aspx?ID="+Eval("OrderID") %>"><%#Eval("OrderID") %></a></ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="支付单号" DataField="PaymentNo" ItemStyle-CssClass="max20rem" />
        <asp:BoundField HeaderText="预付金额" DataField="AmountPre" DataFormatString="{0:F2}" ItemStyle-CssClass="max20rem" />
        <asp:BoundField HeaderText="结算金额" DataField="AmountSettle" DataFormatString="{0:F2}" ItemStyle-CssClass="max20rem" />
        <asp:BoundField DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="创建时间" ItemStyle-CssClass="max20rem"/>
        <asp:BoundField DataField="Remind" HeaderText="备注" />
        <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="max20rem">
            <ItemTemplate>
              <a href="<%#CustomerPageAction.customPath2+"/Shop/OrderListInfo.aspx?ID="+Eval("OrderID") %>"><i class="zi zi_paperplane" zico="纸飞机黑"></i>订单</a>
              <a href="OrderSettle.aspx?sid=<%#Eval("ID") %>&ID=<%#Eval("OrderID") %>"><i class="zi zi_eye"></i>详情</a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>