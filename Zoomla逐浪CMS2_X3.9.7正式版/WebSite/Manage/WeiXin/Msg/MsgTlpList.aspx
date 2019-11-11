<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MsgTlpList.aspx.cs" Inherits="ZoomLaCMS.Manage.WeiXin.Msg.MsgTlpList" MasterPageFile="~/Manage/I/Index.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>消息模板</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx","工作台"),
        new Bread() {url="", text="消息列表<a href='AddMsgTlp.aspx'> [新建图文消息]</a><a href='MsgMultiAdd.aspx'> [新建多图文消息]</a>",addon="" }}
		)
    %>
	<div class="table-responsive-md list_choice pr-1">
<ZL:ExGridView ID="EGV" runat="server" AutoGenerateColumns="False" PageSize="10" IsHoldState="false" 
    OnPageIndexChanging="EGV_PageIndexChanging" AllowPaging="True" AllowSorting="True" OnRowCommand="EGV_RowCommand" OnRowDataBound="EGV_RowDataBound"
    CssClass="table table-striped table-bordered" EnableTheming="False" EnableModelValidation="True" EmptyDataText="数据为空">
    <Columns>
        <asp:TemplateField ItemStyle-CssClass="">
            <ItemTemplate>
                <input type="checkbox" name="idchk" value="<%#Eval("ID") %>" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="ID" DataField="ID" ItemStyle-CssClass="" />
        <asp:TemplateField HeaderText="消息类型" ItemStyle-CssClass="">
            <ItemTemplate>
                <%#GetMsgType() %>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField HeaderText="消息名称" DataField="Alias"/>
    <%--    <asp:TemplateField HeaderText="消息内容">
            <ItemTemplate>
                <%#Eval("MsgContent") %>
            </ItemTemplate>
        </asp:TemplateField>--%>
        <asp:BoundField DataField="CDate" DataFormatString="{0:yyyy年MM月dd日}" HeaderText="创建时间" ItemStyle-CssClass=""/>
        <asp:TemplateField HeaderText="操作" ItemStyle-CssClass="">
            <ItemTemplate>
                <a  href="<%#GetEditLink() %>"><i class="zi zi_pencilalt" title="修改"></i></a>
                <asp:LinkButton runat="server"  CommandName="del2" CommandArgument='<%#Eval("ID") %>' OnClientClick="return confirm('确定要删除吗');"><i class="zi zi_trashalt" title="删除"></i></asp:LinkButton>
                <a  onclick="sendMsg('<%#Eval("ID") %>');"><i class="zi zi_fly"></i>发送</a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</ZL:ExGridView>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script>
    function sendMsg(id) {
        ShowComDiag("MsgSend.aspx?ID=" + id, "消息群发");
    }
</script>
</asp:Content>