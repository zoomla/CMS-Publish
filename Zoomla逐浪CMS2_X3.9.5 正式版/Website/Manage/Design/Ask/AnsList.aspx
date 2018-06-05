<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AnsList.aspx.cs" Inherits="ZoomLaCMS.Manage.Design.Ask.AnsList" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>答题列表</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol id="BreadNav" class="breadcrumb fixed-top">
    <li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'><%=Resources.L.工作台 %></a></li>
    <li class="breadcrumb-item"><a href='Default.aspx'>动力模块</a></li>
    <li class="breadcrumb-item"><a href='AskList.aspx'>问卷调查</a></li>
    <li class="breadcrumb-item"><asp:Label ID="AskTitle_L" runat="server" /></li>
    <div id="help" class="pull-right text-center"><a href="javascript::" id="sel_btn" class="help_btn" onclick="selbox.toggle();"><i class="zi zi_search"></i></a></div>
    <div id="sel_box" runat="server">
        <div>
            <div class="input-group">
                <asp:TextBox ID="Skey_T" placeholder="答题ID或用户名" runat="server" CssClass="form-control max20rem" />
                <span class="input-group-append">
                    <asp:Button ID="Search_B" runat="server" Text="<%$Resources:L,搜索 %>" class="btn btn-outline-secondary" OnClick="Search_B_Click" />
                </span>
            </div>
        </div>
    </div>
</ol>
<div class="template list_choice table-responsive-md pr-1" id="template" runat="server">
    <ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="false" OnRowDataBound="EGV_RowDataBound" PageSize="20" AllowPaging="true" 
        CssClass="table table-striped table-bordered" OnRowCommand="EGV_RowCommand" EmptyDataText="没有数据">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="ID" DataField="ID" />
            <asp:BoundField HeaderText="问卷标题" DataField="Title" />
            <asp:TemplateField HeaderText="答题用户"><ItemTemplate><%#GetCUser() %></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="提交IP"><ItemTemplate><%#GetIP() %></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="来源平台"><ItemTemplate>微信</ItemTemplate></asp:TemplateField>
            <asp:BoundField HeaderText="答题时间" DataField="CDate" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href='AnsDetailList.aspx?ansid=<%#Eval("ID") %>'><i class="zi zi_list"></i> 详情</a>
                    <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="del" OnClientClick="return confirm('确认删除？')" CssClass="option_style"><i class="zi zi_trashalt"></i>删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
</div>
<div class="sysBtline">
    <asp:Button runat="server" ID="BatDel_Btn" Text="批量删除" OnClick="BatDel_Btn_Click" class="btn btn-outline-danger" OnClientClick="return confirm('确定要删除吗');"/>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
    function showuser(id) { ShowComDiag("../../User/Userinfo.aspx?id=" + id, "查看用户"); }
</script>
</asp:Content>