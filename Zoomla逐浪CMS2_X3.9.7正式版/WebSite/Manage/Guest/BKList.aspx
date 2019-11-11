<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BKList.aspx.cs" Inherits="ZoomLaCMS.Manage.Guest.BKList" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>词条版本浏览</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
        OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand"
        CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True">
        <Columns>
          <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:TemplateField HeaderText="版本号">
                <ItemTemplate>
                    <%#Eval("VerStr","").Equals(VerStr)?Eval("VerStr")+"<span class='text-danger'>(当前版本)</span>":Eval("VerStr") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="提交人" DataField="UserName" />
            <asp:TemplateField HeaderText="状态">
                <ItemTemplate>
                   <%#GetStatus() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="/Baike/Details?EditID=<%#Eval("ID") %>" target="_blank" ><i class="zi zi_eye" title="预览"></i></a>
                    <a href="/Baike/BKEditor?EditID=<%#Eval("ID") %>&mode=admin" target="_blank"><i class="zi zi_pencilalt" title="修改"></i></a>
                    <asp:LinkButton runat="server" OnClientClick="return confirm('确实要删除吗？');" CommandArgument='<%#Eval("ID") %>' CommandName="Del" CausesValidation="false" ><i class="zi zi_trashalt" title="删除"></i></asp:LinkButton>
                    <asp:LinkButton runat="server" OnClientClick="return confirm('确定要使用该版词条吗?');" CommandName="apply" CommandArgument='<%#Eval("ID") %>' ><i class="zi zi_flag"></i>应用</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>