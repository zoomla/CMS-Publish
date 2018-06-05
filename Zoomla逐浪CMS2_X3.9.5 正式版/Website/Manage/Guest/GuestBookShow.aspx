<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GuestBookShow.aspx.cs" Inherits="ZoomLaCMS.Manage.Guest.GuestBookShow" ValidateRequest="false" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server">
    <title>留言内容</title>
    <script charset="utf-8" src="/Plugins/Ueditor/ueditor.config.js"></script>
    <script charset="utf-8" src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content  ContentPlaceHolderID="Content" Runat="Server">

	<asp:Label runat="server" ID="Bread_L"></asp:Label>
	<div class="list_choice table-responsive-md pr-1">
    <table class="table table-striped table-bordered table-hover sys_table" border="0" cellpadding="0" cellspacing="0">
        <tr align="center">
            <td colspan="2" class="spacingtitle"><strong>查看留言内容</strong></td>
        </tr>
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="repFileReName_ItemCommand">
            <ItemTemplate>
                <tr>
                    <th class="tdbgleft w12rem_lg">ID</th>
                    <td class="tdbg" ><%# Eval("GID")%></td>
                </tr>
                <tr>
                    <th class="tdbgleft" >留言人</th>
                    <td class="tdbg" ><a href="../User/UserInfo.aspx?id=<%# Eval("UserID") %>" title="点击查看该用户详情"><%# GetUserName(Eval("UserID","{0}")) %></a></td>
                </tr>
                <tr>
                    <th class="tdbgleft" >留言标题</th>
                    <td class="tdbg" ><%# Eval("Title") %></td>
                </tr>
                <tr>
                    <th class="tdbgleft" >留言内容</th>
                    <td class="tdbg" ><%# Eval("TContent") %></td>
                </tr>
                <tr>
                    <th class="tdbgleft" >IP地址</th>
                    <td class="tdbg" ><%# Eval("IP") %></td>
                </tr>
                <tr>
                    <th class="tdbgleft" >添加时间</th>
                    <td class="tdbg" ><%# Eval("GDate") %></td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
    <div id="Pager1" runat="server" style="display: none;"></div>
    <asp:HiddenField ID="HdnGID" runat="server" />
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="GID" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Lnk_Click" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="无相关数据">
        <Columns>
            <asp:TemplateField  >
                <ItemTemplate>
                    <input type="checkbox" name="idchk" title="" value='<%#Eval("GID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="GID" HeaderText="ID"  />
            <asp:TemplateField HeaderText="留言标题">
                <ItemTemplate>
                    <%# Eval("Title")%>
                </ItemTemplate>
                <HeaderStyle  />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="留言内容">
                <ItemTemplate>
                    <%#Eval("TContent","") %>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="留言时间">
                <ItemTemplate>
                    <%#Eval("GDate") %>
                </ItemTemplate>
                <HeaderStyle  />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="留言人">
                <ItemTemplate>
                    <a href="../User/UserInfo.aspx?id=<%# Eval("UserID")%>" title="点击查看用户详情">
                        <%# GetUserName(Eval("UserID","{0}")) %></a>
                </ItemTemplate>
                <HeaderStyle  />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作"  >
                <ItemTemplate>
                    <a href='ReplyGuest.aspx?ID=<%#Eval("GID") %>&CateID=<%=Request.QueryString["CateID"] %>&&GID=<%=Request.QueryString["GID"] %>' ><i class="zi zi_pencilalt"></i>修改</a>
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Del" CommandArgument='<%# Eval("GID") %>'  OnClientClick="return confirm('确实要删除吗？');"><i class=" zi zi_trashalt"></i>删除</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
	</div>
    <table class="TableWrap" border="0" cellpadding="0" cellspacing="0" width="100%" id="sleall">
        <tr>
            <td class="pl-2">
                <asp:Button ID="btndelete" runat="server" CssClass="btn btn-outline-danger" OnClientClick="return confirm('确定要删除选中的项目吗？')" Text="批量删除" OnClick="btndelete_Click" />
                <asp:HiddenField ID="HdnCateID" runat="server" />
            </td>
        </tr>
    </table>
    <div class="sysBtline text-center">
        <asp:Button ID="Button2" runat="server" CssClass="btn btn-info" OnClick="Button2_Click" Text="继续回复" />
        &nbsp;<asp:Button ID="Button1" runat="server" Text="返回列表" CssClass="btn btn-outline-info" OnClick="Button1_Click" />
    </div>
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
</asp:Content>