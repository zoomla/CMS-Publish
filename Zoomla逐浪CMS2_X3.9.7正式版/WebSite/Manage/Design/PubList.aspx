<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PubList.aspx.cs" Inherits="ZoomLaCMS.Manage.Design.PubList" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>互动信息</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol id="BreadNav" class="breadcrumb fixed-top">
    <li class="breadcrumb-item"><a href='<%=CustomerPageAction.customPath2 %>Main.aspx'><%=Resources.L.工作台 %></a></li>
    <li class="breadcrumb-item"><a href='Default.aspx'>动力模块</a></li>
    <li class="breadcrumb-item"><a href='SceneList.aspx'>场景列表</a></li>
    <div id="help" class="pull-right text-center"><a href="javascript::" id="sel_btn" class="help_btn"><i class="zi zi_search"></i></a></div>
    <div id="sel_box" class="sel_box" runat="server">
        <div class="sel_wrap">
            <div class="input-group">
                <asp:TextBox ID="Skey_T" placeholder="表单,场景名称" runat="server" CssClass="form-control max20rem" />
                <span class="input-group-append">
                    <asp:Button ID="Search_B" runat="server" Text="搜索" class="btn btn-outline-secondary" OnClick="Search_B_Click" />
                </span>
            </div>
        </div>
    </div>
</ol>
<div class="list_choice table-responsive-md pr-1">
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
        OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
        CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="场景名称">
                <ItemTemplate><a href="PubList.aspx?h5id=<%#Eval("H5ID") %>" title="点击筛选"><%#Eval("Title") %></a></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="表单名称">
                <ItemTemplate>
                    <a href="PubList.aspx?fname=<%#HttpUtility.UrlEncode(Eval("FormName","")) %>" title="点击筛选"><%#Eval("FormName") %></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="表单内容">
                <ItemTemplate>
                    <%#GetContent() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="用户">
                <ItemTemplate><%#GetUser() %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="IP">
                <ItemTemplate>
                    <%#GetIP() %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="创建时间" />
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="del2" OnClientClick="return confirm('确定要删除吗');"><i class="zi zi_trashalt" title="删除"></i></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
</ZL:ExGridView>
</div>
<div class="sysBtline">
<asp:Button runat="server" ID="BatDel_Btn" Text="批量删除" OnClick="BatDel_Btn_Click" OnClientClick="return confirm('确定要删除吗');" class="btn btn-outline-danger" />
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
$("#sel_btn").click(function (e) {
	if ($("#sel_box").css("display") == "none") {
		$(this).addClass("active");
		$("#sel_box").slideDown(300);
		$(".template").css("margin-top","44px");
	}
	else {
		$(this).removeClass("active");
		$("#sel_box").slideUp(200);
		$(".template").css("margin-top", "0px");
	}
});
</script>
</asp:Content>