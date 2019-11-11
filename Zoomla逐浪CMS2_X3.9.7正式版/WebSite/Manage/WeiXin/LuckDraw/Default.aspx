<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.LuckDraw.Default" MasterPageFile="~/Manage/I/Index.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>抽奖管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("Home.aspx","移动微信"),
        new Bread() {url="Default.aspx", text="抽奖列表<a href='LuckDrawAdd.aspx'> [添加抽奖]</a>",addon="" }}
		)
    %>
	<div class="list_choice table-responsive-md pr-1">
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
    CssClass="table table-striped table-bordered" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
    <Columns>
        <asp:TemplateField ItemStyle-CssClass="">
            <ItemTemplate>
                <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="" />
        <asp:TemplateField HeaderText="活动名称">
            <ItemTemplate>
                <a href="LuckDrawAdd.aspx?ID=<%#Eval("ID") %>"><%#Eval("Name") %></a>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="限定人数" ItemStyle-CssClass="">
            <ItemTemplate>
                <%#ShowLimitNum() %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="活动时间" ItemStyle-Width="350">
            <ItemTemplate>
                <%#Eval("SDate","{0:yyyy/MM/dd HH:mm}") %>--
                <%#Eval("EDate","{0:yyyy/MM/dd HH:mm}") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="抽奖页面" ItemStyle-CssClass="">
            <ItemTemplate>
                <a href="/Common/Luckdraw/RotateDisk.aspx?ID=<%#Eval("ID") %>" target="_blank">[转盘]</a>
                <a href="/Common/Luckdraw/UserRandom.aspx?ID=<%#Eval("ID") %>" target="_blank">[随机]</a>
                <a href="/Common/Luckdraw/Shake.aspx?ID=<%#Eval("ID") %>" target="_blank">[摇一摇]</a>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="">
            <ItemTemplate>
                                <a  href="LuckDrawList.aspx?id=<%#Eval("ID") %>"><i class="zi zi_useralt"></i>抽奖信息</a>
                <a  href="LuckDrawAdd.aspx?id=<%#Eval("ID") %>"><i class="zi zi_pencilalt" title="修改"></i></a>
                <asp:LinkButton runat="server"  CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="zi zi_trashalt" title="删除"></i></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>