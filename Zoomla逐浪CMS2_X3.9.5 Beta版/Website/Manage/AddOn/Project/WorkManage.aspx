<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkManage.aspx.cs" Inherits="ZoomLaCMS.Manage.AddOn.Project.WorkManage" MasterPageFile="~/Manage/I/Default.master" %>
<asp:Content ContentPlaceHolderID="head" runat="Server"><title>项目工作内容列表</title></asp:Content>
<asp:Content ContentPlaceHolderID="Content" runat="Server">
    <asp:Label ID="LblProject" runat="server" Text=""></asp:Label>
    <ZL:ExGridView ID="EGV" runat="server" AllowPaging="True" AutoGenerateColumns="False" CssClass="table table-striped table-bordered"
         DataKeyNames="ID" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" OnRowCommand="EGV_RowCommand" EmptyDataText="无任何相关数据" OnRowDataBound="Egv_RowDataBound">
        <Columns>
            <asp:TemplateField HeaderText="选择" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                </ItemTemplate>
                <HeaderStyle Width="4%" />
            </asp:TemplateField>
            <asp:BoundField DataField="ID" HeaderText="ID" ItemStyle-HorizontalAlign="Center">
                <HeaderStyle Width="5%" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="流程名称">
                <ItemTemplate>
                    <a href="AddWork.aspx?id=<%#Eval("ID")%>">
                        <%#DataBinder.Eval(Container.DataItem, "WorkName").ToString()%></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="启用" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="td_m">
                <ItemTemplate>
                    <%# (int)Eval("Status") == 0 ? "<span style=\"color: red\">×</span>" : "<font color=green>√</font>"%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="批准" ItemStyle-HorizontalAlign="Center" ItemStyle-CssClass="td_m">
                <ItemTemplate>
                    <%# (int)Eval("Approving") == 0 ? "<span style=\"color: red\">×</span>" : "<font color=green>√</font>"%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="td_l">
                <ItemTemplate>
                    <asp:HiddenField ID="hfid" runat="server" Value='<%#Eval("ID") %>' />
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="EditWork" CommandArgument='<%# Eval("ID")%>' CssClass="option_style"><i class="fa fa-pencil" title="修改"></i></asp:LinkButton>
                    <asp:LinkButton ID="LnkDelete" runat="server" CommandName="DelWork"  CommandArgument='<%# Eval("ID")%>' OnClientClick="return confirm('确实要删除吗？');" CssClass="option_style"><i class="fa fa-trash-o" title="删除"></i></asp:LinkButton>
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="FinishWork" CommandArgument='<%# Eval("ID")%>' OnClientClick="return confirm('确实要执行此操作吗？');" CssClass="option_style"><i class="fa fa-play-circle"></i><%# (int)Eval("Status") == 0 ? "启用":"停用"%></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>    
        </Columns>
    </ZL:ExGridView>
    <asp:Button ID="btnDel" runat="server" Text="批量删除" OnClick="btnDel_Click" OnClientClick="return confirm('确定要删除吗');" class="btn btn-primary" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>
