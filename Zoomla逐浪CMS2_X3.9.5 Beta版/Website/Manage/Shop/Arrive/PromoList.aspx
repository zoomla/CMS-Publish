<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PromoList.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Arrive.PromoList" MasterPageFile="~/Manage/I/Default.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>促销列表</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div>
    <ol class="breadcrumb navbar-fixed-top">
        <li><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
        <li><a href='../ProductManage.aspx'>商城管理</a></li>
        <li>促销管理 <a href="PromoAdd.aspx">[添加促销活动]</a></li>
        <div id="help" class="pull-right text-center" style="margin-right: 8px;"><a href="javascript:;" onclick="selbox.toggle();" id="sel_btn" class="help_btn"><i class="fa fa-search"></i></a></div>
        <div id="sel_box" runat="server" class="padding5">
            <div class="input-group pull-left">
                <asp:TextBox runat="server" ID="Key_T" class="form-control" placeholder="请输入活动名称" />
                <span class="input-group-btn">
                    <asp:Button ID="Search_B" CssClass="btn btn-default" runat="server" Text="搜索" OnClick="Search_B_Click" />
                </span>
            </div>
        </div>
    </ol>
</div>
    <ZL:ExGridView ID="EGV" runat="server" PageSize="20" AllowPaging="True" AutoGenerateColumns="False" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
        CssClass="table table-striped table-bordered table-hover" OnPageIndexChanging="EGV_PageIndexChanging" EnableTheming="False" EmptyDataText="当前没有数据！" >
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value='<%# Eval("ID") %>'  />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="优惠活动名" DataField="PromoName" />
            <asp:BoundField HeaderText="开始时间" DataField="StartTime" DataFormatString="{0:yyyy-Mm-dd HH:mm:ss}" />
            <asp:BoundField HeaderText="结束时间" DataField="EndTime" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />
            <asp:BoundField HeaderText="金额下限" DataField="MoneyLL" DataFormatString="{0:f2}" />
            <asp:BoundField HeaderText="金额上限" DataField="MoneyUL" DataFormatString="{0:f2}" />
            <%--<asp:TemplateField HeaderText="优惠方式">
                <ItemTemplate><%#Eval("ZType") %></ItemTemplate>
            </asp:TemplateField>--%>
            <asp:BoundField HeaderText="创建时间" DataField="CreateTime" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="PromoAdd.aspx?id=<%#Eval("ID") %>" class="option_style"><i class="fa fa-pencil"></i>修改</a>
                    <asp:LinkButton runat="server" CommandName="del" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确认删除这条数据吗?');" CssClass="option_style"><i class="fa fa-trash-o"></i>删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script>
        $(function () {
            
        })
    </script>
</asp:Content>
