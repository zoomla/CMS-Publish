<%@ Page Language="C#" MasterPageFile="~/Manage/I/Index.master" AutoEventWireup="true" CodeBehind="Dictionary.aspx.cs" Inherits="ZoomLaCMS.Manage.AddOn.Dictionary" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>数据字典项目列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("admin"),
        new Bread("/{manage}/plus/ADManage.aspx","扩展功能"),	
        new Bread("DictionaryManage.aspx","数据字典"),	
        new Bread() {url="", text=cateMod.CategoryName,addon="" }}
		)
    %>
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="DicID" PageSize="10"   OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Egv_RowCommand" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover list_choice" EnableTheming="False" EnableModelValidation="True" EmptyDataText="无相关数据">
        <Columns>
            <asp:TemplateField HeaderStyle-CssClass="td_xs">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value='<%#Eval("DicID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="DicID" HeaderText="序号">
                <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="字典项目">
                <ItemTemplate>
                    <%# Eval("DicName")%>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Left" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="是否启用">
                <ItemTemplate>
                    <%# GetUsedFlag(Eval("IsUsed","{0}")) %>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <HeaderStyle/>
                <ItemTemplate>
                    <a href="Dictionary.aspx?CateID=<%:CateID %>&ID=<%#Eval("DicID") %>">修改</a>
                    | 
                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Del" CommandArgument='<%# Eval("DicID") %>' OnClientClick="return confirm('确实要删除吗？');">删除</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <div>
        <div class="input-group pull-right" style="width:500px;">
            <div class="input-group-prepend"><span class="input-group-text">字典项目名</span></div>
            <asp:TextBox ID="txtDicName" runat="server" class="form-control max20rem" data-enter="1"></asp:TextBox>
            <span class="input-group-append">
                <asp:Button ID="btnSave" runat="server" Text="添加" OnClick="btnSave_Click" class="btn btn-outline-info" data-enter="2" />
            </span>
        </div>
        <asp:Button ID="btndelete" runat="server" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所有选择项删除吗？')}" Text="批量删除" OnClick="btndelete_Click" class="btn btn-outline-danger" />
        <asp:Button ID="btnSetUsed" runat="server" Text="批量启用" OnClick="btnSetUsed_Click" class="btn btn-outline-info" />
        <asp:Button ID="btnSetUnUsed" runat="server" Text="批量停用" OnClick="btnSetUnUsed_Click" class="btn btn-outline-danger" />
        <asp:Button ID="btnSetAllUsed" runat="server" Text="全部启用" OnClick="btnSetAllUsed_Click" class="btn btn-outline-info" />
        <input type="button" value="导入字典" class="btn btn-outline-info" onclick="showImport();"/>
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/SelectCheckBox.js"></script>
<script src="/JS/Controls/Control.js"></script>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
function IsSelectedId() {
    var checkArr = $("input[type=checkbox][name=idchk]:checked");
    if (checkArr.length > 0)
        return true
    else
        return false;
}
function showImport() {
    ShowComDiag("/Admin/Common/Import.aspx?mode=Ex_DicData", "数据导入");
}
Control.EnableEnter();
</script>
</asp:Content>
