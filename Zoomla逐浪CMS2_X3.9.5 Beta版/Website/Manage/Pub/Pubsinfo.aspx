<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Pubsinfo.aspx.cs" Inherits="ZoomLaCMS.Manage.Pub.Pubsinfo" MasterPageFile="~/Manage/I/Default.master" %>
<%@ Import Namespace="System.Data" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>模型数据</title>
<style type="text/css">
.chkwrap{margin-right:5px;display:inline-block;min-width:80px;}
</style>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<ol id="BreadNav" class="breadcrumb navbar-fixed-top">
    <li><a href="<%=customPath2 %>Main.aspx">工作台</a></li><li><a href="<%=customPath2 %>Content/ContentManage.aspx">内容管理</a></li>
    <li><a href="Pubsinfo.aspx?Pubid=<%=PubID %>">互动模块管理</a></li><li class="active"><a href="<%=Request.RawUrl %>"><asp:Label runat="server" ID="ModelName_L" /></a></li>
    <div id="help" class="pull-right text-center"><a href="javascript:;" id="sel_btn" class="help_btn" onclick="selbox.toggle();"><i class="fa fa-search"></i></a></div>
    <div id="sel_box" class="padding5" style="height:80px;">
        <div class="input-group" style="width:740px;">
            <asp:DropDownList runat="server" ID="skey_dp" class="form-control text_md" DataTextField="FieldAlias" DataValueField="FieldName"></asp:DropDownList>
            <input type="text" id="skey" runat="server" class="form-control mvcparam" placeholder="请输入关键词" style="width:500px;" onkeypress="selbox.search();" />
            <span class="input-group-btn">
                <asp:LinkButton runat="server" class="btn btn-default" ID="Search_Btn" OnClick="Search_Btn_Click"><i class="fa fa-search"></i></asp:LinkButton>
            </span>
        </div>
        <div class="margin_t5">
            <asp:Repeater runat="server" ID="Field_RPT">
                <ItemTemplate><label class="chkwrap"><input type="checkbox" name="ignore_chk" value="<%#Eval("FieldName") %>" /><%#Eval("FieldAlias") %></label></ItemTemplate>
            </asp:Repeater>
            <asp:Button runat="server" ID="Ignore_Btn" class="btn btn-info" OnClick="Ignore_Btn_Click" Text="忽略所选字段" />
        </div>
    </div>
</ol>
<ul class="nav nav-tabs">
    <li id="li_-100"><a href="PubsInfo.aspx?PubID=<%=PubID %>" onclick="ShowTabs(0,1)">所有信息</a></li>
    <li id="li_0"><a href="PubsInfo.aspx?PubID=<%=PubID %>&status=0">待审核信息</a></li>
    <li id="li_1"><a href="PubsInfo.aspx?PubID=<%=PubID %>&status=1">已审核信息</a></li>
</ul>
<table class="table table-bordered table-striped" id="EGV">
    <tr id="head_tr">
        <td class="td_xs excel_no"></td>
        <td class="td_s">ID</td>
        <td class="td_m">状态</td>
       <%foreach (DataColumn dc in setting.dt.Columns){
               if (IsIgnoreField(dc.ColumnName)) { continue; }
               %>
     <td> <%:GetFieldAlias(dc.ColumnName)%></td>
        <%} %>
        <td class="td_l excel_no">操作</td>
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
                   <a href="EditPub.aspx?Pubid=<%# PubID %>&ID=<%#Eval("ID") %>" class="option_style"><i class="fa fa-pencil"></i></a>
                   <a href="AddPub.aspx?Pubid=<%#PubID%>&Parentid=<%#Eval("ID") %>" class="option_style"><i class="fa fa-mail-reply" title="回复"></i>回复</a>
<%--                   <asp:LinkButton runat="server" CommandName="audit" CommandArgument='<%# Eval("ID") %>' class="option_style"><i class="fa fa-legal" title="审核"></i>审核</asp:LinkButton>--%>
                   <a href="PubsInfo.aspx?Pubid=<%# PubID %>&ParentID=<%# Eval("ID") %>" class="option_style"><i class="fa fa-magic" title="管理"></i>管理回复</a>
                   <asp:LinkButton runat="server" CommandName="del" CommandArgument='<%#Eval("ID") %>' class="option_style" OnClientClick="return confirm('确定要删除吗');">
                   <i class="fa fa-trash-o"></i></asp:LinkButton>
               </td>
           </tr>
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </ZL:Repeater>
</table>
<div class="margin_t5">
    <asp:Button runat="server" ID="BatDel_Btn" class="btn btn-info" Text="批量删除" OnClick="BatDel_Btn_Click"/>
    <asp:Button runat="server" ID="BatAudit_Btn" class="btn btn-info" Text="批量审核" OnClick="BatAudit_Btn_Click"/>
    <asp:Button runat="server" ID="BatCancel_Btn" class="btn btn-info" Text="批量取消审核" OnClick="BatCancel_Btn_Click"/>
    <input type="button" value="导出Excel" class="btn btn-info" onclick="ZLHelper.ToExcelByID()"/>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script src="/JS/Label/ZLHelper.js"></script>
<script src="/JS/SelectCheckBox.js"></script>
<script>
    $(function () {
        var ignores = ",<%:Ignores %>,";
        $("input[name='ignore_chk']").each(function () {
            if (ignores.indexOf("," + this.value + ",") > -1) { this.checked = true; }
        });
        $("#page_td").attr("colspan", $("#head_tr td").length - 1);
        $("#li_<%=Status%>").addClass("active");
        $("#chkAll").click(function () {
            selectAllByName(this, "idchk");
        });
    })
</script>
</asp:Content>