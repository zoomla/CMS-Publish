<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FlowView.aspx.cs" Inherits="ZoomLaCMS.MIS.OA.FreeFlow.FlowView" MasterPageFile="~/Office/OAMain.master"  ValidateRequest="false"%>
<%@ Register Src="~/Office/Tlp/defTlp.ascx" TagPrefix="oa" TagName="defTlp" %>
<%@ Register Src="~/Office/Tlp/send.ascx" TagPrefix="oa" TagName="send" %>
<%@ Register Src="~/Office/Tlp/rece.ascx" TagPrefix="oa" TagName="rece" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>归档文件</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
        <ol id="BreadNav" class="breadcrumb navbar-fixed-top">
            <li><a href="/Office/Main.aspx">办公管理</a></li>
            <li><a href="../Flow/FlowList.aspx">流程列表</a></li>
            <li><a href="<%=Request.RawUrl %>">公文查看</a>
                 <span title="打印公文"><a href="/Office/Flow/Print.aspx?appID=<%=appID %>" target="_blank">
                    <img class="startprint" onclick="doprint()" alt="" src="/Template/V4/style/images/print-btn.png" /></a></span>
            </li>
        </ol>
        <div style="margin-top:60px;">
            <asp:Panel runat="server" ID="OAForm_Div">
                <oa:send runat="server" id="ascx_send" visible="false" />
                <oa:rece runat="server" id="ascx_rece" visible="false" />
                <oa:deftlp runat="server" id="ascx_def" visible="false" />
            </asp:Panel>
            <table class="table table-bordered table-striped">
            <tr>
                <td class="text-right">发起人：</td><td><asp:Label runat="server" ID="SendMan_L"></asp:Label></td>
                <td class="text-right">当前步骤：</td><td><asp:Label runat="server" ID="stepNameL"></asp:Label></td>
                <td class="text-right">发文时间：</td><td><asp:Label runat="server" ID="createTimeL"></asp:Label></td>
            </tr>
            <tbody runat="server" id="audit_body">
            <tr><td class="text-right">公文：</td><td colspan="7"><input type="button" onclick="ShowWord();" class="btn btn-info" value="打开公文" /></td></tr>
            <tr><td class="text-right">附件：</td><td runat="server" id="publicAttachTD" colspan="7">
                <div style="margin-top:10px;" id="uploader" class="uploader"><ul class="filelist"></ul></div>
                <asp:HiddenField runat="server" ID="Attach_Hid" /></td></tr>
        </tbody>
        </table>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Script">
<style type="text/css">
#AllID_Chk {display:none;}
</style>
<script src="/JS/Controls/ZL_Dialog.js"></script>
<script src="/JS/ICMS/ZL_Common.js"></script>
<link href="/JS/Controls/ZL_Webup.css" rel="stylesheet" />
<script src="/JS/Controls/ZL_Webup.js"></script>
<script src="/JS/ZL_Regex.js"></script>
<script>
function ShowWord() {
    ShowDiag("/Plugins/Office/office.aspx?ID=<%=appID%>", "查看正文");
}
$(function () {
    if (!ZL_Regex.isEmpty($("#Attach_Hid").val())) {
        var files = $("#Attach_Hid").val().split('|');
        $("#Attach_Hid").val("");
        for (var i = 0; i < files.length; i++) {
            AddAttach(files[i], { _raw: files[i] }, {});
        }
    }
    setTimeout(function () { $(".file-panel .cancel").css("display","none"); }, 1000);
})
function AddAttach(file, ret, pval) { return ZL_Webup.AddAttach(file, ret, pval); }
</script>
</asp:Content>

