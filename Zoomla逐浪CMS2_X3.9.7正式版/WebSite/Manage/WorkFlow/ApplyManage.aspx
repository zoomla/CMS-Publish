<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApplyManage.aspx.cs" Inherits="ZoomLaCMS.Manage.WorkFlow.ApplyManage" MasterPageFile="~/Manage/I/Index.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>公文管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <ol class="breadcrumb fixed-top">
            <li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
            <li class="breadcrumb-item"><a href='../Config/SiteOption.aspx'>系统设置</a></li>
            <li class="breadcrumb-item">公文管理</li>
            <div class="pull-right text-center mr-2 ml-auto"><a href="javascript:;" onclick="selbox.toggle();" id="sel_btn" class="help_btn"><i class="zi zi_search"></i></a></div>
            <div id="sel_box" runat="server">
                <div class="input-group pull-left">
                    <asp:TextBox runat="server" ID="searchText" class="form-control max20rem" placeholder="请输入需要查询的信息" />
                    <span class="input-group-append">
                        <asp:Button ID="searchBtn" CssClass="btn btn-outline-secondary" runat="server" Text="搜索" OnClick="searchBtn_Click" />
                    </span>
                </div>
            </div>
        </ol>
    </div>
	<div class="list_choice table-responsive-md pr-1">
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
    CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
    <Columns>
        <asp:TemplateField ItemStyle-CssClass="">
            <ItemTemplate>
                <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="" />
        <asp:BoundField HeaderText="标题" DataField="Title" ItemStyle-CssClass="" />
        <asp:BoundField HeaderText="拟稿部门" DataField="Branch" />
        <asp:TemplateField HeaderText="申请人" ItemStyle-CssClass="">
            <ItemTemplate>
                <%#Eval("UserName") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="状态">
            <ItemTemplate><%# GetStatus(Eval("Status","{0}")) %></ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="CreateTime" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="申请时间" ItemStyle-CssClass=""/>
        <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="">
            <ItemTemplate>
<%--                <a  href="VideoInfo.aspx?id=<%#Eval("ID") %>"><i class="zi zi_pencilalt" title="修改"></i></a>--%>
                <asp:LinkButton runat="server"  CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="zi zi_trashalt" title="删除"></i></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
</div>
<div class="sysBtline">
    <asp:Button runat="server" ID="BatDel_Btn" class="btn btn-outline-danger" Text="批量删除" OnClientClick="return confirm('确定要移除吗');" OnClick="BatDel_Btn_Click" />
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>