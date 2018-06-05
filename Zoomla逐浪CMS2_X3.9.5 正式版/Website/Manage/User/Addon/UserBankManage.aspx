<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserBankManage.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Addon.UserBankManage" MasterPageFile="~/Manage/I/Index.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head"><title>用户银行管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <ol class="breadcrumb navbar-fixed-top">
            <li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
            <li class="breadcrumb-item"><a href='../ProductManage.aspx'>商城管理</a></li>
            <li class="breadcrumb-item">用户银行账号</li>
            <div id="help" class="pull-right text-center mr-2"><a href="javascript:;" onclick="selbox.toggle();" id="sel_btn" class="help_btn"><i class="zi zi_search" zico="搜索"></i></a></div>
            <div id="sel_box" runat="server">
                <div class="input-group pull-left">
                    <asp:DropDownList ID="SType_D" runat="server" CssClass="form-control max20rem">
                        <asp:ListItem Text="开户人" Value="uname" />
                        <asp:ListItem Text="银行名称" Value="bname" />
                        <asp:ListItem Text="银行账号" Value="bnum" />
                    </asp:DropDownList>
                    <asp:TextBox runat="server" ID="Key_T" class="form-control max20rem" placeholder="请输入开户名或银行名称" />
                    <span class="input-group-append">
                        <asp:Button ID="Search_B" CssClass="btn btn-outline-secondary" runat="server" Text="搜索" OnClick="Search_B_Click" />
                    </span>
                </div>
            </div>
        </ol>
    </div>
    <ZL:ExGridView ID="EGV" runat="server" PageSize="10" AllowPaging="True" AutoGenerateColumns="False" OnRowCommand="EGV_RowCommand"
        CssClass="table table-striped table-bordered table-hover" OnPageIndexChanging="EGV_PageIndexChanging" EnableTheming="False" EmptyDataText="当前没有数据！">
        <Columns>
            <asp:TemplateField HeaderStyle-CssClass="td_s">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value='<%# Eval("ID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:TemplateField  HeaderText="用户名">
                <ItemTemplate>
                    <a href="UserBankManage.aspx?userid=<%#Eval("UserID") %>"><%#Eval("UserName") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="开户人" DataField="PeopleName" />
            <asp:BoundField HeaderText="银行名称" DataField="BankName" />
            <asp:BoundField HeaderText="银行卡号" DataField="CardNum" />
            <asp:BoundField HeaderText="添加时间" DataField="AddTime" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
            <asp:BoundField HeaderText="备注信息" DataField="Remark" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:LinkButton runat="server" CommandName="del" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确认删除这条数据吗?');" CssClass="option_style"><i class="zi zi_trashalt" zico="垃圾箱竖条"></i>删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	<div class="alert alert-light">
    <asp:Button runat="server" ID="BatDel_B" OnClick="BatDel_B_Click" Text="批量删除" class="btn btn-outline-danger" OnClientClick="return confirm('确定要删除选中吗');" />
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>