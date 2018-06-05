<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZoneStyleManage.aspx.cs" Inherits="ZoomLaCMS.Manage.Zone.ZoneStyleManage" MasterPageFile="~/Manage/I/Index.master" %>

<asp:Content runat="server" ContentPlaceHolderID="head">
    <title>空间模板</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<%=Call.SetBread(new Bread[] {
	new Bread("/{manage}/I/Main.aspx","工作台"),
	new Bread("/{manage}/User/UserManage.aspx","会员管理"),
	new Bread("ZoneConfig.aspx","会员空间管理"),
	new Bread() {url="", text="空间模板管理<a href='ZoneStyleAdd.aspx'> [添加空间模板]</a>",addon= "" }}
	)
%>
<div class="container-fluid pr-0">
<div class="row sysRow list_choice table-responsive-md">
    <table class="table table-striped table-bordered table-hover sys_table">
        <tr>
            <th></td>
            <th class="w1rem"  scope="col">ID</th>
            <th scope="col" class="text-center"><span>缩略图</span></th>
            <th scope="col" class="text-center"><span>名称</span></th>
            <th scope="col" class="text-center">路径</th>
            <th scope="col" class="text-center"><span>状态</span></th>
            <th scope="col" class="text-center"><span>操作</span></th>
        </tr>
        <ZL:ExRepeater ID="RPT" runat="server" PageSize="10" OnItemCommand="RPT_ItemCommand"
            PagePre="<tr id='page_tr'><td class='text-center'><input type='checkbox' id='chkAll'/></td><td colspan='10' id='page_td'>" PageEnd="</td></tr>">
            <ItemTemplate>
                <tr ondblclick="javascript:window.location.href='ZoneStyleAdd.aspx?id=<%#Eval("ID")%>';">
                    <td class="text-center">
                        <input name="idchk" type="checkbox" value='<%# Eval("ID")%>' /></td>
                    <td class="text-center"><%#Eval("ID") %></td>
                    <td class="text-center">
                        <img src="<%#Eval("StylePic") %>" onerror="shownopic(this);" class="img_50" /></td>
                    <td class="text-center"><%#Eval("StyleName")%></td>
                    <td class="text-center"><%#Eval("UserIndexStyle") %></td>
                    <td class="text-center"><%#GetState(DataBinder.Eval(Container.DataItem, "StyleState").ToString())%></td>
                    <td class="text-center">
                        <a href="ZoneStyleAdd.aspx?id=<%#Eval("ID")%>" class="option_style"><i class="zi zi_pencilalt" title="修改"></i></a>
                        <asp:LinkButton runat="server" CommandName='del2' CommandArgument='<%#Eval("ID") %>'
                            OnClientClick="return confirm('不可恢复性删除数据,确定将该数据删除?');"><i class="zi zi_trashalt" title="删除"></i>删除</asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate></FooterTemplate>
        </ZL:ExRepeater>
    </table>
</div>
</div>
    <div class="sysBtline">
        <asp:Button runat="server" ID="BatDel_Btn" Text="批量删除" CssClass="btn btn-outline-danger" OnClick="BatDel_Btn_Click" OnClientClick="return confirm('确定要删除吗?');" />
    </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script src="/JS/SelectCheckBox.js"></script>
    <script>
        $(function () {
            $("#chkAll").click(function () { selectAllByName(document.getElementById("chkAll"), "idchk"); });
        })
    </script>
</asp:Content>
