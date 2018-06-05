<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendMailList.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Mail.SendMailList" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>邮件订阅</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/I/Main.aspx","工作台"),
		new Bread("/{manage}/User/UserManage.aspx","用户管理"),
		new Bread("/{manage}/User/Mail/SubscriptListManage.aspx?menu=all","邮件订阅"),
        new Bread() {url="", text="邮件列表",addon="" }}
		)
    %>
<ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="10"  EnableTheming="False"  
                CssClass="table table-striped table-bordered table-hover list_choice" EmptyDataText="当前没有信息!!" 
                OnPageIndexChanging="EGV_PageIndexChanging" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="ID">
        <Columns>
        <asp:TemplateField HeaderText="标题">
            <ItemTemplate> <a href='MailShow.aspx?id=<%#DataBinder.Eval(Container.DataItem,"ID")%>'><%#DataBinder.Eval(Container.DataItem, "MailTitle")%></a> </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="发送时间" DataField="MailSendTime" />
        <asp:TemplateField HeaderText="邮件状态">
            <ItemTemplate> <%#GetState(DataBinder.Eval(Container.DataItem, "MailState").ToString())%> </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="操作">
            <ItemTemplate>
                    <a href="MailShow.aspx?idid=<%#Eval("ID") %>" class="option_style"><i class="zi zi_eye" title="预览"></i></a>
            </ItemTemplate>
        </asp:TemplateField>
        </Columns>
        <PagerStyle HorizontalAlign="Center" />
        <RowStyle Height="24px" HorizontalAlign="Center"  />
</ZL:ExGridView>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>
