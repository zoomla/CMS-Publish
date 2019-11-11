<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MobileMsgLog.aspx.cs" Inherits="ZoomLaCMS.Manage.User.MobileMsgLog" MasterPageFile="~/Manage/I/Index.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>发送记录</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/I/Main.aspx","工作台"),
	new Bread("UserManage.aspx","用户管理"),
    new Bread("MobileMsg.aspx","手机短信"),
	new Bread() {url="", text="发送记录"}}
	)
%>
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
    CssClass="table table-striped table-bordered list_choice" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
    <Columns>
        <asp:TemplateField ItemStyle-CssClass="">
            <ItemTemplate>
                <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="" />
        <asp:TemplateField HeaderText="内容">
            <ItemTemplate>
                <%#Eval("MsgContent") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="CRM客户类别">
            <ItemTemplate>
               <%#Eval("Rece_CRM","") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="用户组">
            <ItemTemplate>
                <%#ShowName(Eval("Rece_Group",""),"group") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Rece_Mobile" HeaderText="手机号" />
        <asp:TemplateField HeaderText="用户ID">
            <ItemTemplate>
                <%#ShowName(Eval("Rece_User",""),"user") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="创建时间" ItemStyle-CssClass=""/>
    </Columns>
</ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
#navHolder{display:none;}
</style>
</asp:Content>