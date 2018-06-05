<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MailTemplist.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Mail.MailTemplist" MasterPageFile="~/Manage/I/Index.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>邮件模板</title>
</asp:Content>

<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/I/Main.aspx","工作台"),
		new Bread("/{manage}/User/UserManage.aspx","用户管理"),
        new Bread() {url="", text="邮件模板<a href='AddMailTemp.aspx'> [创建邮件模板]</a>",addon="" }}
		)
    %>
    <ZL:ExGridView ID="EGV" runat="server" 
        AllowPaging="true" OnPageIndexChanging="EGV_PageIndexChanging" AutoGenerateColumns="False" 
        OnRowCommand="Row_Command" class="table table-striped table-bordered table-hover list_choice" onrowdatabound="EGV_RowDataBound">
        <Columns>
            <asp:TemplateField>
                <ItemStyle CssClass="max20rem w1rem" />
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="模板名称">
                <ItemTemplate><a href="AddMailTemp.aspx?id=<%#Eval("ID")%>" title='<%# Eval("TempName")%>'><%# Eval("TempName")%></a> </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="缩略图">
                <ItemTemplate>
                    <img src="<%# Eval("Pic")%>" alt="缩略图" class="img_3rem" onerror="shownopic(this);" />
                </ItemTemplate>
                <ItemStyle CssClass="max20rem"  HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="模板类型">
                <ItemTemplate><a href="MailTemplist.aspx?type=<%#Eval("Type")%>" title='<%# Eval("TempName")%>'><%# GetType(Convert.ToInt32(Eval("Type")))%> </a></ItemTemplate>
                <ItemStyle CssClass="max20rem"  HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="创建人">
                <ItemTemplate><%# Eval("AddUser")%> </ItemTemplate>
                <ItemStyle CssClass="max20rem"   HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="创建日期">
                <ItemTemplate><%# Eval("CreateTime", "{0:yyyy-MM-dd}")%> </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="AddMailTemp.aspx?id=<%#Eval("ID") %>"><i class="zi zi_pencilalt" zico="笔黑"></i></a>
                    <asp:LinkButton ID="btnDel" runat="server" CommandName="DeleteMsg" OnClientClick="if(!this.disabled) return confirm('确实删除此模板?');" CommandArgument='<%# Eval("ID")%>' ><i class="zi zi_trashalt" zico="垃圾箱竖条"></i>删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	<div class="sysBtline">
    <asp:Button runat="server" ID="BatDel_Btn" Text="批量删除" OnClick="BatDel_Btn_Click" class="btn btn-outline-danger" OnClientClick="return confirm('确定要移除吗');"/>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>
