<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FlowTypeList.aspx.cs" Inherits="ZoomLaCMS.Manage.WorkFlow.FlowTypeList" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>类型列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <ol class="breadcrumb fixed-top">
            <li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
            <li class="breadcrumb-item"><a href='../Config/SiteOption.aspx'>系统设置</a></li>
            <li class="breadcrumb-item">类型管理<a href='AddWorkFlowType.aspx'> [添加类型]</a></li>
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
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20"  EnableTheming="False"  GridLines="None" CellPadding="2" CellSpacing="1" CssClass="table table-striped table-bordered table-hover" RowStyle-CssClass="tdbg" AllowUserToOrder="true" OnPageIndexChanging="EGV_PageIndexChanging" DataKeyNames="ID" OnRowDataBound="EGV_RowDataBound" OnRowCommand="EGV_RowCommand"  EmptyDataText="当前没有类型!!">
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:BoundField HeaderText="类型名称" DataField="TypeName" />
            <asp:BoundField HeaderText="类型描述" DataField="TypeDescribe" />
            <asp:BoundField HeaderText="创建时间" DataField="CreateTime" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="AddWorkFlowType.aspx?ID=<%# Eval("ID") %>"><i class="zi zi_pencilalt" title="修改"></i></a>
                    <asp:LinkButton ID="LinkButton2" CommandName="Del"  CommandArgument='<%# Eval("ID") %>' runat="server"><i class="zi zi_trashalt" title="删除"></i>删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerStyle HorizontalAlign="Center"/>
        <RowStyle HorizontalAlign="Center" />
    </ZL:ExGridView>
</div>
<style>
.allchk_l{display: none;}
</style>
</asp:Content>