<%@ Page Language="C#" MasterPageFile="~/Manage/I/Index.master" AutoEventWireup="true" CodeBehind="ProjectRequireList.aspx.cs" Inherits="ZoomLaCMS.Manage.AddOn.Project.ProjectRequireList" %>
<asp:Content ContentPlaceHolderID="head" runat="Server"><title>需求列表</title></asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("Projects.aspx","项目管理"),
        new Bread() {url="", text="需求列表",addon="" }},
		Call.GetHelp(43)
		)
    %>
	<div class="list_choice table-responsive-md pr-1">
    <ZL:ExGridView ID="Egv" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        CssClass="table table-striped table-bordered table-hover " DataKeyNames="RequireID" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging"
        Width="100%" OnRowCommand="GridView1_RowCommand" EmptyDataText="无相关信息！！">
        <Columns>
            <asp:TemplateField HeaderText="选择" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:CheckBox ID="chkSel" runat="server" />
                </ItemTemplate>
                <HeaderStyle  />
                <ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="RequireID" HeaderText="ID" ItemStyle-HorizontalAlign="Center">
                <HeaderStyle  />
                <ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Require" HeaderText="需求内容" ItemStyle-HorizontalAlign="Center">
                <HeaderStyle  />
                <ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="ReuqireDate" HeaderText="提交时间" ItemStyle-HorizontalAlign="Center">
                <HeaderStyle />
                <ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="立项数目" ItemStyle-HorizontalAlign="Center">
                <HeaderStyle  />
                <ItemTemplate>
                    <%# CountProjectNumByRid(Convert.ToInt32(Eval("RequireID")))%>
                </ItemTemplate>
                <ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="LnkDelete" runat="server" CommandName="DeleteRequest" OnClientClick="if(!this.disabled) return confirm('确实要删除?');"
                        CommandArgument='<%# Eval("RequireID")%>'><i class="zi zi_trashalt" title="删除"></i></asp:LinkButton>
                    <asp:LinkButton ID="LnkCreat" runat="server" CommandName="CreateProject" CommandArgument='<%# Eval("RequireID")%>' CssClass="option_style"><i class="zi zi_doubleSquare"></i>立项</asp:LinkButton>
                </ItemTemplate>
                <ItemStyle CssClass="tdbg" HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	<div class="sysBtline">
    <asp:Button ID="btnDel" runat="server" Text="批量删除" OnClientClick="if(!IsSelectedId()){alert('请选择删除项');return false;}else{return confirm('你确定要将所有选择项删除吗？')}" OnClick="btnDel_Click" class="btn btn-outline-danger" /></div>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
  
</asp:Content>