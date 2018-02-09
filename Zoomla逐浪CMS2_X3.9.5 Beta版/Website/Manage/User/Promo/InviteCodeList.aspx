<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InviteCodeList.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Promo.InviteCodeList" MasterPageFile="~/Manage/I/Index.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>邀请码列表</title>
<%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/I/Main.aspx","工作台"),
        new Bread("/{manage}/user/UserManage.aspx","用户管理"),
        new Bread() {url="", text="邀请码列表{<a href='InviteCodeAdd.aspx'>添加邀请码</a>}",addon= "" }}
        )
    %>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="container-fluid pr-0">
<div class="row sysRow list_choice">
<div class="tab-content col-12 table_box">
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" BoxType="dp"     OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
    <Columns>
        <asp:TemplateField ItemStyle-CssClass="td_xs">
            <ItemTemplate>
                <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="td_s" />
        <asp:BoundField HeaderText="邀请码" DataField="Code" />
        <asp:TemplateField HeaderText="创建人">
            <ItemTemplate>
                <%#GetCUser() %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="所属用户">
            <ItemTemplate>
                <a href="javascript:;" onclick="user.showuinfo('<%#Eval("UserID") %>');"><%#Eval("UserName")+"("+Eval("UserID")+")" %></a>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="会员组"><ItemTemplate><%#GetGroupName() %></ItemTemplate></asp:TemplateField>
        <asp:TemplateField HeaderText="状态"><ItemTemplate><%#Eval("ZStatus","").Equals("0")?"未使用":"<span class='text-danger'>已使用</span>" %></ItemTemplate></asp:TemplateField>
        <asp:TemplateField HeaderText="使用人">
            <ItemTemplate>
                <%#GetUsedInfo() %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="使用日期" DataField="UsedDate" />
        <asp:BoundField HeaderText="创建时间" DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" ItemStyle-CssClass="td_l"/>
        <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="td_l">
            <ItemTemplate>
      <%--          <a class="option_style" href="VideoInfo.aspx?id=<%#Eval("ID") %>"><i class="fa fa-pencil" title="修改"></i></a>--%>
                <asp:LinkButton runat="server" CssClass="option_style" CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="fa fa-trash-o" title="删除"></i> 删除</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
<div class="text-left panel_footers">
    <asp:Button runat="server" ID="BatDel_Btn" Text="删除选中" OnClick="BatDel_Btn_Click" OnClientClick="return confirm('确定要删除吗');" class="btn btn-outline-info m-2"/>
</div>
</div>
</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
</asp:Content>