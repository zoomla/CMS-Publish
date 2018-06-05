<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeliveryMan.aspx.cs" Inherits="ZoomLaCMS.Manage.UserShopManage.DeliveryMan" MasterPageFile="~/Manage/I/Index.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>送货员管理</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div>
    <ol class="breadcrumb fixed-top">
        <li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
        <li class="breadcrumb-item"><a href='../Shop/ProductManage.aspx'>商城管理</a></li>
        <li class="breadcrumb-item"><a href='StoreManage.aspx'>店铺管理</a></li>
        <li class='breadcrumb-item'>送货员管理 <a href="DeliveryManAdd.aspx">[添加送货员]</a></li>
        <div id="help" class="pull-right text-center mr-2"><a href="javascript:;" onclick="selbox.toggle();" id="sel_btn" class="help_btn"><i class="zi zi_search"></i></a></div>
        <div id="sel_box" runat="server" class="padding5">
            <div class="input-group pull-left max20rem">
                <asp:TextBox runat="server" ID="SKey" CssClass="form-control" placeholder="输入店铺名称或店铺ID" />
                <span class="input-group-append">
                    <asp:Button ID="Search_B" CssClass="btn btn-outline-secondary" runat="server" Text="搜索" OnClick="Search_B_Click" />
                </span>
            </div>
        </div>
    </ol>
</div>
<div class="list_choice table-responsive-md">
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="20" IsHoldState="false" OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" OnRowDataBound="EGV_RowDataBound"
        OnRowCommand="EGV_RowCommand" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="当前没有送货员">
        <Columns>
            <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:TemplateField HeaderText="用户名">
                <ItemTemplate>
                    <a href='javascript:;' onclick='showuinfo(<%#Eval("UserID") %>);' title='查看用户'><%#Eval("UserName") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="所属店铺">
                <ItemTemplate>
                    <a href="?skey=<%#Eval("StoreID") %>"><%#Eval("Title") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="权限">
                <ItemTemplate>
                    <%#GetAuth() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="添加时间" DataField="CDate" DataFormatString="{0:yyyy-MM-dd}" />
            <asp:BoundField HeaderText="备注信息" DataField="Remind" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="DeliveryManAdd.aspx?id=<%#Eval("ID") %>" ><i class="zi zi_pencilalt"></i>修改</a>
                    <asp:LinkButton runat="server" CommandName="del" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="zi zi_trashalt"></i>删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/Controls/ZL_Dialog.js"></script>
    <script>
        function showuinfo(uid) {
            var url = siteconf.path + "User/UserInfo.aspx?id=" + uid
            comdiag.maxbtn = false;
            comdiag.ShowModal(url, "会员信息");
        }
    </script>
</asp:Content>
