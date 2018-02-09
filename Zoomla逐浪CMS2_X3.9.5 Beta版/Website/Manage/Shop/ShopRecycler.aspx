<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShopRecycler.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.ShopRecycler" MasterPageFile="~/Manage/I/Default.master"%>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>商品回收站</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
     <ol id="BreadNav" class="breadcrumb navbar-fixed-top">
        <li><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'>工作台</a></li>
        <li><a href='ProductManage.aspx'>商城管理</a></li>
        <li class='active'>商品回收站</li>
        <div id="help" class="pull-right text-center"><a href="javascript:;" id="sel_btn" class="help_btn" onclick="selbox.toggle();"><i class="fa fa-search"></i></a></div>
        <div id="sel_box" class="padding5">
            <div class="input-group">
                <ZL:TextBox ID="Skey_T" runat="server" CssClass="form-control" placeholder="请输入商品名称" onkeypress="selbox.search();" />
                <span class="input-group-btn">
                    <asp:LinkButton runat="server" class="btn btn-default" ID="Search_Btn" OnClick="Search_Btn_Click"><i class="fa fa-search"></i></asp:LinkButton>
                </span>
            </div>
        </div>
    </ol>
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" DataKeyNames="id" PageSize="20" OnPageIndexChanging="EGV_PageIndexChanging" IsHoldState="false" OnRowCommand="EGV_RowCommand" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="<%$Resources:L,无相关数据 %>">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="td_xs">
                <ItemTemplate><input type="checkbox" name="idchk" value='<%#Eval("id") %>' /></ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" HeaderStyle-Width="3%" DataField="ID" />
            <asp:TemplateField HeaderText="<%$Resources:L,商品图片 %>">
                <HeaderStyle CssClass="td_m" />
                <ItemTemplate>
                    <a href="ShowProduct.aspx?id=<%#Eval("id")%>">
                        <img src="<%#getproimg() %>" class="img_50" onerror="shownopic(this);" />
                    </a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,商品名称 %>">
                <ItemTemplate>
                    <div style="display: inline-block;width:200px;overflow:hidden;">
                        <%#GetNode() %>
                        <a href="<%#Eval("Class","").Equals("2") ? "Arrive/SuitProAdd.aspx?id="+Eval("ID") : "ShowProduct.aspx?id="+ Eval("id") %>"><%#Eval("ProName") %></a>
                    </div>
                    <%#GetGroupPro() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="<%$Resources:L,录入者 %>" DataField="AddUser" HeaderStyle-Width="5%" />
            <asp:BoundField HeaderText="<%$Resources:L,单位 %>" DataField="ProUnit" HeaderStyle-Width="5%" />
            <asp:TemplateField HeaderText="<%$Resources:L,库存 %>">
                <ItemTemplate>
                    <%#GetStock()%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,价格 %>">
                <ItemTemplate>
                    <%#GetPrice()%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,类型 %>">
                <ItemTemplate>
                    <%#formatnewstype(Eval("ProClass",""))%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,商品属性 %>">
                <ItemTemplate>
                    <%#GetProAttr() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="<%$Resources:L,状态 %>">
                <ItemTemplate>
                    <%#GetStatus() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <HeaderStyle Width="7%" />
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" CommandName="ReStore" CommandArgument='<%# Eval("ID") %>' runat="server" CssClass="option_style"><i class="fa fa-recycle" title="还原"></i></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton2" CommandName="Del1" CommandArgument='<%# Eval("ID") %>' OnClientClick="return confirm('不可恢复性删除数据,你确定将该数据删除吗？');" runat="server" CssClass="option_style"><i class="fa fa-trash-o" title="删除"></i>删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <div class="btn-group">
        <asp:Button ID="Rec_B" class="btn btn-primary" runat="server" Text="批量还原" OnClick="Rec_B_Click" OnClientClick="if(!IsSelectedId()){alert('请选择还原项');return false;}else{return true;}" />
        <asp:Button ID="Del_B" class="btn btn-primary" runat="server" Text="批量删除" OnClick="Del_B_Click" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('不可恢复性删除数据,你确定将该数据删除吗？')}" />
        <asp:Button ID="DelAll_B" class="btn btn-primary" runat="server" Text="清空回收站" OnClick="DelAll_B_Click" OnClientClick="return confirm('你确定要清空回收站吗')" />
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
        <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
    <script>
        function IsSelectedId() {
            var checkArr = $("[name=idchk]:checked");
            if (checkArr.length > 0)
                return true
            else
                return false;
        }
    </script>
</asp:Content>