<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MailManage.aspx.cs" Inherits="ZoomLaCMS.Manage.WorkFlow.MailManage" MasterPageFile="~/Manage/I/Index.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>模型管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <ol class="breadcrumb fixed-top">
            <li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
            <li class="breadcrumb-item"><a href='../Config/SiteOption.aspx'>系统设置</a></li>
            <li class="breadcrumb-item">邮箱管理</li>
            <div id="help" class="pull-right mr-2 ml-auto"><a href="javascript:;" onclick="selbox.toggle();" id="sel_btn" class="help_btn"><i class="zi zi_search"></i></a></div>
            <div id="sel_box" runat="server">
                <div class="input-group pull-left m50rem_50">
                    <asp:DropDownList ID="SizeStatus_Dp" runat="server" CssClass="form-control">
                        <asp:ListItem Text="全部用户" Value="All" />
                        <asp:ListItem Text="无容量用户" Value="NoSize" />
                    </asp:DropDownList>
                    <asp:TextBox runat="server" ID="searchText" class="form-control max20rem" placeholder="请输入开户名或银行名称" />
                    <span class="input-group-append">
                        <asp:Button ID="searchBtn" CssClass="btn btn-outline-secondary" runat="server" Text="搜索" OnClick="searchBtn_Click" />
                    </span>
                </div>
            </div>
        </ol>
    </div>
    <div class="table-responsive-md list_choice pr-1">
        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20" EnableTheming="False" GridLines="None"
            CellPadding="2" CellSpacing="1"  CssClass=" table table-bordered table-hover table-striped" OnPageIndexChanging="EGV_PageIndexChanging" DataKeyNames="UserID"
            OnRowCommand="EGV_RowCommand" RowStyle-CssClass="tdbg" AllowUserToOrder="true"  EmptyDataText="当前没有类型!!">
            <Columns>
                <asp:BoundField DataField="UserID" HeaderText="ID" SortExpression="UserID">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="会员名">
                    <ItemTemplate>
                        <a href="../User/UserInfo.aspx?id=<%# Eval("UserID") %>"><%# Eval("UserName","{0}") %></a>
                    </ItemTemplate>
                    <HeaderStyle />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="WorkNum" HeaderText="工号" SortExpression="WorkNum">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="会员组">
                    <ItemTemplate>
                        <a href="UserManage.aspx?GroupID=<%#Eval("GroupID","{0}") %>">
                            <%# GetGroupName(Eval("GroupID","{0}")) %></a>
                    </ItemTemplate>
                    <HeaderStyle />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="邮箱使用状况">
                    <ItemTemplate>
                        <%#GetMailRemind() %>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerStyle HorizontalAlign="Center" />
            <RowStyle HorizontalAlign="Center" />
        </ZL:ExGridView>
    </div>
<style>#AllID_Chk{display: none;}</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>
