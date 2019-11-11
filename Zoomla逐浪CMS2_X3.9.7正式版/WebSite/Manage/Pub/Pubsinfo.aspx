<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pubsinfo.aspx.cs" Inherits="ZoomLaCMS.Manage.Pub.Pubsinfo" MasterPageFile="~/Manage/I/Index.master" %>
<%@ Import Namespace="System.Data" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title><asp:Literal runat="server" ID="Title_L"></asp:Literal></title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol id="BreadNav" class="breadcrumb fixed-top">
    <li class="breadcrumb-item"><a href="<%=customPath2 %>Main.aspx">工作台</a></li>
	<li class="breadcrumb-item"><a href="<%=customPath2 %>Content/ContentManage.aspx">内容管理</a></li>
    <li class="breadcrumb-item"><a href="PubManage.aspx">互动模块管理</a></li>
	<li class="breadcrumb-item"><a href="<%=Request.RawUrl %>"><asp:Label runat="server" ID="ModelName_L" /></a></li>
    <div id="help" class="pull-right text-center"><a href="javascript:;" id="sel_btn" class="help_btn" onclick="selbox.toggle();"><i class="zi zi_search"></i></a></div>
    <div id="sel_box" class="" style="height:80px;">
        <div class="input-group">
            <asp:DropDownList runat="server" ID="skey_dp" class="form-control max20rem" DataTextField="FieldAlias" DataValueField="FieldName"></asp:DropDownList>
            <input type="text" id="skey" runat="server" class="form-control mvcparam max20rem" placeholder="请输入关键词" onkeypress="selbox.search();" />
            <span class="input-group-append">
                <asp:LinkButton runat="server" class="btn btn-outline-secondary" ID="Search_Btn" OnClick="Search_Btn_Click"><i class="zi zi_search"></i></asp:LinkButton>
            </span>
        </div>
    </div>
</ol>
<ul class="nav nav-tabs list_choice">
    <li class="nav-item" id="li_-100"><a class="nav-link" href="PubsInfo.aspx?PubID=<%=PubID %>" onclick="ShowTabs(0,1)">所有信息</a></li>
    <li class="nav-item" id="li_0"><a class="nav-link" href="PubsInfo.aspx?PubID=<%=PubID %>&status=0">待审核信息</a></li>
    <li class="nav-item" id="li_1"><a class="nav-link" href="PubsInfo.aspx?PubID=<%=PubID %>&status=1">已审核信息</a></li>
</ul>
<div class="container-fluid pr-0">
<div class="row sysRow table-responsive-md">
<table class="table table-bordered table-striped" id="EGV">
    <tr id="head_tr">
        <td class=" excel_no"></td>
        <td class="">ID</td>
        <td class="">状态</td>
       <%foreach (DataColumn dc in setting.dt.Columns){
               if (IsIgnoreField(dc.ColumnName)) { continue; }
               %>
     <td> <%:GetFieldAlias(dc.ColumnName)%></td>
        <%} %>
        <td class=" excel_no">操作</td>
    </tr>
    <ZL:Repeater ID="RPT" runat="server" PageSize="20" PagePre="<tr><td><input type='checkbox' id='chkAll'/></td><td colspan='8' id='page_td'><div class='text-center'>"
        PageEnd="</div></td></tr>" OnItemCommand="RPT_ItemCommand" OnItemDataBound="RPT_ItemDataBound">
        <ItemTemplate>
           <tr>
               <td class="excel_no"><input type="checkbox" name="idchk" value="<%#Eval("ID") %>" /></td>
               <td><%#Eval("ID") %></td>
               <td><%#ShowStatus()%></td>
            <asp:Label runat="server" ID="ItemHtml_L" EnableViewState="false"></asp:Label>
               <td class="excel_no">
                   <a href="EditPub.aspx?Pubid=<%# PubID %>&ID=<%#Eval("ID") %>" class="option_style"><i class="zi zi_pencilalt"></i></a>
                   <a href="AddPub.aspx?Pubid=<%#PubID%>&Parentid=<%#Eval("ID") %>" class="option_style"><i class="zi zi_reply" title="回复"></i>回复</a>
<%--                   <asp:LinkButton runat="server" CommandName="audit" CommandArgument='<%# Eval("ID") %>' class="option_style"><i class="zi zi_gavel" title="审核"></i>审核</asp:LinkButton>--%>
                   <a href="PubsInfo.aspx?Pubid=<%# PubID %>&ParentID=<%# Eval("ID") %>" class="option_style"><i class="zi zi_magic" title="管理"></i>管理回复</a>
                   <asp:LinkButton runat="server" CommandName="del" CommandArgument='<%#Eval("ID") %>' class="option_style" OnClientClick="return confirm('确定要删除吗');">
                   <i class="zi zi_trashalt"></i></asp:LinkButton>
               </td>
           </tr>
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </ZL:Repeater>
</table>
</div>
</div>
<div class="sysBtline">
    <asp:Button runat="server" ID="BatDel_Btn" class="btn btn-outline-danger mb-1" Text="批量删除" OnClick="BatDel_Btn_Click"/>
    <asp:Button runat="server" ID="BatAudit_Btn" class="btn btn-outline-info mb-1" Text="批量审核" OnClick="BatAudit_Btn_Click"/>
    <asp:Button runat="server" ID="BatCancel_Btn" class="btn btn-outline-danger mb-1" Text="批量取消审核" OnClick="BatCancel_Btn_Click"/>
    <input type="button" value="导出Excel" class="btn btn-outline-info mb-1" onclick="ZLHelper.ToExcelByID()"/>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Label/ZLHelper.js"></script>
<script src="/JS/SelectCheckBox.js"></script>
<script>
    $(function () {
        $("#page_td").attr("colspan", $("#head_tr td").length - 1);
        $("#li_<%=Status%>").find("a").addClass("active");
        $("#chkAll").click(function () {
            selectAllByName(this, "idchk");
        });
    })
</script>
</asp:Content>