<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GuestManage.aspx.cs" Inherits="ZoomLaCMS.Manage.Guest.GuestManage" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server"><title><%=Resources.L.留言管理 %></title>
</asp:Content>
<asp:Content  ContentPlaceHolderID="Content" Runat="Server">
	<%=Call.SetBread(new Bread[] {
		new Bread("/{manage}/Main.aspx",Resources.L.工作台),
        new Bread("/{manage}/Guest/GuestManage.aspx",Resources.L.留言管理),
        new Bread() {url="", text="<a href='javascript:;' onclick='ShowCate(0,0);' id='showDiv'>["+Resources.L.添加留言分类 +"]</a>",addon="" }},
		Call.GetHelp(92)
		)
    %>
    <asp:Repeater runat="server" ID="RPT" OnItemCommand="RPT_ItemCommand">
        <HeaderTemplate>
            <table id="EGV" class="table table-bordered table-hover table-striped list_choice">
             <tr><td>ID</td><td><%=Resources.L.图标 %></td><td><%=Resources.L.留言名称 %></td><td><%=Resources.L.留言状态 %></td><td><%=Resources.L.访问权限 %></td><td><%=Resources.L.留言总数 %> </td><td><%=Resources.L.操作 %></td></tr>
        </HeaderTemplate>
        <ItemTemplate>
            <tr data-layer="1" data-id="<%#Eval("CateID") %>" data-pid="0" ondblclick="ShowCate(<%#Eval("CateID") %>,0);">
                <td><%#Eval("CateID") %></td>
                <td class="icontd"><a href="Default.aspx?CateID=<%#Eval("CateID") %>"><%#GetIcon() %></a></td>
                <td><a href="Default.aspx?CateID=<%#Eval("CateID") %>"></a><%#GetCateName()%></td>
                <td><span class="text-primary"><%#GetBarStatus(Eval("BarInfo").ToString()) %></span></td>
                <td><%#GetNeedLog(Eval("NeedLog").ToString()) %></td>
                <td><%#Eval("GCount") %> (<%#Eval("GCountAll") %>)</td>
                <td class='optd'>
                    <a href="javascript:;"  onclick="ShowCate(<%#Eval("CateID") %>,0);"><i class="zi zi_pencilalt" title="<%=Resources.L.修改 %>"></i><%=Resources.L.修改 %> </a> 
                    <a href="Default.aspx?CateID=<%#Eval("CateID") %>"><i class="zi zi_listul"></i><%=Resources.L.留言列表 %> </a>
                    <a href="/Guest/Default?CateID=<%#Eval("CateID") %>" target="_blank"><i class="zi zi_globe"></i><%=Resources.L.浏览 %></a>
                    <asp:LinkButton CommandName="Del"  CommandArgument='<%#Eval("CateID") %>' OnClientClick="return confirm('确实要删除吗？');" runat="server"><i class="zi zi_trashalt" title="<%=Resources.L.删除 %>"></i><%=Resources.L.删除 %></asp:LinkButton>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate>
            </table>
        </FooterTemplate>
    </asp:Repeater>
    <script>
        function ShowCate(id, pid) {
            location.href = "BarConfig.aspx?ID=" + id + "&GType=0&PID=" + pid;
        }
    </script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">

</asp:Content>