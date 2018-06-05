<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NodeRecycle.aspx.cs" Inherits="ZoomLaCMS.Manage.Content.Node.NodeRecycle" MasterPageFile="~/Manage/I/Index.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>节点回收站</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/Config/SiteInfo.aspx","系统设置"),
		new Bread("NodeManage.aspx","节点管理"),
        new Bread() {url="/{manage}/Content/Node/NodeRecycle.aspx", text="节点回收站",addon="" }}
		)
    %>
<div class="list_choice table-responsive-md pr-1">
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="20" IsHoldState="false" 
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
    CssClass="table table-striped table-bordered" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
    <Columns>
        <asp:TemplateField ItemStyle-CssClass="w1rem">
            <ItemTemplate>
                <input type="checkbox" name="idchk" value="<%#Eval("NodeID") %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="NodeID" DataField="NodeID" ItemStyle-CssClass="" />
        <asp:TemplateField HeaderText="节点名称">
            <ItemTemplate>
                <%#Eval("NodeName") %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="父节点名称">
            <ItemTemplate>
                <%#ShowParentName() %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="节点类型" ItemStyle-CssClass="">
            <ItemTemplate>
                <%#ShowNodeType() %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="创建时间" ItemStyle-CssClass=""/>
        <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="">
            <ItemTemplate>
                <asp:LinkButton runat="server"  CommandName="reconver" CommandArgument='<%#Eval("NodeID") %>'><i class="zi zi_recycle" zico="回收符号"></i>恢复</asp:LinkButton>
                <asp:LinkButton runat="server"  CommandName="del2" CommandArgument='<%#Eval("NodeID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="zi zi_trashalt" zico="垃圾箱竖条"></i>删除</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
</div>
<div class="sysBtline">
    <asp:Button runat="server" ID="BatReconver_Btn" class="btn btn-outline-info" Text="批量恢复" OnClick="BatReconver_Btn_Click" />
    <asp:Button runat="server" ID="BatDel_Btn" class="btn btn-outline-danger" Text="批量删除" OnClientClick="return confirm('确定要删除吗');" OnClick="BatDel_Btn_Click" />
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>