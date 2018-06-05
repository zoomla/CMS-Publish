<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Import.aspx.cs" Inherits="ZoomLaCMS.Manage.Common.Import" MasterPageFile="~/Manage/I/Index.Master" %>
<asp:Content runat="server" ContentPlaceHolderID="head"><title>数据导入</title></asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Content">
<div class="d-flex flex-row">
<div class="input-group">
    <input type="file" class="form-control m50rem_50" name="file_up" id="file_up"  accept=".xlsx"/>
    <span class="input-group-append">
        <asp:Button runat="server" ID="Upload_Btn" class="btn btn-outline-info" Text="上传文档" OnClick="Upload_Btn_Click" OnClientClick="return checkSub();" />
    </span>
</div>
<asp:Button runat="server" ID="DownTlp_Btn" OnClick="DownTlp_Btn_Click" Text="下载数据导入模板"  class="btn btn-outline-info"/>
</div>
<div class="alert alert-info w-100 mt-2">
    <div>1,下载模板,按照规范填写好数据</div>
    <div>2,在本页面上传填写好的文档</div>
</div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
<script>
    function checkSub() {
        var fname=$("#file_up").val();
        if (fname == "") { alert("未选定文件"); return false; }
        return true;
    }
</script>
</asp:Content>