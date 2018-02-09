<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MatReport.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Addon.Material.MatReport" MasterPageFile="~/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>原料报表</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="BreadDiv" class="container-fluid mysite">
        <div class="row">
            <ol id="BreadNav" class="breadcrumb navbar-fixed-top">
                <li><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
                <li><a href='<%=CustomerPageAction.customPath2+"Shop/ProductManage.aspx" %>'>商品管理</a></li>
                <li><a href='../Material/Default.aspx'>申购单列表</a></li>
                <li class="active">
                    原料汇总
                    <asp:TextBox runat="server" ID="Date_T" class="form-control text_md" onclick="WdatePicker({dateFmt: 'yyyy/MM/dd'});" AutoPostBack="true" OnTextChanged="Date_T_TextChanged" />
                </li>
            </ol>
        </div>
    </div>
<div class="container">
<div class="panel panel-info margin_t10">
    <div class="panel panel-heading">原料汇总</div>
    <div class="panel-body">
        <table class="table table-bordered table-striped margin_t10">
            <tr>
                <td class="td_s">序号</td>
                <td class="td_l">原料名称</td>
                <td>数量(单位)</td>
            </tr>
            <asp:Repeater runat="server" ID="Mat_RPT" EnableViewState="false">
                <ItemTemplate>
                    <tr>
                        <td><%#Container.ItemIndex+1 %></td>
                        <td><%#Eval("Name") %></td>
                        <td><span><%#Eval("MatNum") %></span>/<%#Eval("Unit") %></td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
</div>
<div class="panel panel-info margin_t5">
    <div class="panel panel-heading">商品统计</div>
    <div class="panel-body">
        <table class="table table-bordered table-striped">
            <thead><tr><td class="td_s">序号</td><td class="td_l">商品名称</td><td>订购数量</td></tr></thead>
            <asp:Repeater runat="server" ID="Cart_RPT">
                <ItemTemplate>
                    <tr><td><%#Container.ItemIndex+1 %></td><td><%#Eval("ProName") %></td><td><%#Eval("Pronum") %>/<%#Eval("Prounit") %></td></tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </div>
</div>
</div>

<div runat="server" class="alert alert-warning" id="remind_div" visible="false"></div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/DatePicker/WdatePicker.js"></script>
</asp:Content>