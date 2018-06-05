<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlatInfoManage.aspx.cs" Inherits="ZoomLaCMS.Manage.Plat.PlatInfoManage" MasterPageFile="~/Manage/I/Index.master" %>

<asp:Content runat="server" ContentPlaceHolderID="Head">
    <title>信息管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/Plat/PlatInfoManage.aspx","能力中心"),
        new Bread() {url="", text="信息管理<a href='PlatInfoManage.aspx?status=0'> [回收站]</a>",addon="" }}
		)
    %>
	<div class="table-responsive-md pr-1">
    <ZL:ExGridView ID="EGV" AllowPaging="true" CssClass="table table-bordered table-striped table-hover list_choice" OnPageIndexChanging="EGV_PageIndexChanging" 
        PageSize="10" runat="server" AutoGenerateColumns="false" EmptyDataText="无相关数据">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input name="idchk" type="checkbox" value="<%#Eval("ID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="ID">
                <ItemTemplate>
                    <%#Eval("ID") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="信息内容">
                <ItemStyle  />
                <ItemTemplate>
                    <%#getText() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="用户">
                <ItemTemplate>
                    <a href="../User/UserInfo.aspx?id=<%#Eval("CUser") %>"><%#Eval("CUName") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="状态">
                <ItemTemplate>
                    <%#GetStatus() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="创建时间">
                <ItemStyle  />
                <ItemTemplate>
                    <%#Eval("CDate") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemStyle HorizontalAlign="Center" />
                <ItemTemplate>
                    <a href="PlatInfoDeail.aspx?ID=<%#Eval("ID") %>">详情</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	</div>
	<div class="sysBtline">
    <asp:Button ID="Dels" runat="server" OnClientClick="return confirm('确定要删除选中的内容吗？')" CssClass="btn btn-outline-danger" Text="批量删除" OnClick="Dels_Click" />
    <asp:Button ID="Rels" Visible="false" runat="server" OnClientClick="return confirm('确定要删除选中的内容吗？')" CssClass="btn btn-outline-info" Text="批量还原" OnClick="Rels_Click" />
    <asp:Button runat="server" ID="Clear_Btn" Visible="false" CssClass="btn btn-outline-danger" Text="清空回收站" OnClientClick="return confirm('确定要清空吗?');" OnClick="Clear_Btn_Click" />
	</div>
</asp:Content> 
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
   <script type="text/javascript">
       $(function () {
           $("#EGV tr:gt(0):not(:last)").dblclick(function () {
               location = "PlatInfoDeail.aspx?ID=" + $(this).find("input[name=idchk]").val();
           });
       });
   </script>
</asp:Content>
