<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JsonPManage.aspx.cs" Inherits="ZoomLaCMS.Manage.APP.JsonPManage" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>跨域调用</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/I/Main.aspx","工作台"),
		new Bread("/{manage}/user/UserManage.aspx","用户管理"),
        new Bread() {url="", text="移动接口<a href='AddJsonP.aspx'> [添加调用]</a>",addon="" }}
		)
    %>
	<div class="table-responsive-md">
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" IsHoldState="false" PageSize="10" 
        OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand"
        CssClass="table table-striped table-bordered table-hover list_choice" EnableTheming="False">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="调用名称">
                <ItemTemplate>
                    <a href="AddJsonP.aspx?ID=<%#Eval("ID") %>"><%#Eval("Alias") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="主表">
                <ItemTemplate>
                     <%#GetStr(Eval("T1")) %>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="次表">
                <ItemTemplate>
                     <%#GetStr(Eval("T2")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="开放参数">
                <ItemTemplate>
                    <%#GetStr(Eval("Params")) %>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField HeaderText="备注">
                <ItemTemplate>
                    <%#GetStr(Eval("Remark")) %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="启用">
                <ItemTemplate>
                    <%#Eval("MyState","").Equals("1")?"<i class='zi zi_check rd_green'></i>":" <i class='zi zi_times rd_red'></i>" %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="AddJsonP.aspx?ID=<%#Eval("ID") %>"><i class="zi zi_pencilalt" title="修改"></i>修改</a>
                    <a target="_blank" href="<%#GetJsLink() %>">生成实例</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	</div>
	<div class="sysBtline">
    <asp:Button ID="Dels_Btn" runat="server" CssClass="btn btn-outline-danger" OnClientClick="return confirm('是否确定删除所选项?')" Text="批量删除" OnClick="Dels_Btn_Click" />
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
</asp:Content>
