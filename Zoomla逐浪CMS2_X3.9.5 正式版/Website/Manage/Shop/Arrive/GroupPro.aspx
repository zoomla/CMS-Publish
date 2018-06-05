<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GroupPro.aspx.cs" Inherits="ZoomLaCMS.Manage.Shop.Arrive.GroupPro" MasterPageFile="~/Manage/I/Index.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>组合商品</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div>
    <ol class="breadcrumb navbar-fixed-top">
        <li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>I/Main.aspx'>工作台</a></li>
        <li class="breadcrumb-item"><a href='../ProductManage.aspx'>商品列表</a></li>
        <li class='breadcrumb-item'>组合商品 [<a href='GroupProAdd.aspx'>添加组合</a>]</li>
        <div id="help" class="pull-right text-center mr-2"><a href="javascript:;" onclick="selbox.toggle();" id="sel_btn" class="help_btn"><i class="zi zi_search"></i></a></div>
        <div id="sel_box" runat="server" class="padding5">
            <div class="input-group pull-left">
                <asp:TextBox runat="server" ID="Key_T" class="form-control " placeholder="请输入活动名称" />
                <span class="input-group-btn">
                    <asp:Button ID="Search_B" CssClass="btn btn-outline-secondary" runat="server" Text="搜索" OnClick="Search_B_Click" />
                </span>
            </div>
        </div>
    </ol>
</div>
<div class="table-responsive">
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="20" IsHoldState="false" 
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
    CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
    <Columns>
        <asp:TemplateField>
            <ItemTemplate>
                <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="ID" DataField="ID" />
        <asp:BoundField HeaderText="组合名称" DataField="Name" />
        <asp:BoundField DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="创建时间" />
        <asp:BoundField DataField="Remind" HeaderText="备注" />
        <asp:TemplateField HeaderText="操作" >
            <ItemTemplate>
                <a href="GroupProAdd.aspx?id=<%#Eval("ID") %>"><i class="zi zi_pencilalt" title="修改"></i></a>
                <asp:LinkButton runat="server" CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="zi zi_trashalt" title="删除"></i></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
</div>
<div class="alert alert-light">
    <asp:Button runat="server" ID="BatDel_Btn" Text="批量删除" OnClick="BatDel_Btn_Click" OnClientClick="return confirm('确定要删除吗');" class="btn btn-outline-danger" />
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>