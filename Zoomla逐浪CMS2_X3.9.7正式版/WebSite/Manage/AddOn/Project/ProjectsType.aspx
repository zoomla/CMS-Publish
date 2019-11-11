<%@ Page Language="C#"  MasterPageFile="~/Manage/I/Index.master"  AutoEventWireup="true" CodeBehind="ProjectsType.aspx.cs" Inherits="ZoomLaCMS.Manage.AddOn.Project.ProjectsType" %>
<asp:Content ContentPlaceHolderID="head" runat="Server"><title>项目分类管理</title></asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/Plat/PlatInfoManage.aspx","项目管理"),
        new Bread() {url="", text="类型管理<a href='ProjectsAddType.aspx'> [添加类型]</a>",addon="" }},
		Call.GetHelp(45)
		)
    %>
	<div class="list_choice table-responsive-md pr-1"></div>
    <ZL:ExGridView runat="server" ID="EGV" AllowPaging="true" AllowSorting="false"  class="table table-striped table-bordered" 
         OnRowDataBound="EGV_RowDataBound" DataKeyNames="ID"
        OnPageIndexChanging="EGV_PageIndexChanging" AutoGenerateColumns="false" OnRowCommand="EGV_RowCommand" EmptyDataText="无相关数据！">
        <Columns>
            <asp:TemplateField HeaderText="" ItemStyle-CssClass="td_xs">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("ID") %>"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="td_s"/>
            <asp:TemplateField HeaderText="项目类型名称">
                <ItemTemplate>
                    <a href="ProjectsAddType.aspx?ID=<%#Eval("ID") %>"><%#Eval("TName") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="项目类型简介">
                <ItemTemplate>
                    <%#Eval("Remind") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:LinkButton ID="LbtnUpdate" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="Update"><i class="zi zi_squareCorrect" title="编辑"></i> 编辑</asp:LinkButton>
                    <asp:LinkButton ID="LbtnDel" runat="server" OnClientClick="return confirm('您确定要删除吗？')" CommandArgument='<%#Eval("ID") %>' CommandName="Del"><i class="zi zi_trashalt" title="删除"></i></asp:LinkButton> 
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	<div class="sysBtline">
        <asp:Button runat="server" ID="BatDel_Btn" CssClass="btn btn-outline-danger" Text="批量删除" OnClick="BatDel_Btn_Click" OnClientClick="return confirm('确定要删除所选内容吗?');" />
		</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
	function CheckAll(spanChk)//CheckBox全选
	{
		var oItem = spanChk.children;
		var theBox = (spanChk.type == "checkbox") ? spanChk : spanChk.children.item[0];
		xState = theBox.checked;
		elm = theBox.form.elements;
		for (i = 0; i < elm.length; i++)
			if (elm[i].type == "checkbox" && elm[i].id != theBox.id) {
				if (elm[i].checked != xState)
					elm[i].click();
			}
	}
</script>
</asp:Content>
