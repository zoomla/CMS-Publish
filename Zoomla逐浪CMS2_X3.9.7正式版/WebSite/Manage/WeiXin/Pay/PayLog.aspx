<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PayLog.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.Pay.PayLog" MasterPageFile="~/Manage/I/Index.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>支付日志</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("Home.aspx","移动微信"),	
        new Bread() {url="RedPacket.aspx", text="支付日志",addon="" }}
		)
    %>
 <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="20" IsHoldState="false" OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" OnRowDataBound="EGV_RowDataBound"
      AllowSorting="True" CssClass="table table-striped table-bordered table-hover list_choice" EnableTheming="False" EnableModelValidation="True" EmptyDataText="当前没有支付记录">
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:BoundField HeaderText="收款人" DataField="TrueName" />
            <asp:TemplateField HeaderText="公众号">
                <ItemTemplate>
                    <a href="?appid=<%#Eval("Appid") %>"><%#Eval("Alias") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="金额" DataField="AMount" DataFormatString="{0:0.00}" />
            <asp:TemplateField HeaderText="付款方式">
                <ItemTemplate>
                    <%#GetPayType() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="状态">
                <ItemTemplate>
                    <%#Eval("ZStatus","").Equals("1") ? "<span style='color:green;'>成功</span>" : "<span color='red'>失败</span>" %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="时间" DataField="CDate" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />
            <asp:BoundField HeaderText="付款备注" DataField="Remind" />
            <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="excel_no" HeaderStyle-CssClass="excel_no">
                <ItemTemplate>
                    <a href="PayLogDetail.aspx?ID=<%#Eval("ID") %>"><i class="zi zi_list"></i>查看详情</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
<div>
    <input type="button" class="btn btn-outline-info" value="导出Excel" onclick="ZLHelper.ToExcelByID()" />
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Label/ZLHelper.js"></script>
</asp:Content>