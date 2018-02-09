<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MailManage.aspx.cs" Inherits="ZoomLaCMS.Manage.WorkFlow.MailManage" MasterPageFile="~/Manage/I/Default.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>模型管理</title>
    <style>
        #AllID_Chk{display:none;}
    </style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <ol class="breadcrumb navbar-fixed-top">
            <li><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
            <li><a href='../Config/SiteOption.aspx'>系统设置</a></li>
            <li class='active'>邮箱管理</li>
            <div id="help" class="pull-right text-center" style="margin-right: 8px;"><a href="javascript:;" onclick="selbox.toggle();" id="sel_btn" class="help_btn"><i class="fa fa-search"></i></a></div>
            <div id="sel_box" runat="server" class="padding5">
                <div class="input-group pull-left" style="width:473px;">
                    <asp:DropDownList ID="SizeStatus_Dp" runat="server" CssClass="form-control" Width="120px">
                        <asp:ListItem Text="全部用户" Value="All" />
                        <asp:ListItem Text="无容量用户" Value="NoSize" />
                    </asp:DropDownList>
                    <asp:TextBox runat="server" ID="searchText" class="form-control text_300" placeholder="请输入开户名或银行名称" />
                    <span class="input-group-btn">
                        <asp:Button ID="searchBtn" CssClass="btn btn-default" runat="server" Text="搜索" OnClick="searchBtn_Click" />
                    </span>
                </div>
            </div>
        </ol>
    </div>
    <div>
        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20" EnableTheming="False" GridLines="None"
            CellPadding="2" CellSpacing="1" Width="100%" CssClass=" table table-bordered table-hover table-striped" OnPageIndexChanging="EGV_PageIndexChanging" DataKeyNames="UserID"
            OnRowCommand="EGV_RowCommand" RowStyle-CssClass="tdbg" AllowUserToOrder="true" BackColor="White" EmptyDataText="当前没有类型!!">
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
                    <HeaderStyle Width="8%" />
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
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>
