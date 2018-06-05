<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SuitPro.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Arrive.SuitPro" MasterPageFile="~/Manage/I/Index.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>套装商品</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div>
        <ol class="breadcrumb fixed-top">
            <li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
            <li class="breadcrumb-item"><a href='../ProductManage.aspx'>商城管理</a></li>
            <li class="breadcrumb-item">套装商品 <a href="SuitProAdd.aspx">[添加促销组合]</a></li>
            <div id="help" class="pull-right text-center mr-2"><a href="javascript:;" onclick="selbox.toggle();" id="sel_btn" class="help_btn"><i class="zi zi_search"></i></a></div>
            <div id="sel_box" runat="server" class="padding5">
                <div class="input-group pull-left">
                    <asp:TextBox runat="server" ID="Key_T" class="form-control" placeholder="请输入组合名称" />
                    <span class="input-group-btn">
                        <asp:Button ID="Search_B" CssClass="btn btn-outline-secondary" runat="server" Text="搜索" OnClick="Search_B_Click" />
                    </span>
                </div>
            </div>
        </ol>
    </div>
	<div class="list_choice table-responsive-md">
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" DataKeyNames="id" PageSize="20" 
        OnRowDataBound="EGV_RowDataBound" OnPageIndexChanging="EGV_PageIndexChanging" IsHoldState="false" 
        OnRowCommand="EGV_RowCommand" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="<%$Resources:L,无相关数据 %>">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="">
                <ItemTemplate><input type="checkbox" name="idchk" value='<%#Eval("id") %>' /></ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" HeaderStyle-Width="" DataField="ID" />
            <asp:TemplateField HeaderText="<%$Resources:L,商品图片 %>">
                <HeaderStyle CssClass="" />
                <ItemTemplate>
                    <img src="<%#ZoomLa.Common.function.GetImgUrl(Eval("Thumbnails")) %>" class="img_3rem" onerror="shownopic(this);" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,商品名称 %>">
                <ItemTemplate>
                    [<%#Eval("NodeName") %>]
                        <a href="SuitProAdd.aspx?id=<%#Eval("id")%>"><%#Eval("ProName") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="<%$Resources:L,录入者 %>" DataField="AddUser" HeaderStyle-Width="" />
            <asp:BoundField HeaderText="<%$Resources:L,单位 %>" DataField="ProUnit" HeaderStyle-Width="" />
            <asp:TemplateField HeaderText="<%$Resources:L,价格 %>">
                <ItemTemplate>
                   <%#Eval("LinPrice","F2") %>
                </ItemTemplate>
            </asp:TemplateField>
<%--            <asp:TemplateField HeaderText="<%$Resources:L,类型 %>">
                <ItemTemplate>
                    <%#formatnewstype(Eval("ProClass",""))%>
                </ItemTemplate>
            </asp:TemplateField>--%>
            <asp:TemplateField HeaderText="<%$Resources:L,状态 %>">
                <ItemTemplate>
                    <%#proBll.ShowStatus(GetDataItem()) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,操作 %>">
                <ItemTemplate>
                    <a  href="<%#GetShopUrl() %>" target="_blank" title="<%=Resources.L.预览 %>"><i class="zi zi_eye"></i></a>
                    <a  href="SuitProAdd.aspx?id=<%#Eval("id")%>"><i class="zi zi_pencilalt" title="<%=Resources.L.编辑 %>"></i></a>
                    <asp:LinkButton runat="server"  CommandName="del" CommandArgument='<%# Eval("id") %>' OnClientClick="return confirm('确定要将商品移入回收站吗');"><i class="zi zi_trashalt" title="<%=Resources.L.删除 %>"></i><%=Resources.L.删除 %></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	</div>
	<div class="alert alert-light">
    <asp:Button runat="server" ID="batBtn" OnClick="batBtn_Click" Text="批量删除" class="btn btn-outline-danger" OnClientClick="return confirm('确定要删除选中吗');" />
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script runat="server">
    public string GetShopUrl()
    {
        return ZoomLa.BLL.Shop.OrderHelper.GetShopUrl(Eval("UserShopID"), Eval("ID"));
    }
</script>
</asp:Content>
