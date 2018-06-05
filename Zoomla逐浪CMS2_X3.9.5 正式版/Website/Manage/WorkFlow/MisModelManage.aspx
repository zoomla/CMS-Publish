<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MisModelManage.aspx.cs" Inherits="ZoomLaCMS.Manage.WorkFlow.MisModelManage" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>模板管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <ol class="breadcrumb fixed-top">
            <li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
            <li class="breadcrumb-item"><a href='../Config/SiteOption.aspx'>系统设置</a></li>
            <li class="breadcrumb-item">模板管理<a href='AddMisModel.aspx'> [添加套红模板]</a></li>
            <div class="pull-right mr-2 ml-auto"><a href="javascript:;" onclick="selbox.toggle();" id="sel_btn" class="help_btn"><i class="zi zi_search"></i></a></div>
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
        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20" EnableTheming="False"
            GridLines="None" CellPadding="2" CellSpacing="1" Width="100%" CssClass="table table-striped table-bordered table-hover" 
            OnPageIndexChanging="EGV_PageIndexChanging" DataKeyNames="ID" OnRowDataBound="EGV_RowDataBound" OnRowCommand="EGV_RowCommand"  
            AllowUserToOrder="true" EmptyDataText="当前没有类型!!">
            <Columns>
                <asp:BoundField DataField="ID" ItemStyle-CssClass="" />
                <asp:BoundField HeaderText="模板名称" DataField="ModelName" />
                <asp:TemplateField HeaderText="模板类型" ItemStyle-CssClass="">
                    <ItemTemplate><%#bmis.GetDocType(Convert.ToInt32(Eval("DocType"))) %></ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="创建时间" DataField="CreateTime"  ItemStyle-CssClass=""/>
                <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="">
                    <ItemTemplate>
                        <a href="AddMisModel.aspx?ID=<%#Eval("ID") %>"><i class="zi zi_pencilalt" title="修改"></i></a>
                        <asp:LinkButton CommandName="del" CommandArgument='<%# Eval("ID") %>' runat="server"><i class="zi zi_trashalt" title="删除"></i>删除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
    </div>
</asp:Content>
