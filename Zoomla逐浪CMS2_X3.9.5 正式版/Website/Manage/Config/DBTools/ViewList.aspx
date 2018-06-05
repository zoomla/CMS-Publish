<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewList.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.ViewList" MasterPageFile="~/Manage/I/Safe.master"%> 
<asp:Content runat="server" ContentPlaceHolderID="head"><title>视图列表</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("DatalistProfile.aspx","扩展功能"),
        new Bread("RunSql.aspx","开发中心"),
        new Bread() {url="ViewList.aspx", text="视图列表",addon="" }}
		)
    %>
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
        OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand"
        CssClass="table table-striped table-bordered table-hover list_choice" EnableTheming="False" EnableModelValidation="True">
        <Columns>
            <asp:BoundField HeaderText="视图名" DataField="ViewName" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="ViewInfo.aspx?ViewName=<%#Eval("ViewName") %>"><i class="zi zi_eye" title="查看"></i> 查看</a>
                    <asp:LinkButton runat="server" CommandName="del2" CommandArgument='<%#Eval("ViewName") %>' OnClientClick="return confirm('你确认要删除该视图吗？')"><i class="zi zi_trashalt" title="删除"></i></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
     <%--   <asp:Button ID="Button3" class="btn btn-primary" runat="server" OnClientClick="return confirm('此操作将删除现有站点数据，确认？');" Text="批量删除" OnClick="Button3_Click" />--%>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <style>.allchk_l{display:none;}</style>
    <script type="text/javascript">
        function CheckAll(spanChk) {
            var oItem = spanChk.children;
            var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
            xState = theBox.checked;
            elm = theBox.form.elements;
            for (i = 0; i < elm.length; i++) if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
                if (elm[i].checked != xState)
                    elm[i].click();
            }
        }
</script>
</asp:Content>