<i class="zi zi_trashalt" zico="垃圾箱竖条"></i><i class="zi zi_trashalt" zico="垃圾箱竖条"></i><%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegularList.aspx.cs" Inherits="ZoomLaCMS.Manage.User.Addon.RegularList" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>规则列表</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("/{manage}/WeiXin/Home.aspx","用户管理"),				
        new Bread() {url="", text="充值赠送<a href='AddRegular.aspx'> [添加规则]</a>",addon="" }}
		)
    %>
	<div class="table-responsive-md pr-1">
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
        OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
        CssClass="table table-striped table-bordered table-hover list_choice" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="w1rem">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="别名">
                <ItemTemplate>
                    <%#Eval("Alias") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="充值金额" DataField="Min" DataFormatString="{0:f2}" />
            <asp:BoundField HeaderText="金额" DataField="Purse" DataFormatString="{0:f2}" />
            <asp:BoundField HeaderText="银币" DataField="SIcon" DataFormatString="{0:f2}" />
            <asp:BoundField HeaderText="积分" DataField="Point" DataFormatString="{0:f2}" />
            <asp:BoundField HeaderText="备注(用户可见)" DataField="UserRemind" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a  href="AddRegular.aspx?id=<%#Eval("ID") %>"><i class="zi zi_pencilalt" title="修改"></i></a>
                    <asp:LinkButton runat="server"  CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="zi zi_trashalt" title="删除"></i></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>