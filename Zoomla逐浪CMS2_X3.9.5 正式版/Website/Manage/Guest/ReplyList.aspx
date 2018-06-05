<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReplyList.aspx.cs" Inherits="ZoomLaCMS.Manage.Guest.ReplyList" ValidateRequest="false" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server">
    <title>留言回复列表</title>
</asp:Content>
    <%=Call.SetBread(new Bread[] {
        new Bread("/{manage}/I/Main.aspx","工作台"),
        new Bread("/{manage}/WeiXin/WxAppManage.aspx","公众号管理"),
        new Bread() {url="", text="回复管理 <a href='AddReply.aspx?appid=1'>[添加回复]</a> [公众号:育婴妈妈love]",addon= "" }}
        )
    %>
	<div class="list_choice pr-1">
<asp:Content  ContentPlaceHolderID="Content" Runat="Server">
    <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="GID" PageSize="10" OnPageIndexChanging="Egv_PageIndexChanging" IsHoldState="false" OnRowCommand="Lnk_Click" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover w-100" EnableTheming="False" EnableModelValidation="True" EmptyDataText="无相关数据">
        <Columns>
            <asp:TemplateField HeaderText="选择">
                <ItemTemplate>
                    <input type="checkbox" name="idchk" title="" value='<%#Eval("GID") %>' />
                </ItemTemplate>
                <HeaderStyle CssClass="w1rem"/>
            </asp:TemplateField>
            <asp:BoundField DataField="GID" HeaderText="ID">
                <HeaderStyle />
            </asp:BoundField>
            <asp:TemplateField HeaderText="标题">
                <ItemTemplate>
                    <a href="guestbookshow.aspx?CateID=<%# Eval("CateID")%>&GID=<%# Eval("GID")%>"><%# Eval("Title")%></a>
                </ItemTemplate>
                <HeaderStyle />
            </asp:TemplateField>
            <asp:BoundField HeaderText="回复人" DataField="UserName" HeaderStyle-Width="10%" />
            <asp:TemplateField HeaderText="回复时间">
                <ItemTemplate>
                    <%#Eval("GDate") %>
                </ItemTemplate>
                <HeaderStyle />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="回复状态">
			    <ItemTemplate>                                
                   <%#GetStatus() %>
			    </ItemTemplate>
			     <HeaderStyle/>
		    </asp:TemplateField>  
            <asp:TemplateField HeaderText="留言IP">
                <ItemTemplate>
                    <%#GetIPLoca() %>
                </ItemTemplate>
                <HeaderStyle />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <a href="/Guest/GuestShow?GID=<%#Eval("ParentID") %>" class="option_style" target="_blank" ><i class="zi zi_globe"></i>浏览</a>
                    <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Del" CommandArgument='<%# Eval("GID") %>' CssClass="option_style" OnClientClick="return confirm('确实要删除吗？');"><i class="zi zi_trashalt"></i>删除</asp:LinkButton>
                </ItemTemplate>
                <HeaderStyle />
            </asp:TemplateField>
        </Columns>
    </ZL:ExGridView>
    <div class="clearfix"></div>
    <table  class="TableWrap"  border="0" cellpadding="0" cellspacing="0" width="100%" id="sleall">
	    <tr>
		    <td style="height: 21px">      
                <asp:Button ID="btnAdudit" runat="server" class="btn btn-info"  Text="批量审核" OnClick="btnAdudit_Click" />   
                <asp:Button ID="btnSvaeAudit" runat="server" class="btn btn-outline-danger" OnClientClick="return confirm('确定要取消选中的项目审核吗？')"  Text="取消审核" OnClick="btnSelAudit_Click"  />             
			    <asp:Button ID="btndelete" runat="server" class="btn btn-outline-danger" OnClientClick="return confirm('确定要删除选中的项目吗？')" Text="批量删除" OnClick="btndelete_Click" />
			    <asp:HiddenField ID="HdnCateID" runat="server" />
		    </td>
	    </tr>
    </table>
    <script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
</asp:Content>
</div>