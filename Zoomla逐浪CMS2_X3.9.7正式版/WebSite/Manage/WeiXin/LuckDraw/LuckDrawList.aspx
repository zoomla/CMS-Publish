<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LuckDrawList.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.LuckDraw.LuckDrawList" MasterPageFile="~/Manage/I/Default.Master"%>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>抽奖信息</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="top_opbar">
    <div class="input-group" style="width:550px;">
        <span class="input-group-addon">奖品名称</span>
        <asp:TextBox runat="server" ID="PrizeName_T" class="form-control text_md" />
        <span class="input-group-addon">用户名</span>
        <asp:TextBox runat="server" ID="UserName_T" class="form-control text_md" />
        <span class="input-group-btn">
            <asp:Button runat="server" ID="Search_Btn" class="btn btn-info" OnClick="Search_Btn_Click" Text="搜索" />
        </span>
    </div>
</div>
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
    CssClass="table table-striped table-bordered" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
    <Columns>
        <asp:TemplateField HeaderStyle-CssClass="excel_no" ItemStyle-CssClass="td_xs excel_no">
            <ItemTemplate>
                <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="td_s" />
        <asp:TemplateField HeaderText="参与用户">
            <ItemTemplate>
              <a href="javascript:;" onclick="user.showuinfo('<%#Eval("UserID") %>');"><%#Eval("UserName")+"("+Eval("Permissions")+")" %></a>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="奖品名称" DataField="Prize" />
        <asp:BoundField DataField="CDate" DataFormatString="{0:yyyy年MM月dd日 HH:mm:ss}" HeaderText="参与时间" ItemStyle-CssClass="td_l"/>
  <%--      <asp:TemplateField HeaderStyle-CssClass="excel_no" HeaderText="操作" ItemStyle-CssClass="td_l excel_no">
            <ItemTemplate>
            </ItemTemplate>
        </asp:TemplateField>--%>
    </Columns>
</ZL:ExGridView>
<div>
    <input type="button" class="btn btn-info" value="导出Excel" onclick="ZLHelper.ToExcelByID()" />
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/Label/ZLHelper.js"></script>
</asp:Content>