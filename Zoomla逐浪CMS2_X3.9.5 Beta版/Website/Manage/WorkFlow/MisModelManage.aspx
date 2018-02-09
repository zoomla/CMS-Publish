<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MisModelManage.aspx.cs" Inherits="ZoomLaCMS.Manage.WorkFlow.MisModelManage" MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>模板管理</title>
    <style>.allchk_l{display:none;}</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <ol class="breadcrumb navbar-fixed-top">
            <li><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
            <li><a href='../Config/SiteOption.aspx'>系统设置</a></li>
            <li class='active'>模板管理<a href='AddMisModel.aspx'>[添加套红模板]</a></li>
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
    <div>
        <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" AllowPaging="true" PageSize="20" EnableTheming="False"
            GridLines="None" CellPadding="2" CellSpacing="1" Width="100%" CssClass="table table-striped table-bordered table-hover" 
            OnPageIndexChanging="EGV_PageIndexChanging" DataKeyNames="ID" OnRowDataBound="EGV_RowDataBound" OnRowCommand="EGV_RowCommand"  
            AllowUserToOrder="true" EmptyDataText="当前没有类型!!">
            <Columns>
                <asp:BoundField DataField="ID" ItemStyle-CssClass="td_s" />
                <asp:BoundField HeaderText="模板名称" DataField="ModelName" />
                <asp:TemplateField HeaderText="模板类型" ItemStyle-CssClass="td_l">
                    <ItemTemplate><%#bmis.GetDocType(Convert.ToInt32(Eval("DocType"))) %></ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField HeaderText="创建时间" DataField="CreateTime"  ItemStyle-CssClass="td_l"/>
                <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="td_l">
                    <ItemTemplate>
                        <a href="AddMisModel.aspx?ID=<%#Eval("ID") %>" class="option_style"><i class="fa fa-pencil" title="修改"></i></a>
                        <asp:LinkButton CommandName="del" CommandArgument='<%# Eval("ID") %>' runat="server" CssClass="option_style"><i class="fa fa-trash-o" title="删除"></i>删除</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </ZL:ExGridView>
    </div>
</asp:Content>
