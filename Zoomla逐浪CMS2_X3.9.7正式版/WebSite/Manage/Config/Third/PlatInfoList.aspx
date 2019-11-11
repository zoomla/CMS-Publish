<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlatInfoList.aspx.cs" Inherits="ZoomLaCMS.Manage.Config.PlatInfoList" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>平台信息</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
        new Bread("","扩展功能"),
		new Bread("/{manage}/Config/DBTools/RunSql.aspx","开发中心"),
        new Bread() {url="", text="平台信息<a href='AddPlatInfo.aspx'> [添加信息]</a>",addon="" }}
		)
    %>
	<div class="table-responsive">
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
        OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
        CssClass="table table-striped table-bordered table-hover list_choice" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="w1rem">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="名称" DataField="Name" />
            <asp:BoundField HeaderText="标识" DataField="flag" />
            <asp:BoundField HeaderText="APPKey" DataField="APPKey" />
            <asp:BoundField HeaderText="APPSecret" DataField="APPSecret" />
            <asp:TemplateField HeaderText="回调链接">
                <ItemTemplate>
                   <%#GetCallBack() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="备注" DataField="Remind" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a  href="<%#GetEditUrl() %>"><i class="zi zi_pencilalt" title="修改"></i></a>
                    <asp:LinkButton runat="server"  CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="zi zi_trashalt" title="删除"></i></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script runat="server">
    public string GetEditUrl()
    {
        switch (Eval("Flag", ""))
        {
            case "点触":
                return "AddPlatInfo.aspx?id="+Eval("ID");
            default:
                return "TouClickAdd.aspx";
        }
    }
</script>
</asp:Content>