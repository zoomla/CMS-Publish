<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ISReplyAdd.aspx.cs" Inherits="ZoomLaCMS.Manage.iServer.ISReplyAdd" MasterPageFile="~/Manage/I/Default.Master" ValidateRequest="false" %>
<asp:Content runat="server" ContentPlaceHolderID="head">
<title>回复管理</title>
<script src="/Plugins/Ueditor/ueditor.config.js"></script>
<script src="/Plugins/Ueditor/ueditor.all.min.js"></script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div style="min-height:600px;">
<table class="table table-bordered table-striped">
<tr><td class="td_m">问题</td><td><asp:Label runat="server" ID="QTitle_L"></asp:Label></td></tr>
<tr><td colspan="2"><asp:TextBox runat="server" style="height:300px;" TextMode="MultiLine" ID="Content_T"></asp:TextBox></td></tr>
<tr style="display:none;">
    <td>附件</td>
    <td>
        <input type="button" id="upfile_btn" class="btn btn-primary" value="选择文件" />
        <div style="margin-top: 10px;" id="uploader" class="uploader">
            <ul class="filelist"></ul>
        </div>
        <asp:HiddenField runat="server" ID="Attach_Hid" />
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Text=""></asp:Label>
    </td>
</tr>
<tr><td></td><td><asp:Button runat="server" ID="Save_Btn" Text="保存信息" OnClick="Save_Btn_Click" class="btn btn-info" /></td></tr>
</table>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<style type="text/css">
#navHolder{display:none;}
</style>
<%=Call.GetUEditor("Content_T",2) %>
<script>
    function refresh() { parent.location = parent.location; }
</script>
</asp:Content>