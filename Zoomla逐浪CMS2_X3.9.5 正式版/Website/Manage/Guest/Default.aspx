<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ZoomLaCMS.Manage.Guest.Default" ValidateRequest="false" EnableViewStateMac="false" MasterPageFile="~/Manage/I/Index.master" %>
<asp:Content ContentPlaceHolderID="head" Runat="Server">
    <title>留言列表</title>
</asp:Content>
<asp:Content  ContentPlaceHolderID="Content" Runat="Server">
            <ol id="BreadNav" class="breadcrumb fixed-top">
                <li class="breadcrumb-item"><a href="/admin/I/Main.aspx">工作台</a></li>
                <li class="breadcrumb-item"><a href='WdCheck.aspx'>百科问答</a></li>
                <li class="breadcrumb-item"><a href='GuestManage.aspx'>留言管理</a></li>
                <li class="breadcrumb-item">留言列表 <%=RelStr %></li>
                <div id="help" class="pull-right text-center"><a href="javascript:;" class="help_btn active" onclick="selbox.toggle();"><i class="zi zi_search"></i></a></div>
                <div id="sel_box">
                    <div class="input-group">
                        <asp:TextBox runat="server" ID="Key_T" CssClass="form-control max20rem" placeholder="请输入关键词" onkeypress="selbox.search();" />
                        <span class="input-group-append">
                            <asp:Button runat="server" CssClass="btn btn-outline-secondary" ID="SearchBtn" Text="搜索" OnClick="SearchBtn_Click" />
                        </span>
                    </div>
                </div>
            </ol>
    <div class="template list_choice table-responsive-md pr-1">
        <ZL:ExGridView ID="Egv" runat="server" AutoGenerateColumns="False" DataKeyNames="GID" PageSize="20" OnPageIndexChanging="Egv_PageIndexChanging" OnRowDataBound="Egv_RowDataBound" IsHoldState="false" OnRowCommand="Lnk_Click" AllowPaging="True" AllowSorting="True" CssClass="table table-striped table-bordered table-hover" EnableTheming="False" EnableModelValidation="True" EmptyDataText="无相关数据">
        <Columns>
		    <asp:TemplateField>                            
			    <ItemTemplate>
                    <input type="checkbox"  name="idchk" title="" value='<%#Eval("GID") %>' />
			    </ItemTemplate>
                <HeaderStyle/>
		    </asp:TemplateField>
		    <asp:BoundField DataField="GID" HeaderText="ID">
		    <HeaderStyle/>
		    </asp:BoundField>                                               
		    <asp:TemplateField HeaderText="标题">
			    <ItemTemplate>                                
			       <a href="guestbookshow.aspx?CateID=<%# Eval("CateID")%>&GID=<%# Eval("GID")%>"><%# Eval("Title")%> </a>
			    </ItemTemplate>
			     <HeaderStyle/>
		    </asp:TemplateField>
            <asp:TemplateField HeaderText="留言状态">
			    <ItemTemplate>                                
                   <%#GetStatus() %>
			    </ItemTemplate>
			     <HeaderStyle/>
		    </asp:TemplateField>   
		    <asp:TemplateField HeaderText="留言时间">
			    <ItemTemplate>                                
			       <%#Eval("GDate") %>
			    </ItemTemplate>
			     <HeaderStyle Width="100px"/>
		    </asp:TemplateField>   
		    <asp:TemplateField HeaderText="留言IP">
			    <ItemTemplate>   
                   <%#GetIPLoca() %>                             
			    </ItemTemplate>
			     <HeaderStyle/>
		    </asp:TemplateField>  
            <asp:TemplateField HeaderText="留言人">
                <ItemTemplate>
                    <a href="../User/UserInfo.aspx?id=<%#Eval("UserID") %>"><%#Eval("UserName") %></a>
                </ItemTemplate>
                  <HeaderStyle />
            </asp:TemplateField>                                                
		    <asp:TemplateField HeaderText="操作">                
		    <ItemTemplate>                 
                <asp:LinkButton ID="LinkButton4" runat="server" CommandName="Reply" CommandArgument='<%# Eval("GID")+"&CateID="+Eval("CateID") %>'  ToolTip="回复"><i class="zi zi_reply"></i>回复</asp:LinkButton>
                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="RList" CommandArgument='<%# Eval("GID")+"&CateID="+Eval("CateID") %>'  ToolTip="回复列表"><i class="zi zi_list"></i>回复列表</asp:LinkButton>
			    <asp:LinkButton ID="LinkButton3" runat="server" CommandName="QList" CommandArgument='<%# Eval("GID")+"&CateID="+Eval("CateID") %>'  ToolTip="详情">详情</asp:LinkButton>
                <a href="/Guest/GuestShow?GID=<%#Eval("GID") %>"  target="_blank" ><i class="zi zi_globe"></i>浏览</a>
                <asp:LinkButton ID="LinkButton5" runat="server" Visible='<%#Eval("Status","").Equals("0") %>' CommandName="Audit" CommandArgument='<%#Eval("GID")%>'  ToolTip="未审核"><i class="zi zi_flag"></i><span class="text-success">通过审核</span></asp:LinkButton>
                <asp:LinkButton ID="LinkButton6" runat="server" Visible='<%#Eval("Status","").Equals("1") %>' CommandName="CancelAudit" CommandArgument='<%#Eval("GID")%>'  ToolTip="已审核"><i class="zi zi_flag"></i><span class="text-danger">取消审核</span></asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" Visible='<%#!Eval("Status","").Equals("-1") %>' CommandName="Del" CommandArgument='<%#Eval("GID")%>'  ToolTip="删除"><i class="zi zi_trashalt"></i>删除</asp:LinkButton>
                <asp:LinkButton ID="LinkButton8" runat="server" Visible='<%#Eval("Status","").Equals("-1") %>' CommandName="Del2" CommandArgument='<%#Eval("GID")%>'  ToolTip="删除"><i class="zi zi_trashalt"></i>彻底删除</asp:LinkButton>
		    </ItemTemplate>
		    <HeaderStyle />
		    </asp:TemplateField>
	    </Columns>
    </ZL:ExGridView>
    </div>
<div class="clearbox"></div>           
<table  class="TableWrap"  border="0" cellpadding="0" cellspacing="0" class="w-100" id="sleall">
	<tr>
		<td>                   
			<asp:Button ID="btndelete" runat="server" CssClass="btn btn-outline-danger" OnClientClick="return confirm('确定要删除选中的项目吗？')" Text="批量删除" OnClick="btndelete_Click" />
             <asp:Button ID="btnAdudit" runat="server" class="btn btn-outline-info"  Text="审核通过" OnClick="btnAdudit_Click" />   
            <asp:Button ID="btnSvaeAudit" runat="server" class="btn btn-outline-danger" OnClientClick="return confirm('确定要取消选中的项目审核吗？')"  Text="取消审核" OnClick="btnSelAudit_Click"  />
            <asp:Button ID="Rel_B" runat="server" CssClass="btn btn-outline-info" Text="批量还原" Visible="false" OnClick="Rel_B_Click" />
            <asp:Button ID="Del_B" runat="server" CssClass="btn btn-outline-danger" OnClientClick="return confirm('确定要删除选中的项目吗？')" Visible="false" Text="彻底删除" OnClick="Del_B_Click" />
			<asp:HiddenField ID="HdnCateID" runat="server" />
		</td>
	</tr>                
</table>
<script type="text/javascript" src="/JS/SelectCheckBox.js"></script>
<script>
</script>
</asp:Content>