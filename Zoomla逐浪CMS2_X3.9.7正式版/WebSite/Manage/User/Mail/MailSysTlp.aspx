<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MailSysTlp.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Mail.MailSysTlp" MasterPageFile="~/Manage/I/Index.master"  %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>系统邮件</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/I/Main.aspx","工作台"),
	new Bread("/{manage}/User/UserManage.aspx","用户管理"),
	new Bread() {url="", text="系统邮件",addon= "" }}
	)
%>
    <ZL:ExGridView ID="EGV" runat="server" AllowPaging="true" OnPageIndexChanging="EGV_PageIndexChanging" AutoGenerateColumns="False" 
        class="table table-striped table-bordered table-hover list_choice" OnRowDataBound="EGV_RowDataBound" EmptyDataText="<%$Resources:L,当前没有信息 %>">
        <Columns>
            <asp:TemplateField HeaderText="模板名称">
                <ItemTemplate><i class="zi zi_code"></i><a href="MailSysTlpEdit.aspx?TlpName=<%# HttpUtility.UrlEncode(Eval("Name","")) %>" ><%# Eval("Name") %></a></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="模板类型">
                <ItemTemplate>邮件模板</ItemTemplate>
                <ItemStyle  HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="创建日期">
                <ItemTemplate><%# Eval("CreationTime") %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="修改日期">
                <ItemTemplate><%# Eval("UpdateTime") %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="MailSysTlpEdit.aspx?TlpName=<%# HttpUtility.UrlEncode(Eval("Name","")) %>" ><i class="zi zi_pencilalt" zico="笔黑"></i></a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>