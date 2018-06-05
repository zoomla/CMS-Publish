<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LabelManage.aspx.cs" Inherits="ZoomLaCMS.Design.Diag.Label.LabelManage" MasterPageFile="~/Common/Master/Empty2.master" %>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="head">
    <title>标签管理</title>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
    <div id="sel_box" class="padding5">
<div class="input-group sel_box">
    <asp:TextBox runat="server" ID="TxtLableName" class="form-control" onkeydown="return GetEnterCode('click','HidSearch');" placeholder="检索当前位置" />
    <span class="input-group-btn">
            <asp:LinkButton runat="server" CssClass="btn btn-default" ID="Search_Btn" OnClick="BtnSearch_Click">搜索</asp:LinkButton>
            <asp:Button runat="server" ID="BtnSearch" OnClick="BtnSearch_Click" style="display:none;" />
    </span>
</div>
</div>
<div class="sysUsertabs">
    <ul class="nav nav-tabs" id="navtabs_ul">
        <asp:Literal ID="lblLabel" runat="server"></asp:Literal>
    </ul>

<a id="hid_right" class="hid_right"><i class="zi zi_pathLeft"></i>  </a>
<a id="hid_left" class="hid_left"><i class="zi zi_pathRight"></i>   </a></div>

<table class="table table-striped table-bordered table-hover">
    <tr class="gridtitle text-center">
        <td class="td_s">选择</td>
        <td style="width:30%;">名称</td>
        <td style="width: 20%">标签分类</td>
        <td style="width: 20%">标签类别</td>
        <td>操作</td>
    </tr>
    <ZL:ExRepeater runat="server" ID="RPT" PageSize="20" PagePre="<tr><td><input type='checkbox' id='chkAll'/></td><td colspan='8'><div class='text-center'>" PageEnd="</div></td></tr>"  OnItemCommand="repFileReName_ItemCommand">
        <ItemTemplate>
            <tr ondblclick="ckl('<%# Eval("LabelName") %>')">
                <td><input type="checkbox" name="idchk" value="<%#Eval("LabelID") %>" /></td>
                <td class="text-left">
                    <%# GetLabelLink(Eval("LabelID",""), Eval("LabelName",""), Eval("LabelType",""))%>
                </td>
                <td class="text-center"><a href="LabelManage.aspx?Cate=<%# HttpUtility.UrlEncode(Eval("LabelCate",""))%>"><%#Eval("LabelCate") %></a></td>
                <td class="text-center"><%#GetLabelType(Eval("LabelType").ToString()) %></td>
                <td class="text-center" id="select">
                    <a class="option_style" href="<%#"LabelCall.aspx?labelName="+HttpUtility.UrlEncode(Eval("LabelName",""))%>"><i class="zi zi_sharealt" zico="分享粗黑"></i>引入</a>
                </td>
            </tr>
        </ItemTemplate>
        <FooterTemplate></FooterTemplate>
    </ZL:ExRepeater>
</table>
<script>
$("#navtabs_ul").addClass("nav-item").find("a").addClass("nav-link")
</script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">

</asp:Content>