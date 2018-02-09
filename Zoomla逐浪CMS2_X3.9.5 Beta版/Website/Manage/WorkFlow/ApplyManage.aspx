<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplyManage.aspx.cs" Inherits="ZoomLaCMS.Manage.WorkFlow.ApplyManage" MasterPageFile="~/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>公文管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <ol class="breadcrumb navbar-fixed-top">
            <li><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
            <li><a href='../Config/SiteOption.aspx'>系统设置</a></li>
            <li class='active'>公文管理</li>
            <div class="pull-right text-center" style="margin-right: 8px;"><a href="javascript:;" onclick="selbox.toggle();" id="sel_btn" class="help_btn"><i class="fa fa-search"></i></a></div>
            <div id="sel_box" runat="server" class="padding5">
                <div class="input-group pull-left">
                    <asp:TextBox runat="server" ID="searchText" class="form-control" placeholder="请输入需要查询的信息" />
                    <span class="input-group-btn">
                        <asp:Button ID="searchBtn" CssClass="btn btn-default" runat="server" Text="搜索" OnClick="searchBtn_Click" />
                    </span>
                </div>
            </div>
        </ol>
    </div>
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
    CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
    <Columns>
        <asp:TemplateField ItemStyle-CssClass="td_xs">
            <ItemTemplate>
                <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="td_s" />
        <asp:BoundField HeaderText="标题" DataField="Title" ItemStyle-CssClass="td_50p" />
        <asp:BoundField HeaderText="拟稿部门" DataField="Branch" />
        <asp:TemplateField HeaderText="申请人" ItemStyle-CssClass="td_m">
            <ItemTemplate>
                <%#Eval("UserName") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="状态">
            <ItemTemplate><%# GetStatus(Eval("Status","{0}")) %></ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="CreateTime" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="申请时间" ItemStyle-CssClass="td_l"/>
        <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="td_l">
            <ItemTemplate>
<%--                <a class="option_style" href="VideoInfo.aspx?id=<%#Eval("ID") %>"><i class="fa fa-pencil" title="修改"></i></a>--%>
                <asp:LinkButton runat="server" CssClass="option_style" CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="fa fa-trash-o" title="删除"></i></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
<div class="margin_t5">
    <asp:Button runat="server" ID="BatDel_Btn" class="btn btn-info" Text="批量删除" OnClientClick="return confirm('确定要移除吗');" OnClick="BatDel_Btn_Click" />
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>