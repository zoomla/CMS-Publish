<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MsgTlpList.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.MsgTlpList" MasterPageFile="~/Manage/I/Index.master"  %>
<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>模板列表</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/I/Main.aspx","工作台"),
        new Bread("/{manage}/WeiXin/WxAppManage.aspx","公众号管理"),
        new Bread() {url="", text="模板列表",addon= "" }}
        )
    %>
	<div class="list_choice table-responsive-md pr-1">
    <ZL:ExGridView runat="server" ID="EGV" AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover" EmptyDataText="暂无模板号信息!"
        PageSize="10" OnPageIndexChanging="EGV_PageIndexChanging" OnRowDataBound="EGV_RowDataBound" AllowPaging="True" OnRowCommand="EGV_RowCommand" DataKeyNames="template_id">
        <Columns>
            <asp:TemplateField ItemStyle-CssClass="w1rem">
                <ItemTemplate><input type="checkbox" name="idchk" value='<%#Eval("template_id") %>' /></ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField HeaderText="模板标题" DataField="title" />
            <asp:BoundField HeaderText="ID" DataField="template_id" />
            <asp:BoundField HeaderText="所属一级行业" DataField="primary_industry" />
            <asp:BoundField HeaderText="所属二级行业" DataField="deputy_industry" />
            <asp:BoundField  HeaderText="模板内容" DataField="content" />
            <asp:TemplateField HeaderText="操作" >
                <ItemTemplate>
                    <a href="SendTlpMsg.aspx?id=<%#Eval("template_id") %>&appid=<%#AppID %>"><i class="zi zi_pencilalt"></i>编辑</a>
                    <asp:LinkButton runat="server" OnClientClick="return confirm('是否删除该项')" CommandName="Del" CommandArgument='<%#Eval("template_id") %>' ><span class="zi zi_trashalt" title="删除"></span> 删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	</div>
	<div class="sysBtline">
    <asp:Button runat="server" ID="Dels_B" OnClick="Dels_B_Click" OnClientClick="return confirm('确定删除选中项?')" CssClass="btn btn-outline-danger" Text="批量删除" />
	</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent"></asp:Content>