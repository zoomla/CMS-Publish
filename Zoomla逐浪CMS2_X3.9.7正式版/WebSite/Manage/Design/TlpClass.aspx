<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TlpClass.aspx.cs" Inherits="ZoomLaCMS.Manage.Design.TlpClass" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>模板类别</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread("Default.aspx","动力模块"),
        new Bread() {url="", text="分类列表<a href='AddTlpClass.aspx'>[添加分类]</a>",addon="" }}
		)
    %>
 <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="5000" IsHoldState="false" 
        OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
        CssClass="table table-striped table-bordered table-hover list_choice" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:TemplateField HeaderText="名称">
                <ItemTemplate>
                  <a href="AddTlpClass.aspx?ID=<%#Eval("ID") %>"><%#Eval("Name") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Remind" HeaderText="备注" />
            <asp:BoundField DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="创建时间" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a  href="AddTlpClass.aspx?id=<%#Eval("ID") %>"><i class="zi zi_pencilalt" title="修改"></i></a>
                    <asp:LinkButton runat="server"  CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="zi zi_trashalt" title="删除"></i>删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	<div class="alert alert-light">
<asp:Button runat="server" ID="BatDel_Btn" OnClick="BatDel_Btn_Click" OnClientClick="return confirm('确定要删除吗');" CssClass="btn btn-outline-danger" Text="批量删除" />
</div>

</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>