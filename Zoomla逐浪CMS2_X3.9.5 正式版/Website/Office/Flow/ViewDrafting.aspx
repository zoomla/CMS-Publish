<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDrafting.aspx.cs" Inherits="ZoomLaCMS.MIS.OA.Flow.ViewDrafting" MasterPageFile="~/Common/Master/UserEmpty.master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>公文预览</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="draftnav"><a href="/Office/Main.aspx">行政公文</a>/<asp:Label runat="server" ID="title_lab" Text="公文起草"/></div>
<div class="panel panel-primary" style="margin:10px;">
    <div class="panel-heading"><h3 class="panel-title">操作成功</h3></div>
    <div class="panel-body">
        <table class="table table-bordered">
            <tr><td class="td_md">标题</td><td><asp:Label ID="LBTitle" runat="server" /></td></tr>
            <tr><td>主题词</td><td><asp:Label ID="LBKeyWords" runat="server" /></td></tr>
            <tr><td>添加人</td><td><asp:Label ID="AddUSer" runat="server" /></td></tr>
            <tr><td>添加时间</td><td><asp:Label ID="AddTime" runat="server" /></td></tr>
            <tr><td><asp:Label runat="server" ID="ReferUser_Alias" Text="主办人"/></td>
                <td><asp:Label runat="server" ID="RUser_L"/></td>
            </tr>
            <tr runat="server" id="CCUser_Tr"><td><asp:Label runat="server" ID="CCUser_Alias" Text="协办人"/></td>
                <td><asp:Label runat="server" ID="CUser_L"/></td>
            </tr>
            <tr runat="server" id="HelpUser_Tr"><td><asp:Label runat="server" ID="HelpUser_Alias" Text="辅办人"/></td>
                <td><asp:Label runat="server" ID="HelpUser_L"/></td>
            </tr>
           <%-- <tr><td>步骤</td><td><div id="prog_div"></div></td></tr>--%>
            <tr>
                <td class="td_md">操作</td>
                <td>
                    <a href="FlowApply.aspx?appID=<%:moa.ID %>" class="btn btn-primary">修改文档</a>
                    <a href="ApplyList.aspx?view=3" class="btn btn-primary">文档管理</a>
                    <input runat="server" type="button" id="preViewBtn" class="btn btn-primary" onclick="disWin();" value="预览流程" />
                </td>
            </tr>
        </table>
    </div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<script src="/JS/Controls/ZL_Array.js"></script>
<script>
function disWin() {
    var iTop = (window.screen.availHeight - 30 - 550) / 2;
    var iLeft = (window.screen.availWidth - 10 - 960) / 2;
    var myWin = window.open('/Office/PreViewProg.aspx?proID=<%=moa.ProID%>', 'newwindow', 'height=550, width=960,top=' + iTop + ',left=' + iLeft + ',toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no');
}
</script>
</asp:Content>
