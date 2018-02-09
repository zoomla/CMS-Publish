<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserBankManage.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Addon.UserBankManage" MasterPageFile="~/Manage/I/Default.Master" %>

<asp:Content runat="server" ContentPlaceHolderID="head"><title>用户银行管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <ol class="breadcrumb navbar-fixed-top">
            <li><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
            <li><a href='../ProductManage.aspx'>商城管理</a></li>
            <li>用户银行账号</li>
            <div id="help" class="pull-right text-center" style="margin-right: 8px;"><a href="javascript:;" onclick="selbox.toggle();" id="sel_btn" class="help_btn"><i class="fa fa-search"></i></a></div>
            <div id="sel_box" runat="server" class="padding5">
                <div class="input-group pull-left" style="width:473px;">
                    <asp:DropDownList ID="SType_D" runat="server" CssClass="form-control" Width="120px">
                        <asp:ListItem Text="开户人" Value="uname" />
                        <asp:ListItem Text="银行名称" Value="bname" />
                        <asp:ListItem Text="银行账号" Value="bnum" />
                    </asp:DropDownList>
                    <asp:TextBox runat="server" ID="Key_T" class="form-control text_300" placeholder="请输入开户名或银行名称" />
                    <span class="input-group-btn">
                        <asp:Button ID="Search_B" CssClass="btn btn-default" runat="server" Text="搜索" OnClick="Search_B_Click" />
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
                    <asp:LinkButton runat="server" CommandName="del" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确认删除这条数据吗?');" CssClass="option_style"><i class="fa fa-trash-o"></i>删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <asp:Button runat="server" ID="BatDel_B" OnClick="BatDel_B_Click" Text="批量删除" class="btn btn-primary" OnClientClick="return confirm('确定要删除选中吗');" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>